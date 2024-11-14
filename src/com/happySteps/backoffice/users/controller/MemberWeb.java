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
 * File			: MemberWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240912123612][pluto@himedia.co.kr][CREATE: Initial Release]
 */
package com.happySteps.backoffice.users.controller;

import java.util.List;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.happySteps.backoffice.common.Common;
import com.happySteps.backoffice.common.dto.PagingDto;
import com.happySteps.backoffice.common.dto.PagingListDto;
import com.happySteps.backoffice.users.dto.MemberDto;
import com.happySteps.backoffice.users.service.MemberSrvc;
import com.happySteps.util.security.SKwithAES;

/**
 * @version 1.0.0
 * @author pluto@himedia.co.kr
 * 
 * @since 2024-09-12
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("com.happySteps.backoffice.users.controller.MemberWeb")
public class MemberWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(MemberWeb.class);
	
	@Autowired
	Properties staticProperties;
	
	@Inject
	MemberSrvc memberSrvc;
	
	@RequestMapping(value = "/console/users/member/list.web")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, PagingDto pagingDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("backoffice.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			String searchWord = pagingDto.getSearchWord();
			pagingDto.setSearchWord(aes.encode(searchWord));
			
			PagingListDto pagingListDto = memberSrvc.list(pagingDto);
			
			@SuppressWarnings("unchecked")
			List<MemberDto> list = (List<MemberDto>) pagingListDto.getList();
			
			for (int loop = 0; loop < list.size(); loop++) {
				list.get(loop).setId(aes.decode(list.get(loop).getId()));
				list.get(loop).setMbr_nm(aes.decode(list.get(loop).getMbr_nm()));
			}
			
			pagingDto.setSearchWord(searchWord);
			mav.addObject("paging"	, pagingListDto.getPaging());
			mav.addObject("list"	, pagingListDto.getList());
			
			mav.setViewName("backoffice/users/member/list");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".list()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	@RequestMapping(value = "/console/users/member/modifyForm.web")
	public ModelAndView modifyForm(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav	= new ModelAndView("redirect:/error.web");
		
		try {
			
			MemberDto _memberDto = memberSrvc.select(memberDto);
			
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("backoffice.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			_memberDto.setId(aes.decode(_memberDto.getId()));
			_memberDto.setMbr_nm(aes.decode(_memberDto.getMbr_nm()));
			_memberDto.setPhone(aes.decode(_memberDto.getPhone()));
			_memberDto.setEmail(aes.decode(_memberDto.getEmail()));
			_memberDto.setPost(aes.decode(_memberDto.getPost()));
			_memberDto.setAddr1(aes.decode(_memberDto.getAddr1()));
			_memberDto.setAddr2(aes.decode(_memberDto.getAddr2()));
			
			mav.addObject("memberDto", _memberDto);
			
			mav.setViewName("backoffice/users/member/modifyForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".modifyForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	@RequestMapping(value = "/console/users/member/modifyProc.web")
	public ModelAndView modifyProc(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			memberDto.setUpdater(Integer.parseInt(getSession(request, "SEQ_MNG")));
			
			String pet1 = request.getParameter("pet1") != null ? "Y" : "N";
			String pet2 = request.getParameter("pet2") != null ? "Y" : "N";
			String pet3 = request.getParameter("pet3") != null ? "Y" : "N";
			String pet4 = request.getParameter("pet4") != null ? "Y" : "N";
			String pet5 = request.getParameter("pet5") != null ? "Y" : "N";

			String pets = pet1 + pet2 + pet3 + pet4 + pet5;
			memberDto.setPets(pets);
			
			
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			
			String phone = phone1 + "-" + phone2 + "-" + phone3;
			memberDto.setPhone(phone);
			
			String flg_email = request.getParameter("flg_email") != null ? "Y" : "N";
			String flg_sms = request.getParameter("flg_sms") != null ? "Y" : "N";
			
			memberDto.setFlg_email(flg_email);
			logger.debug("겟이멜"+flg_email);
			memberDto.setFlg_sms(flg_sms);
			logger.debug("겟문자"+flg_sms);
			
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setPhone(aes.encode(memberDto.getPhone()));
			memberDto.setPost(aes.encode(memberDto.getPost()));
			memberDto.setAddr1(aes.encode(memberDto.getAddr1()));
			memberDto.setAddr2(aes.encode(memberDto.getAddr2()));
			
			if (memberSrvc.update(memberDto)) {
				request.setAttribute("script"	, "alert('적용되었습니다.');");
				request.setAttribute("redirect"	, "/console/users/member/list.web");
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
	@RequestMapping(value = "/console/users/member/modifyStateProc.web")
	public ModelAndView modifyStateProc(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {

			if (memberSrvc.update(memberDto)) {
				request.setAttribute("script"	, "alert('적용되었습니다.');");
				request.setAttribute("redirect"	, "/console/users/member/list.web");
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
}
