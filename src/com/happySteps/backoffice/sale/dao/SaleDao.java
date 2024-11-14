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
 * File			: SaleDao.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [202410010900][hyeen103#gmail.com][CREATE: Initial Release]
 */
package com.happySteps.backoffice.sale.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.happySteps.backoffice.common.dao.BaseDao;
import com.happySteps.backoffice.common.dto.PagingDto;
import com.happySteps.backoffice.sale.dto.SaleDto;

/**
 * @version 1.0.0
 * @author hyeen103@gmail.com
 * 
 * @since 202410010900
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Repository("com.happySteps.backoffice.sale.dao.SaleDao")
public class SaleDao extends BaseDao{
	
	/**
	 * @return int
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 품절(처리)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int soldout(SaleDto saleDto) {
		return sqlSessionBackoffice.update("com.happySteps.backoffice.mybatis.sale.Sale.soldout", saleDto);
	}
	
	/**
	 * @return int
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 재개(처리)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int re(SaleDto saleDto) {
		return sqlSessionBackoffice.update("com.happySteps.backoffice.mybatis.sale.Sale.re", saleDto);
	}
	
	/**
	 * @return int
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 판매 중지(처리)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int stop(SaleDto saleDto) {
		return sqlSessionBackoffice.update("com.happySteps.backoffice.mybatis.sale.Sale.stop", saleDto);
	}
	
	/**
	 * @return int
	 * 
	 * @since 2024-08-18
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int update(SaleDto saleDto) {
		return sqlSessionBackoffice.update("com.happySteps.backoffice.mybatis.sale.Sale.update", saleDto);
	}
	
	/**
	 * @return int
	 * 
	 * @since 2024-07-10
	 * <p>DESCRIPTION: 상품 등록 처리</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int insert(SaleDto saleDto) {
		return sqlSessionBackoffice.insert("com.happySteps.backoffice.mybatis.sale.Sale.insert", saleDto);
	}
	
	/**
	 * @return List<SaleDto>
	 * 
	 * @since 2024-08-18
	 * <p>DESCRIPTION:</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public List<SaleDto> listPrd(SaleDto saleDto) {
		return sqlSessionBackoffice.selectList("com.happySteps.backoffice.mybatis.sale.Sale.listPrd", saleDto);
	}
	
	/**
	 * @return SaleDto
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION:판매 view</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public SaleDto select(SaleDto saleDto) {
		return sqlSessionBackoffice.selectOne("com.happySteps.backoffice.mybatis.sale.Sale.select", saleDto);
	}
	/**
	 * @return List<SaleDto>
	 * 
	 * @since 2024-08-08
	 * <p>DESCRIPTION: 판매 목록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public List<SaleDto> list(PagingDto pagingDto) {
		return sqlSessionBackoffice.selectList("com.happySteps.backoffice.mybatis.sale.Sale.list", pagingDto);
	}
	
	public int count(PagingDto pagingDto) {
		return sqlSessionBackoffice.selectOne("com.happySteps.backoffice.mybatis.sale.Sale.count", pagingDto);
	}
	
	public int sequence() {
		return sqlSessionBackoffice.selectOne("com.happySteps.backoffice.mybatis.sale.Sale.sequence");
	}

}
