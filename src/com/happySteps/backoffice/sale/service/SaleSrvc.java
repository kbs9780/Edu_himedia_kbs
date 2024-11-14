/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 com.happySteps에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 com.happySteps All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: SaleSrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [202410010900][hyeen103#gmail.com][CREATE: Initial Release]
 */
package com.happySteps.backoffice.sale.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.happySteps.backoffice.common.dto.PagingDto;
import com.happySteps.backoffice.common.dto.PagingListDto;
import com.happySteps.backoffice.sale.dao.SaleDao;
import com.happySteps.backoffice.sale.dto.SaleDto;




/**
 * @version 1.0.0
 * @author hyeen103@gmail.com
 * 
 * @since 202410010900
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("com.happySteps.backoffice.sale.service.SaleSrvc")
public class SaleSrvc {

	@Inject
	SaleDao saleDao;
	
	/**
	 * @return boolean
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 품절(처리)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txBackoffice")
	public boolean soldout(SaleDto saleDto) {
		
		int result = saleDao.soldout(saleDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	/**
	 * @return boolean
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 재개(처리)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txBackoffice")
	public boolean re(SaleDto saleDto) {
		
		int result = saleDao.re(saleDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	/**
	 * @return boolean
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 판매 목록 중지(처리)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txBackoffice")
	public boolean stop(SaleDto saleDto) {
		
		int result = saleDao.stop(saleDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	/**
	 * @return boolean
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txBackoffice")
	public boolean update(SaleDto saleDto) {
		
		int result = saleDao.update(saleDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	/**
	 * @return boolean
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 상품 등록 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txBackoffice")
	public boolean insert(SaleDto saleDto) {
		
		
		// 신규 글 번호(seq_bbs)
		saleDto.setSeq_sle(saleDao.sequence());
		// 판매하고자 하는 상품 일련번호
		saleDto.setSeq_prd(saleDto.getSeq_prd());
		
		int result = saleDao.insert(saleDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	
	/**
	 * @return List<SaleDto>
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public List<SaleDto> listPrd(SaleDto saleDto) {
		return saleDao.listPrd(saleDto);
	}
	
	/**
	 * @return SaleDto
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 판매 view</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public SaleDto select(SaleDto saleDto) {
		return saleDao.select(saleDto);
	}
	
	/**
	 * @return List<SaleDto>
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public PagingListDto list(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		// 전체 라인(행) 수
		int totalLine = saleDao.count(pagingDto);
		// 전체 페이지 수 = 전체 라인(행) 수 / 페이징할 라인수
		int totalPage = (int) Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(saleDao.list(pagingDto));
		
		return pagingListDto;
	}
}
