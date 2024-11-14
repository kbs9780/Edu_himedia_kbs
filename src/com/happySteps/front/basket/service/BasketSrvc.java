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
 * File			: BasketSrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241014174000][kbs@happySteps.com][CREATE: Initial Release]
 */
package com.happySteps.front.basket.service;

import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.happySteps.front.basket.dao.BasketDao;
import com.happySteps.front.basket.dto.BasketDto;

/**
 * @version 1.0.0
 * @author kbs@happySteps.com
 * 
 * @since 2024-08-27
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("com.happySteps.front.basket.srvc.BasketSrvc")
public class BasketSrvc {

	@Inject
	BasketDao basketDao;
	
	public List<BasketDto> getSelectedItemsByUser(int seq_mbr, List<Integer> selectedItems) {
		return basketDao.listing(seq_mbr)
						.stream()
						.filter(item -> selectedItems.contains(item.getSeq_bsk()))
						.collect(Collectors.toList());
	}

	public boolean insertOrUpdate(BasketDto basketDto) {
		List<BasketDto> existingItems = basketDao.listing(basketDto.getSeq_mbr());
		
		for (BasketDto item : existingItems) {
			if (item.getSeq_sle() == basketDto.getSeq_sle()) {
				// 동일한 상품이 있을 경우 수량 업데이트
				item.setCount(item.getCount() + basketDto.getCount());
				return basketDao.update(item) > 0;
			}
		}

		// 동일한 상품이 없으면 새로운 항목으로 추가
		return basketDao.insert(basketDto) > 0;
	}

	public List<BasketDto> getBasketByUser(int seq_mbr) {
		return basketDao.listing(seq_mbr);
	}

	public boolean deleteItem(int seq_bsk) {
		return basketDao.delete(seq_bsk) > 0;
	}

	public boolean clearBasket(int seq_mbr) {
		return basketDao.deleteAllByUser(seq_mbr) > 0;
	}
}