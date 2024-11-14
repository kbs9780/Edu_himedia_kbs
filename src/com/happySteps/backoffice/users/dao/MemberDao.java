/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 himedia.co.kr에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 himedia.co.kr All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: MemberDao.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240912120512][pluto@himedia.co.kr][CREATE: Initial Release]
 */
package com.happySteps.backoffice.users.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.happySteps.backoffice.common.dao.BaseDao;
import com.happySteps.backoffice.common.dto.PagingDto;
import com.happySteps.backoffice.users.dto.MemberDto;

/**
 * @version 1.0.0
 * @author pluto@himedia.co.kr
 * 
 * @since 2024-09-12
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Repository("com.happySteps.backoffice.users.dao.MemberDao")
public class MemberDao extends BaseDao {
	
	public int updateMst(MemberDto memberDto) {
		return sqlSessionBackoffice.update("com.happySteps.backoffice.mybatis.users.Member.updateMst", memberDto);
	}
	
	public int updateDtl(MemberDto memberDto) {
		return sqlSessionBackoffice.update("com.happySteps.backoffice.mybatis.users.Member.updateDtl", memberDto);
	}
	
	public MemberDto select(MemberDto memberDto) {
		return sqlSessionBackoffice.selectOne("com.happySteps.backoffice.mybatis.users.Member.select", memberDto); 
	}
	
	public int count(PagingDto pagingDto) {
		return sqlSessionBackoffice.selectOne("com.happySteps.backoffice.mybatis.users.Member.count", pagingDto);
	}
	
	public List<MemberDto> list(PagingDto pagingDto) {
		return sqlSessionBackoffice.selectList("com.happySteps.backoffice.mybatis.users.Member.list", pagingDto);
	}
}