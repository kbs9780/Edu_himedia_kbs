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
 * Copyright (C) 2024 HAPPYSTEPS.COM All Rights Reserved.
 *
 *
 * Program		: com.github.ecommerce7th
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241002100000][hyeen103#gmail.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/login/loginForm.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<style>
		table {
		  width: 100%;
		}
		td {
		  padding: 5px;
		}
		.left, .center, .right {
		  width: 33%;
		}
				/* 로고 이미지 스타일 */
		header img {
			width: 300px;
			height: 200px;
		}
	</style>
	<script>
		window.onload = function () {
			if ("${url}") {
				alert("로그인이 필요합니다.");
			}
			
			const cookies = document.cookie.split(';');
		    let rememberedId = '';

		    for (let i = 0; i < cookies.length; i++) {
		        const cookie = cookies[i].trim();
		        if (cookie.startsWith("rememberedId=")) {
		            rememberedId = decodeURIComponent(cookie.substring("rememberedId=".length)); // 디코딩 추가
		            break;
		        }
		    }

		    // 저장된 아이디가 있을 경우 입력란에 표시
		    if (rememberedId) {
		        document.getElementById("id").value = rememberedId; // 아이디 입력란에 값 설정
		        document.getElementById("rememberMe").checked = true; // 체크박스도 체크
		    }
		}
		
		function checkForm() {
			
			var frmMain = document.getElementById("frmMain");
			/*
			alert("이메일(아이디)=" + document.getElementById("email").value + "\n"
					+ "비밀번호=" + document.getElementById("passwd").value);
			*/
			/*
			alert("이메일(아이디)=" + document.frmMain.email.value + "\n"
					+ "비밀번호=" + document.frmMain.passwd.value);
			*/
			// if (document.getElementById("email").value == "") {
			if (document.getElementById("id").value.length < 5) {
				alert("아이디를 5 ~ 10자 이내로 입력하세요!");
				document.getElementById("id").focus();
				// document.getElementById("email").select();
				return;
			}
			
			if (document.getElementById("passwd").value.length < 8
					|| document.getElementById("passwd").value.length > 16) {
				alert("비밀번호를 8 ~ 16자 이내로 입력하세요!");
				document.getElementById("passwd").focus();
				return;
			}
			
			frmMain.action = "/front/login/loginProc.web";
			frmMain.submit();
		}
			
		function rememberId() {
		    const checkbox = document.getElementById("rememberMe");
		    const userIdInput = document.getElementById("id"); // 아이디 입력란의 ID가 "id"인지 확인하세요

		    if (checkbox.checked) {
		        // 체크박스가 체크된 경우
		        document.cookie = "rememberedId=" + encodeURIComponent(userIdInput.value) + "; path=/; max-age=" + (60 * 60 * 24 * 30); // 30일 동안 유효
		    } else {
		        // 체크박스가 체크 해제된 경우 쿠키 삭제
		        document.cookie = "rememberedId=; path=/; max-age=0";
		    }
		}

	</script>
</head>
<body>
<form id="frmMain" name="frmMain" method="POST">
<!-- <form id="frmMain" method="POST" action="/loginProc.jsp"> -->
<div class="container">
		<header style="display: flex; justify-content: center; align-items: center; height: 120px;">
			<div style="position: relative; margin-top: 90px;">
				<a href="/front/"><img src="/images/logo/logo3.png" style="width: 85%; height: auto; object-fit: cover; alt="로고"></a>
			</div>
		</header>
	
	<section class="content" style="display: flex; justify-content: center; align-items: flex-start; height: 100vh;" >
		<nav></nav>
		<article class="txtCenter">
			<table class="headLeft_01" style="margin-top: 120px;" >
				<tr>
					<th style="text-align: left;">아이디</th>
					<td><input type="text" id="id" name="id"  maxlength="15" required style="border: none; border-left: 2px solid #dead6f; padding: 5px; outline: none; width: 200px;"/></td>
					
				</tr>
				<tr>
					<th style="text-align: left;">비밀번호</th>
					<td><input type="password" id="passwd" name="passwd"  maxlength="16" required style="border: none; border-left: 2px solid #dead6f; padding: 5px; outline: none; width: 200px;"/></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:left;border-bottom:0px;padding-top: 10px"><input type="checkbox" id="rememberMe" name="rememberMe" style="width:20px" onClick="rememberId()"/>아이디 저장</td>
				</tr>
				<tr>
				<td colspan="2" style="text-align:center;border-bottom:0px;padding-top: 10px">
					<input type="button" 
						value="로그인 하기" 
						style="width:100%; padding:10px; background-color:#dead6f; color:white; border:none; border-radius:5px; cursor:pointer; font-size:16px;"
						onMouseOver="this.style.backgroundColor='#d9c88c';" 
						onMouseOut="this.style.backgroundColor='#dead6f';" 
						onClick="checkForm();"/>
				</td>
				</tr>
			</table>
			<table>
				<tr>
					<td style="text-align:center;border-top:0px; padding: 5px; white-space: nowrap;"><a href="/front/member/findIdForm.web">[아이디 찾기]</a></td>
					<td style="text-align:center;border-top:0px; padding: 5px; white-space: nowrap;"><a href="/front/member/findPasswdForm.web">[비밀번호 찾기]</a></td>
					<td style="text-align:center;border-top:0px; padding: 5px; white-space: nowrap;"><a href="/front/member/termAgreeForm.web">[회원 가입]</a></td>
				</tr>
			</table>
		</article>
		<aside></aside>
	</section>
	<footer>
		<%@ include file="/include/front/login_footer.jsp" %>
	</footer>
</div>
</form>
</body>
</html>