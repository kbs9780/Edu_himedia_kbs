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
 *				: [202410131306][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/myPage/modifyForm.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/layoutSubmain.css" />
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/table.css" />
	<script type="text/javascript" src="/js/jquery-3.7.1.min.js"></script>
	<style></style>
	<script type="text/javascript">
	function checkModify() {
		var passwd = $("#passwd").val(); // 현재 비밀번호
		var newPasswd = $("#newPasswd").val(); // 신규 비밀번호
		var confirmPasswd = $("#confirmPasswd").val(); // 신규 비밀번호 확인
		
		// 현재 비밀번호가 비어 있는지 확인
		if (!passwd) {
			alert("현재 비밀번호를 입력해주세요!");
			return;
		}
		
		// 신규 비밀번호가 비어 있는지 확인
		if (!newPasswd) {
			alert("신규 비밀번호를 입력해주세요!");
			return;
		}
		
		// 비밀번호 확인이 비어 있는지 확인
		if (!confirmPasswd) {
			 alert("신규 비밀번호 확인을 입력해주세요!");
			 return;
		}
		
		// 신규 비밀번호와 비밀번호 확인이 일치하는지 확인
		if (newPasswd !== confirmPasswd) {
			alert("신규 비밀번호와 비밀번호 확인이 일치하지 않습니다!");
			return;
		}
		
		// 비밀번호가 규칙에 맞는지 확인 (예: 최소 8자, 대문자 포함)
		if (newPasswd.length < 8) {
			alert("신규 비밀번호는 최소 8자 이상이어야 합니다!");
			return;
		}
		
		// 폼을 제출
		$("#frmMain").submit();
	}
	</script>
</head>
<body>
<form id="frmMain" method="POST"  action="/front/member/passwd/modifyProc.web">
<div class="container">
<div style="text-align: center; margin-left: 55px;">
	<a href="/front/">
		<img src="/images/logo/logo3.png" alt="로고" style="width: 100%; object-fit: cover;"/>
	</a>
</div>
	<header>
	</header>
	<nav>
	</nav>
	<section class="content">
		<nav>
		</nav>
		<article class="txtCenter">
			(*) 표시는 필수 입력 사항입니다.
<table style="width: 500px; margin-left: auto; margin-right: auto; border-collapse: collapse;">
	<tr>
		<th style="padding: 8px; color: black; padding-right: 10px; position: relative;">
			현재 비밀번호(*)
			<div style="position: absolute; left: 100%; top: 50%; transform: translateY(-50%); height: 30px; width: 2px; background-color: #d9c88c; margin-left: 0px;"></div>
		</th>
		<td style="padding: 8px;">
			<input type="password" id="passwd" name="passwd" value="12345678!a" required style="border: none; padding: 5px; outline: none; width: 100%; color: black;"/>
		</td>
	</tr>
	<tr>
		<th style="padding: 8px; color: black; padding-right: 10px; position: relative;">
			신규 비밀번호(*)
			<div style="position: absolute; left: 100%; top: 50%; transform: translateY(-50%); height: 30px; width: 2px; background-color: #d9c88c; margin-left: 0px;"></div>
		</th>
		<td style="padding: 8px;">
			<input type="password" id="newPasswd" name="newPasswd" value="123456789!a" required style="border: none; padding: 5px; outline: none; width: 100%; color: black;"/>
		</td>
	</tr>
	<tr>
		<th style="padding: 8px; color: black; padding-right: 10px; position: relative;">
			신규 비밀번호 확인(*)
			<div style="position: absolute; left: 100%; top: 50%; transform: translateY(-50%); height: 30px; width: 2px; background-color: #d9c88c; margin-left: 0px;"></div>
		</th>
		<td style="padding: 8px;">
			<input type="password" id="confirmPasswd" name="confirmPasswd" value="123456789!a" required style="border: none; padding: 5px; outline: none; width: 100%; color: black;"/>
		</td>
	</tr>
	<tr>
	<td colspan="2" style="text-align:center; padding-top: 10px; padding-bottom: 10px;">
			<input type="button" 
				value="수정 하기" 
				style="width:430px; padding:10px; background-color:#dead6f; color:white; border:none; border-radius:5px; cursor:pointer; font-size:16px;" 
				onMouseOver="this.style.backgroundColor='#d9c88c';" 
				onMouseOut="this.style.backgroundColor='#dead6f';" 
				onClick="checkModify();"/>
						</td>
					</tr>
				</table>
			</article>
		</section>
		<footer>
			<jsp:include page="/include/front/login_footer.jsp" />
		</footer>
	</div>
	</form>
</body>
</html>