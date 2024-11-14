/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF COM.HAPPYSTEPS.
 * COM.HAPPYSTEPS OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 COM.HAPPYSTEPS ALL RIGHTS RESERVED.
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
 * File			: PharmacyApi.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241106171434][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
package com.happySteps.front.pharmacy.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.happySteps.front.common.Common;

/**
 * @version 1.0.0
 * @author rkdcodbs77#naver.com
 * 
 * @since 2024-11-06
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("com.happySteps.front.pharmacy.PharmacyApi")
public class PharmacyApi extends Common {

	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(PharmacyApi.class);

	
	 @RequestMapping(value = "/front/pharmacy/data.json", produces = "application/json; charset=UTF-8")
	    @ResponseBody
	    public String getPharmacyData(@RequestParam(defaultValue = "1") int pageIndex) {
	        StringBuilder result = new StringBuilder();

	        try {
	            // API URL (동물약국 데이터)
	            String apiUrl = "https://openapi.gg.go.kr/AnimalPharmacy?KEY=33ad857277a64427bd66af7937619016&Type=json&bsn_state_nm=정상&pIndex=" 
	                            + pageIndex + "&pSize=100";
	            URL url = new URL(apiUrl);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("GET");

	            // API 응답 데이터 읽기
	            try (BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"))) {
	                String line;
	                while ((line = rd.readLine()) != null) {
	                    result.append(line);
	                }
	            }
	        } catch (Exception e) {
	            // 오류 발생 시 로깅
	            logger.error("API 호출 실패: {}", e.getMessage(), e);
	            return "{\"error\": \"데이터를 가져오는 데 실패했습니다.\"}";
	        }

	        // 응답 반환
	        return result.toString(); 
	    }
	}