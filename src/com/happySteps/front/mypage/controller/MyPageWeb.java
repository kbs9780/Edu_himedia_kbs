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
 * File			: MyPageWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241002][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
package com.happySteps.front.mypage.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.happySteps.front.common.Common;
import com.happySteps.front.member.dto.MemberDto;
import com.happySteps.front.member.service.MemberSrvc;
import com.happySteps.front.mypage.controller.MyPageWeb;
/**
 * @version 1.0.0
 * @author rkdcodbs77#naver.com
 * 
 * @since 2024-10-02
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("com.happySteps.front.myPage.controller.MyPageWeb")
public class MyPageWeb extends Common {
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(MyPageWeb.class);
	
	@Inject
	private MemberSrvc memberSrvc;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-11-13
	 * <p>DESCRIPTION: 회원 탈퇴 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/myPage/exitProc.web")
	public ModelAndView exitProc(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("redirect:/error.web");

		try {
			// 세션에서 seq_mbr 값 가져오기
			MemberDto memberDto = new MemberDto();
			memberDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			mav.addObject("memberDto", memberDto);
			// 서비스 호출
			boolean result = memberSrvc.updateExit(memberDto);

			// 성공 시 리다이렉트할 페이지 설정
			if (result) {
				request.getSession().invalidate();
				mav.setViewName("redirect:/front/index.web");
			}
		} catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".exitProc()] " + e.getMessage(), e);
		}

		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-11-11
	 * <p>DESCRIPTION: 회원 탈퇴 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/myPage/exitForm.web")
	public ModelAndView exitForm(HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			// 세션에서 seq_mbr 값 가져오기
			mav.addObject("seq_mbr", Integer.parseInt(getSession(request, "SEQ_MBR")));
			mav.setViewName("front/myPage/exitForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".exitForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-02
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/myPage/index.web")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/myPage/index");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".index()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}