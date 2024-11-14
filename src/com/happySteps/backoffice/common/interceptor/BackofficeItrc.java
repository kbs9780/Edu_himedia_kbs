/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF com.happySteps.
 * com.happySteps OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 com.happySteps ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 com.happySteps에 있으며,
 * com.happySteps이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * com.happySteps의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 com.happySteps All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: BackofficeItrc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241002115711][son062121#gmail.com][CREATE: Initial Release]
 */
package com.happySteps.backoffice.common.interceptor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.happySteps.backoffice.common.component.SessionCmpn;

/**
 * @version 1.0.0
 * @author son062121#gmail.com
 * 
 * @since 2024-10-02
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class BackofficeItrc extends HandlerInterceptorAdapter {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(BackofficeItrc.class);
	
	@Autowired
	SessionCmpn sessionCmpn;
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @param handler [핸들러]
	 * @throws IOException [IO 예외]
	 * @throws ServletException [서블릿 예외]
	 * @return boolean
	 * 
	 * @since 2024-10-02
	 * <p>DESCRIPTION: 컨트롤러 접근 전에 가로채기 위해 preHandle 오버라이드</p>
	 * <p>IMPORTANT: 파라미터는 데이터 타입 및 형식을 만족하여야 한다.</p>
	 * <p>EXAMPLE:</p>
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException, ServletException {
		
		try {
			// 세션이 없으면 무조건 /reject.web으로이동
			if (!sessionCmpn.isSession(request)) {
				// response.sendRedirect(request.getContextPath() + "/reject.web");
				response.sendRedirect(request.getContextPath() + "/console/login/loginForm.web?url=" + request.getRequestURI());
				return false;
			}
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".preHandle()] " + e.getMessage(), e);
		}
		
		return true;
	}
}