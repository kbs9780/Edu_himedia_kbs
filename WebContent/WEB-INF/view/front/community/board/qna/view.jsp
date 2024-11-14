<%@page import="com.happySteps.front.community.dto.CommunityDto"%>
<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HAPPYSTEPS.COM.
 * HAPPYSTEPS.COM OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HAPPYSTEPS.COM ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 HAPPYSTEPS.COM에 있으며,
 * HAPPYSTEPS.COM이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * HAPPYSTEPS.COM의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 com.happySteps All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: view.jsp
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [2024-10-17][rkdcodbs77#naevr.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/community/board/qna/view.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include/front/header.jsp" %>
<%@ include file="/include/front/top.jsp" %>
<%@ include file="/include/front/gnb_community.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/brdSearchArea.css">
	<link rel="stylesheet" href="/css/view.css">
	<script type="text/javascript" src="/js/view.js">
		// 서버에서 JSP로 넘어온 seq_bbs 값을 JavaScript 변수로 할당
		document.addEventListener('DOMContentLoaded', () => {
		var seq_bbs = "${communityDto.seq_bbs}"; 
	});
	</script>
	<title>커뮤니티 질문게시판 상세보기</title>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" id="type"			name="type" />
<input type="hidden" id="sequence"		name="sequence" />
<input type="hidden" id="cd_ctg_pet"	name="cd_ctg_pet" 	value="${communityDto.cd_ctg_pet}" />
<input type="hidden" id="cd_bbs_type"	name="cd_bbs_type"	value="${communityDto.cd_bbs_type}" />
<input type="hidden" id="seq_mbr"		name="seq_mbr"		value="${seq_mbr}" />
<input type="hidden" id="seq_bbs"		name="seq_bbs"		value="${communityDto.seq_bbs}" />
<input type="hidden" id="cd_ctg"		name="cd_ctg" 		value="${communityDto.cd_ctg}" />  
<div class="container">
	<section class="content">
		<article class="txtCenter">
		 <div class="content-container"> 
			<h2 class="title">제목: ${communityDto.title}</h2>		
			<div class="icon-cd_ctg_pet" style="display: flex; justify-content: center; align-items: flex-start; flex-direction: column;">
				<c:choose>
					<c:when test="${communityDto.cd_ctg_pet == 1}">
						<img src="/images/icon/community/dog.png" alt="Dog" style="width: 10%; height: 10%;" />
					</c:when>
					<c:when test="${communityDto.cd_ctg_pet == 2}">
						<img src="/images/icon/community/cat.png" alt="Cat" style="width: 10%; height: 10%;" />
					</c:when>
					<c:when test="${communityDto.cd_ctg_pet == 3}">
						<img src="/images/icon/community/hamster.png" alt="Hamster" style="width: 10%; height: 10%;" />
					</c:when>
					<c:when test="${communityDto.cd_ctg_pet == 4}">
						<img src="/images/icon/community/reptile.png" alt="Reptile" style="width: 10%; height: 10%;" />
					</c:when>
					<c:otherwise>
						<img src="/images/icon/community/default.png" alt="Default Pet" style="width: 10%; height: 10%;" />
					</c:otherwise>
				</c:choose>
			</div>
		<table class="headLeft_01">
			<tr>
			<th class="tag-container">Tag: </th>
				<td>
				${communityDto.tag}
				</td>
			</tr>
				<tr>
					<th>작성자</th>
					<td>
						${communityDto.nickname}
					</td>
				</tr>
				<tr>
				<tr>
					<th>등록 일자</th>
					<td>
						${communityDto.dt_reg}
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td class="content">
						<c:out value="${communityDto.content}" escapeXml="false" />
					</td>
				</tr>
			<tr>
				<th>좋아요</th>
				<td>
					<span id="likeElement" style="cursor: pointer; font-size: 24px;" onclick="toggleLike(${communityDto.seq_bbs})">🤍</span>
				<%--	<span id="like_count">${communityDto.like_count}개</span> --%>
				</td>
			</tr>
				<c:if test="${communityDto.file_orig != ''}">
				<tr>
					<th>첨부 파일</th>
					<td>
						<a href="javascript:download('BbsNotice', ${communityDto.seq_bbs});">다운로드</a>
					</td>
				</tr>
				</c:if>
			</table>
				<div style="display: flex; justify-content: right; margin-top: 20px;">
				<input type="button" value="목록" style="width:15%; height:60px;" onclick="javascript:goList(8);" />
				<input type="button" value="수정" style="width:15%" onclick="javascript:modifyForm(8);" /> 
				<input type="button" value="삭제" style="width:15%" onclick="javascript:remove(8);" /> 
			</div>
			<hr>
			<div style="font-size:30px; margin-top: 20px;">댓글 </div>
			<c:set var="seq_mbr" value="${seq_mbr}" />-
				<textarea id="commentContent" rows="5" cols="50"style="width: 100%; font-size: 18px;" placeholder="댓글을 입력하세요."></textarea>
				<button type="button" style="width: 100%; height: 50px; margin-top: 10px; font-size: 18px;" onclick="addComment(${communityDto.seq_bbs},'${seq_mbr}','${communityDto.nickname}','${communityDto.dt_reg}');">댓글 등록</button>
			</div>
			<br>
<h3>댓글 목록</h3>
<hr>
<div class="comment-list" id="commentListContainer">
	<c:if test="${not empty commentList}">
		<c:forEach var="comment" items="${commentList}">
			<div class="comment-item" style="margin-left: <c:out value="${comment.depth * 20}"/>px;">
				<div class="comment-author" style="margin-bottom: 5px;">
					<strong>작성자:</strong> 
					<c:out value="${comment.nickname}"/> 
				</div>
				<div class="comment-content" style="margin-bottom: 5px;">
					<strong>내용:</strong>
					<span id="commentContent_${comment.seq_comment}">
						<c:out value="${comment.content}"/> 
					</span>
					<div class="comment-date" style="margin-bottom: 10px;">
						<strong>등록일:</strong> <c:out value="${comment.dt_reg}"/> 
					</div>
				</div>
				<div id="commentEditArea_${comment.seq_comment}" style="display: none;">
					<textarea id="editCommentContent_${comment.seq_comment}" style="width: 100%; height: 60px; border-radius: 4px; border: 1px solid #ccc; padding: 5px;">${comment.content}</textarea>
					<button onclick="editComment(${comment.seq_comment})">댓글수정</button>
					<button onclick="cancelEdit(${comment.seq_comment})">취소</button>
				</div>
				
				<div class="comment-actions" style="text-align: right; margin-top: 10px; background-color: #f9f9f9;">
					<button type="button" onclick="showEditForm(${comment.seq_comment})">수정</button>
					<button type="button" onclick="deleteComment(${comment.seq_comment})">삭제</button>
					<button type="button" onclick="showReplyForm(${comment.seq_comment})">답글</button>
				</div>
					<div class="reply-form" id="replyForm_${comment.seq_comment}" style="display: none; margin-top: 10px;">
						<textarea id="replyContent_${comment.seq_comment}" style="width: 100%; height: 60px; border-radius: 4px; border: 1px solid #ccc; padding: 5px;" placeholder="답글을 입력하세요"></textarea>
						<button onclick="saveReply(${comment.seq_comment}, ${comment.depth + 1}, ${communityDto.seq_bbs})">저장</button>
						<button onclick="cancelReply(${comment.seq_comment})">취소</button>
					</div>
				</div> <!-- comment-item 종료 -->
			</c:forEach>
		</c:if>
	</div>
	</article>
		<aside></aside>
	</section>
	<footer>
		<%@ include file="/include/front/footer.jsp" %>
	</footer>
</div>
<iframe name="frmBlank" id="frmBlank" width="0" height="0"></iframe>
</form>
</body>
</html>