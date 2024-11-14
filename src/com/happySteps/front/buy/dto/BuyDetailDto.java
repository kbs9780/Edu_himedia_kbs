/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
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
 * File			: BuyDetailDto.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241004143655][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
package com.happySteps.front.buy.dto;

/**
 * @version 1.0.0
 * @author rkdcodbs77#naver.com
 * 
 * @since 2024-10-04
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class BuyDetailDto {

	private int seq_buy_dtl		= 0;	// 구매 상세 일련번호
	private int seq_buy_mst		= 0;	// 구매 마스터 일련번호
	private int seq_sle			= 0;	// 판매 상품 일련번호
	private int seq_prd			= 0;	// 상품 일련번호
	private int count				= 0;	// 판매상품 개수
	private int price				= 0;	// 판매 상품 가격
	private String dt_reg			= "";	// 등록일시
	private int register			= 0;	// 등록자
	private String cd_state_buy		="";	// 주문상태코드 : 주문전(NULL), 주문확정(Y) 주문취소(C) 주문교환(E) 주문환불(R)
	private String sle_nm			= "";	// 판매 상품이름
	
	public String getSle_nm() {
		return sle_nm;
	}
	public void setSle_nm(String sle_nm) {
		this.sle_nm = sle_nm;
	}
	
	public int getSeq_buy_dtl() {
		return seq_buy_dtl;
	}
	public void setSeq_buy_dtl(int seq_buy_dtl) {
		this.seq_buy_dtl = seq_buy_dtl;
	}
	public int getSeq_buy_mst() {
		return seq_buy_mst;
	}
	public void setSeq_buy_mst(int seq_buy_mst) {
		this.seq_buy_mst = seq_buy_mst;
	}
	public int getSeq_sle() {
		return seq_sle;
	}
	public void setSeq_sle(int seq_sle) {
		this.seq_sle = seq_sle;
	}
	public int getSeq_prd() {
		return seq_prd;
	}
	public void setSeq_prd(int seq_prd) {
		this.seq_prd = seq_prd;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDt_reg() {
		return dt_reg;
	}
	public void setDt_reg(String dt_reg) {
		this.dt_reg = dt_reg;
	}
	public int getRegister() {
		return register;
	}
	public void setRegister(int register) {
		this.register = register;
	}
	public String getCd_state_buy() {
		return cd_state_buy;
	}
	public void setCd_state_buy(String cd_state_buy) {
		this.cd_state_buy = cd_state_buy;
	}
}
