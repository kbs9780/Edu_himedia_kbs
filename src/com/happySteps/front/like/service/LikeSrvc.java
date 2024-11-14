package com.happySteps.front.like.service;
/**
 * @version 1.0.0
 * @author rkdcodbs77#naver.com
 * 
 * @since 2024-10-21
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT: </p>
 */

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happySteps.front.community.dao.Communitydao;
import com.happySteps.front.like.dto.LikeDto;
import com.happySteps.front.like.service.LikeSrvc;

@Service("com.happySteps.front.like.service.LikeSrvc")
public class LikeSrvc {
	
	/** Logger */
	private static Logger logger = LoggerFactory.getLogger(LikeSrvc.class);
	
	@Autowired
	Communitydao communityDao;
	
	/**
	* 좋아요를 추가하거나 제거하는 메서드
	 * @param seq_mbr 
	* @return 좋아요 처리 결과
	*/
	public boolean addLike(LikeDto likeDto) {

		// 좋아요 상태를 확인
		 boolean isLiked = communityDao.isLiked(likeDto);  // LikeDto 객체 전달
		//logger.debug("?="+isLiked);
		// 좋아요 추가 또는 제거
		 if (isLiked) {
			 likeDto.setFlg_lke("N"); // 좋아요 상태를 기본 "N"으로 설정
				return communityDao.removeLike(likeDto) > 0; // 좋아요 제거 성공 시 true 반환
			} else {
				likeDto.setFlg_lke("Y"); // 좋아요 상태를 "Y"로 설정
				return communityDao.addLike(likeDto) > 0; // 좋아요 추가 성공 시 true 반환
			}
	}
	/**
	* 특정 게시물의 좋아요 개수를 반환하는 메서드
	*
	* @param seq_bbs 게시물 번호
	* @return 좋아요 개수
	*/
	public int getLikeCount(LikeDto likeDto) {
		logger.debug("좋아요 개수를 준다고 하던데="+communityDao.getLikeCount(likeDto));
		return communityDao.getLikeCount(likeDto); // 좋아요 개수 반환
		
	}
}
