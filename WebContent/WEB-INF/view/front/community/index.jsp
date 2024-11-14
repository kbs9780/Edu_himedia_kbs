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
 * Copyright (C) 2024 happySteps All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [2024-10-01][rkdcodbs77#naevr.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/front/community/index.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>소개</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style>
	</style>
</head>
<body>
	<form id="frmMain">
		<div class="container">
			<article class="txtCenter">
			<div style="position: relative; height: auto; margin-top: 10px;">
					<a href="/front/"></a>
			<header>
					<div style="text-align: center;">	
					<%@ include file="/include/front/header.jsp" %>
					<%@ include file="/include/front/top.jsp" %>
					<%@ include file="/include/front/gnb_community_index.jsp" %>
					</div>
			</header>
				</div>
				<div style="text-align: center;">
					<img src="/images/community.png" style="width: 80%; height: auto; margin-top: 15%;">
				</div>
				<br>
			</article>
		</div>		
		<footer>
			<%@ include file="/include/front/footer.jsp" %>
		</footer>
	</form>
</body>
</html>