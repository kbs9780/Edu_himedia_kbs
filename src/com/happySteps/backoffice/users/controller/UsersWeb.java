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
* Program : com.happySteps				
* Description :					
* Environment : JRE 1.7 or more					
* File : UserWeb.java					
* Notes :					
* History : [NO][Programmer][Description]					
* : [20241007172127][son062121#gmail.com][CREATE: Initial Release]					
*/					
package com.happySteps.backoffice.users.controller;					
					
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.happySteps.backoffice.common.Common;

/**
 * @version 1.0.0
 * @author son062121#gmail.com
 * 
 * @since 2024-10-07
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("com.happySteps.backoffice.users.controller.UsersWeb")
public class UsersWeb extends Common {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(UsersWeb.class);
	
	/**
	 * @param request [요청 서블릿]
	 * @param response [응답 서블릿]
	 * @return ModelAndView
	 * 
	 * @since 2024-10-07
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/console/users/index.web")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView("redirect:/error.web");
		
		try {
			mav.setViewName("backoffice/users/index");
		}
		catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".index()] " + e.getMessage(), e);
		}
		finally {}
		
		return mav;
	}
}