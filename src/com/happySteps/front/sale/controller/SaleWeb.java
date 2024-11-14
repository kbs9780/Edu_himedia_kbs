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
 * File			: SaleWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [202410010900][hyeen103#gmail.com][CREATE: Initial Release]
 */
package com.happySteps.front.sale.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.happySteps.front.common.Common;
import com.happySteps.front.common.component.SessionCmpn;
import com.happySteps.front.common.dto.PagingDto;
import com.happySteps.front.common.dto.PagingListDto;
import com.happySteps.front.sale.service.SaleSrvc;

/**
 * @version 1.0.0
 * @author hyeen103@gmail.com
 * 
 * @since 202410010900
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("com.happySteps.front.sale.controller.SaleWeb")
public class SaleWeb extends Common {

	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(SaleWeb.class);
	
	@Inject
	private SaleSrvc saleSrvc;
	
	@Autowired
	SessionCmpn sessionCmpn;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-06-26
	 * <p>DESCRIPTION: 상품 목록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/sale/shop/list.web")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {

				if (pagingDto.getCd_ctg_pet() == 1) {
					mav.setViewName("front/sale/shop/dog/list");
				}
				else if (pagingDto.getCd_ctg_pet() == 2) {
					mav.setViewName("front/sale/shop/cat/list");
				}
				else if (pagingDto.getCd_ctg_pet() == 3) {
					mav.setViewName("front/sale/shop/hamster/list");
				}
				else if (pagingDto.getCd_ctg_pet() == 4) {
					mav.setViewName("front/sale/shop/reptile/list");
				}
				else if (pagingDto.getCd_ctg_pet() == 5) {
					mav.setViewName("front/sale/shop/fish/list");
				}
				else {
					request.setAttribute("redirect"	, "/front/index.web");
					mav.setViewName("forward:/servlet/result.web");
				}
				
				PagingListDto pagingListDto = saleSrvc.list(pagingDto);
				
				mav.addObject("paging"	, pagingListDto.getPaging());
				mav.addObject("list"	, pagingListDto.getList());

		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".list()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-07-12
	 * <p>DESCRIPTION: 상품 전체 페이지</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/sale/shop/index.web")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response,	PagingDto pagingDto) {

		ModelAndView mav = new ModelAndView("redirect:/error.web");

		try {
			PagingListDto pagingListDto = saleSrvc.list(pagingDto);
			
			mav.addObject("paging", pagingListDto.getPaging());
			mav.addObject("list", pagingListDto.getList());

			mav.setViewName("/front/sale/shop/index");

		} catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".index()] " + e.getMessage(), e);
		} finally {}

		return mav;
	}
}
