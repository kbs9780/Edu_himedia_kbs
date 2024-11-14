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
 * File			: LikeDto.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241021140617][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
package com.happySteps.front.like.dto;

/**
 * @version 1.0.0
 * @author rkdcodbs77#naver.com
 * 
 * @since 2024-10-21
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class LikeDto {
	private int seq_bbs		= 0;		//게시물 일련번호
	private int seq_lke		= 0;		//좋아요 일련번호
	private String flg_lke		= "";		//좋아요 여부
	private int cd_ctg			= 0;		//카테고리:상품(0),입양(1),게시글(2),댓글(3)
	private int register		= 0;		//등록자
	private int seq_mbr 		= 0;		//회원 일련번호
	private String dt_reg		= "";		//등록일시
	private int updater		= 0;		//수정자
	private String dt_upt		= "";		//수정일시
	
	public int getSeq_bbs() {
		return seq_bbs;
	}
	public void setSeq_bbs(int seq_bbs) {
		this.seq_bbs = seq_bbs;
	}
	public int getSeq_lke() {
		return seq_lke;
	}
	public void setSeq_lke(int seq_lke) {
		this.seq_lke = seq_lke;
	}
	
	public String getFlg_lke() {
		return flg_lke;
	}
	public void setFlg_lke(String flg_lke) {
		this.flg_lke = flg_lke;
	}
	public int getCd_ctg() {
		return cd_ctg;
	}
	public void setCd_ctg(int cd_ctg) {
		this.cd_ctg = cd_ctg;
	}
	public int getRegister() {
		return register;
	}
	public void setRegister(int register) {
		this.register = register;
	}
	public String getDt_reg() {
		return dt_reg;
	}
	public void setDt_reg(String dt_reg) {
		this.dt_reg = dt_reg;
	}
	public int getUpdater() {
		return updater;
	}
	public void setUpdater(int updater) {
		this.updater = updater;
	}
	public String getDt_upt() {
		return dt_upt;
	}
	public void setDt_upt(String dt_upt) {
		this.dt_upt = dt_upt;
	}
	public int getSeq_mbr() {
		return seq_mbr;
	}
	public void setSeq_mbr(int seq_mbr) {
		this.seq_mbr = seq_mbr;
	}
}
