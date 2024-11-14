/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 COM.HAPPYSTEPS ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 com.happySteps에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 com.happySteps All Rights Reserved.
 *
 *
 * Program		:com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: BuyWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241031103931][kbs#>_<.co.kr][CREATE: Initial Release]
 */
package com.happySteps.backoffice.buy.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.happySteps.backoffice.buy.dto.BuyDto;
import com.happySteps.backoffice.buy.service.BuySrvc;
import com.happySteps.backoffice.common.Common;
import com.happySteps.backoffice.common.dto.PagingDto;
import com.happySteps.backoffice.common.dto.PagingListDto;

/**
 * @version 1.0.0
 * @author [kbs#>_<.co.kr]
 * 
 * @since 2024-10-31
 *        <p>
 *        DESCRIPTION:
 *        </p>
 *        <p>
 *        IMPORTANT:
 *        </p>
 */
@Controller("com.happySteps.backoffice.buy.controller.BuyWeb")
public class BuyWeb extends Common {

	private static Logger logger = LoggerFactory.getLogger(BuyWeb.class);

	@Inject
	private BuySrvc buySrvc;

	@RequestMapping(value = "/console/buy/history.web")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response, BuyDto buyDto,
			PagingDto pagingDto) {

		ModelAndView mav = new ModelAndView("redirect:/error.web");

		try {
			String searchWord = pagingDto.getSearchWord();
			pagingDto.setSearchWord(searchWord);

			PagingListDto pagingListDto = buySrvc.list(pagingDto);

			@SuppressWarnings("unchecked")
			List<BuyDto> list = (List<BuyDto>) pagingListDto.getList();

			
			 for (int loop = 0; loop < list.size(); loop++) {
			 list.get(loop).setSeq_buy_mst(list.get(loop).getSeq_buy_mst());
			 list.get(loop).setBuy_info(list.get(loop).getBuy_info());
			 list.get(loop).setBuy_price(list.get(loop).getBuy_price());
			 list.get(loop).setDt_reg(list.get(loop).getDt_reg());
			 list.get(loop).setCd_state_delivery(list.get(loop).getCd_state_delivery()); }
			

			pagingDto.setSearchWord(searchWord);
			mav.addObject("paging", pagingListDto.getPaging());
			mav.addObject("list", pagingListDto.getList());

			mav.setViewName("/backoffice/buy/history");

		} catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".list()] " + e.getMessage(), e);
		} finally {
		}

		return mav;
	}
}
