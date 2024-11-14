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
 * File			: list.jsp
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [2024-10-10][rkdcodbs77#naevr.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/community/board/storyboard/list.jsp" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="plutozoneUtilTag"	uri="/WEB-INF/tld/com.plutozone.util.tld" %>
<%@ include file="/include/front/header.jsp" %>
<%@ include file="/include/front/top.jsp" %>
<%@ include file="/include/front/gnb_community.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/css/communityTable.css" />
	<link rel="stylesheet" href="/css/brdSearchArea.css">
	<title>커뮤니티 자유게시판</title>
	<script>
		function download(type, sequence) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.type.setAttribute("value", type);
			frmMain.sequence.setAttribute("value", sequence);
			frmMain.action = "/front/community/board/download.web";
			frmMain.target = "frmBlank";
			frmMain.submit();
		}
		function goView(value) {
			var frmMain = document.getElementById("frmMain");
			document.getElementById("seq_bbs").value = value;
			frmMain.action="/front/community/board/view.web";
			frmMain.target = "";
			frmMain.submit();
		}
		
		function getList(value) {
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("searchWord").value = "";
			document.getElementById("currentPage").value = "1";
			document.getElementById("cd_bbs_type").value = value;
			
			alert(value);
			frmMain.action="/front/community/board/list.web";
			frmMain.target = "";
			frmMain.submit();
		}
		
		function goPage(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("currentPage").value = value;
			
			frmMain.action="/front/community/board/list.web";
			frmMain.target = "";
			frmMain.submit();
		}
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" id="type"			name="type" />
<input type="hidden" id="sequence"		name="sequence" />
<input type="hidden" name="seq_bbs"		id="seq_bbs" />
<input type="hidden" name="cd_bbs_type"	id="cd_bbs_type" value="${paging.cd_bbs_type}" />
<input type="hidden" name="currentPage"	id="currentPage" value="${paging.currentPage}" />
<div class="container">
	<section class="content">
		<nav>
		</nav>
		<article class="txtCenter" style="margin: 30px;">
			<div class="brdSearchArea" style="display: flex; justify-content: center; align-items: center; width:100%;">
				<select name="searchKey" id="searchKey">
					<option value="title"<c:if test="${paging.searchKey == 'title'}"> selected</c:if>>제목</option>
					<option value="contents"<c:if test="${paging.searchKey == 'contents'}"> selected</c:if>>내용</option>
					<option value="title+contents"<c:if test="${paging.searchKey == 'title+contents'}"> selected</c:if>>제목 또는 내용</option>
				</select>
				<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}" />
				<input type="submit" value="검색"/>
			</div>
			<div class="brdInfo" style="margin: 20px; margin-left: 10%; margin-bottom: 10px">전체 ${paging.totalLine}개[${paging.currentPage}/${paging.totalPage} 페이지]</div>
			<table class="headTop_01" style="width: 80%; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 5%">NO</th>
					<th>제목</th>
					<th style="width: 20%">등록일</th>
				</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="4">등록된 글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="list">
						<tr>
							<td>
								${list.rnum}
							</td>
							<td style="text-align: left">
								<c:if test="${list.flg_top == 'Y'}">[커뮤니티 공지] </c:if>
								<a href="javascript:goView(${list.seq_bbs});">
									${list.title}
								</a>
							</td>
							<td>
								${list.dt_reg}
							</td>
						</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			<br/>
			<div style="display: flex; justify-content: center;">
			<plutozoneUtilTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPage" />
			</div>
			<br/>
			<div style="width: 900px; margin-left: auto; margin-right: auto">
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