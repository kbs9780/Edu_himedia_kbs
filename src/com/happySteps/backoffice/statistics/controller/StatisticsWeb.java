/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF happySteps.com.
 * happySteps.com OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 happySteps.com ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 happySteps.com에 있으며,
 * happySteps.com이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * happySteps.com의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 happySteps.com All Rights Reserved.
 *
 *
 * Program		: kr.co.himedia.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: StatisticsWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241024173100][kbs@happySteps.com][CREATE: Initial Release]
 */
package com.happySteps.backoffice.statistics.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.happySteps.backoffice.common.Common;
import com.happySteps.backoffice.statistics.dto.MemberRegionDto;
import com.happySteps.backoffice.statistics.service.MemberSrvc;

/**
 * @version 1.0.0
 * @author kbs@happySteps.com
 * 
 * @since 2024-08-13
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("com.happySteps.backoffice.statistics.controller.StatisticsWeb")
public class StatisticsWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(StatisticsWeb.class);
	
	@Inject
	MemberSrvc memberSrvc;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-08-01
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/statistics/sale.web")
	public ModelAndView sale(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			mav.setViewName("backoffice/statistics/sale");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".sale()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-08-01
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/statistics/member.web")
	public ModelAndView member(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			List<MemberRegionDto> listMemberRegion = memberSrvc.memberRegion();
			
			mav.addObject("listMemberRegion", listMemberRegion);
			
			mav.setViewName("backoffice/statistics/member");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".member()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}