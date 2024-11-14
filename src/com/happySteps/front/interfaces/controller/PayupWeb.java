/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 himedia.co.kr에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 himedia.co.kr All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: PayupWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241010154752][pluto@himedia.co.kr][CREATE: Initial Release]
 *				: [20240207164634][pluto@himedia.co.kr][REPORT: From com.payup.pay.controller.PayController Old(BASE ON DEAL NUM)]
 *				: [20241018152000][pluto@himedia.co.kr][REPORT: From com.payup.pay.controller.PayController New(BASE ON ORDER NUM) and Old is changed]
 */
package com.happySteps.front.interfaces.controller;


import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.happySteps.front.buy.dto.BuyDetailDto;
import com.happySteps.front.buy.dto.BuyDetailListDto;
import com.happySteps.front.buy.dto.BuyMasterDto;
import com.happySteps.front.buy.service.BuySrvc;
import com.happySteps.front.common.Common;
import com.happySteps.front.interfaces.component.PayupCmpn;
import com.happySteps.front.member.dao.MemberDao;
import com.happySteps.util.Datetime;
import com.happySteps.util.servlet.Request;

/**
 * @version 1.0.0
 * @author pluto@himedia.co.kr
 * 
 * @since 2024-10-10
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:
 * - [2024-10-14][pluto@himedia.co.kr][TODO-개선: 가격, 다중 상품 및 AppUrl 적용 필요]
 * - [2024-10-23][pluto@himedia.co.kr][REPORT: 모바일을 위해 receive() 및 receiveOld() 서버 설정 필요]
 * </p>
 */
