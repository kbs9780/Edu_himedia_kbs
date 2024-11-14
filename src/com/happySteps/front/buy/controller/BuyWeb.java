/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 com.happySteps에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 com.happySteps All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: history.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241004115246][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
package com.happySteps.front.buy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.happySteps.front.common.Common;
import com.happySteps.front.common.dto.PagingDto;
import com.happySteps.front.common.dto.PagingListDto;
import com.happySteps.front.sale.dto.SaleDto;
import com.happySteps.front.sale.service.SaleSrvc;
import com.happySteps.front.buy.controller.BuyWeb;
import com.happySteps.front.buy.dto.BuyDetailDto;
import com.happySteps.front.buy.dto.BuyDetailListDto;
import com.happySteps.front.buy.dto.BuyDto;
import com.happySteps.front.buy.dto.BuyMasterDto;
import com.happySteps.front.buy.service.BuySrvc;
import com.happySteps.front.center.service.BoardSrvc;

//import com.happySteps.front.buy.dto.BuyDto;
//import com.happySteps.front.buy.service.BuySrvc;


/**
 * @version 1.0.0
 * @author rkdcodbs77#naver.com
 * 
 * @since 2024-10-04
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("com.happySteps.front.buy.controller.BuyWeb")
public class BuyWeb extends Common{

	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(BuyWeb.class);
	
	@Inject
	BuySrvc buySrvc;
	
	@Inject
	SaleSrvc saleSrvc;
	
	@Inject
	BoardSrvc boardSrvc;
	
	@RequestMapping(value = "/front/buy/goConfirm.web")
	public ModelAndView goConfirm(HttpServletRequest request, HttpServletResponse response, BuyDto buyDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {

			if (buySrvc.goConfirm(buyDto)) {
				request.setAttribute("script"	, "alert('구매 확정 되었습니다.');");
				request.setAttribute("redirect"	, "/front/buy/history.web");
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".goConfirm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	@RequestMapping(value = "/front/buy/goCancle.web")
	public ModelAndView goCancle(HttpServletRequest request, HttpServletResponse response, BuyDto buyDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {

			if (buySrvc.goCancle(buyDto)) {
				request.setAttribute("script"	, "alert('취소,반품요청 되었습니다.');");
				request.setAttribute("redirect"	, "/front/buy/history.web");
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".goCancle()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	@RequestMapping(value = "/front/buy/writeProc.web")
	public ModelAndView writeProc(HttpServletRequest request, HttpServletResponse response, BuyDetailListDto buyDetailListDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			//logger.debug("" + buyDetailListDto.getBuyList().size());
			
			String finalSleName = "";	// 마지막 판매 상품명
			
			int totalCount = 0;			// 총 갯수
			int totalPrice = 0;			// 총 가격
			
			ArrayList<BuyDetailDto> listBuyDetailDto = new ArrayList<BuyDetailDto>();
			
			if (buyDetailListDto.getBuyList() != null) {
				for (int loop = 0; loop < buyDetailListDto.getBuyList().size(); loop++) {
					
					if (buyDetailListDto.getBuyList().get(loop).getCount() >= 1) {
						
						//logger.debug(loop + " : seq_prd(" + buyDetailListDto.getBuyList().get(loop).getSeq_prd() + ")" + " + count(" + buyDetailListDto.getBuyList().get(loop).getCount() + ")");
						
						// 갯수가 1개 이상인 상품
						listBuyDetailDto.add(buyDetailListDto.getBuyList().get(loop));
						
						// 전체 상품 갯수 및 금액 그리고 구매명
						totalCount += buyDetailListDto.getBuyList().get(loop).getCount();
						totalPrice += buyDetailListDto.getBuyList().get(loop).getCount() * buyDetailListDto.getBuyList().get(loop).getPrice();
						finalSleName = buyDetailListDto.getBuyList().get(loop).getSle_nm();
					}
				}
			}
			//logger.debug("count=" + listBuyDetailDto.size());
			
			// 선택된 상품이 1개 이상을 경우만 구매 실행
			if (listBuyDetailDto.size() > 0) {
				
				// 마스터 설정
				BuyMasterDto buyMasterDto = new BuyMasterDto();
				buyMasterDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
				buyMasterDto.setBuy_info(finalSleName + "-포함(총 개수: " + totalCount + ")");
				buyMasterDto.setBuy_count(totalCount);
				buyMasterDto.setBuy_price(totalPrice);
				buyMasterDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
				
				if (buySrvc.insertByDealNum(buyMasterDto, listBuyDetailDto, "[INF]NO PAYMENT")) {
					request.setAttribute("script"	, "alert('추후 결제 페이지로 이동 예정');");
					request.setAttribute("redirect"	, "/front/main/main.web");
				}
				else {
					request.setAttribute("script"	, "alert('구매에 실패했습니다! 잠시 후에 이용 바랍니다!');");
					request.setAttribute("redirect"	, "/front/main/main.web");
				}
			}
			else {
				request.setAttribute("script"	, "alert('선택된 상품이 없습니다!');");
				request.setAttribute("redirect"	, "/");
			}
			
			request.setAttribute("redirect"	, "/front/");
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".writeProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	@RequestMapping(value = "/front/buy/writeForm.web")
	public ModelAndView writeForm(HttpServletRequest request
			, HttpServletResponse response
			, SaleDto saleDto
			, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			if (request.getSession().getAttribute("SEQ_MBR") == null) {
				mav.setViewName("/front/login/loginForm");
				return mav;
			}
			
			pagingDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			SaleDto _saleDto = saleSrvc.select(saleDto);
			mav.addObject("saleDto"		, _saleDto);
			
			pagingDto.setCd_bbs_type(3);
			PagingListDto pagingListDto = boardSrvc.saleList(pagingDto);
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("list"	, pagingListDto.getList());
			
			mav.setViewName("/front/buy/writeForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".writeForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-04
	 * <p>DESCRIPTION: 구매이력</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/buy/history.web")
	public ModelAndView history(HttpServletRequest request, HttpServletResponse response, BuyDto buyDto) {

		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			buyDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			// 구매 목록
			List<BuyDto> list = buySrvc.list(buyDto);
			
			// 총 구매금액
			String total_price = buySrvc.selectTotal(buyDto);
			
			mav.addObject("list", list);
			mav.addObject("total_price", total_price);
			
			mav.setViewName("front/buy/history");
			
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".history()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}
