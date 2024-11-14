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
 * File			: ManagerDao.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241021174600][kbs@happySteps.com][CREATE: Initial Release]
 */
package com.happySteps.backoffice.users.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.happySteps.backoffice.common.dao.BaseDao;
import com.happySteps.backoffice.common.dto.PagingDto;
import com.happySteps.backoffice.users.dto.ManagerDto;

/**
 * @version 1.0.0
 * @author kbs@happySteps.com
 * 
 * @since 2024-07-26
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Repository("com.happySteps.backoffice.users.dao.ManagerDao")
public class ManagerDao extends BaseDao {
	
	public int update(ManagerDto managerDto) {
		return sqlSessionBackoffice.update("com.happySteps.backoffice.mybatis.users.Manager.update", managerDto);
	}
	
	public int selectIdDuplicate(ManagerDto managerDto) {
		return sqlSessionBackoffice.selectOne("com.happySteps.backoffice.mybatis.users.Manager.selectIdDuplicate", managerDto);
	}
	public int selectNickDuplicate(ManagerDto managerDto) {
		return sqlSessionBackoffice.selectOne("com.happySteps.backoffice.mybatis.users.Manager.selectNickDuplicate", managerDto);
	}
	
	public ManagerDto select(ManagerDto managerDto) {
		return sqlSessionBackoffice.selectOne("com.happySteps.backoffice.mybatis.users.Manager.select", managerDto); 
	}
	
	public int count(PagingDto pagingDto) {
		return sqlSessionBackoffice.selectOne("com.happySteps.backoffice.mybatis.users.Manager.count", pagingDto);
	}
	
	public List<ManagerDto> list(PagingDto pagingDto) {
		return sqlSessionBackoffice.selectList("com.happySteps.backoffice.mybatis.users.Manager.list", pagingDto);
	}
	
	public int sequence() {
		return sqlSessionBackoffice.selectOne("com.happySteps.backoffice.mybatis.users.Manager.sequence");
	}
	
	public int insert(ManagerDto managerDto) {
		return sqlSessionBackoffice.insert("com.happySteps.backoffice.mybatis.users.Manager.insert", managerDto);
	}
}