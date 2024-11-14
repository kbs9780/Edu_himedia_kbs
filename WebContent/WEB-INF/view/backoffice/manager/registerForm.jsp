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
 *				: [20241010123000][kbs@happySteps.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/manager/registerForm.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/console/header.jsp" %>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/layoutMain.css" />
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/table.css" />
	<script type="text/javascript" src="/js/console.js"></script>
	<script type="text/javascript" src="/js/jquery-3.7.1.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<style></style>
	<script>
		
		// 아이디 중복 여부
		var idDuplicate = true;
		
		$(function() {
			var $frm = $("#frmMain");
			
			$("#btnId").on("click", function(e) {
				
				// 이메일이 7자리 이하 또는 @가 없으면
				if ($("#id").val().length < 5) {
					alert("아이디를 5자리 이상으로 입력하세요!");
					return false;
				}
				
				var myData = {id: $("#id").val()};
				
				$.ajax({
					type: "POST",
					async: false,
					url: "/console/users/manager/checkIdDuplicate.json",
					dataType: "json",
					contentType: "application/json; charset=UTF-8",
					data: JSON.stringify(myData),
					success:function(res) {
						if (res != true) {
							idDuplicate = false;
							$("#id").attr("readonly",true);
							$("#id").css("background-color", "#d3d3d3");
							alert($("#id").val() + "는 사용 가능하며 변경할 수 없습니다.");
						}
						else {
							alert($("#id").val() + "는 사용 불가능! 다른 아이디 입력하세요!");
							$("#id").val("");
							$("#id").focus();
						}
					}
				});
			});
		});
		
	</script>
	
	<script>
		// 닉네임 중복 여부
		var nickDuplicate = true;
		
		$(function() {
			var $frm = $("#frmMain");
			
			$("#btnNick").on("click", function(e) {
				if ($("#nickname").val().length <2) {
					alert("닉네임을 2자리 이상으로 입력하세요!");
					return false;
				}
				
				var nickData = {nickname: $("#nickname").val()};
				
				$.ajax({
					type: "POST",
					async: false,
					url: "/console/users/manager/checkNickDuplicate.json",
					dataType: "json",
					contentType: "application/json; charset=UTF-8",
					data: JSON.stringify(nickData),
					success:function(res) {
						// 중복이 안 될 경우
						if (res != true) {
							nickDuplicate = false;
							$("#nickname").attr("readonly",true);
							$("#nickname").css("background-color", "#d3d3d3");
							alert($("#nickname").val() + "는 사용 가능하며 변경할 수 없습니다.");
						}
						else {
							alert($("#nickname").val() + "는 사용 불가능! 다른 닉네임을 입력하세요!");
							$("#nickname").val("");
							$("#nickname").focus();
						}
					}
				});
			});
		});
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" name="width" value="100" />
<input type="hidden" name="phone" id="phone" />
<div class="container">
	<section class="txtCenter">
		<article class="txtCenter">
			<a href="/"><img src="/images/logo/logo.jpg" alt="로고" width="200px" /></a>
			<h3>관리자 가입</h3><br/>
			<h1>최고 관리자의 승인 이후 사용 가능합니다.</h1><br/>
		</article>
	</section>
	<section class="content">
		<article class="txtCenter">
			(*) 표시는 필수 입력 사항입니다.
			<table class="headLeft_01" style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 150px;">아이디(*)</th>
					<td>
						<input value="rhksflwk" type="text" id="id" name="id" required />
						 <input type="button" value="중복 찾기" style="width:100px" id="btnId" />
					</td>
				</tr>
				<tr>
					<th>비밀번호(*)</th>
					<td><input value="12345678!a" type="password" id="passwd" name="passwd" required /></td>
				</tr>
				<tr>
					<th>비밀번호 확인(*)</th>
					<td><input value="12345678!a" type="password" id="passwd_" name="passwd_" required /></td>
				</tr>
				<tr>
					<th style="width: 150px;">닉네임(*)</th>
					<td>
						<input value="관리자" type="text" id="nickname" name="nickname" required />
						<input type="button" value="중복 찾기" style="width:100px" id="btnNick" />
					</td>
				</tr>
				<tr>
					<th>성명(*)</th>
					<td>
						<input value="김관리" type="text" id="mng_nm" name="mng_nm" required />
					</td>
				</tr>
				<tr>
					<th>이메일(*)</th>
					<td>
						<input value="rhksflwk@happySteps.com" type="text" id="email" name="email" required />
					</td>
				</tr>
				<tr>
					<th>연락처(*)</th>
					<td>
						<input value="010" type="text" id="phone1" name="phone1" maxlength="3"     style="text-align:center;width:30px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						 - <input value="1122" type="text" id="phone2" name="phone2" maxlength="4" style="text-align:center;width:40px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						 - <input value="2233" type="text" id="phone3" name="phone3" maxlength="4" style="text-align:center;width:40px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
					</td>
				</tr>
				<tr>
					<th>주소(*)</th>
					<td>
						<input type="text" maxlength="5" style="text-align:center;width:50px;background-color:#F0F0F0" id="post" name="post" required readonly />
						 도로명 <input type="text" size="40" required id="addr1" name="addr1" style="background-color:#F0F0F0" readonly />
						 <input type="hidden" id="jibunAdd" />
						 <input type="hidden" id="extraAddress" />
						 <span id="guide" style="color:#999; display:none"></span>
						 상세 <input value="주소2" type="text" placeholder="상세 주소" required id="addr2" name="addr2" />
						 <input type="button" value="우편번호 찾기" style="width:100px" onClick="execDaumPostcode();" /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;padding-top: 10px;padding-bottom: 10px">
						<input type="reset" value="다시 쓰기" style="width:100px"/>
						 <input type="button" value="가입 하기" style="width:100px" onClick="checkRegister();"/>
					</td>
				</tr>
			</table>
		</article>
		<aside></aside>
	</section>
</div>
</form>
</body>
</html>