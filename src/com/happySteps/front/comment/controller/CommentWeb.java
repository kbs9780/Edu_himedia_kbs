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
 * File			: CommentWeb.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241022164647][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
package com.happySteps.front.comment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.happySteps.front.comment.dto.CommentDto;
import com.happySteps.front.comment.dto.CommentListDto;
import com.happySteps.front.comment.service.CommentSrvc;
import com.happySteps.front.common.Common;
import com.happySteps.front.community.dto.CommunityDto;


/**
 * @version 1.0.0
 * @author rkdcodbs77#naver.com
 * 
 * @since 2024-10-22
 * <p>DESCRIPTION:댓글 및 대댓글에 대한 컨트롤러</p>
 * <p>IMPORTANT:</p>
 */
@Controller("com.happySteps.front.comment.controller.CommentWeb")
public class CommentWeb extends Common{

	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(CommentWeb.class);

	@Autowired
	private CommentSrvc commentsrvc;
	
	
	/**
	 * @return responseMap
	 * @since  2024-10-25
	 * <p>DESCRIPTION: 대 댓글 저장</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/comment/saveReply.json", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> saveReply(@RequestBody CommentDto commentDto, HttpSession session, HttpServletRequest request, HttpServletResponse response, CommunityDto communityDto) {
		
		Map<String, Object> responseMap = new HashMap<>();
	
		try {
			// 글을 쓸 때 세션에서 seq_mbr 값 체크
			commentDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR"))); // seq_mbr 가져오기
			//logger.debug("제이슨씨="+ getSession(request, "SEQ_MBR"));
			communityDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR"))); // seq_mbr 가져오기
			//logger.debug("제이슨씨222="+ getSession(request, "SEQ_MBR"));
			commentDto.setNickname(getSession(request, "NICKNAME")); // nickname 가져오기
			
			String seq_mbr = getSession(request, "SEQ_MBR");
			// seq_mbr이 없으면 에러 처리
			
			if (seq_mbr != null) {
				commentDto.setSeq_mbr(Integer.parseInt(seq_mbr)); // seq_mbr 가져오기
			} else {
				responseMap.put("error", "사용자 세션 정보가 없습니다.");
				return responseMap;
			}
			// 자기 자신에게 댓글을 다는 경우 처리
			if (commentDto.getSeq_comment_parent() != 0 && commentDto.getSeq_comment_parent() == commentDto.getSeq_comment()) {
				responseMap.put("error", "자기 자신에게 댓글을 달 수 없습니다.");
				return responseMap;
			}
			// 닉네임이 없으면 에러 처리
			if (commentDto.getNickname() == null) {
				responseMap.put("error", "닉네임이 없습니다. 로그인 후 다시 시도해 주세요.");
				request.setAttribute("script", "alert('닉네임이 없습니다. 로그인 후 다시 시도해 주세요.');");
				request.setAttribute("redirect", "/front/login/loginForm.web"); 
				return responseMap;
			}
			if (commentDto.getContent() == null || commentDto.getContent().equals("")) {
				responseMap.put("error", "댓글내용이 없습니다. 다시 시도해 주세요.");
				request.setAttribute("script", "alert('댓글내용이 없습니다. 다시 시도해 주세요.');");
				return responseMap;
			}
			// 댓글 추가
			commentsrvc.saveReply(commentDto);
			responseMap.put("message", "댓글이 등록되었습니다.");
			
		} catch (Exception e) {
			responseMap.put("error", "댓글 등록 중 오류가 발생했습니다.");
			logger.error("댓글 등록 중 오류", e);
		}
		
		return responseMap;
}

	
	/**
	 * @return responseMap
	 * @since  2024-10-25
	 * <p>DESCRIPTION: 댓글 삭제</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/comment/delete.json", method = RequestMethod.POST, produces = "application/json; charset=UTF-8") 
	@ResponseBody
	public Map<String, Object> deleteComment(@RequestBody CommentDto commentDto, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
			Map<String, Object> responseMap = new HashMap<>();
		try {
			
			String seq_mbr = (String) session.getAttribute("SEQ_MBR");
			// 댓글을 수정할때 세션에서 seq_mbr 값 체크 // 세션 정보가 없으면 에러 처리
			if (seq_mbr == null){
				responseMap.put("error", "로그인 정보가 없습니다. 로그인 후 다시 시도해 주세요.");
				return responseMap;
			}

			// commentDto에 세션 정보 설정
			commentDto.setSeq_mbr(Integer.parseInt(seq_mbr));
			commentDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR"))); // seq_mbr 가져오기
			// seq_mbr이 없으면 에러 처리
			if (commentDto.getSeq_mbr() == 0) {
				responseMap.put("error", "사용자 세션 정보가 없습니다.");
				return responseMap;
		}
			
			logger.debug(commentDto.getSeq_comment() + "");
			commentsrvc.deleteComment(commentDto);
			
			} catch (Exception e) {
				responseMap.put("error", "댓글 삭제 중 오류가 발생했습니다.");
				logger.error("댓글 삭제 중 오류", e);
			}
				return responseMap;
	}
	
	/**
	 * @return responseMap
	 * @since  2024-10-25
	 * <p>DESCRIPTION: 댓글 수정</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/comment/edit.json", method = RequestMethod.POST, produces = "application/json; charset=UTF-8") 
	@ResponseBody
	public Map<String, Object> editComment(@RequestBody CommentDto commentDto, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
			Map<String, Object> responseMap = new HashMap<>();
		try {
			
			String seq_mbr = (String) session.getAttribute("SEQ_MBR");
			// 댓글을 수정할때 세션에서 seq_mbr 값 체크 // 세션 정보가 없으면 에러 처리
			if (seq_mbr == null){
				responseMap.put("error", "로그인 정보가 없습니다. 로그인 후 다시 시도해 주세요.");
				return responseMap;
			}

			// commentDto에 세션 정보 설정
			commentDto.setSeq_mbr(Integer.parseInt(seq_mbr));
			commentDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR"))); // seq_mbr 가져오기
			// seq_mbr이 없으면 에러 처리
			if (commentDto.getSeq_mbr() == 0) {
				responseMap.put("error", "사용자 세션 정보가 없습니다.");
				return responseMap;
		}
			
			logger.debug(commentDto.getSeq_comment() + "");
			commentsrvc.editComment(commentDto);
			
			} catch (Exception e) {
				responseMap.put("error", "댓글 수정 중 오류가 발생했습니다.");
				logger.error("댓글 수정 중 오류", e);
			}
				return responseMap;
	}
	
	/**
	 * @return responseMap
	 * @since  2024-10-23
	 * <p>DESCRIPTION: 댓글 목록 조회</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	@RequestMapping(value = "/front/comment/view.json", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public CommentListDto getCommentList(@RequestParam(value = "seq_bbs", required = true) String str_seq_bbs, HttpSession session, HttpServletRequest request, CommentDto commentDto) {
		CommentListDto commentListDto = new CommentListDto();
		try {
			// 게시물 시퀀스 번호 파싱
			int seq_bbs = Integer.parseInt(str_seq_bbs);
			// 세션에서 사용자 정보 설정
			commentDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR"))); // seq_mbr 가져오기
			commentDto.setSeq_bbs(seq_bbs);
			commentDto.setNickname(getSession(request, "NICKNAME")); // 닉네임 설정
			logger.debug("getCommentList 메서드 호출됨, seq_bbs: " + str_seq_bbs);
			
			// 해당 게시물의 댓글 목록 조회
			List<CommentDto> commentList = commentsrvc.getComments(seq_bbs);
			logger.debug("리스트 내용확인? " + commentList);
			
			// 각 댓글에 대해 대댓글 조회 및 설정
			for (CommentDto comment : commentList) {
				List<CommentDto> replies = commentsrvc.getComments(comment.getSeq_comment()); // 대댓글 조회
				comment.setCommentDtolist(replies); // 대댓글 설정
			}

			// 댓글 목록이 있는지 확인 후 응답 데이터에 담음
			if (commentList != null && !commentList.isEmpty()) {
				commentListDto.setCommentList(commentList); // 댓글 리스트 설정
				logger.debug("댓글 목록을 가져왔습니다.");
			} else {
				logger.debug("댓글이 없습니다.");
			}
		} catch (Exception e) {
			logger.error("댓글 목록 조회 중 오류", e);
		}
		
		return commentListDto; // CommentListDto 반환
	}

	
	/*
	@RequestMapping(value = "/front/comment/view.json", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public CommentListDto getCommentList(@RequestParam(value = "seq_bbs", required = true) String str_seq_bbs, HttpSession session, HttpServletRequest request, CommentDto commentDto) {
		CommentListDto commentListDto = new CommentListDto();
		try {
			// 세션에서 사용자 정보를 체크 (선택 사항, 필요할 경우)
			int seq_bbs = Integer.parseInt(str_seq_bbs);
			// 세션에서 사용자 정보를 체크
			commentDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR"))); // seq_mbr 가져오기
			commentDto.setSeq_bbs(seq_bbs);
			commentDto.setNickname(getSession(request, "NICKNAME")); // 닉네임 바로 설정
			logger.debug("getCommentList 메서드 호출됨, seq_bbs: " + str_seq_bbs);
			
			// 해당 게시물의 댓글 목록 조회
			List<CommentDto> commentList = commentsrvc.getComments(seq_bbs);
			logger.debug("리스트 내용확인? " + commentList);
			
			// 댓글이 있는지 확인 후 응답 데이터에 담음
			if (commentList != null && !commentList.isEmpty()) {
				commentListDto.setCommentList(commentList); // 댓글 리스트 설정
				logger.debug("댓글 목록을 가져왔습니다.");
			} else {
				logger.debug("댓글이 없습니다.");
			}
		} catch (Exception e) {
			logger.error("댓글 목록 조회 중 오류", e);
		}
		
		return commentListDto; // CommentListDto 반환
	}
*/
	
	/*
	@RequestMapping(value = "/front/comment/view.json", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> getCommentList(@RequestParam(value = "seq_bbs", required = true) String str_seq_bbs, HttpSession session, HttpServletRequest request, CommentDto commentDto) {
		
		Map<String, Object> responseMap = new HashMap<>();
		try {
			// 세션에서 사용자 정보를 체크 (선택 사항, 필요할 경우)
			int seq_bbs = Integer.parseInt(str_seq_bbs);
			// 세션에서 사용자 정보를 체크
			commentDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR"))); // seq_mbr 가져오기
			commentDto.setSeq_bbs(seq_bbs);
			commentDto.setNickname(getSession(request, "NICKNAME")); // 닉네임 바로 설정
			logger.debug("getCommentList 메서드 호출됨, seq_bbs: " + str_seq_bbs);
			// 해당 게시물의 댓글 목록 조회
			
			List<CommentDto> commentList = commentsrvc.getComments(seq_bbs);
			//responseMap.put("commentList", commentList);
			logger.debug("리스트 내용확인? " + commentList);
			
			// 댓글이 있는지 확인 후 응답 데이터에 담음
			if (commentList != null && !commentList.isEmpty()) {
				responseMap.put("commentList", commentList);
				responseMap.put("message", "댓글 목록을 가져왔습니다.");
			}
			else {
				responseMap.put("message", "댓글이 없습니다.");
			}
		} catch (Exception e) {
			responseMap.put("error", "댓글 목록을 조회하는 중 오류가 발생했습니다.");
			logger.error("댓글 목록 조회 중 오류", e);
		}
		return responseMap;
	}
*/
	
	/**
	 * @return responseMap
	 * @since  2024-10-23
	 * <p>DESCRIPTION: 댓글 등록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@RequestMapping(value = "/front/comment/add.json", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> addComment(@RequestBody CommentDto commentDto, HttpSession session, HttpServletRequest request, HttpServletResponse response, CommunityDto communityDto) {
		
		Map<String, Object> responseMap = new HashMap<>();
	
		try {
			// 글을 쓸 때 세션에서 seq_mbr 값 체크
			commentDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR"))); // seq_mbr 가져오기
			communityDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR"))); // seq_mbr 가져오기
			commentDto.setNickname(getSession(request, "NICKNAME")); // nickname 가져오기
			// seq_mbr이 없으면 에러 처리
			if (commentDto.getSeq_mbr() == 0) {
				responseMap.put("error", "사용자 세션 정보가 없습니다.");
				return responseMap;
			}
			
			// 닉네임이 없으면 에러 처리
			if (commentDto.getNickname() == null) {
				responseMap.put("error", "닉네임이 없습니다. 로그인 후 다시 시도해 주세요.");
				request.setAttribute("script", "alert('닉네임이 없습니다. 로그인 후 다시 시도해 주세요.');");
				request.setAttribute("redirect", "/front/login/loginForm.web"); 
				return responseMap;
			}
			if (commentDto.getContent() == null || commentDto.getContent().equals("")) {
				responseMap.put("error", "댓글내용이 없습니다. 다시 시도해 주세요.");
				request.setAttribute("script", "alert('댓글내용이 없습니다. 다시 시도해 주세요.');");
				return responseMap;
			}
			// 댓글 추가
			commentsrvc.addComment(commentDto);
			responseMap.put("message", "댓글이 등록되었습니다.");
			
		} catch (Exception e) {
			responseMap.put("error", "댓글 등록 중 오류가 발생했습니다.");
			logger.error("댓글 등록 중 오류", e);
		}
		
		return responseMap;
	}
}
