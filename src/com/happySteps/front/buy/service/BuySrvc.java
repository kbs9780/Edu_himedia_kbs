/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 COM.HAPPYSTEPS ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 com.happySteps에 있으며,
 * com.happySteps이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * com.happySteps의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 com.happySteps All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: BuySrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241004142722][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
package com.happySteps.front.buy.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.happySteps.front.buy.dto.BuyDetailDto;
import com.happySteps.front.buy.dto.BuyDto;
import com.happySteps.front.buy.dto.BuyMasterDto;
import com.happySteps.front.common.dto.PagingDto;
import com.happySteps.front.common.dto.PagingListDto;
import com.happySteps.front.pay.dao.PayDao;
import com.happySteps.front.pay.dto.PayDto;
import com.happySteps.front.buy.dao.BuyDao;

/**
 * @version 1.0.0
 * @author rkdcodbs77#naver.com
 * 
 * @since 2024-10-04
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("com.happysteps.buy.service.BuySrvc")
public class BuySrvc {

	@Inject
	BuyDao buyDao;
	@Inject
	PayDao payDao;
	
	/**
	 * @return boolean
	 * 
	 * @since 2024-11-11
	 * <p>DESCRIPTION: 반품및취소(처리)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txBackoffice")
	public boolean goCancle(BuyDto buyDto) {
		
		int result = buyDao.goCancle(buyDto);
		
		if (result >= 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	/**
	 * @return boolean
	 * 
	 * @since 2024-11-11
	 * <p>DESCRIPTION: 주문확정(처리)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txBackoffice")
	public boolean goConfirm(BuyDto buyDto) {
		
		int result = buyDao.goConfirm(buyDto);
		
		if (result >= 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	
	@Transactional("txFront")
	public int insertByOrderNum(BuyMasterDto buyMasterDto, ArrayList<BuyDetailDto> listBuyDetailDto, String num_order) {
			
			int result		= 0;
			int seq_buy_mst	= buyDao.sequenceMaster();
			
			// 구매 마스터 정보
			buyMasterDto.setSeq_buy_mst(seq_buy_mst);
			result += buyDao.insertMaster(buyMasterDto);
			
			// 구매 상세 정보들
			for (int loop = 0; loop < listBuyDetailDto.size(); loop++) {
				
				listBuyDetailDto.get(loop).setSeq_buy_dtl(buyDao.sequenceDetail());
				listBuyDetailDto.get(loop).setSeq_buy_mst(buyMasterDto.getSeq_buy_mst());
				listBuyDetailDto.get(loop).setRegister(buyMasterDto.getRegister());
				
				result += buyDao.insertDetail(listBuyDetailDto.get(loop));
			}
			
			// 결제 정보
			PayDto payDto = new PayDto();
			payDto.setSeq_pay(payDao.sequence());
			payDto.setSeq_mbr(buyMasterDto.getSeq_mbr());
			payDto.setSeq_buy_mst(buyMasterDto.getSeq_buy_mst());
			payDto.setNum_order(num_order);
			payDto.setNum_deal("[INF]BASE ON ORDER NUM");
			payDto.setRegister(buyMasterDto.getSeq_mbr());
			result += payDao.insert(payDto);
			
			if (result == 1 + listBuyDetailDto.size() + 1) return seq_buy_mst;
			else {
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				return 0;
			}
	}
	
	@Transactional("txFront")
	public boolean updateByOrderNum(String num_order, String num_deal, int updater, String flg_success) {
		
		int result = 0;
		
		PayDto payDto = new PayDto();
		payDto.setNum_order(num_order);
		payDto.setNum_deal(num_deal);
		payDto.setFlg_success(flg_success);			// 성공(Y), 실패(N)
		result += payDao.updateByOrderNum(payDto);
		
		payDto = payDao.select(payDto);
		BuyMasterDto buyMasterDto = new BuyMasterDto();
		buyMasterDto.setSeq_buy_mst(payDto.getSeq_buy_mst());
		buyMasterDto.setCd_state_pay(flg_success);	// 결제 전(NULL), 결제 완료(Y), 결제 실패(N), 결제 취소(C)
		buyMasterDto.setUpdater(updater);
		result += buyDao.update(buyMasterDto);
		
		if (result == 2) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	@Transactional("txFront")
	public boolean updateByDealNum(String num_deal, int updater, String flg_success) {
		
		int result = 0;
		
		PayDto payDto = new PayDto();
		payDto.setNum_deal(num_deal);
		payDto.setFlg_success(flg_success);			// 성공(Y), 실패(N)
		result += payDao.updateByDealNum(payDto);
		
		payDto = payDao.select(payDto);
		BuyMasterDto buyMasterDto = new BuyMasterDto();
		buyMasterDto.setSeq_buy_mst(payDto.getSeq_buy_mst());
		buyMasterDto.setCd_state_pay(flg_success);	// 결제 전(NULL), 결제 완료(Y), 결제 실패(N), 결제 취소(C)
		buyMasterDto.setUpdater(updater);
		result += buyDao.update(buyMasterDto);
		
		if (result == 2) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	@Transactional("txFront")
	public boolean insertByDealNum(BuyMasterDto buyMasterDto, ArrayList<BuyDetailDto> listBuyDetailDto, String num_deal) {
			
			int result = 0;
			
			// 구매 마스터 정보
			buyMasterDto.setSeq_buy_mst(buyDao.sequenceMaster());
			result += buyDao.insertMaster(buyMasterDto);
			
			// 구매 상세 정보들
			for (int loop = 0; loop < listBuyDetailDto.size(); loop++) {
				
				listBuyDetailDto.get(loop).setSeq_buy_dtl(buyDao.sequenceDetail());
				listBuyDetailDto.get(loop).setSeq_buy_mst(buyMasterDto.getSeq_buy_mst());
				listBuyDetailDto.get(loop).setRegister(buyMasterDto.getRegister());
				
				result += buyDao.insertDetail(listBuyDetailDto.get(loop));
			}
			
			// 결제 정보
			PayDto payDto = new PayDto();
			payDto.setSeq_pay(payDao.sequence());
			payDto.setSeq_mbr(buyMasterDto.getSeq_mbr());
			payDto.setSeq_buy_mst(buyMasterDto.getSeq_buy_mst());
			payDto.setNum_deal(num_deal);
			payDto.setRegister(buyMasterDto.getSeq_mbr());
			result += payDao.insert(payDto);
			
			if (result == 1 + listBuyDetailDto.size() + 1) return true;
			else {
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				return false;
			}
	}
	
	/**
	 * @return List
	 * 
	 * @since 2024-10-30
	 * <p>DESCRIPTION: </p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public List<BuyDetailDto> select(BuyMasterDto buyMasterDto) {
		return buyDao.select(buyMasterDto);
	}

	/**
	 * @param pagingDto [게시판 빈]
	 * @return PagingListDto
	 * 
	 * @since 2024-10-30
	 * <p>DESCRIPTION:  목록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public PagingListDto list(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		// 전체 라인(행) 수
		int totalLine = buyDao.count(pagingDto);
		// 전체 페이지 수 = 전체 라인(행) 수 / 페이징할 라인수
		int totalPage = (int) Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(1);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(buyDao.list(pagingDto));
		
		return pagingListDto;
	}
	
	/**
	 * @return String
	 * 
	 * @since 2024-10-04
	 * <p>DESCRIPTION: 마이페이지 구매이력 총 구매 금액</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public String selectTotal(BuyDto buyDto) {
		return buyDao.selectTotal(buyDto);
	}
	
	/**
	 * @return List<BuyDto>
	 * 
	 * @since 2024-10-04
	 * <p>DESCRIPTION: 마이페이지 구매이력 목록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public List<BuyDto> list(BuyDto buyDto) {
		return buyDao.list(buyDto);
	}
}
