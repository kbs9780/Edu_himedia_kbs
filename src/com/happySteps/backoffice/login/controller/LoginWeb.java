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
 * Program		: kr.co.himedia.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: LoginWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240726153637][pluto@himedia.co.kr][CREATE: Initial Release]
 */
package com.happySteps.backoffice.login.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.happySteps.backoffice.common.Common;
import com.happySteps.backoffice.login.dto.LoginDto;
import com.happySteps.backoffice.login.service.LoginSrvc;
import com.happySteps.util.Datetime;

import com.happySteps.backoffice.users.dto.ManagerDto;

/**
 * @version 1.0.0
 * @author pluto@himedia.co.kr
 * 
 * @since 2024-07-26
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("com.happySteps.backoffice.login.controller.LoginWeb")
public class LoginWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(LoginWeb.class);
	
	@Inject
	LoginSrvc loginSrvc;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-07-30
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/login/logout.web")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			HttpSession session = request.getSession(false);
			
			// [2024-07-25][pluto@himedia.co.kr][TODO: 세션 만료 시 처리 추가]
			String name		= (String) session.getAttribute("NAME");
			String dt_login	= (String) session.getAttribute("DT_LOGIN");
			session.invalidate();
			
			request.setAttribute("script"	, "alert('" + dt_login + "에 로그인한 " + name + "님 안녕히 가세요.')");
			request.setAttribute("redirect"	, "/console/");
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".logout()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param loginDto [로그인 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-07-30
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/login/loginProc.web", method = RequestMethod.POST)
	public ModelAndView loginProc(HttpServletRequest request, HttpServletResponse response, LoginDto loginDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			ManagerDto managerDto = loginSrvc.exist(loginDto);
			
			if (managerDto != null
					&& loginDto.getPasswd().equals(managerDto.getPasswd())) {
				
				/** 정상적인 관리자일 경우 세션에 이름과 아이디를 저장 */
				HttpSession session = request.getSession(true);
				session.setAttribute("SEQ_MNG", Integer.toString(managerDto.getSeq_mng()));
				session.setAttribute("NAME", managerDto.getMng_nm());
				session.setAttribute("ID", managerDto.getId());
				session.setAttribute("NICKNAME", managerDto.getNickname());
				session.setAttribute("DT_LOGIN", Datetime.getNow("yyyy-MM-dd HH:mm:ss"));
				
				request.setAttribute("script", "alert('" + session.getAttribute("NICKNAME")
												+ "님이 "
												+ session.getAttribute("DT_LOGIN")
												+ "에 로그인하였습니다."
												+ "')");
			}
			else {
				request.setAttribute("script", "alert('아이디와 비밀번호를 확인하세요!')");
			}
			
			request.setAttribute("redirect"	, "/console/");
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".loginProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-07-26
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/login/loginForm.web")
	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response, String url) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.addObject("url", url);
			
			mav.setViewName("backoffice/login/loginForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".loginForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}