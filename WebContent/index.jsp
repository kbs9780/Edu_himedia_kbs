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
<%@ page info="/index.jsp" %>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="content-style-type" content="text/css" />
	<meta http-equiv="content-script-type" content="text/javascript" />	
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>:::HappySteps 행복한 발걸음 :::</title>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/common.css" />
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/layoutMain.css" />
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript" src="/js/util.js"></script>
	<script type="text/javascript" src="/js/jquery-3.7.1.min.js"></script>
	<style></style>
	<script>
		window.onload = function () {
			// alert(getNow());
		}
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<div class="container">
	<header>
		<a href="/"><img src="/images/logo/logo.jpg" alt="로고" width="200px" /></a>
	</header>
	<nav>
	</nav>
	<section class="content">
		<nav></nav>
		<article class="txtCenter">
			<ul>
				<li><a href="/front/">[구매자]</a></li>
				<li><a href="/console/">[관리자]</a></li>
			</ul>
		</article>
		<aside></aside>
	</section>
	<footer>
		Copyright &copy; 2024 by HappySteps All Rights Reserved
	</footer>
</div>
</form>
</body>
</html>