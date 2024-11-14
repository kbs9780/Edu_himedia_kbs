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
 * File			: BuyDao.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241004142922][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
package com.happySteps.front.buy.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.happySteps.front.common.dao.BaseDao;

import com.happySteps.front.buy.dto.BuyDetailDto;
import com.happySteps.front.buy.dto.BuyDto;
import com.happySteps.front.buy.dto.BuyMasterDto;
import com.happySteps.front.common.dto.PagingDto;

/**
 * @version 1.0.0
 * @author rkdcodbs77#naver.com
 * 
 * @since 2024-10-04
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("com.happySteps.front.buy.dao.BuyDao")
public class BuyDao extends BaseDao{
	
	public int goConfirm(BuyDto buyDto) {
		return sqlSessionFront.update("com.happySteps.front.mybatis.buy.Buy.goConfirm", buyDto);
	}
	public int goCancle(BuyDto buyDto) {
		return sqlSessionFront.update("com.happySteps.front.mybatis.buy.Buy.goCancle", buyDto);
	}
	
	public int update(BuyMasterDto buyMasterDto) {
		return sqlSessionFront.update("com.happySteps.front.mybatis.buy.BuyMaster.update", buyMasterDto);
	}
	
	public int insertMaster(BuyMasterDto buyMasterDto) {
		return sqlSessionFront.insert("com.happySteps.front.mybatis.buy.BuyMaster.insert", buyMasterDto);
	}
	
	public int insertDetail(BuyDetailDto buyDetailDto) {
		return sqlSessionFront.insert("com.happySteps.front.mybatis.buy.BuyDetail.insert", buyDetailDto);
	}
	
	public int count(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("com.happySteps.front.mybatis.buy.BuyMaster.count", pagingDto);
	}
	
	public int sequenceDetail() {
		return sqlSessionFront.selectOne("com.happySteps.front.mybatis.buy.BuyDetail.sequence");
	}
	
	public int sequenceMaster() {
		return sqlSessionFront.selectOne("com.happySteps.front.mybatis.buy.BuyMaster.sequence");
	}
	
	public List<BuyMasterDto> list(PagingDto pagingDto) {
		return sqlSessionFront.selectList("com.happySteps.front.mybatis.buy.BuyMaster.list", pagingDto);
	}
	
	public List<BuyDetailDto> select(BuyMasterDto buyMasterDto) {
		return sqlSessionFront.selectList("com.happySteps.front.mybatis.buy.BuyDetail.select", buyMasterDto);
	}
	
	/**
	 * @return String
	 * 
	 * @since 2024-10-04
	 * <p>DESCRIPTION: 마이페이지 구매이력 총 구매 금액</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public String selectTotal(BuyDto buyDto) {
		return sqlSessionFront.selectOne("com.happySteps.front.mybatis.buy.Buy.selectTotal", buyDto);
	}
	
	/**
	 * @return List<BuyDto>
	 * 
	 * @since 2024-10-04
	 * <p>DESCRIPTION: 마이페이지 구매이력 목록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public List<BuyDto> list(BuyDto buyDto) {
		return sqlSessionFront.selectList("com.happySteps.front.mybatis.buy.Buy.list", buyDto);
	}
}
