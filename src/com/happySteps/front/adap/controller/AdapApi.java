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
 * File			: AdapApi.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241101155854][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
package com.happySteps.front.adap.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.happySteps.front.adap.dto.AdapDto;
import com.happySteps.front.common.Common;


/**
 * @version 1.0.0
 * @author rkdcodbs77#naver.com
 * 
 * @since 2024-11-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Controller("com.happySteps.front.adap.controller.AdapApi")
public class AdapApi extends Common {

	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(AdapApi.class);

	 // JSON을 AdapDto 객체로 변환
	private AdapDto parseJsonToAnimalData(String json) {
		ObjectMapper objectMapper = new ObjectMapper();
		AdapDto adapDto = null;
		try {
		
			adapDto = objectMapper.readValue(json, AdapDto.class);
		} catch (IOException e) {
			logger.error("JSON 파싱 중 오류 발생: {}", e.getMessage());
		}
		return adapDto;
	}

	/**
	 * POST 방식으로만 외부 API와 통신하여 동물 정보를 추가하는 코드
	 * @param model 뷰에 전달할 모델
	 * @param Pblanc_idntfy_no 공고 번호
	 * @return view
	 */
	/*
	public String showAnimalDetails(Model model, String Pblanc_idntfy_no) {
		String apiUrl = "https://openapi.gg.go.kr/AbdmAnimalProtect?KEY=e705ae67f910466d9eef16b2618fa1c2&Type=json&pIndex=1&pSize=1";
		String responseJson;

		try {
			// HttpURLConnection을 사용한 POST 요청
			HttpURLConnection connection = (HttpURLConnection) new URL(apiUrl).openConnection();
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/json; utf-8");
			connection.setRequestProperty("Accept", "application/json");
			connection.setDoOutput(true);

			// 요청 본문에 JSON 데이터 작성
			String requestJson = "{\"Pblanc_idntfy_no\":\"" + Pblanc_idntfy_no + "\"}"; // 요청 JSON 수정
			try (OutputStream os = connection.getOutputStream()) {
				byte[] input = requestJson.getBytes("utf-8");
				os.write(input, 0, input.length);
			}

			// 응답을 읽어와서 StringBuilder에 저장
			try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"))) {
				StringBuilder response = new StringBuilder();
				String responseLine;
				while ((responseLine = br.readLine()) != null) {
					response.append(responseLine.trim());
				}
				responseJson = response.toString();
			}

			logger.debug("API 호출 성공, 응답: {}", responseJson);

			// JSON을 AdapDto 객체로 변환
			AdapDto adapDto = parseJsonToAnimalData(responseJson);

			if (adapDto != null) {
				// 모델에 동물 정보 추가
				model.addAttribute("공고번호", adapDto.getPblanc_idntfy_no());
				model.addAttribute("품종", adapDto.getSpecies_nm());
				model.addAttribute("색상", adapDto.getColor_nm());
				model.addAttribute("성별", adapDto.getSex_nm());
				model.addAttribute("중성화여부", adapDto.getNeut_yn()); 
				model.addAttribute("나이", adapDto.getAge_info());
				model.addAttribute("체중", adapDto.getBdwgh_info());
				model.addAttribute("특이사항", adapDto.getSfetr_info());
				model.addAttribute("특징", adapDto.getPartclr_matr());
				model.addAttribute("발견장소", adapDto.getDiscvry_plc_info());
				model.addAttribute("접수일시", adapDto.getPblanc_begin_de());
				model.addAttribute("관할기관이름", adapDto.getJurisd_inst_nm());
				model.addAttribute("관할기관연락처", adapDto.getShter_telno());
				model.addAttribute("보호장소", adapDto.getProtect_plc());
				model.addAttribute("담당자이름", adapDto.getChrgpsn_nm());
				model.addAttribute("담당자연락처", adapDto.getChrgpsn_contct_no());
			} else {
				logger.error("AdapDto 객체 생성 실패");
			}

		} catch (Exception e) {
			logger.error("API 호출 중 오류 발생: {}", e.getMessage());
			model.addAttribute("error", "동물 정보 로드 중 오류가 발생했습니다.");
		}

		// JSP 뷰로 이동
		return "/front/adap/view.web"; // view.jsp로 포워딩
	}
*/
	
	/**
	 * POST 방식으로만 외부 API와 통신하여 JSON 응답을 받는 메서드
	 * @param requestJson 요청할 JSON 데이터
	 * @return 외부 API의 응답
	 */
	@RequestMapping(value = "/front/adap/view.json", method = RequestMethod.POST)
	public ResponseEntity<String> viewAdap(@RequestBody String requestJson) {
		String apiUrlTemplate = "https://openapi.gg.go.kr/AbdmAnimalProtect?KEY=e705ae67f910466d9eef16b2618fa1c2&Type=json&pIndex=%s&pSize=%s";
		
		// 요청 JSON에서 필요한 정보 추출
		String page = extractJsonValue(requestJson, "page");
		String index = extractJsonValue(requestJson, "index");
		//String sigunCd = extractJsonValue(requestJson, "sigunCd");
		//String stateNm = extractJsonValue(requestJson, "stateNm");
		//String pblancBeginDe = extractJsonValue(requestJson, "pblancBeginDe");
		//String pblancEndDe = extractJsonValue(requestJson, "pblancEndDe");
		//String speciesNm = extractJsonValue(requestJson, "speciesNm");
		//String shterNm = extractJsonValue(requestJson, "shterNm");

		// 로그로 추출된 파라미터 값 확인
		logger.debug("Extracted parameters: SIGUN_CD={}, STATE_NM={}, PBLANC_BEGIN_DE={}, PBLANC_END_DE={}, SPECIES_NM={}, SHTER_NM={}");

		// API URL 생성
//		String apiUrl = String.format("%s&SIGUN_CD=%s&STATE_NM=%s&PBLANC_BEGIN_DE=%s&PBLANC_END_DE=%s&SPECIES_NM=%s&SHTER_NM=%s",
//	            apiUrlTemplate, sigunCd, stateNm, pblancBeginDe, pblancEndDe, speciesNm, shterNm);

		String apiUrl = String.format(apiUrlTemplate, index, page) ;
//			    + "&SIGUN_CD=" + sigunCd 
//			    + "&STATE_NM=" + stateNm 
//			    + "&PBLANC_BEGIN_DE=" + pblancBeginDe 
//			    + "&PBLANC_END_DE=" + pblancEndDe 
//			    + "&SPECIES_NM=" + speciesNm 
//			    + "&SHTER_NM=" + shterNm;
		
		String responseJson;
		logger.debug("API 호출 시작: {}", apiUrl);
		try {
			// HttpURLConnection을 사용한 POST 요청 구현
			HttpURLConnection connection = (HttpURLConnection) new URL(apiUrl).openConnection();
			
			connection.setConnectTimeout(3000);
			connection.setReadTimeout(3000);
			
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/json");
			//connection.setRequestProperty("Accept", "application/json"); //해당문장으로인해 오류 발생!
			connection.setDoInput(true);
			connection.setDoOutput(true);

			// 요청 본문에 JSON 데이터를 작성
			try (OutputStream os = connection.getOutputStream()) {
				byte[] input = requestJson.getBytes("utf-8");
				os.write(input, 0, input.length);
			}

			// 응답을 읽기
			try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"))) {
				StringBuilder response = new StringBuilder();
				String responseLine;
				while ((responseLine = br.readLine()) != null) {
					response.append(responseLine.trim());
				}
				responseJson = response.toString();
			}

			//logger.debug("API 호출 성공, 응답: {}", responseJson);
			
			return ResponseEntity.ok(responseJson);

		}
		catch (RuntimeException e) {
			logger.error("API 호출 중 RuntimeException 발생, 메시지: {}", e.getMessage());
			return ResponseEntity.status(500).body("{\"error\":\"" + e.getMessage() + "\"}");
		}
		catch (Exception e) {
			logger.error("API 호출 중 오류 발생", e);
			return ResponseEntity.status(500).body("{\"error\":\"" + e.getMessage() + "\"}");
		}
	}
	// JSON 값 추출 메서드
	private String extractJsonValue(String json, String key) {
	    String searchKey = "\"" + key + "\":\"";
	    int startIndex = json.indexOf(searchKey);
	    if (startIndex == -1) {
	        return ""; // 키가 존재하지 않으면 빈 문자열 반환
	    }
	    startIndex += searchKey.length();
	    int endIndex = json.indexOf("\"", startIndex);
	    return json.substring(startIndex, endIndex);
	}
	/**
	* 외부 API와 통신하여 JSON 응답을 받는 메서드
	* @param requestJson 요청할 JSON 데이터
	* @return 외부 API의 응답
	*/
	@RequestMapping(value = "/front/adap/list.json", method = RequestMethod.POST)
	public ResponseEntity<String> callExternalApi(@RequestBody String requestJson) {
		String responseJson = null;
		int pageIndex = 1; // 기본 페이지 번호

		// 요청 JSON에서 pageIndex를 추출
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, Object> requestMap = objectMapper.readValue(requestJson, new TypeReference<Map<String, Object>>() {});
			pageIndex = (int) requestMap.getOrDefault("pageIndex", 1); // 기본값 1
		} catch (Exception e) {
			logger.error("요청 본문 파싱 중 오류 발생", e);
		}

		String apiUrl = "https://openapi.gg.go.kr/AbdmAnimalProtect?KEY=e705ae67f910466d9eef16b2618fa1c2&Type=json&pIndex=" + pageIndex + "&pSize=20";

		logger.debug("API 호출 시작: {}", apiUrl);
		try {
			// URL 객체 생성
			URL url = new URL(apiUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// 요청 방식 설정
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setDoOutput(true);

			// 요청 바디 전송
			try (OutputStream os = conn.getOutputStream()) {
				byte[] input = requestJson.getBytes("utf-8");
				os.write(input, 0, input.length);
			}

			// 응답 읽기
			try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
				StringBuilder responseBuilder = new StringBuilder();
				String responseLine;
				while ((responseLine = br.readLine()) != null) {
					responseBuilder.append(responseLine.trim());
				}
				responseJson = responseBuilder.toString();
			}

			return ResponseEntity.ok(responseJson);
		} catch (RuntimeException e) {
			logger.error("API 호출 중 RuntimeException 발생, 상태 코드: {}, 메시지: {}", e.getMessage());
			return ResponseEntity.status(500).body("{\"error\":\"" + e.getMessage() + "\"}");
		} catch (Exception e) {
			logger.error("API 호출 중 오류 발생", e);
			return ResponseEntity.status(500).body("{\"error\":\"" + e.getMessage() + "\"}");
		}
	}
}