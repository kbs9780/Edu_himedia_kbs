/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF com.happySteps.
 * com.happySteps OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2023 com.happySteps ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 com.happySteps에 있으며,
 * com.happySteps이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * com.happySteps의 지적재산권 침해에 해당된다.
 * Copyright (C) 2023 com.happySteps All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: BaseDao.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241003180449][son062121#gmail.com][CREATE: Initial Release]
 */
package com.happySteps.backoffice.common.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

/**
 * @version 1.0.0
 * @author son062121#gmail.com
 * 
 * @since 2024-10-02
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
public class BaseDao {
	
	@Inject
	protected SqlSession sqlSessionBackoffice;
	
	
	public SqlSession getSqlSessionBackoffice() {
		return sqlSessionBackoffice;
	}
	public void setSqlSessionBackoffice(SqlSession sqlSessionBackoffice) {
		this.sqlSessionBackoffice = sqlSessionBackoffice;
	}
}
