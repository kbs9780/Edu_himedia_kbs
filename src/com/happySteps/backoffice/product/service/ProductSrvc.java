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
 * File			: ProductSrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [202410010900][hyeen103#gmail.com][CREATE: Initial Release]
 */
package com.happySteps.backoffice.product.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.happySteps.backoffice.common.dto.PagingDto;
import com.happySteps.backoffice.common.dto.PagingListDto;
import com.happySteps.backoffice.product.dao.ProductDao;
import com.happySteps.backoffice.product.dto.ProductDto;


/**
 * @version 1.0.0
 * @author hyeen103@gmail.com
 * 
 * @since 202410010900
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("com.happySteps.backoffice.product.service. ProductSrvc")
public class ProductSrvc {

	@Inject
	ProductDao productDao;
	/**
	 * @param productDto [판매자 상품 빈]
	 * @return ProductDto
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 판매자 상품 수정처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txBackoffice")
	public boolean update(ProductDto productDto) {
		
		int result = productDao.update(productDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	/**
	 * @param productDto [판매자 상품 빈]
	 * @return ProductDto
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 판매자 상품현황 보기</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public ProductDto select(ProductDto productDto) {
		return productDao.select(productDto);
	}
	
	/**
	 * @param productDto [게시판 빈]
	 * @return boolean
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 판매자 상품 삭제</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txBackoffice")
	public boolean deleteFlag(ProductDto productDto) {
		
		int result = productDao.deleteFlag(productDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	/**
	 * @param pagingDto [게시판 빈]
	 * @return PagingListDto
	 * 
	 * @since 2024-07-04
	 * <p>DESCRIPTION: 상품관리 리스트 페이징</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public PagingListDto list(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		// 전체 라인(행) 수
		int totalLine = productDao.count(pagingDto);
		// 전체 페이지 수 = 전체 라인(행) 수 / 페이징할 라인수
		int totalPage = (int) Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(productDao.list(pagingDto));
		
		return pagingListDto;
	}
	
	@Transactional("txBackoffice")
	public boolean insert(ProductDto productDto) {
		
		productDto.setSeq_prd(productDao.sequence());
		
		int result = productDao.insert(productDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
}
