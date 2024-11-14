<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HAPPYSTEPS.COM.
 * HAPPYSTEPS.COM OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HAPPYSTEPS.COM ALL RIGHTS RESERVED.
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
 *				: [20241010122700][kbs@happySteps.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/login/loginForm.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/console/header.jsp" %>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/layoutMain.css" />
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/table.css" />
	<style></style>
	<script>
		
		window.onload = function () {
			if ("${url}") {
				alert("로그인이 필요합니다.");
			}
		}
		
		function checkForm() {
			
			var frmMain = document.getElementById("frmMain");
			
			if (document.getElementById("id").value.length < 5
					|| document.getElementById("id").value.length > 32) {
				alert("아이디를 5 ~ 16자 이내로 입력하세요!");
				document.getElementById("id").focus();
				return;
			}
			
			if (document.getElementById("passwd").value.length < 8
					|| document.getElementById("passwd").value.length > 16) {
				alert("비밀번호를 8 ~ 16자 이내로 입력하세요!");
				document.getElementById("passwd").focus();
				return;
			}
			
			frmMain.action = "/console/login/loginProc.web";
			frmMain.submit();
		}
	</script>
</head>
<body>
<form id="frmMain" name="frmMain" method="POST">
<div class="container">
	<section class="txtCenter">
		<article class="txtCenter">
			<a href="/"><img src="/images/logo/logo.jpg" alt="로고" width="200px" /></a>
			<h3>관리자 로그인</h3><br/>
		</article>
	</section>
	<section class="txtCenter">
		<article class="txtCenter">
			<table class="headLeft_01" style="width: 320px; margin-left: auto; margin-right: auto">
				<tr>
					<th>아이디</th>
					<td><input autofocus type="text" id="id" name="id" value="rhksflwk" maxlength="16" required onKeyPress="if (event.keyCode == 13) checkForm();"/></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="passwd" name="passwd" value="12345678!a" maxlength="16" required onKeyPress="if (event.keyCode == 13) checkForm();"/></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;border-bottom:0px;padding-top: 10px"><input type="button" value="로그인" style="width:100px" onClick="checkForm();"/></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;border-top:0px;"><a href="#">[아이디/비밀번호 찾기]</a> <a href="/console/manager/registerForm.web">[관리자 가입]</a></td>
				</tr>
			</table>
		</article>
		<aside></aside>
	</section>

</div>
</form>
</body>
</html>