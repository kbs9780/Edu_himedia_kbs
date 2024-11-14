<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 himedia.co.kr에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 himedia.co.kr All Rights Reserved.
 *
 *
 * Program		: kr.co.himedia.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240626130000][pluto@himedia.co.kr][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/member/findPasswdForm.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style></style>
<script>
	function findpasswd() {
		
		var frmMain = document.getElementById("frmMain");
		
		if (document.getElementById("id").value.length < 3
				|| document.getElementById("id").value.length > 10) {
			alert("아이디를 입력해주세요!");
			document.getElementById("id").focus();
			// document.getElementById("email").select();
			return;
		}
		
		if (document.getElementById("name").value.length < 1
				|| document.getElementById("name").value.length > 16) {
			alert("이름을 입력해 주세요!");
			document.getElementById("name").focus();
			return;
		}
		
		if (document.getElementById("email").value.length < 6
				|| document.getElementById("email").value.length > 32) {
			alert("이메일을 6 ~ 32자 이내로 입력하세요!");
			document.getElementById("email").focus();
			// document.getElementById("email").select();
			return;
		}
		
		frmMain.action = "/front/member/findPasswdProc.web";
		frmMain.submit();
	}
</script>
</head>
<body>
<form id="frmMain" name="frmMain" method="POST">

<header style="display: flex; justify-content: center; align-items: center; height: 120px margin-top = 50px;">
		<a href="/front/"><img src="/images/logo/logo3.png" alt="로고" style="width: 85%; height: auto; object-fit: cover; "/></a>
</header>

<section class="content" style="display: flex; justify-content: center; align-items: flex-start; height: 100vh;" >
		<nav></nav>
		<article class="txtCenter">
			<table class="headLeft_01" style="margin-top: 50px;" >
				<tr>
					<th>아이디</th>
					<td><input type="text" id="id" name="id"  maxlength="15" required style="border: none; border-left: 2px solid #dead6f; padding: 5px; outline: none; width: 200px;"/></td>
					
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id="name" name="name"  required style="border: none; border-left: 2px solid #dead6f; padding: 5px; outline: none; width: 200px;"/></td>
					
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" id="email" name="email"  maxlength="18" required style="border: none; border-left: 2px solid #dead6f; padding: 5px; outline: none; width: 200px;"/></td>
				</tr>
				<tr>
				<td colspan="2" style="text-align:center;border-bottom:0px;padding-top: 10px">
					<input type="button" 
						value="비밀번호 찾기" 
						style="width:100%; padding:10px; background-color:#dead6f; color:white; border:none; border-radius:5px; cursor:pointer; font-size:16px;"
						onMouseOver="this.style.backgroundColor='#d9c88c';" 
						onMouseOut="this.style.backgroundColor='#dead6f';" 
						onClick="findpasswd();"/>
				</td>
				</tr>
			</table>
			<table style="width:100%;">
				<tr>
					<td style="text-align:center;border-top:0px; padding: 5px; white-space: nowrap;"><a href="/front/member/termAgreeForm.web">[회원 가입]</a></td>
					<td style="text-align:center;border-top:0px; padding: 5px; white-space: nowrap;"><a href="/front/login/loginForm.web">[로그인 하기]</a></td>
				</tr>
			</table>
		</article>
		<aside></aside>
	</section>
	<footer>
		<%@ include file="/include/front/login_footer.jsp" %>
	</footer>
</form>
</body>
</html>
