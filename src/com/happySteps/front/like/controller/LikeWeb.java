package com.happySteps.front.like.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.happySteps.front.common.Common;
import com.happySteps.front.like.dto.LikeDto;
import com.happySteps.front.like.service.LikeSrvc;


@Controller("com.happySteps.front.like.LikeWeb")
public class LikeWeb extends Common {

	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(LikeWeb.class);

	@Autowired
	private LikeSrvc likeSrvc;
	
	@RequestMapping(value = "/front/community/board/like_count.json", method = RequestMethod.POST, consumes = "application/json; charset=UTF-8", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> LikeCount(@RequestBody LikeDto likeDto, HttpServletRequest request) {
		Map<String, Object> responseMap = new HashMap<>();
		try {
			likeDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			if (likeDto.getSeq_mbr() != 0) {
				// 좋아요 개수 가져오기
				int like_count = likeSrvc.getLikeCount(likeDto);
				
				// 응답에 좋아요 개수 추가
				responseMap.put("newLikeCount", like_count);
			}
		} catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".likeCount()] " + e.getMessage(), e);
		}
		return responseMap;
	}

	
	// 좋아요 응답 관련 처리 코드
	@RequestMapping(value = "/front/community/board/like.json", method = RequestMethod.POST, consumes = "application/json; charset=UTF-8", produces = "application/json; charset=UTF-8")
	@ResponseBody	
	public Map<String, Object> addLike(@RequestBody LikeDto likeDto, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		Map<String, Object> responseMap = new HashMap<>();
		try {
			likeDto.setSeq_mbr(Integer.parseInt(getSession(request, "SEQ_MBR")));
			likeDto.setRegister(likeDto.getSeq_mbr());
			if (likeDto.getSeq_mbr() != 0) {
				// 좋아요 처리
				boolean liked = likeSrvc.addLike(likeDto);
				int like_count = likeSrvc.getLikeCount(likeDto);
				
				// 응답에 처리 결과 추가
				responseMap.put("liked", liked);
				responseMap.put("like_count", like_count);
			}
				
		}catch (Exception e) {
			logger.error("[" + this.getClass().getName() + ".addLike()] " + e.getMessage(), e);
		}
		finally {}

		return responseMap;
	}
}

