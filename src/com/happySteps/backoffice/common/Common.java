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
 * File			: Common.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241002155751][son062121#gmail.com][CREATE: Initial Release]
 */
package com.happySteps.backoffice.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @version 1.0.0
 * @author son062121#gmail.com
 * 
 * @since 2024-10-02
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(Common.class);
	
	protected static String getSession(HttpServletRequest request, String key) {
		
		String value = "";
		
		HttpSession session = request.getSession(false);
		value = (String) session.getAttribute(key);
		
		if (value == null) value = "[UNDEFINED]";
		
		return value;
	}

	protected static void printClientIp(HttpServletRequest request) {
		logger.debug(request.getRemoteAddr());
	}
}