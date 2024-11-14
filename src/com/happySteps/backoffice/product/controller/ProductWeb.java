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
 * File			: ProductWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [202410010900][hyeen103#gmail.com][CREATE: Initial Release]
 */
package com.happySteps.backoffice.product.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.happySteps.backoffice.common.Common;
import com.happySteps.backoffice.common.dto.PagingDto;
import com.happySteps.backoffice.common.dto.PagingListDto;
import com.happySteps.backoffice.product.dto.ProductDto;
import com.happySteps.backoffice.product.service.ProductSrvc;



/**
 * @version 1.0.0
 * @author hyeen103#gmail.com
 * 
 * @since 202410010900
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("com.happySteps.backoffice.product.controller.ProductWeb")
public class ProductWeb extends Common {

	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(ProductWeb.class);
	
	@Inject
	ProductSrvc productSrvc;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 판매자 상품 수정 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/product/modifyProc.web")
	public ModelAndView modifyProc(HttpServletRequest request, HttpServletResponse response, ProductDto productDto){

		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			productDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MNG")));
			
			if (productSrvc.update(productDto)) {
				request.setAttribute("script"	, "alert('수정되었습니다.');");
				request.setAttribute("redirect"	, "/console/product/list.web?seq_prd=" + productDto.getSeq_prd());
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".modifyProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 판매자 상품 수정</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/product/modifyForm.web")
	public ModelAndView modifyForm(HttpServletRequest request	, HttpServletResponse response, ProductDto productDto){

		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			ProductDto _productDto = productSrvc.select(productDto);
			
			mav.addObject("productDto", _productDto);
			mav.setViewName("backoffice/product/modifyForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".modifyForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 판매자 상품현황 보기</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/product/view.web")
	public ModelAndView view(HttpServletRequest request	, HttpServletResponse response, ProductDto productDto){

		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			ProductDto _productDto = productSrvc.select(productDto);
			
			logger.debug("productDto.seq_prd: " + productDto.getSeq_prd());
			
			mav.addObject("productDto", _productDto);
			mav.setViewName("backoffice/product/view");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".view()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 판매자 상품 삭제</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/product/remove.web")
	public ModelAndView remove(HttpServletRequest request	, HttpServletResponse response, ProductDto productDto){

		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			productDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MNG")));
			
			logger.debug("productDto.seq_prd: " + productDto.getSeq_prd());
			
			if (productSrvc.deleteFlag(productDto)) {
				request.setAttribute("script"	, "alert('삭제되었습니다.');");
				request.setAttribute("redirect"	, "/console/product/list.web");
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".remove()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 판매자 상품 등록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/product/writeProc.web")
	public ModelAndView writeProc(HttpServletRequest request, HttpServletResponse response, ProductDto productDto){

		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			productDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MNG")));
			
			//logger.debug("productDto.seq_prd: " + productDto.getSeq_prd());
			
			
			if (productSrvc.insert(productDto)) {
				request.setAttribute("script"	, "alert('등록되었습니다.');");
				request.setAttribute("redirect"	, "/console/product/list.web");
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".writeProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 관리자 상품 등록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/product/writeForm.web")
	public ModelAndView writeForm(HttpServletRequest request	, HttpServletResponse response, ProductDto productDto){

		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			productDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MNG")));
			
			logger.debug("productDto.seq_prd: " + productDto.getSeq_prd());
			
			
			mav.setViewName("backoffice/product/writeForm");
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
	 * @return ModelAndView
	 * 
	 * @since 2024-08-01
	 * <p>DESCRIPTION: 상품 리스트</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/product/list.web")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			PagingListDto pagingListDto = productSrvc.list(pagingDto);
			
			mav.addObject("paging", pagingListDto.getPaging());
			mav.addObject("list", pagingListDto.getList());
			
			mav.setViewName("backoffice/product/list");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".list()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}
