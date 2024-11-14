package com.happySteps.front.comment.dto;
import java.util.List;

public class CommentListDto {
	private List<CommentDto> commentList;

	
	public List<CommentDto> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<CommentDto> commentList) {
		this.commentList = commentList;
	}
}
