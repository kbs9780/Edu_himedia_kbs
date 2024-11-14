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
 * File			: AdapDto.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241101154613][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
package com.happySteps.front.adap.dto;

/**
 * @version 1.0.0
 * @author rkdcodbs77#naver.com
 * 
 * @since 2024-11-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class AdapDto {

	private String sigun_cd ="";			// 지역 시군 코드
	private String sigun_nm ="";			// 지역 시군 이름
	private String abdm_idntfy_no ="";		// 동물 식별 번호
	private String thumb_image_cours =""; 	// 동물의 썸네일 이미지 URL
	private String recept_de =""; 			// 접수 날짜 (형식: YYYYMMDD)
	private String discvry_plc_info =""; 	// 발견 장소 정보
	private String species_nm ="";			// 동물의 종류 및 종
	private String color_nm =""; 			// 동물의 색상
	private String age_info =""; 			// 동물의 나이 정보 
	private String bdwgh_info =""; 			// 동물의 체중 정보 (예: 9Kg)
	private String pblanc_idntfy_no ="";	// 공고 식별 번호
	private String pblanc_begin_de =""; 	// 공고 시작 날짜 (형식: YYYYMMDD)
	private String pblanc_end_de =""; 		// 공고 종료 날짜 (형식: YYYYMMDD)
	private String image_cours =""; 		// 동물의 이미지 URL
	private String state_nm =""; 			// 동물의 현재 상태 (예: 보호중)
	private String sex_nm =""; 				// 동물의 성별 (예: M(수컷), F(암컷))
	private String neut_yn =""; 			// 중성화 여부 (예: Y(중성화됨), N(중성화되지 않음))
	private String sfetr_info =""; 			// 동물의 특이사항 또는 성격 정보
	private String shter_nm =""; 			// 보호소 이름
	private String shter_telno =""; 		// 보호소 전화번호
	private String protect_plc =""; 		// 동물이 보호되는 장소
	private String jurisd_inst_nm =""; 		// 관할 기관 이름
	private String chrgpsn_nm =""; 			// 담당자 이름
	private String chrgpsn_contct_no =""; 	// 담당자 연락처
	private String partclr_matr =""; 		// 동물의 특징
	private String refine_lotno_addr =""; 	// 상세 주소 (지번)
	private String refine_roadnm_addr ="";  // 상세 주소 (도로명)
	private String refine_zip_cd =""; 		// 우편번호
	private String refine_wgs84_logt =""; 	// WGS84 경도
	private String refine_wgs84_lat =""; 	// WGS84 위도
	
	
	public String getSigun_cd() {
		return sigun_cd;
	}
	public void setSigun_cd(String sigun_cd) {
		this.sigun_cd = sigun_cd;
	}
	public String getSigun_nm() {
		return sigun_nm;
	}
	public void setSigun_nm(String sigun_nm) {
		this.sigun_nm = sigun_nm;
	}
	public String getAbdm_idntfy_no() {
		return abdm_idntfy_no;
	}
	public void setAbdm_idntfy_no(String abdm_idntfy_no) {
		this.abdm_idntfy_no = abdm_idntfy_no;
	}
	public String getThumb_image_cours() {
		return thumb_image_cours;
	}
	public void setThumb_image_cours(String thumb_image_cours) {
		this.thumb_image_cours = thumb_image_cours;
	}
	public String getRecept_de() {
		return recept_de;
	}
	public void setRecept_de(String recept_de) {
		this.recept_de = recept_de;
	}
	public String getDiscvry_plc_info() {
		return discvry_plc_info;
	}
	public void setDiscvry_plc_info(String discvry_plc_info) {
		this.discvry_plc_info = discvry_plc_info;
	}
	public String getSpecies_nm() {
		return species_nm;
	}
	public void setSpecies_nm(String species_nm) {
		this.species_nm = species_nm;
	}
	public String getColor_nm() {
		return color_nm;
	}
	public void setColor_nm(String color_nm) {
		this.color_nm = color_nm;
	}
	public String getAge_info() {
		return age_info;
	}
	public void setAge_info(String age_info) {
		this.age_info = age_info;
	}
	public String getBdwgh_info() {
		return bdwgh_info;
	}
	public void setBdwgh_info(String bdwgh_info) {
		this.bdwgh_info = bdwgh_info;
	}
	public String getPblanc_idntfy_no() {
		return pblanc_idntfy_no;
	}
	public void setPblanc_idntfy_no(String pblanc_idntfy_no) {
		this.pblanc_idntfy_no = pblanc_idntfy_no;
	}
	public String getPblanc_begin_de() {
		return pblanc_begin_de;
	}
	public void setPblanc_begin_de(String pblanc_begin_de) {
		this.pblanc_begin_de = pblanc_begin_de;
	}
	public String getPblanc_end_de() {
		return pblanc_end_de;
	}
	public void setPblanc_end_de(String pblanc_end_de) {
		this.pblanc_end_de = pblanc_end_de;
	}
	public String getImage_cours() {
		return image_cours;
	}
	public void setImage_cours(String image_cours) {
		this.image_cours = image_cours;
	}
	public String getState_nm() {
		return state_nm;
	}
	public void setState_nm(String state_nm) {
		this.state_nm = state_nm;
	}
	public String getSex_nm() {
		return sex_nm;
	}
	public void setSex_nm(String sex_nm) {
		this.sex_nm = sex_nm;
	}
	public String getNeut_yn() {
		return neut_yn;
	}
	public void setNeut_yn(String neut_yn) {
		this.neut_yn = neut_yn;
	}
	public String getSfetr_info() {
		return sfetr_info;
	}
	public void setSfetr_info(String sfetr_info) {
		this.sfetr_info = sfetr_info;
	}
	public String getShter_nm() {
		return shter_nm;
	}
	public void setShter_nm(String shter_nm) {
		this.shter_nm = shter_nm;
	}
	public String getShter_telno() {
		return shter_telno;
	}
	public void setShter_telno(String shter_telno) {
		this.shter_telno = shter_telno;
	}
	public String getProtect_plc() {
		return protect_plc;
	}
	public void setProtect_plc(String protect_plc) {
		this.protect_plc = protect_plc;
	}
	public String getJurisd_inst_nm() {
		return jurisd_inst_nm;
	}
	public void setJurisd_inst_nm(String jurisd_inst_nm) {
		this.jurisd_inst_nm = jurisd_inst_nm;
	}
	public String getChrgpsn_nm() {
		return chrgpsn_nm;
	}
	public void setChrgpsn_nm(String chrgpsn_nm) {
		this.chrgpsn_nm = chrgpsn_nm;
	}
	public String getChrgpsn_contct_no() {
		return chrgpsn_contct_no;
	}
	public void setChrgpsn_contct_no(String chrgpsn_contct_no) {
		this.chrgpsn_contct_no = chrgpsn_contct_no;
	}
	public String getPartclr_matr() {
		return partclr_matr;
	}
	public void setPartclr_matr(String partclr_matr) {
		this.partclr_matr = partclr_matr;
	}
	public String getRefine_lotno_addr() {
		return refine_lotno_addr;
	}
	public void setRefine_lotno_addr(String refine_lotno_addr) {
		this.refine_lotno_addr = refine_lotno_addr;
	}
	public String getRefine_roadnm_addr() {
		return refine_roadnm_addr;
	}
	public void setRefine_roadnm_addr(String refine_roadnm_addr) {
		this.refine_roadnm_addr = refine_roadnm_addr;
	}
	public String getRefine_zip_cd() {
		return refine_zip_cd;
	}
	public void setRefine_zip_cd(String refine_zip_cd) {
		this.refine_zip_cd = refine_zip_cd;
	}
	public String getRefine_wgs84_logt() {
		return refine_wgs84_logt;
	}
	public void setRefine_wgs84_logt(String refine_wgs84_logt) {
		this.refine_wgs84_logt = refine_wgs84_logt;
	}
	public String getRefine_wgs84_lat() {
		return refine_wgs84_lat;
	}
	public void setRefine_wgs84_lat(String refine_wgs84_lat) {
		this.refine_wgs84_lat = refine_wgs84_lat;
	}
	
	// 필터링 메서드 추가
	public boolean matchesFilter(String type, String gender) {
		boolean matchesType = (type == null || type.equalsIgnoreCase(species_nm));
		boolean matchesGender = (gender == null || 
				(gender.equalsIgnoreCase("M") && "수컷".equals(sex_nm)) ||
				(gender.equalsIgnoreCase("F") && "암컷".equals(sex_nm)) ||
				(gender.equalsIgnoreCase("Q") && "알 수 없음".equals(sex_nm)));

		return matchesType && matchesGender;
	}

}
