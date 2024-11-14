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
 * File			: ProductDao.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [202410010900][hyeen103#gmail.com][CREATE: Initial Release]
 */
package com.happySteps.backoffice.product.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.happySteps.backoffice.common.dao.BaseDao;
import com.happySteps.backoffice.common.dto.PagingDto;
import com.happySteps.backoffice.product.dto.ProductDto;


/**
 * @version 1.0.0
 * @author hyeen103@gmail.com
 * 
 * @since 202410010900
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Repository("com.happySteps.backoffice.product.service. ProductDao")
public class ProductDao extends BaseDao {
	
	public int update(ProductDto productDto) {
		return sqlSessionBackoffice.update("com.happySteps.backoffice.mybatis.product.Product.update", productDto);
	}
	
	public ProductDto select(ProductDto productDto) {
		return sqlSessionBackoffice.selectOne("com.happySteps.backoffice.mybatis.product.Product.select", productDto);
	}
	
	public int deleteFlag(ProductDto productDto) {
		return sqlSessionBackoffice.update("com.happySteps.backoffice.mybatis.product.Product.deleteFlag", productDto);
	}
	
	public int count(PagingDto pagingDto) {
		return sqlSessionBackoffice.selectOne("com.happySteps.backoffice.mybatis.product.Product.count", pagingDto);
	}
	
	public List<ProductDto> list(PagingDto pagingDto) {
		return sqlSessionBackoffice.selectList("com.happySteps.backoffice.mybatis.product.Product.list", pagingDto);
	}
	
	public int insert(ProductDto productDto) {
		return sqlSessionBackoffice.insert("com.happySteps.backoffice.mybatis.product.Product.insert", productDto);
	}
	
	public int sequence() {
		return sqlSessionBackoffice.selectOne("com.happySteps.backoffice.mybatis.product.Product.sequence");
	}

}
