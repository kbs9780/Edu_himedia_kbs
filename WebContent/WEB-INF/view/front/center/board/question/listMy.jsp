<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF happySteps.com.
 * happySteps.com OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 happySteps.com ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 happySteps.com에 있으며,
 * happySteps.com이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * happySteps.com의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 happySteps.com All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240702172500][kbs@happySteps.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/center/board/question/listMy.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/front/top.jsp" %>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/layoutSubmain.css" />
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/lnb.css" />
	<link rel="stylesheet" href="/css/table.css">
	<style></style>
	<script>
		
		function goView(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("seq_bbs").value = value;
			
			frmMain.action="/front/center/board/view.web";
			frmMain.submit();
		}
		
		function goPage(value) {
			var frmMain = document.getElementById("frmMain");
			document.getElementById("cd_bbs_type").value = value;
			frmMain.action="/front/center/board/list.web";
			frmMain.submit();
		}
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" name="seq_bbs" id="seq_bbs" />
<input type="hidden" id="cd_bbs_type" name="cd_bbs_type" />
<div class="container">
	<header>
		<%@ include file="/include/front/header.jsp" %>
	</header>
	<section class="content">
		<nav>
			<%@ include file="/include/front/lnbCenter.jsp" %>
		</nav>
		<article class="txtCenter">
			<table class="headTop_01" style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 5%">NO</th>
					<th>제목</th>
					<th style="width: 10%">등록일</th>
				</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="3">등록된 글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="list">
						<tr>
							<td>
								-
							</td>
							<td style="text-align: left">
								<a href="javascript:goView(${list.seq_bbs})">
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
		</article>
		<aside></aside>
	</section>
	<footer>
		<%@ include file="/include/front/footer.jsp" %>
	</footer>
</div>
</form>
</body>
</html>