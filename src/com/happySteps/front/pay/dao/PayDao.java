/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF happySteps.com.
 * happySteps.com OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 happySteps.com ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 happySteps.com에 있으며,
 * happySteps.com이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * happySteps.com의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 happySteps.com All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: PayDao.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240813101034][kbs@happySteps.com][CREATE: Initial Release]
 */
package com.happySteps.front.pay.dao;

import org.springframework.stereotype.Repository;

import com.happySteps.front.common.dao.BaseDao;
import com.happySteps.front.pay.dto.PayDto;

/**
 * @version 1.0.0
 * @author kbs@happySteps.com
 * 
 * @since 2024-10-25
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Repository("com.happySteps.front.pay.dao.PayDao")
public class PayDao extends BaseDao {
	
	public int updateByOrderNum(PayDto payDto) {
		return sqlSessionFront.update("com.happySteps.front.mybatis.pay.Pay.updateByOrderNum", payDto);
	}
	
	public PayDto select(PayDto payDto) {
		return sqlSessionFront.selectOne("com.happySteps.front.mybatis.pay.Pay.select", payDto);
	}
	
	public int updateByDealNum(PayDto payDto) {
		return sqlSessionFront.update("com.happySteps.front.mybatis.pay.Pay.updateByDealNum", payDto);
	}
	
	public int insert(PayDto payDto) {
		return sqlSessionFront.insert("com.happySteps.front.mybatis.pay.Pay.insert", payDto);
	}
	
	public int sequence() {
		return sqlSessionFront.selectOne("com.happySteps.front.mybatis.pay.Pay.sequence");
	}
}