@Controller("com.happySteps.front.interfaces.controller.PayupWeb")
public class PayupWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(PayupWeb.class);
	
	@Autowired
	Properties staticProperties;
	
	@Inject
	private PayupCmpn payupCmpn;
	
	@Inject
	private BuySrvc buySrvc;
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/front/interface/payup/receive.api")
	public ModelAndView receive(@RequestParam Map<String, String> param, HttpServletRequest request) throws NoSuchAlgorithmException {
		
		ModelAndView mav = new ModelAndView();
		
		try {
			logger.info("-----------------------------------------------------");
			logger.info("num_order = " + getSession(request, "NUM_ORDER"));
			logger.info("-----------------------------------------------------");
			boolean isResult	= false;
			String num_order	= getSession(request, "NUM_ORDER");
			String amount		= getSession(request, "AMOUNT");
			String num_deal		= param.get("transactionId");
			
			/** 뭐야, 이건! 달랑 transactionId만 주면 어떻게 하라고^^; */
			if (num_order != null && num_deal != null) {
				
				String token = "";
				
				// 토큰 발행
				String url = "https://standard.testpayup.co.kr/auth/v1/accessToken";
				Map<String,String> map = new HashMap<String, String>();
				
				map.put("merchantId", "himedia");
				map.put("apiKey", "ac805b30517f4fd08e3e80490e559f8e");
				Map<String,Object> apiResult = payupCmpn.JsonApi(request, url, map);
				logger.debug("-----------------------------------------------------");
				logger.debug("토큰 발행 응답 = " + apiResult.toString());
				logger.debug("-----------------------------------------------------");
				
				// 토큰 성공
				if (apiResult.get("messageCode").equals("0000")) {
					
					Map<String, Object> data = (Map<String, Object>) apiResult.get("data");
					token = (String) data.get("accessToken");
					
					// 결제 승인
					String authUrl = "https://standard.testpayup.co.kr/api/v1/payment";
					Map<String,String> authMap = new HashMap<String, String>();
					authMap.put("transactionId"	, num_deal);
					authMap.put("orderNumber"	, num_order);
					authMap.put("amount"		, amount);
					authMap.put("merchantId"	, "himedia");
					Map<String,Object> authApiResult = payupCmpn.JsonApi(request, authUrl, authMap, token);
					logger.info("-----------------------------------------------------");
					logger.info("결제 승인 응답 : " + authApiResult.toString());
					logger.info("-----------------------------------------------------");
					
					data = (Map<String, Object>) authApiResult.get("data");
					// 결제 성공
					if ("0000".equals(data.get("responseCode"))) {
						
							isResult = buySrvc.updateByOrderNum(num_order, num_deal, Integer.parseInt(getSession(request, "SEQ_MBR")), "Y");
							request.setAttribute("script"	, "alert('정상적으로 결제되었습니다. 구매해 주셔서 감사합니다.');");
							request.setAttribute("redirect"	, "/");
					}
					// 결제 실패
					else {
						isResult = buySrvc.updateByOrderNum(num_order, num_deal, Integer.parseInt(getSession(request, "SEQ_MBR")), "N");
						
						request.setAttribute("script"	, "alert('[" + data.get("responseCode") + "]결제 처리에 실패하였습니다. 고객센터(=Payup)로 문의바랍니다!');");
						request.setAttribute("redirect"	, "/");
					}
					
					// 결제 결과에 대한 업데이트 실패 시
					if (!isResult) {
						request.setAttribute("script"	, "alert('[P001]결제 처리에 실패하였습니다. 고객센터로 문의바랍니다!');");
						request.setAttribute("redirect"	, "/");
					}
				}
				// 토큰 실패
				else {
					request.setAttribute("script"	, "alert('[" + apiResult.get("messageCode") + "]결제가 실패(토큰)되었습니다. 고객센터(=Payup)로 문의바랍니다!');");
					request.setAttribute("redirect"	, "/");
				}
			}
			else {
				logger.error("[" + this.getClass().getName() + ".receive()] num_order + num_deal = " + num_order + " + " + num_deal);
				isResult = buySrvc.updateByOrderNum(num_order, num_deal, Integer.parseInt(getSession(request, "SEQ_MBR")), "N");
				
				request.setAttribute("script"	, "alert('[P000]결제가 실패되었습니다. 고객센터(=Payup)로 문의바랍니다!');");
				request.setAttribute("redirect"	, "/");
			}
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			request.setAttribute("script"	, "alert('[P000]결제 처리에 실패하였습니다. 고객센터로 문의바랍니다!');");
			request.setAttribute("redirect"	, "/");
			mav.setViewName("forward:/servlet/result.web");
			logger.error("[" + this.getClass().getName() + ".receive()] " + e.getMessage(), e);
		}
		finally {
			// 주문 번호 초기화
			HttpSession session = request.getSession(false);
			session.setAttribute("NUM_ORDER", null);
		}
		
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/front/interface/payup/pay.json")
	public @ResponseBody Map<String, Object> pay(@RequestBody Map<String,String> param, HttpServletRequest request) throws NoSuchAlgorithmException {
		
		Map<String, Object> returnMap = new HashMap<>();
		
		try {
			
			//System.out.println(param.toString());
			String transactionId	= param.get("transactionId");
			String merchantId		= param.get("merchantId");
			String orderNumber		= param.get("orderNumber");
			String amount			= param.get("amount");
			String token			= "";
			
			// 토큰 발행
			String url = "https://standard.testpayup.co.kr/auth/v1/accessToken";
			Map<String,String> map = new HashMap<String, String>();
			
			map.put("merchantId", "himedia");
			map.put("apiKey", "ac805b30517f4fd08e3e80490e559f8e");
			Map<String,Object> apiResult = payupCmpn.JsonApi(request, url, map);
			logger.debug("-----------------------------------------------------");
			logger.debug("토큰 발행 응답 = " + apiResult.toString());
			logger.debug("-----------------------------------------------------");
			
			if (apiResult.get("messageCode").equals("0000")) {
				
				Map<String, Object> data = (Map<String, Object>) apiResult.get("data");
				token = (String) data.get("accessToken");
				
				// 결제 승인
				String authUrl = "https://standard.testpayup.co.kr/api/v1/payment";
				Map<String,String> authMap = new HashMap<String, String>();
				authMap.put("transactionId"	, transactionId);
				authMap.put("orderNumber"	, orderNumber);
				authMap.put("amount"		, amount);
				authMap.put("merchantId"	, merchantId);
				Map<String,Object> authApiResult = payupCmpn.JsonApi(request, authUrl, authMap, token);
				logger.debug("-----------------------------------------------------");
				logger.debug("결제 승인 응답 : " + authApiResult.toString());
				logger.debug("-----------------------------------------------------");
				
				String num_deal		= transactionId;
				boolean isResult	= true;
				
				data = (Map<String, Object>) authApiResult.get("data");
				if ("0000".equals(data.get("responseCode"))) {
					
					isResult = buySrvc.updateByOrderNum(orderNumber, num_deal, Integer.parseInt(getSession(request, "SEQ_MBR")), "Y");
					
					returnMap.put("responseCode", "0000");
					returnMap.put("responseMsg", "정상적으로 결제되었습니다. 구매해 주셔서 감사합니다.");
				}
				else {
					isResult = buySrvc.updateByOrderNum(orderNumber, num_deal, Integer.parseInt(getSession(request, "SEQ_MBR")), "N");
					
					returnMap.put("responseCode", data.get("responseCode"));
					returnMap.put("responseMsg", "결제가 실패되었습니다. 고객센터(=Payup)로 문의바랍니다!");
				}
				
				// 결제 결과에 대한 업데이트 실패 시
				if (!isResult) {
					returnMap.put("responseCode", "P001");
					returnMap.put("responseMsg", "결제 처리에 실패하였습니다. 고객센터로 문의바랍니다!");
				}
			}
			else {
				returnMap.put("responseCode", apiResult.get("messageCode"));
				returnMap.put("responseMsg", "결제가 실패(토큰)되었습니다. 고객센터(=Payup)로 문의바랍니다!");
			}
		}
		catch (Exception e) {
			returnMap.put("responseCode", "P999");
			returnMap.put("responseMsg", "결제 처리에 실패하였습니다. 고객센터로 문의바랍니다!");
			logger.error("[" + this.getClass().getName() + ".pay()] " + e.getMessage(), e);
		}
		finally {
			// 주문 번호 초기화
			HttpSession session = request.getSession(false);
			session.setAttribute("NUM_ORDER", null);
		}
		
		return returnMap;
	}
	
	@RequestMapping(value = "/front/interface/payup/order.json", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> order(@RequestParam Map<String, String> param, HttpServletRequest request, BuyDetailListDto buyDetailListDto) throws NoSuchAlgorithmException {
		
		Map<String,Object> returnMap = new HashMap<>();
		
		try {
			
			returnMap.put("responseCode", "0000");
			
			if ("0000".equals(returnMap.get("responseCode"))) {
				
				if (buyDetailListDto.getBuyList() != null) {
					
					// 주문 번호
					String num_order = "HM-JPT-" + Integer.parseInt(getSession(request, "SEQ_MBR")) + Datetime.getNow("yyyyMMddHHmmss");
					
					// 마스터 정보 추출
					int TotalPrice	= 0;
					int TotalCount	= 0;
					
					for (int loop = 0; loop < buyDetailListDto.getBuyList().size(); loop++) {
						
						buyDetailListDto.getBuyList().get(loop).getSle_nm();
						
						TotalCount += buyDetailListDto.getBuyList().get(loop).getCount();																		// 총 개수
						TotalPrice = TotalPrice + (buyDetailListDto.getBuyList().get(loop).getPrice() * buyDetailListDto.getBuyList().get(loop).getCount());	// 총 금액
					}
					
					// 마스터 설정
					BuyMasterDto buyMasterDto = new BuyMasterDto();
					buyMasterDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
					buyMasterDto.setBuy_info(buyDetailListDto.getBuyList().get(0).getSle_nm() + "(수량: " +  TotalCount + ")");
					buyMasterDto.setBuy_count(TotalCount);
					buyMasterDto.setBuy_price(TotalPrice);
					buyMasterDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
					
					int seq_buy_mst = buySrvc.insertByOrderNum(buyMasterDto, (ArrayList<BuyDetailDto>) buyDetailListDto.getBuyList(), num_order); 
					
					if (seq_buy_mst > 0) {
						
						returnMap.put("merchantId"		, "himedia");
						returnMap.put("itemName"		, buyDetailListDto.getBuyList().get(0).getSle_nm() + "(수량: " +  TotalCount + ")");
						returnMap.put("amount"			, Integer.toString(TotalPrice));
						returnMap.put("userName"		, getSession(request, "NAME"));
						returnMap.put("orderNumber"		, num_order);
						
						HttpSession session = request.getSession(false);
						session.setAttribute("NUM_ORDER"	, num_order);
						session.setAttribute("AMOUNT"		, Integer.toString(TotalPrice));
						
						String serverUrl = "";
						if (staticProperties.getProperty("common.mode", "[UNDEFINED]").equalsIgnoreCase("LOCAL")) {
							serverUrl = "http://119.71.96.251:"
										+ staticProperties.getProperty("common.server.port", "[UNDEFINED]");
						}
						else if (staticProperties.getProperty("common.mode", "[UNDEFINED]").equalsIgnoreCase("DEVELOPMENT")) {
							 // moon(8080), jupiter(8081), saturn(8082), uranus(8083)
							serverUrl = "http://119.71.96.251:8081";
						}
						else {
							serverUrl = "[UNDEFINED]";
						}
						
						
						/** 모바일에서는 pay()가 아닌 receive()로 응답을 처리 */
						if (Request.isDevice(request, "mobile")) {
							returnMap.put("returnUrl", serverUrl + "/front/interface/payup/receive.api");
						}
						else returnMap.put("returnUrl", "");
						
						logger.info("**************************************");
						logger.info("returnUrl = " + returnMap.get("returnUrl"));
						logger.info("**************************************");
					}
					else {
						// 구매 정보 저장 실패
						returnMap.put("responseCode", "B001");
						returnMap.put("responseMsg", "구매 정보 저장 실패");
					}
				}
				else {
					// 상품 정보 부재
					returnMap.put("responseCode", "B002");
					returnMap.put("responseMsg", "구매 정보 부재");
				}
			}
			else {
				// 연동 에러
				returnMap.put("responseCode", returnMap.get("responseCode"));
				returnMap.put("responseMsg", "구매 등록 처리 실패(=Payup)");
				logger.error("[" + this.getClass().getName() + ".order().RES.FAILURE] " + returnMap.toString());
			}
		}
		catch (Exception e) {
			// 알 수 없는 에러
			returnMap.put("responseCode", "B000");
			returnMap.put("responseMsg", "구매 등록 처리 실패");
			logger.error("[" + this.getClass().getName() + ".order()] " + e.getMessage(), e);
		}
		finally {}
		
		return returnMap;
	}
}