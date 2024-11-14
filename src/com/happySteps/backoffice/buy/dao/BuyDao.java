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
package com.happySteps.backoffice.buy.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.happySteps.backoffice.common.dao.BaseDao;
import com.happySteps.backoffice.common.dto.PagingDto;
import com.happySteps.backoffice.buy.dto.BuyDto;

/**
 * @version 1.0.0
 * @author kbs@happySteps.com
 * 
 * @since 2024-10-04
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("com.happySteps.backoffice.buy.dao.BuyDao")
public class BuyDao extends BaseDao{
	
	public List<BuyDto> list(PagingDto pagingDto) {
		return sqlSessionBackoffice.selectList("com.happySteps.backoffice.mybatis.buy.Buy.list", pagingDto);
	}
	
	public int count(PagingDto pagingDto) {
		return sqlSessionBackoffice.selectOne("com.happySteps.backoffice.mybatis.buy.Buy.count", pagingDto);
	}

}
