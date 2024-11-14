/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF COM.HAPPYSTEPS.
 * COM.HAPPYSTEPS OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
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
 * File			: CommentSrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241022164936][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
package com.happySteps.front.comment.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.happySteps.front.comment.dto.CommentDto;
import com.happySteps.front.community.dao.Communitydao;


/**
 * @version 1.0.0
 * @author rkdcodbs77#naver.com
 * 
 * @since 2024-10-22
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("com.happySteps.front.comment.service.CommentSrvc")
public class CommentSrvc {

	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(CommentSrvc.class);

	@Inject
	Communitydao communitydao;
	
	// 대댓글 등록

		public void saveReply(CommentDto commentDto) {
			try {
				communitydao.insertReply(commentDto);
				} catch (Exception e) {
					logger.error("댓글 추가 중 오류 발생: " + e.getMessage(), e);
			}
		}
	
	// 댓글 등록

	public void addComment(CommentDto commentDto) {
		try {
			communitydao.insertComment(commentDto);
			} catch (Exception e) {
				logger.error("댓글 추가 중 오류 발생: " + e.getMessage(), e);
		}
	}

		// 댓글 수정

		public void editComment(CommentDto commentDto) {
			try {	
				communitydao.editComment(commentDto);
		}catch (Exception e) {
			logger.error("댓글 수정 중 오류 발생: " + e.getMessage(), e);
		}
	}
		
		// 댓글 삭제
		public void deleteComment(CommentDto commentDto) {
			communitydao.deleteComment(commentDto);
		}

		// 댓글 목록 조회
		public List<CommentDto> getComments(int seq_bbs) {
			return communitydao.selectComments(seq_bbs);
	}
}
