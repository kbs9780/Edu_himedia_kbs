<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HAPPYSTEPS.COM.
 * HAPPYSTEPS.COM OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HAPPYSTEPS.COM ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 HAPPYSTEPS.COM 에 있으며,
 * HAPPYSTEPS.COM이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * HAPPYSTEPS.COM의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 HAPPYSTEPS.COM All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241004134100][kbs@>_<.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/member/termAgreeForm.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>	
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>약관 페이지</title>
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<style>
		/* 아코디언 버튼 스타일 */
		.accordion {
			background-color: #f7eadb;
			color: #444;
			cursor: pointer;
			padding: 10px;
			width: 100%;
			border-radius: 10px;
			border-color: #f9dcb9;
			text-align: left;
			outline: none;
			font-size: 15px;
			transition: background-color 0.3s ease;
			display: flex;
			justify-content: space-between;
			align-items: center;
		}

		.accordion:hover, .accordion.active {
			background-color: #efdfcc;
		}

		/* 아코디언 패널 스타일 */
		.panel {
			background-color: white;
			max-height: 500px; /* 기본적으로 열려있는 높이 */
			overflow: hidden;
			transition: max-height 0.3s ease-out;
			width: 99%;
		}

		/* 체크박스 선택 후 닫히도록 설정 */
		.panel.hidden {
			max-height: 0; 
		}

		/* textarea 스타일 */
		.accordion2 {
			background-color: #F9F3EC;
			color: #666;
			padding: 5px;
			border-radius: 10px;
			width: 98%;
			border: none;
			font-size: 15px;
			resize: none;
			overflow: auto;
		}

		/* 스크롤바 스타일 */
		.accordion2::-webkit-scrollbar {
			width: 6px;
		}

		.accordion2::-webkit-scrollbar-thumb {
			background-color: #f1d6b8;
			border-radius: 10px;
		}

		.accordion2::-webkit-scrollbar-thumb:hover {
			background-color: #555;
		}

		.accordion2::-webkit-scrollbar-track {
			background: #f1f1f1;
		}

		/* 체크박스 스타일 */
		input[type="checkbox"] {
			transform: scale(1.5);
		}

		/* 폼 제출 버튼 스타일 */
		.submit-button {
			display: block;
			margin: 20px auto;
			padding: 10px 20px;
			font-size: 16px;
			cursor: pointer;
		}

		/* 로고 이미지 스타일 */
		header img {
			width: 300px;
			height: 200px;
		}
	</style>
	<script>
		// 아코디언 토글 기능
		function toggleAccordion(index) {
			var panels = document.getElementsByClassName('panel');
			var checkboxes = document.querySelectorAll('input[type="checkbox"]');

			if (!checkboxes[index + 1].checked) {
				panels[index].classList.remove('hidden');
			} else {
				panels[index].classList.add('hidden');
			}
		}

		// 전체 체크박스 기능
		function toggleAllCheckboxes(selectAll) {
			var checkboxes = document.querySelectorAll('input[type="checkbox"]');
			checkboxes.forEach(function(checkbox) {
				if (checkbox !== selectAll) {
					checkbox.checked = selectAll.checked;
					toggleAccordion(Array.from(checkboxes).indexOf(checkbox) - 1);
				}
			});
		}

		// 폼 검증 및 제출
		function validateForm() {
			var term1Checkbox = document.getElementById('term1');
			if (!term1Checkbox.checked) {
				alert("필수 약관에 동의해야 합니다.");
				return false;
			}
			return true;
		}

		// 폼 제출 전 처리
		function submitForm() {
			if (validateForm()) {
				var form = document.getElementById('termsForm');
				var submitButton = document.querySelector('.submit-button');
				submitButton.disabled = true; // 중복 제출 방지
				form.submit();
			}
		}
	</script>
</head>
<body id="site-header">
	<div class="container">
		<header style="display: flex; justify-content: center; align-items: center; height: 120px;">
			<div style="position: relative; height: 200px; overflow: hidden; margin-top: 50px;">
				<a href="/front/"><img src="/images/logo/logo3.png" alt="로고"></a>
			</div>
		</header>
		<br/><br/><br/><br/>
	</div>

	<section class="content" style="align-items: flex-start; height: 50%; width: 50%; margin-left: auto; margin-right: auto;">
		<article class="content" style="text-align:center">
			<div>서비스 이용 약관</div><br/>

			<form id="termsForm" action="registerForm.web" method="POST">
				<!-- 전체 체크박스 -->
				<div>
					<input type="checkbox" id="selectAll" onclick="toggleAllCheckboxes(this)" />
					<label for="selectAll">전체 동의</label>
				</div>
				<br/>

				<!-- 첫 번째 아코디언 -->
				<button class="accordion" aria-expanded="true" type="button">
					1. 필수 약관 (*)
					<input type="checkbox" id="term1" name="term1" value="Y" onchange="toggleAccordion(0)" required />
				</button>
				<div class="panel">
					<textarea class="accordion2" readonly><%@ include file="../member/terms/term1.jsp" %></textarea>
				</div>

				<!-- 두 번째 아코디언 -->
				<button class="accordion" aria-expanded="true" type="button">
					2. 마켓팅 수신 동의
					<input type="checkbox" id="term2" name="term2" value="Y" onchange="toggleAccordion(1)" />
				</button>
				<div class="panel">
					<textarea class="accordion2" readonly><%@ include file="../member/terms/term2.jsp" %></textarea>
				</div>

				<!-- 세 번째 아코디언 -->
				<button class="accordion" aria-expanded="true" type="button">
					3. 후원 동의
					<input type="checkbox" id="term3" name="term3" value="Y" onchange="toggleAccordion(2)" />
				</button>
				<div class="panel">
					<textarea class="accordion2" readonly><%@ include file="../member/terms/term3.jsp" %></textarea>
				</div><br/>

				<!-- 제출 버튼 -->
				<button type="button" class="submit-button" onclick="submitForm()">체크 항목 동의하고 계속</button>
			</form>
		</article>
	</section>
	<footer>
		<br><br><br>
		<%@ include file="/include/front/login_footer.jsp" %>
	</footer>
</body>
</html>