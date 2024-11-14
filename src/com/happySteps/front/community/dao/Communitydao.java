package com.happySteps.front.community.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.happySteps.front.comment.dto.CommentDto;
import com.happySteps.front.common.dao.BaseDao;

import com.happySteps.front.community.dto.CommunityDto;
import com.happySteps.front.like.dto.LikeDto;
import com.happySteps.front.common.dto.PagingDto;

/**
 * @version 1.0.0
 * @author rkdcodbs77#naver.com
 * @since 2024-10-09
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Repository("com.happySteps.front.community.dao.Communitydao")
public class Communitydao extends BaseDao {
	
	

	/**
	 * @param communityDto
	 * @since 2024-10-27
	 * <p>DESCRIPTION: 대댓글 등록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public void insertReply(CommentDto commentDto) {
		sqlSessionFront.insert("com.happySteps.front.mybatis.community.Community.insertReply", commentDto);
	}
	
	/**
	 * @param communityDto
	 * @since 2024-10-22
	 * <p>DESCRIPTION: 댓글 등록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public void insertComment(CommentDto commentDto) {
		sqlSessionFront.insert("com.happySteps.front.mybatis.community.Community.insertComment", commentDto);
	}
	/**
	 * @param commentDto
	 * @since 2024-10-22
	 * <p>DESCRIPTION: 댓글 수정</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public void editComment(CommentDto commentDto) {
		sqlSessionFront.update("com.happySteps.front.mybatis.community.Community.updateComment", commentDto);
	}
	/**
	 * @param communityDto
	 * @since 2024-10-22
	 * <p>DESCRIPTION: 댓글 삭제</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	@Transactional("txFront")
	public void deleteComment(CommentDto commentDto) {
		sqlSessionFront.delete("com.happySteps.front.mybatis.community.Community.deleteComment", commentDto);
	}
	/**
	 * @param communityDto
	 * @since 2024-10-22
	 * <p>DESCRIPTION: 댓글 목록 조회</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public List<CommentDto> selectComments(int seq_bbs) {
		return sqlSessionFront.selectList("com.happySteps.front.mybatis.community.Community.selectComments", seq_bbs);
	}	
	/**
	 * @param likeDto
	 * @return 좋아요 개수
	 * @since 2024-10-21
	 * <p>DESCRIPTION: 게시글 좋아요 개수</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int getLikeCount(LikeDto likeDto) {
		return sqlSessionFront.selectOne("com.happySteps.front.mybatis.community.Community.getLikeCount", likeDto);
	}
	/**
	 * @param likeDto
	 * @return 좋아요 제거
	 * @since 2024-10-21
	 * <p>DESCRIPTION: 게시글 좋아요 제거</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int removeLike(LikeDto likeDto) {
		return sqlSessionFront.delete("com.happySteps.front.mybatis.community.Community.removeLike", likeDto);
	}
	/**
	 * @param likeDto
	 * @return 좋아요를 추가
	 * @since 2024-10-21
	 * <p>DESCRIPTION: 게시글 좋아요 추가</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int addLike(LikeDto likeDto) {
		return sqlSessionFront.insert("com.happySteps.front.mybatis.community.Community.addLike", likeDto);
	}
	/**
	 * @param seq_bbs
	 * @return 좋아요 상태 
	 * @since 2024-10-21
	 * <p>DESCRIPTION: 게시글 좋아요 확인</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public boolean isLiked(LikeDto likeDto) {
		Integer count = sqlSessionFront.selectOne("com.happySteps.front.mybatis.community.Community.isLiked", likeDto);
		return count != null && count > 0;
	}
	
	/**
	 * @param communityDto [게시판 빈]
	 * @return CommunityDto 
	 * @since 2024-10-09
	 * <p>DESCRIPTION: 보기(답변)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public CommunityDto selectReply(CommunityDto communityDto) {
		return sqlSessionFront.selectOne("com.happySteps.front.mybatis.community.Community.selectReply", communityDto);
	}
	
	public int count(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("com.happySteps.front.mybatis.community.Community.count", pagingDto);
	}

	public int count_all(PagingDto pagingDto) {
		return sqlSessionFront.selectOne("com.happySteps.front.mybatis.community.Community.count_all", pagingDto);
	}
	
	/**
	 * @param communityDto [게시판 빈]
	 * @return int
	 * @since 2024-10-09
	 * <p>DESCRIPTION: 글 삭제</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int delete(CommunityDto communityDto) {
		return sqlSessionFront.delete("com.happySteps.front.mybatis.community.Community.delete", communityDto);
	}
	
	/**
	 * @param communityDto [게시판 빈]
	 * @return int
	 * @since 2024-10-09
	 * <p>DESCRIPTION: 등록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int insert(CommunityDto communityDto) {
		return sqlSessionFront.insert("com.happySteps.front.mybatis.community.Community.insert", communityDto);
	}
	
	/**
	 * @param communityDto [게시판 빈]
	 * @return CommunityDto
	 * @since 2024-10-10
	 * <p>DESCRIPTION: 삭제(처리)</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int deleteFlag(CommunityDto communityDto) {
		return sqlSessionFront.update("com.happySteps.front.mybatis.community.Community.deleteFlag", communityDto);
	}
	
	/**
	 * @param communityDto [게시판 빈]
	 * @return int
	 * @since 2024-10-09
	 * <p>DESCRIPTION: 수정</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public int update(CommunityDto communityDto) {
		return sqlSessionFront.update("com.happySteps.front.mybatis.community.Community.update", communityDto);
	}
	/**
	 * @param communityDto [페이징 빈]
	 * @return allView<CommunityDto>
	 * @since 2024-10-20
	 * <p>DESCRIPTION: 커뮤니티 전체 글 보기</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	public CommunityDto allSelect(CommunityDto communityDto) {
		return sqlSessionFront.selectOne("com.happySteps.front.mybatis.community.Community.allSelect", communityDto);
	}
	/**
	 * @param communityDto [게시판 빈]
	 * @return CommunityDto
	 * @since 2024-10-09
	 * <p>DESCRIPTION: 글 보기</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public CommunityDto select(CommunityDto communityDto) {
		return sqlSessionFront.selectOne("com.happySteps.front.mybatis.community.Community.select", communityDto);
	}
	/**
	 * @param pagingDto [페이징 빈]
	 * @return allList<CommunityDto>
	 * @since 2024-10-14
	 * <p>DESCRIPTION: 커뮤니티 모든 글목록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	public List<CommunityDto> popular_allList(PagingDto pagingDto) {
	    return sqlSessionFront.selectList("com.happySteps.front.mybatis.community.Community.popular_allList", pagingDto);
	}
	/**
	 * @param pagingDto [페이징 빈]
	 * @return allList<CommunityDto>
	 * @since 2024-10-14
	 * <p>DESCRIPTION: 커뮤니티 모든 글목록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	
	public List<CommunityDto> allList(PagingDto pagingDto) {
	    return sqlSessionFront.selectList("com.happySteps.front.mybatis.community.Community.allList", pagingDto);
	}
	
	/**
	 * @param pagingDto [페이징 빈]
	 * @return List<CommunityDto>
	 * @since 2024-10-09
	 * <p>DESCRIPTION: 목록</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public List<CommunityDto> list(PagingDto pagingDto) {
		
		return sqlSessionFront.selectList("com.happySteps.front.mybatis.community.Community.list", pagingDto);
		
	}
	public int sequence() {
		return sqlSessionFront.selectOne("com.happySteps.front.mybatis.community.Community.sequence");
	}
	/**
	 * @param pagingDto [페이징 빈]
	 * @return List<CommunityDto>
	 * @since 2024-10-09
	 * <p>DESCRIPTION: 글쓰기폼</p>
	 * <p>IMPORTANT:</p>
	 * <p>EXAMPLE:</p>
	 */
	public List<CommunityDto> writeForm(PagingDto pagingDto) {
		
		return sqlSessionFront.selectList("com.happySteps.front.mybatis.community.Community.writeForm", pagingDto);
		
	}
}
