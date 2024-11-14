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
 * File			: BasketWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241014174000][kbs@happySteps.com][CREATE: Initial Release]
 */
package com.happySteps.front.basket.controller;


import java.util.List;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.happySteps.front.basket.dto.BasketDto;
import com.happySteps.front.basket.service.BasketSrvc;
import com.happySteps.front.common.Common;
import com.happySteps.front.member.dto.MemberDto;
import com.happySteps.front.member.service.MemberSrvc;
import com.happySteps.util.security.SKwithAES;

/**
 * @version 1.0.0
 * @author kbs@happySteps.com
 * 
 * @since 2024-08-26
 *		<p>
 *		DESCRIPTION:
 *		</p>
 *		<p>
 *		IMPORTANT:
 *		</p>
 */
@Controller("com.happySteps.front.basket.controller.BasketWeb")
public class BasketWeb extends Common {

	private static Logger logger = LoggerFactory.getLogger(BasketWeb.class);
	
	@Inject
	BasketSrvc basketSrvc;
	
	@Inject
	MemberSrvc memberSrvc;
	
	@Autowired
	Properties staticProperties;
	

	@RequestMapping(value = "/front/basket/addItem.web", method = RequestMethod.POST)
	public ModelAndView addItem(@RequestBody BasketDto basketDto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/front/basket/index");

		try {
			// 사용자 세션에서 SEQ_MBR 가져오기
			int seqMbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
			basketDto.setSeq_mbr(seqMbr);
			
			// DB에 장바구니 추가
			basketSrvc.insertOrUpdate(basketDto); 
			
		}catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".addItem()] " + e.getMessage(), e);
		}

		return mav;
	}

	@RequestMapping(value = "/front/basket/removeItem.web")
	public ModelAndView removeItem(HttpServletRequest request, HttpServletResponse response, int seq_bsk) {
		ModelAndView mav = new ModelAndView("forward:/servlet/result.web");

		try {
			if (basketSrvc.deleteItem(seq_bsk)) {
				request.setAttribute("script", "alert('장바구니에서 삭제되었습니다.');");
			} else {
				request.setAttribute("script", "alert('삭제 중 오류가 발생했습니다.');");
			}
		} catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".removeItem()] " + e.getMessage(), e);
		}

		return mav;
	}

	@RequestMapping(value = "/front/basket/index.web")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("front/basket/index");

		try {
			// 사용자 ID 가져오기
			int seq_mbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
			
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			// 기본 생성자 사용
			MemberDto memberDto = new MemberDto(); 
			memberDto.setSeq_mbr(seq_mbr); // seq_mbr 설정
			
			// MemberSrvc를 이용하여 회원 정보 조회
			memberDto = memberSrvc.select(memberDto);
			
			memberDto.setMbr_nm(aes.decode(memberDto.getMbr_nm()));
			memberDto.setPhone(aes.decode(memberDto.getPhone()));
			memberDto.setPost(aes.decode(memberDto.getPost()));
			memberDto.setAddr1(aes.decode(memberDto.getAddr1()));
			memberDto.setAddr2(aes.decode(memberDto.getAddr2()));
			
			mav.addObject("member", memberDto);
			
			// 장바구니 목록 가져오기
			List<BasketDto> basketList = basketSrvc.getBasketByUser(seq_mbr);
			
			// 총 결제 금액 계산
			int totalPrice = basketList.stream()
										.mapToInt(basket -> basket.getPrice() * basket.getCount())
										.sum();

			// JSP로 데이터 전달
			mav.addObject("basketList", basketList);
			mav.addObject("totalPrice", totalPrice); // totalPrice 추가

			mav.setViewName("front/basket/index"); // 장바구니 JSP 페이지로 이동
		} catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".index()] " + e.getMessage(), e);
			mav.setViewName("redirect:/error.web");
		}

		return mav;
	}
}