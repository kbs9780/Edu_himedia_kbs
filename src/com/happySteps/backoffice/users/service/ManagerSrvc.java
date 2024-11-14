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
 * File			: ManagerSrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241021195200][kbs@happySteps.com][CREATE: Initial Release]
 */
package com.happySteps.backoffice.users.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.happySteps.backoffice.common.dto.PagingDto;
import com.happySteps.backoffice.common.dto.PagingListDto;
import com.happySteps.backoffice.users.dao.ManagerDao;
import com.happySteps.backoffice.users.dto.ManagerDto;

/**
 * @version 1.0.0
 * @author kbs@happySteps.com
 * 
 * @since 2024-07-26
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("com.happySteps.backoffice.users.service.ManagerSrvc")
public class ManagerSrvc {
	
	@Inject
	ManagerDao managerDao;
	
	@Transactional("txBackoffice")
	public boolean update(ManagerDto managerDto) {
		
		if (managerDao.update(managerDto) == 1)
			return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	public int selectIdDuplicate(ManagerDto managerDto) {
		return managerDao.selectIdDuplicate(managerDto);
	}

	public int selectNickDuplicate(ManagerDto managerDto) {
		return managerDao.selectNickDuplicate(managerDto);
	}
	
	@Transactional("txBackoffice")
	public boolean insert(ManagerDto managerDto) {
		
		// 신규 관리자 번호(seq_mng)
		managerDto.setSeq_mng(managerDao.sequence());
		managerDto.setRegister(managerDto.getSeq_mng());
		
		if (managerDao.insert(managerDto) == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	public ManagerDto select(ManagerDto managerDto) {
		return managerDao.select(managerDto);
	}
	
	public PagingListDto list(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		// 전체 라인(행) 수
		int totalLine = managerDao.count(pagingDto);
		// 전체 페이지 수 = 전체 라인(행) 수 / 페이징할 라인수
		int totalPage = (int) Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(managerDao.list(pagingDto));
		
		return pagingListDto;
	}
}