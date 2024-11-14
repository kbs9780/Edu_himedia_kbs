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
 *				: [20241004134100][kbs@>_<.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/member/registerForm.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/front/header.jsp" %>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/layoutMain.css" />
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/table.css" />
	<script type="text/javascript" src="/js/front.js"></script>
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
					url: "/front/member/checkIdDuplicate.json",
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
					url: "/front/member/checkNickDuplicate.json",
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
	

	<script>
	//펫 유/무 클릭시 종류선택이 가능하게하는 코드
	function togglePetOptions() {
			var petOptions = document.getElementById("petOptions");
			var isPetYes = document.getElementById("btnPetYes").checked;
			
			// 반려동물 있음일 경우 체크박스를 활성화
			var checkboxes = petOptions.getElementsByTagName("input");
			for (var i = 0; i < checkboxes.length; i++) {
				checkboxes[i].disabled = !isPetYes;
				checkboxes[i].checked = false; // 초기화
			}
	}		
	</script>
	
	
	<script>
	//이메일 직접입력
		function checkCustomDomain() {
			var emailDomainSelect = document.getElementById("emailDomain");
			var customEmailDomain = document.getElementById("customEmailDomain");

		if (emailDomainSelect.value === "custom") {
		customEmailDomain.style.display = "inline";	// 기타 선택 시 직접 입력란 표시
		customEmailDomain.required = true;		// 필수 입력 설정
		} else {
		customEmailDomain.style.display = "none";	// 선택 해제 시 입력란 숨기기
		customEmailDomain.required = false;		// 필수 입력 해제
		}
		}
	//이메일 합치기
		function combineEmail() {
		var frontEmail = document.getElementById("frontEmail").value;
		var emailDomain = document.getElementById("emailDomain").value;
		var customEmailDomain = document.getElementById("customEmailDomain").value;

		var email = '';

		// 이메일 도메인이 'custom'일 경우, customEmailDomain 값 사용
		if (emailDomain === "custom" && customEmailDomain) {
		email = frontEmail + "@" + customEmailDomain;
		} else {
		email = frontEmail + "@" + emailDomain;
		}

		// 최종 이메일을 hidden input에 저장
		document.getElementById("email").value = email;

		// 디버그 용 콘솔 로그 (필요시 제거)
		console.log("최종 이메일:", email);

		return true; // 폼이 정상적으로 제출되도록 반환
		}
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" name="phone" id="phone" />
<input type="hidden" name="email" id="email" />
<input type="hidden" name="pets" id="pets" />
<input type="hidden" name="term1" value="${term1}"/>
<input type="hidden" name="term2" value="${term2}"/>
<input type="hidden" name="term3" value="${term3}"/>
<div class="container">
	<section class="content">
		<nav></nav>
		<article class="txtCenter">
			(*) 표시는 필수 입력 사항입니다.
			
			<table class="headLeft_01" style="width: 900px; margin-left: auto; margin-right: auto; ">
				<tr>
					<th style="width: 150px;">아이디(*)</th>
					<td>
						<input type="text" id="id" name="id" required />
						<input type="button" value="중복 찾기" style="width:100px" id="btnId" />
					</td>
				</tr>
				<tr>
					<th>비밀번호(*)</th>
					<td><input type="password" id="passwd" name="passwd" required /></td>
				</tr>
				<tr>
					<th>비밀번호 확인(*)</th>
					<td><input  type="password" id="passwd_" name="passwd_" required /></td>
				</tr>
				<tr>
					<th style="width: 150px;">닉네임(*)</th>
					<td>
						<input type="text" id="nickname" name="nickname" required />
						<input type="button" value="중복 찾기" style="width:100px" id="btnNick" />
					</td>
				</tr>
				<tr>
					<th>성명(*)</th>
					<td>
						<input type="text" id="mbr_nm" name="mbr_nm" required />
						 <input type="radio" name="gender" value="M" checked /> 남
						 <input type="radio" name="gender" value="F" /> 여
					</td>
				</tr>
				<tr>
					<th>연락처(*)</th>
					<td>
						<input type="text" id="phone1" name="phone1" maxlength="3"		style="text-align:center;width:50px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						 - <input type="text" id="phone2" name="phone2" maxlength="4" style="text-align:center;width:60px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						 - <input type="text" id="phone3" name="phone3" maxlength="4" style="text-align:center;width:60px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
					</td>
				</tr>
				<tr>
					<th>주소(*)</th>
					<td>
						<input type="text" maxlength="5" style="text-align:center;width:70px;background-color:#F0F0F0" id="post" name="post" required readonly />
						 도로명 <input type="text" size="30" required id="addr1" name="addr1" style="background-color:#F0F0F0" readonly />
						 <input type="hidden" id="jibunAdd" />
						 <input type="hidden" id="extraAddress" />
						 <span id="guide" style="color:#999; display:none"></span>
						 <input type="button" value="우편번호 찾기" style="width:120px" onClick="execDaumPostcode();" />
						 <br> 상세주소 
						 <input value="주소2" type="text" placeholder="상세 주소" required id="addr2" name="addr2" />
						 </td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
					<input type="text" id="frontEmail" name="frontEmail" placeholder="이메일주소" required>	@
					<input type="text" id="customEmailDomain" name="customEmailDomain" placeholder="직접 입력" style="display:none;">
					<select id="emailDomain" name="emailDomain" onchange="checkCustomDomain()">
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="custom">기타 (직접 입력)</option>
					</select>
					</td>
				</tr>
				
				<tr>
					<th>반려동물 유/무</th>
					<td>
						<input type="radio" name="flg_pets" value="Y" id="btnPetYes" onclick="togglePetOptions()"/> 있음
						<input type="radio" name="flg_pets" value="N" id="btnPetNo" checked onclick="togglePetOptions()"/> 없음
					</td>
				</tr>

				<tr id="petOptions">
					<th>반려동물 종류</th>
					<td>
						<input type="checkbox" name="pet" id="pet1" disabled /> 강아지 &nbsp;&nbsp;
						<input type="checkbox" name="pet" id="pet2" disabled /> 고양이 &nbsp;&nbsp;
						<input type="checkbox" name="pet" id="pet3" disabled /> 햄스터 &nbsp;&nbsp;
						<input type="checkbox" name="pet" id="pet4" disabled /> 파충류 &nbsp;&nbsp;
						<input type="checkbox" name="pet" id="pet5" disabled /> 기타
					</td>
				</tr>
				
				<tr>
					<th>마케팅 수신 동의</th>
					<td>
						SMS <input type="checkbox" name="flg_sms" value="Y" />
						Email <input type="checkbox" name="flg_email" value="Y" /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;padding-top: 10px;padding-bottom: 10px">
						<input type="reset" value="다시 쓰기" style="width:100px"/>
						<input type="button" value="가입 하기" style="width:100px" onClick="combineEmail(); checkRegister();"/>
					</td>
				</tr>
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