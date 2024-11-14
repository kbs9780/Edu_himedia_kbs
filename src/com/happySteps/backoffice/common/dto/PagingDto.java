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
 * File			: PagingDto.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241002172702][son062121#gmail.com][CREATE: Initial Release]
 */
package com.happySteps.backoffice.common.dto;

/**
 * @version 1.0.0
 * @author son062121#gmail.com
 * 
 * @since 2024-10-02
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class PagingDto {
	
	private int totalLine		= 0;	// 전체 라인(행) 수
	private int totalPage		= 0;	// 전체 페이지 수 = 전체 라인(행) 수 / 페이징할 라인수
	private int linePerPage	= 10;	// 페이징할 라인수
	private int currentPage	= 1;	// 현재 페이지
	
	private String searchKey	= "";	// 검색키(예: 타이틀, 내용, 타이틀+내용)
	private String searchWord	= "";	// 검색어
	
	private Integer cd_state	= null;	// [공통]
	private int cd_bbs_type	= 0;	// [게시판] 공지사항(1), 자주 찾는 질문(2), 질의 응답(3)
	private int cd_state_prd	= 0;	// [판매상품상태코드]: 대기(0), 승인(1), 중지(2),반려(3), 재고소진(9)
	private String flg_delete	= "";	// 삭제 여부
	private int cd_ctg_pet		= 0;	// 카테고리:강아지(1),고양이(2),햄스터(3),파충류(4),기타(5)
	private int species		= 0;	// 동물 카테고리:강아지(1),고양이(2),햄스터(3),파충류(4),기타(5)
	private int pet_items		= 0;	// 판매 상품 카테고리 : 사료(x1), 간식(x2), 하우스(x3), 기타(x4)
	private int register		= 0;	// 등록자
	private int seq_prd		= 0;	// 상품 일련번호
	private int count_stock	= 0;	// 상품 재고
	private int cd_state_sale	= 0;	// 판매상품상태코드: 대기(0), 승인(1),중지(2), 반려(3), 품절(9)
	private int seq_sle		= 0;	// 판매상품 일련번호
	
	
	public int getSeq_sle() {
		return seq_sle;
	}
	public void setSeq_sle(int seq_sle) {
		this.seq_sle = seq_sle;
	}
	public int getSpecies() {
		return species;
	}
	public void setSpecies(int species) {
		this.species = species;
	}
	public int getCd_state_sale() {
		return cd_state_sale;
	}
	public void setCd_state_sale(int cd_state_sale) {
		this.cd_state_sale = cd_state_sale;
	}
	public int getCount_stock() {
		return count_stock;
	}
	public void setCount_stock(int count_stock) {
		this.count_stock = count_stock;
	}
	public int getSeq_prd() {
		return seq_prd;
	}
	public void setSeq_prd(int seq_prd) {
		this.seq_prd = seq_prd;
	}
	public int getRegister() {
		return register;
	}
	public void setRegister(int register) {
		this.register = register;
	}
	public int getCd_ctg_pet() {
		return cd_ctg_pet;
	}
	public void setCd_ctg_pet(int cd_ctg_pet) {
		this.cd_ctg_pet = cd_ctg_pet;
	}
	public int getPet_items() {
		return pet_items;
	}
	public void setPet_items(int pet_items) {
		this.pet_items = pet_items;
	}
	public String getFlg_delete() {
		return flg_delete;
	}
	public void setFlg_delete(String flg_delete) {
		this.flg_delete = flg_delete;
	}
	public int getCd_state_prd() {
		return cd_state_prd;
	}
	public void setCd_state_prd(int cd_state_prd) {
		this.cd_state_prd = cd_state_prd;
	}
	public Integer getCd_state() {
		return cd_state;
	}
	public void setCd_state(Integer cd_state) {
		this.cd_state = cd_state;
	}
	public int getTotalLine() {
		return totalLine;
	}
	public void setTotalLine(int totalLine) {
		this.totalLine = totalLine;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getLinePerPage() {
		return linePerPage;
	}
	public void setLinePerPage(int linePerPage) {
		this.linePerPage = linePerPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public int getCd_bbs_type() {
		return cd_bbs_type;
	}
	public void setCd_bbs_type(int cd_bbs_type) {
		this.cd_bbs_type = cd_bbs_type;
	}
}