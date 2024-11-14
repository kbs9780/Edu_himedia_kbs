<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF COM.HAPPYSTEPS
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 COM.HAPPYSTEPS ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 com.happySteps에 있으며,
 * com.happySteps이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * com.happySteps의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 com.happySteps All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: donationForm.jsp
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [202410072000][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/donation/index.jsp" %>
<!DOCTYPE html>
<html>
	<head>
	<title>후원소개</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<style>
			p {
		        margin-top: 5px; /* 상단 여백을 5px로 줄임 */
		        line-height: 1.6; /* 줄 간격 */
		        margin-bottom: 10px; /* 하단 여백 */
		    }
				.container {
			    max-width: 3000px; /* 최대 폭을 3000px로 설정 */
			    margin: 0 auto; /* 중앙 정렬 */
			    padding: 0 20px; /* 좌우 여백 */
			}
			.gnb {
				background-color: #F9F3EC; /* 연한 노란색 배경 */
				padding: 20px;
				border-radius: 8px; /* 모서리 둥글게 */
				box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
			}

			.gnb ul {
				list-style-type: none; /* 기본 리스트 스타일 제거 */
				padding: 0; /* 패딩 제거 */
				margin: 0; /* 마진 제거 */
			}

			.gnb li {
				display: inline; /* 수평 배치 */
				margin-right: 15px; /* 메뉴 간격 */
			}

			.gnb a {
				text-decoration: none; /* 링크 밑줄 제거 */
				color: #000; /* 검정 글자 */
				padding: 15px 20px; /* 패딩 추가 */
				border-radius: 4px; /* 모서리 둥글게 */
				transition: background-color 0.3s; /* 배경색 변화 효과 */
			}

			.gnb a:hover {
				background-color: #E0E0E0; /* 호버 시 배경색 변화 */
			}

			body {
			  body {
				    font-family: 'RixXladywatermelonR', Arial, sans-serif; /* 폰트를 기본으로 설정 */
				}
			    background-color: #ffffff; /* 전체 배경색 */
			    color: #000; /* 검정 글자 */
			    margin: 0 auto; /* 중앙 정렬 */
			    padding: 20px;
			    max-width: 2000px; /* 최대 폭을 2000px로 설정 */
			}
			
			.txtCenter {
				text-align: center; /* 중앙 정렬 */
				margin-bottom: 20px; /* 하단 여백 */
				background-color: #ffffff; /* 부드러운 배경색 */
				padding: 20px;
				border-radius: 8px; /* 모서리 둥글게 */
				box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
			}

			p {
				margin-top: 5px;
				line-height: 1.6; /* 줄 간격 */
				margin: 5px 0; /* 위아래 여백 */
			}

			button.accordion {
				background-color: #FFFFF0; /* 기본 버튼 배경색 */
				color: #000; /* 검정 글자 */
				cursor: pointer;
				padding: 10px;
				width: 100%;
				border: none;
				text-align: left;
				outline: none;
				font-size: 16px;
				transition: background-color 0.3s;
				border-radius: 5px; /* 버튼 모서리 둥글게 */
				margin: 5px 0; /* 버튼 간격 */
			}

			button.accordion:hover {
				background-color: #FFC107; /* 마우스 호버 시 색상 */
			}

			button.accordion.active {
				background-color: #FAEBD7; /* 클릭 시 연한 베이지색 */
			}

			.accordion2 {
				background-color: #FFF; /* 텍스트 박스 배경색 */
				color: #000; /* 검정 글자 */
				cursor: text;
				padding: 10px;
				width: 950px;
				border: 1px solid #ddd; /* 테두리 */
				border-radius: 5px; /* 둥근 모서리 */
				margin: 5px 0; /* 여백 */
				resize: none; /* 크기 조절 비활성화 */
				overflow: auto; /* 스크롤바 활성화 */
				height: auto; /* 자동 높이 */
			}

			.panel {
				padding: 1px 1px;
				background-color: white;
				overflow: hidden;
				display: none; /* 기본적으로 숨김 */
				height: auto;
			}

			.contact-info {
				margin-top: 20px; /* 상단 여백 */
				padding: 10px;
				background-color: #F9F3EC; /* 부드러운 배경색 */
				border-radius: 8px; /* 모서리 둥글게 */
			}

			.contact-info h3 {
				margin-bottom: 10px; /* 하단 여백 */
			}
		</style>
		<script>
			window.onload = function() {
				var acc = document.getElementsByClassName("accordion");
				for (var i = 0; i < acc.length; i++) {
					acc[i].addEventListener("click", function() {
						this.classList.toggle("active");
						var panel = this.nextElementSibling;
						if (panel.style.display === "block") {
							panel.style.display = "none";
						} else {
							panel.style.display = "block";
						}
					});
				}
			}
		</script>
	</head>
	<body>
	<div class="container">
		<article class="txtCenter">
			<div style="position: relative; height: 350px; overflow: hidden; margin-top: 10px;">
				<a href="/front/">
					<img src="/images/logo/logo3.png" alt="로고" style="width: 380px; height: 250px; object-fit: cover; "/> <!-- 로고 크기를 더 크게 조정 -->
				</a>
				<nav class="gnb">
					<ul>
						<li><a href="/front/index.web">홈페이지</a></li>
						<li><a href="/front/about/index.web">소개</a></li>
						<li><a href="/front/about/service.web">서비스</a></li>
						<li><a href="/front/donation/donationForm.web">후원하기</a></li>
						<li><a href="/front/center/index.web">문의하기</a></li>
					</ul>
				</nav>
			</div>
			<p>
				[유기 동물 보호 및 복지를 위한 후원금 모집 안내]<br><br>
				안녕하세요, 저희 happySteps는 유기된 동물들의 구조와 보호, 건강한 입양을 위해 다양한 활동을 펼치고 있는 비영리 단체입니다.<br>
				유기 동물 문제는 심각한 사회적 이슈로 자리 잡고 있으며, 더 많은 동물들이 보호받기 위해서는 여러분의 따뜻한 후원이 필요합니다.<br> 
				com.happySteps는 동물 보호의 중요성을 알리고<br> 
				유기 동물을 줄이기 위한 캠페인과 교육 프로그램을 운영하여, 지역사회에서 책임 있는 반려동물 문화를 조성합니다.
			</p>

			<!-- 첫 번째 아코디언 -->
			<button class="accordion" type="button">1. 후원금의 사용처: 유기 동물의 구조와 치료</button>
			<div class="panel">
				<textarea class="accordion2" readonly>유기 동물의 긴급 구조와 필요한 의료 지원, 응급 치료가 이루어집니다. 장기적인 치료가 필요한 경우에는 전문 수의사와 협력하여 건강 회복에 중점을 둡니다.</textarea>
			</div>

			<!-- 두 번째 아코디언 -->
			<button class="accordion" type="button">2. 보호소 운영 및 생활 환경 개선</button>
			<div class="panel">
				<textarea class="accordion2" readonly>구조된 동물들이 쾌적한 환경에서 지낼 수 있도록 보호소의 운영비로 사용됩니다. 사료, 침구, 놀이 용품 등 동물들의 생활 환경을 개선합니다.</textarea>
			</div>

			<!-- 세 번째 아코디언 -->
			<button class="accordion" type="button">3. 건강한 입양을 위한 지원</button>
			<div class="panel">
				<textarea class="accordion2" readonly>입양 희망자와 동물의 특성을 고려하여 건강하고 행복한 입양이 이루어질 수 있도록 상담 및 지원 서비스를 제공합니다. 입양 후에도 지속적인 관리가 이루어집니다.</textarea>
			</div>

			<div class="contact-info">
				<h3>문의 사항</h3>
				<p>이메일: contact@happysteps.org<br>전화: 123-456-7890</p>
			</div>
		</article>
	</div>
	<footer>
		<%@ include file="/include/front/login_footer.jsp" %>
	</footer>
	</body>
</html>