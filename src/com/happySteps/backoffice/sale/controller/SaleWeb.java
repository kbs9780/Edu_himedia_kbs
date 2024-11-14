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
package com.happySteps.backoffice.sale.controller;

import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.happySteps.backoffice.common.Common;
import com.happySteps.backoffice.common.dto.PagingDto;
import com.happySteps.backoffice.common.dto.PagingListDto;
import com.happySteps.backoffice.sale.dto.SaleDto;
import com.happySteps.backoffice.sale.service.SaleSrvc;
import com.happySteps.common.dto.FileDto;
import com.happySteps.common.dto.FileUploadDto;
import com.happySteps.common.file.FileUpload;




/**
 * @version 1.0.0
 * @author hyeen103@gmail.com
 * 
 * @since 202410010900
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("com.happySteps.backoffice.sale.controller.SaleWeb")
public class SaleWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(SaleWeb.class);
	
	@Inject
	SaleSrvc saleSrvc;
	
	@Autowired
	private MessageSourceAccessor dynamicProperties;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 판매 목록 삭제</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/sale/soldout.web")
	public ModelAndView out(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			saleDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MNG")));
			saleDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MNG")));
			
			if (saleSrvc.soldout(saleDto)) {
				request.setAttribute("script"	, "alert('품절 되었습니다.');");
				request.setAttribute("redirect"	, "/console/sale/list.web");
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".soldout()] " + e.getMessage(), e);
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
	 * @since 2024-08-08
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/sale/re.web")
	public ModelAndView re(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			saleDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MNG")));
			saleDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MNG")));
			
			if (saleSrvc.re(saleDto)) {
				request.setAttribute("script"	, "alert('판매 재개가 되었습니다.');");
				request.setAttribute("redirect"	, "/console/sale/list.web");
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".re()] " + e.getMessage(), e);
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
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 판매 중지</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/sale/stop.web")
	public ModelAndView stop(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			saleDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MNG")));
			saleDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MNG")));
			
			if (saleSrvc.stop(saleDto)) {
				request.setAttribute("script"	, "alert('판매 중지 되었습니다.');");
				request.setAttribute("redirect"	, "/console/sale/list.web");
			}
			else {
				request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".stop()] " + e.getMessage(), e);
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
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 상품 수정</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/sale/modifyProc.web")
	public ModelAndView modifyProc(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			saleDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MNG")));
			saleDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MNG")));
			
			if (saleSrvc.update(saleDto)) {
				request.setAttribute("script"	, "alert('수정되었습니다.');");
				request.setAttribute("redirect"	, "/console/sale/list.web");
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
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 내 판매 수정</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/sale/modifyForm.web")
	public ModelAndView modifyForm(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			saleDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MNG")));
			
			SaleDto _saleDto = saleSrvc.select(saleDto);
			
			mav.addObject("saleDto", _saleDto);
			mav.setViewName("backoffice/sale/modifyForm");
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
	 * <p>DESCRIPTION: 판매 등록 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@SuppressWarnings({ "rawtypes", "unchecked", "unused" })
	@RequestMapping(value = "/console/sale/writeProc.web")
	public ModelAndView writeProc(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto, FileUploadDto fileUploadDto){

		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		String message	= "";
		
		try {
			saleDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MNG")));
			
			// 이미지(대표)
			String pathBase		= dynamicProperties.getMessage("backoffice.upload.path", "[UNDEFINED]");
			String maxSize		= dynamicProperties.getMessage("backoffice.upload.file.max5MB"			, "[UNDEFINED]");
			String allowedExt	= dynamicProperties.getMessage("backoffice.upload.file.extension.image"	, "[UNDEFINED]");
			
			int countFile = 0;
			if (null != fileUploadDto.getFiles()) countFile = fileUploadDto.getFiles().size();
			
			FileDto[] fileDto = new FileDto[countFile];
			LinkedList<Object> uploadResult = FileUpload.upload(fileUploadDto, pathBase, maxSize, allowedExt, countFile);
			
			message	= (String)((Hashtable)uploadResult.getLast()).get("resultID");
			
			if (message.equals("success")) {
				
				Hashtable<String, String> hashtable	= (Hashtable<String, String>)uploadResult.getLast();
				
				String fileNameSrc	= "";
				String fileNameSve	= "";
				String fileSize		= "";
				long totalSize		= 0;
				
				for (int loop = 0; loop < countFile; loop++) {
					fileNameSrc		= (String)hashtable.get("files[" + loop + "]_fileSrcName");
					fileNameSve		= (String)hashtable.get("files[" + loop + "]_fileSveNameRelative");
					fileSize		= (String)hashtable.get("files[" + loop + "]_fileSveSize");
					if (fileSize == null || fileSize == "") fileSize = "0";
					
					fileDto[loop] = new FileDto();
					fileDto[loop].setFileNameOriginal(fileNameSrc);			// 파일 원본명
					fileDto[loop].setFileNameSave(fileNameSve);				// 파일 저장명(경로 포함)
					fileDto[loop].setFileSize((Long.parseLong(fileSize)));	// 파일 크기
					
					totalSize += Long.parseLong(fileSize);
				}
				
				saleDto.setImg(fileDto[0].getFileNameSave());
				saleDto.setDt_sale_end(saleDto.getDt_sale_end() + " 23:59:59");
				
				if (saleSrvc.insert(saleDto)) {
					request.setAttribute("script"	, "alert('등록되었습니다.');");
					request.setAttribute("redirect"	, "/console/sale/list.web");
				}
				else {
					request.setAttribute("script"	, "alert('시스템 관리자에게 문의하세요!');");
					request.setAttribute("redirect"	, "/");
				}
			}
			else {
				request.setAttribute("script"	, "alert('" + message + "');");
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
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 판매 등록 작성</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/sale/writeForm.web")
	public ModelAndView writeForm(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			saleDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MNG")));
			List<SaleDto> listPrd = saleSrvc.listPrd(saleDto);
			
			// [2024-08-12][pluto@himedia.co.kr][TODO: 판매 상품 등록 폼에서 상품 목록의 Service는 상품 서비스에서 가져옴]
			mav.addObject("listPrd", listPrd);
			
			mav.setViewName("backoffice/sale/writeForm");
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
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 내 판매 목록 보기</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/sale/view.web")
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response, SaleDto saleDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {

			saleDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MNG")));
			
			SaleDto _saleDto = saleSrvc.select(saleDto);
			
			mav.addObject("saleDto", _saleDto);
			mav.setViewName("backoffice/sale/view");
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
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 내 판매 목록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/sale/list.web")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			pagingDto.setRegister(Integer.parseInt(getSession(request, "SEQ_MNG")));
			
			PagingListDto pagingListDto = saleSrvc.list(pagingDto);
			
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("list"	, pagingListDto.getList());
			
			mav.setViewName("backoffice/sale/list");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".list()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}

}
