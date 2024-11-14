/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HAPPYSTEPS.COM.
 * HAPPYSTEPS.COM OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HAPPYSTEPS.COM ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 happysteps.com에 있으며,
 * happysteps.com이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * happysteps.com의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 happysteps.com All Rights Reserved.
 *
 *
 * Program		: com.happysteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: MemberWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240620143410][kbs@happySteps.com][CREATE: Initial Release]
 */
package com.happySteps.front.member.controller;

import java.net.URLDecoder;
import java.util.Properties;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.happySteps.common.component.EmailCmpn;
import com.happySteps.common.dto.EmailDto;
import com.happySteps.front.common.Common;
import com.happySteps.front.member.dto.MemberDto;
import com.happySteps.front.member.service.MemberSrvc;
import com.happySteps.util.security.HSwithSHA;
import com.happySteps.util.security.SKwithAES;
/**
 * @version 1.0.0
 * @author kbs@happySteps.com
 * 
 * @since 2024-06-20
 * <p>DESCRIPTION: 회원 컨트롤러</p>
 * <p>IMPORTANT:</p>
 */
@Controller("com.happySteps.front.member.controller.MemberWeb")
public class MemberWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(MemberWeb.class);
	
	@Autowired
	Properties staticProperties;
	
	@Autowired 
	private MessageSourceAccessor dynamicProperties;
	
	@Inject
	private EmailCmpn emailCmpn;
	
	
	@Inject
	private MemberSrvc memberSrvc;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-09-19
	 * <p>DESCRIPTION: 이메일 인증</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/confirmEmail.web")
	public ModelAndView confirmEmail(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");

		try {
			logger.debug(">>> " + memberDto.getPasswd());
			logger.debug(">>> " + memberDto.getId());
			logger.debug(">>> " + memberDto.getEmail());
			logger.debug(">>> " + memberDto.getMbr_nm());
			
			memberDto.setPasswd(HSwithSHA.encode(memberDto.getPasswd()));
			if (memberSrvc.newPasswd(memberDto)) {
				logger.debug("OK");
				request.setAttribute("script"	, "alert('임시 비밀번호로 로그인 후 비밀번호를 재설정 해주세요!');");
				request.setAttribute("redirect"	, "/front/login/loginForm.web");
			}
			else {
				// [2024-09-19][hyeen103@gmail.com][TODO: 10분 이내에 인증되지 않은 이메일이므로 '#' + SEQ_MBR + '_' + EMAIL 패턴으로 업데이트]
				request.setAttribute("script"	, "alert('회원 가입 재시도 또는 고객센터에 문의하세요!');");
				request.setAttribute("redirect"	, "/");
			}
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".confirmEmail()] " + e.getMessage(), e);
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
	 * @since 2024-08-02
	 * <p>DESCRIPTION: 비밀번호 찾기 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/findPasswdProc.web", method = RequestMethod.POST)
	public ModelAndView findPasswdProc(HttpServletRequest request, HttpServletResponse response,MemberDto memberDto) {

	    ModelAndView mav = new ModelAndView("redirect:/error.web");

	    try {
	        // 아이디 찾기 폼에서 입력한 사용자의 이름과 이메일을 가져옴
	        String id		= request.getParameter("id");
	        String email	= request.getParameter("email");
	        String name		= request.getParameter("name");
	        
	        logger.debug("인풋이름=" + id);
	        logger.debug("인풋이메일=" + email);
	        logger.debug("인풋이메일=" + name);
	   
	        // 해쉬 암호화(SHA-256)
	     	memberDto.setPasswd(HSwithSHA.encode(memberDto.getPasswd()));
	        
	        // DB값을 불러오기
	        String staticKey = staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
	        SKwithAES aes = new SKwithAES(staticKey);
	        
	        // 브라우저에서 입력한 값들을 암호화함
	        memberDto.setId(aes.encode(id));
	        memberDto.setEmail(aes.encode(email));
	        memberDto.setMbr_nm(aes.encode(name));
	        
	        //logger.debug("인풋이름=" + aes.encode(id));
	        
	        MemberDto _memberDto = memberSrvc.findPasswd(memberDto);
	        
	        if (_memberDto != null) {
	        	
	            // 랜덤 임시 비밀번호 생성
	            int length = 8;
	            StringBuilder sb = new StringBuilder();
	            Random rd = new Random();

	            for (int i = 0; i < length; i++) {
	                if (rd.nextBoolean()) {
	                    sb.append(rd.nextInt(10)); // 0-9 숫자 추가
	                } else {
	                    sb.append((char) (rd.nextInt(26) + 65)); // A-Z 대문자 추가
	                }
	            }
	            String temporaryPassword = sb.toString(); // 생성된 임시 비밀번호

	            logger.debug("temporaryPassword=" +temporaryPassword);
	            // 가입 축하 이메일 발송 
	            EmailDto emailDto = new EmailDto();
	            
	            emailDto.setSender(dynamicProperties.getMessage("email.sender.mail"));
	            emailDto.setTo(new String[]{email});
	            emailDto.setSubject("임시비밀번호");
	            emailDto.setMessage("<b>하기 URL을 클릭해주세요!</b> " 
	            		+ "<a href='http://127.0.0.1:8080/front/member/confirmEmail.web?Passwd=" + temporaryPassword + "&" +
	            		"id=" + aes.encode(id) + "&" +
	                    "email=" + aes.encode(email) + "&" +
	                    "mbr_nm=" + aes.encode(name)
	            		+ "'>URL 링크</a>"
	            + "</br>"
	            + "임시비밀번호로 로그인 후 비밀번호를 재설정해주세요."
	            + "</br>"
	            + "임시비밀번호는" + temporaryPassword + "입니다!"
	            );
	            emailCmpn.send(emailDto);

	            mav.addObject("temporaryPassword", HSwithSHA.encode(memberDto.getPasswd()));
	            
	            mav.setViewName("front/login/loginForm"); // ID를 보여줄 JSP 페이지로 리디렉션
	            
	            logger.debug("이메일은?"+ aes.encode(email));
	            logger.debug("이름은?"+ aes.encode(name));
	            logger.debug("아이디는?"+ aes.encode(id));
	            
	            logger.debug("비밀번호?="+memberDto.getPasswd());
	            logger.debug(temporaryPassword);
	        }
	        else {
	            logger.debug("다시 한번 확인해주세요.");
	            mav.setViewName("front/member/termAgreeForm");
	        }
	    } 
	    catch (Exception e) {
	        logger.error("[" + this.getClass().getName() + ".findPasswdProc()] " + e.getMessage(), e);
	    } 
	    return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-04
	 * <p>DESCRIPTION: 비밀번호 찾기 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/findPasswdForm.web")
	public ModelAndView findPasswdForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/member/findPasswdForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".findPasswdForm()] " + e.getMessage(), e);
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
	 * @since 2024-08-02
	 * <p>DESCRIPTION: 아이디 찾기 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/findIdProc.web", method = RequestMethod.POST)
	public ModelAndView findIdProc(HttpServletRequest request, HttpServletResponse response,
	                                 MemberDto memberDto) {

	    ModelAndView mav = new ModelAndView("redirect:/error.web");

	    try {
	        // HttpSession session = request.getSession();

	        // 아이디 찾기 폼에서 입력한 사용자의 이름과 이메일을 가져옴
	        String findNm		= request.getParameter("findNm");
	        String findEmail	= request.getParameter("findEmail");

	        // session.setAttribute("findNm", findNm);
	        // session.setAttribute("findEmail", findEmail);
	        
	        //memberDto.setMbr_nm(findNm);
	        //memberDto.setEmail(findEmail);
	        
	        logger.debug("인풋이름=" + findNm);
	        logger.debug("인풋이메일=" + findEmail);
	        /*
	        if (findNm != null && findEmail != null) { // AND 연산으로 수정
	            logger.debug("설정된 memberDto 이메일(findEmail): " + memberDto.getEmail());
	            logger.debug("설정된 memberDto 이름(findNm): " + memberDto.getMbr_nm());
	        }
	        */
	        // DB값을 불러오기
	        String staticKey = staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
	        SKwithAES aes = new SKwithAES(staticKey);
	        
	        // 브라우저에서 입력한 값들을 암호화함
	        memberDto.setMbr_nm(aes.encode(findNm));
	        memberDto.setEmail(aes.encode(findEmail));

	        MemberDto _memberDto = memberSrvc.findId(memberDto);
	        
	     // 암호화된 이름과 이메일 비교
	        if (_memberDto != null) {
	            
	            logger.debug("복호화된 ID: " + aes.decode(_memberDto.getId()));

	            // 브라우저에 ID 출력
	            // request.setAttribute("foundId", aes.decode(memberDto.getId()));
	            
	            mav.addObject("foundId", aes.decode(_memberDto.getId()));
	            mav.setViewName("front/member/findIdForm"); // ID를 보여줄 JSP 페이지로 리디렉션
	            
	        }
	        else {
	            logger.debug("이름 또는 이메일이 일치하지 않습니다.");
	            mav.setViewName("front/member/termAgreeForm");
	        }
	        
	        
	    } 
	    catch (Exception e) {
	        logger.error("[" + this.getClass().getName() + ".findIdProc()] " + e.getMessage(), e);
	    } 
	    return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-04
	 * <p>DESCRIPTION: 아이디 찾기 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/findIdForm.web")
	public ModelAndView findIdForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/member/findIdForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".findIdForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	// 약관페이지
	@RequestMapping(value = "/front/member/termAgreeForm.web")
	public ModelAndView termAgreeForm(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("front/member/termAgreeForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".termAgreeForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	//인증 이메일 발송
	/*
	 * @RequestMapping(value = "/front/member/emailConfirm.web", method =
	 * RequestMethod.POST) public ModelAndView emailConfirm(HttpServletRequest
	 * request, HttpServletResponse response, MemberDto memberDto) {
	 * 
	 * ModelAndView mav = new ModelAndView("redirect:/error.web");
	 * 
	 * try {
	 * 
	 * EmailDto emailDto = new EmailDto();
	 * 
	 * emailDto.setSender(dynamicProperties.getMessage("email.sender.mail"));
	 * emailDto.setTo(new String[] {memberDto.getEmail()});
	 * emailDto.setSubject("인증 메일"); emailDto.setMessage("인증 번호" + "???");
	 * 
	 * emailCmpn.send(emailDto);
	 * 
	 * mav.setViewName("forward:/servlet/result.web"); } catch (Exception e) {
	 * logger.error("[" + this.getClass().getName() + ".emailConfirm()] " +
	 * e.getMessage(), e); } finally {}
	 * 
	 * return mav;
	 * 
	 * }
	 */
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param boardDto [게시판 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-04
	 * <p>DESCRIPTION: 마이페이지 수정 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/member/modifyProc.web")
	public ModelAndView modifyProc(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto, String _Pets, String _flg_sms, String _flg_email) {

		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			int seq_mbr = Integer.parseInt(getSession(request, "SEQ_MBR"));
			memberDto.setSeq_mbr(seq_mbr);
			memberDto.setUpdater(seq_mbr);
			
			// SMS 또는 Email 수신 동의 정보가 없을 경우 기본값(N)로 설정
			if (memberDto.getFlg_email() == null || memberDto.getFlg_email().equals("")) memberDto.setFlg_email("N");
			if (memberDto.getFlg_sms() == null || memberDto.getFlg_sms().equals("")) memberDto.setFlg_sms("N");
			
			// 입력한 정보와 기존 정보가 같으면 업데이트를 안 하고 다르면 입력한 정보로 업데이트(시간 포함)
			if (memberDto.getFlg_email().equals(_flg_email)) memberDto.setFlg_email("");
			if (memberDto.getFlg_sms().equals(_flg_sms)) memberDto.setFlg_sms("");
			
			if(memberDto.getPets().equals(_Pets)) memberDto.setPets("");
			
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setPhone(aes.encode(memberDto.getPhone()));
			memberDto.setPost(aes.encode(memberDto.getPost()));
			memberDto.setAddr1(aes.encode(memberDto.getAddr1()));
			memberDto.setAddr2(aes.encode(memberDto.getAddr2()));
			
			if (memberSrvc.update(memberDto)) {
				request.setAttribute("script"	, "alert('수정되었습니다.');");
				request.setAttribute("redirect"	, "/front/myPage/");
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
	 * @since 2024-10-04
	 * <p>DESCRIPTION: 마이페이지 수정 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/modifyForm.web")
	public ModelAndView modifyForm(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			
			MemberDto _memberDto = memberSrvc.select(memberDto);
			
			_memberDto.setEmail(aes.decode(_memberDto.getEmail()));
			_memberDto.setMbr_nm(aes.decode(_memberDto.getMbr_nm()));
			_memberDto.setPhone(aes.decode(_memberDto.getPhone()));
			_memberDto.setPost(aes.decode(_memberDto.getPost()));
			_memberDto.setAddr1(aes.decode(_memberDto.getAddr1()));
			_memberDto.setAddr2(aes.decode(_memberDto.getAddr2()));
			_memberDto.setId(aes.decode(_memberDto.getId()));
			
			String pets = "N"; // 기본값을 'N'으로 설정
			if (request.getParameter("pets1") != null) pets = pets.substring(0, 0) + "Y"; // 강아지
			if (request.getParameter("pets2") != null) pets = pets.substring(0, 1) + "Y"; // 고양이
			if (request.getParameter("pets3") != null) pets = pets.substring(0, 2) + "Y"; // 햄스터
			if (request.getParameter("pets4") != null) pets = pets.substring(0, 3) + "Y"; // 파충류
			if (request.getParameter("pets5") != null) pets = pets.substring(0, 4) + "Y"; // 기타
			
			mav.addObject("memberDto", _memberDto);
			
			mav.setViewName("front/member/modifyForm");
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
	 * @since 2024-10-04
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/checkIdDuplicate.json", method = RequestMethod.POST, 
					headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, 
					consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
	public @ResponseBody boolean checkIdDuplicate(@RequestBody MemberDto memberDto) {
		
		boolean idDuplicate = true;
		
		try {
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setId(aes.encode(memberDto.getId()));
			
			int count = memberSrvc.selectIdDuplicate(memberDto);
			
			if (count == 0) idDuplicate = false;
			
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".checkIdDuplicate()] " + e.getMessage(), e);
		}
		finally {}
		
		return idDuplicate;
	}
	@RequestMapping(value = "/front/member/checkNickDuplicate.json", method = RequestMethod.POST, 
					headers = {"content-type=application/json; charset=UTF-8", "accept=application/json"}, 
					consumes="application/json; charset=UTF-8", produces="application/json; charset=UTF-8")
		public @ResponseBody boolean checkNickDuplicate(@RequestBody MemberDto memberDto) {
		
		boolean nickDuplicate = true;
		
		try {
			
			memberDto.setNickname(memberDto.getNickname());
			
			int count = memberSrvc.selectNickDuplicate(memberDto);
			
			if (count == 0) nickDuplicate = false;
			
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".checkNickDuplicate()] " + e.getMessage(), e);
		}
		finally {}
		
		return nickDuplicate;
		}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-04
	 * <p>DESCRIPTION: 회원 가입 폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/registerForm.web")
	public ModelAndView registerForm(HttpServletRequest request, HttpServletResponse response, String term1 ,String
			  term2 , String term3 ) {
		
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			mav.addObject("term1", term1);
			mav.addObject("term2", term2);
			mav.addObject("term3", term3);
			mav.setViewName("front/member/registerForm");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".registerForm()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param mebmerDto [회원 빈]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-08
	 * <p>DESCRIPTION: 회원 가입 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/member/registerProc.web", method = RequestMethod.POST)

	public ModelAndView registerProc(HttpServletRequest request,
	HttpServletResponse response , MemberDto memberDto , String term1 , String
	term2 , String term3) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			
			if (term1 == null || term1.equals("")) term1 = "N";
			if (term2 == null || term2.equals("")) term2 = "N";
			if (term3 == null || term3.equals("")) term3 = "N";
			
			logger.debug("term1="+term1);
			logger.debug("term2="+term2);
			logger.debug("term3="+term3);
			
			// [2024-10-04][kbs@happySteps.com]
			String[] arrTermAgreement = {term1, term2, term3};
			
			if (memberDto.getFlg_email() == null || memberDto.getFlg_email().equals("")) memberDto.setFlg_email("N");
			if (memberDto.getFlg_sms() == null || memberDto.getFlg_sms().equals("")) memberDto.setFlg_sms("N");
			if (memberDto.getFlg_pets() == null || memberDto.getFlg_pets().equals("")) memberDto.setFlg_pets("N");
			
			if (memberDto.getPets() == null || memberDto.getPets().equals("")) memberDto.setPets("N");
			logger.debug("pets=" + memberDto.getPets());
			
			// 해쉬 암호화(SHA-256)
			memberDto.setPasswd(HSwithSHA.encode(memberDto.getPasswd()));
			
			// 대칭키 암호화(AES-256)
			String staticKey	= staticProperties.getProperty("front.enc.user.aes256.key", "[UNDEFINED]");
			SKwithAES aes		= new SKwithAES(staticKey);
			
			memberDto.setNickname(memberDto.getNickname());
			
			memberDto.setId(aes.encode(memberDto.getId()));
			memberDto.setMbr_nm(aes.encode(memberDto.getMbr_nm()));
			memberDto.setPhone(aes.encode(memberDto.getPhone()));
			memberDto.setEmail(aes.encode(memberDto.getEmail()));
			memberDto.setPost(aes.encode(memberDto.getPost()));
			memberDto.setAddr1(aes.encode(memberDto.getAddr1()));
			memberDto.setAddr2(aes.encode(memberDto.getAddr2()));
			
			boolean insert = memberSrvc.insert(memberDto, arrTermAgreement, aes.decode(memberDto.getPost()));
			if (insert) {
				logger.debug("가입 성공");
				
				/*
				 * // 가입 축하 이메일 발송 EmailDto emailDto = new EmailDto();
				 * 
				 * emailDto.setSender(dynamicProperties.getMessage("email.sender.mail"));
				 * emailDto.setTo(new String[] {memberDto.getEmail()});
				 * emailDto.setSubject("가입 축하 메일"); emailDto.setMessage("<b>가입</b>을 축하합니다.");
				 * 
				 * emailCmpn.send(emailDto);
				 */
				
			}
			else logger.debug("가입 실패");
			
			
			request.setAttribute("redirect"	, "/");
			
			mav.setViewName("forward:/servlet/result.web");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".registerProc()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}