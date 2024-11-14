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
 *				: [20240626130000][kbs@happySteps.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/center/index.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/css/lnb.css">
	<style></style>
	<script>
		function goList(value) {
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("cd_bbs_type").value = value;
			frmMain.action="/front/center/board/list.web";
			frmMain.submit();
		}
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" id="cd_bbs_type" name="cd_bbs_type" />
<div class="container">
	<header>
		<%@ include file="/include/front/header.jsp" %>
		<%@ include file="/include/front/top.jsp" %>
	</header>
		<section class="content" style="display: flex; justify-content: space-between; margin-top: 20px;">
	<nav>
			<%@ include file="/include/front/lnbCenter.jsp" %>
	</nav>
	<article style="flex: 1;">
	    <img src="/images/center.png" alt="고객센터 페이지 이미지" style="width: 90%; height: auto; object-fit: cover; margin-left: 50px; margin-bottom: 10px; margin-top: 20px;"/>
	</article>
		<article class="txtCenter">
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