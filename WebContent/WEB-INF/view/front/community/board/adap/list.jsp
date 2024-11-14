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
<%@ page info="/WEB-INF/view/front/community/board/adap/list.jsp" %>
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
	<title>커뮤니티 입양글 목록</title>
	<style>
	 .container { width: 100%; max-width: 1200px; margin: 0 auto; padding: 20px; }
  .content { display: flex; flex-direction: column; align-items: center; }
  .brdSearchArea { display: flex; justify-content: center; align-items: center; margin-bottom: 20px; }
  .brdInfo { text-align: center; margin-bottom: 20px; }
  
  /* 카드 레이아웃 스타일 */
  .card-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 20px; width: 100%; }
  .card { display: flex; border: 3px solid #ddd; padding: 15px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); }
  .card-image { width: 120px; height: 120px; background-color: #f0f0f0; border-radius: 8px; margin-right: 15px; }
  .card-content { display: flex; flex-direction: column; justify-content: space-between; }
  .card-title { font-weight: bold; font-size: 1.1em; margin-bottom: 8px; }
  .card-meta { font-size: 0.9em; color: #888; margin-bottom: 8px; }
  .card-description { font-size: 0.9em; margin-bottom: 8px; }
  .card-tags { font-size: 0.8em; color: #555; }
  
  .adoption-review {
	    background-color: #f9f9f9; /* 부드러운 배경색 */
	    border: 2px solid #a0a0a0; /* 테두리 색상 */
	    border-radius: 10px; /* 모서리를 둥글게 */
	    padding: 20px; /* 내부 여백 */
	    font-family: 'Arial', sans-serif; /* 글꼴 스타일 */
	    font-size: 16px; /* 글자 크기 */
	    line-height: 1.6; /* 줄 간격 */
	    color: #333; /* 글자 색상 */
	    max-width: 600px; /* 최대 너비 */
	    margin: 20px auto; /* 가운데 정렬 */
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	}
	
	.adoption-review strong {
	    color: #007bff; /* 강조할 글자 색상 */
	    font-weight: bold;
	}
	</style>
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
			
			// document.getElementById("currentPage").remove();
			// document.getElementById("searchKey").remove();
			// document.getElementById("searchWord").remove();
			
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
		<article class="txtCenter">
			<div class="brdSearchArea" style="display: flex; justify-content: center; align-items: center;">
				<select name="searchKey" id="searchKey">
					<option value="title"<c:if test="${paging.searchKey == 'title'}"> selected</c:if>>제목</option>
					<option value="contents"<c:if test="${paging.searchKey == 'contents'}"> selected</c:if>>내용</option>
					<option value="title+contents"<c:if test="${paging.searchKey == 'title+contents'}"> selected</c:if>>제목 또는 내용</option>
				</select>
				<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}" />
				<input type="submit" value="검색"/>
			</div>
			<br>
			<div class="adoption-review">
			    입양 후기를 보실 수 있습니다.<br>
			    HappySteps를 통해 입양하신 분들은 누구나! 입양후기를 올려주세요.<br>
			    가족이 되어 즐겁게 지내시는 모습, 입양 전후 사진, 특이한 버릇, 입양 후 가장 좋은 점 등 입양을 망설이시거나 고민하시는 분들께 좋은 선물이 될 수 있습니다.
			</div>
			<br>
			<div class="brdInfo">전체 ${paging.totalLine}개 [${paging.currentPage}/${paging.totalPage} 페이지]</div>
		<div class="card-grid">
	<c:choose>
		<c:when test="${empty list}">
			<div style="grid-column: span 2; text-align: center;">등록된 글이 없습니다.</div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="list">
				<div class="card">
				<%--
					<div class="card-image">
					<img src="http://localhost:8080/image/sale/${list.file_save}" alt="이미지" style="width: 100%; height: 100%; object-fit: cover; border-radius: 8px;" />
					</div>
					 --%>
					<div class="card-content">
						내용:${list.content}
						<div class="card-title">
							<a href="javascript:goView(${list.seq_bbs});">${list.title}</a>
						</div>
						<div class="card-meta">
							작성자: ${list.nickname} | 등록일: ${list.dt_reg}
						</div>
						<div class="card-description">
							${list.content}
						</div>
						<div class="card-tags">
							태그: ${list.tag}
							<div class="icon-cd_ctg_pet" style="display: flex; justify-content: center; align-items: flex-start; flex-direction: column;">
								<c:choose>
									<c:when test="${list.cd_ctg_pet == 1}">
										<img src="/images/icon/community/dog.png" alt="Dog" style="width: 10%; height: 10%;" />
									</c:when>
									<c:when test="${list.cd_ctg_pet == 2}">
										<img src="/images/icon/community/cat.png" alt="Cat" style="width: 10%; height: 10%;" />
									</c:when>
									<c:when test="${list.cd_ctg_pet == 3}">
										<img src="/images/icon/community/hamster.png" alt="Hamster" style="width: 10%; height: 10%;" />
									</c:when>
									<c:when test="${list.cd_ctg_pet == 4}">
										<img src="/images/icon/community/reptile.png" alt="Reptile" style="width: 10%; height: 10%;" />
									</c:when>
									<c:otherwise>
										<img src="/images/icon/community/default.png" alt="Default Pet" style="width: 10%; height: 10%;" />
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
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