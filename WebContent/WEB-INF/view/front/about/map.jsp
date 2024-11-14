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
<%@ page info="/front/about/map.jsp" %>
<!DOCTYPE html>
<html>
<head>    
	<title>오시는길</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style>
		body {
			margin: 0;
		}
		.container {
			max-width: 1200px; /* 최대 너비 설정 */
			margin: 0 auto; /* 중앙 정렬 */
			padding: 10px; /* 패딩 추가 */
		}
		.txtCenter {
			text-align: center;
		}
		.map-container {
			display: flex; /* Flexbox 사용 */
			justify-content: center; /* 수평 가운데 정렬 */
			margin: 60px 0; /* 위아래 여백 추가 */
			width: 100%; /* 너비 100% 설정 */
			position: relative; /* 부모 요소의 위치를 기준으로 설정 */
		}
		#daumRoughmapContainer1728392491067 {
			width: 100%; /* 지도 너비를 100%로 설정 */
			height: 360px; /* 고정 높이 설정 */
		}
		@media (max-width: 768px) {
			.container {
				padding: 5px; /* 작은 화면에서 패딩 감소 */
			}
			#daumRoughmapContainer1728392491067 {
				height: 300px; /* 작은 화면에서 높이 조정 */
			}
		}
	</style>
</head>
<body>
	<form id="frmMain">
		<div class="container">
			<article class="txtCenter">
				<div style="position: relative; height: 500px; margin-top: 10px; margin-bottom: 20px;">
					<a href="/front/">
					</a>
					<header>
						<div style="text-align: center;">
							<%@ include file="/include/front/header.jsp" %>
							<%@ include file="/include/front/top.jsp" %>
							<%@ include file="/include/front/gnb_about.jsp" %>
						</div>
					</header>
				</div>
				<br>
				<hr>
				<div class="map-container">
					<!-- 카카오맵 위치 -->
					<div id="daumRoughmapContainer1728392491067" class="root_daum_roughmap root_daum_roughmap_landing"></div>
				</div>
				<div style="text-align: center;">
					<span>
						[주소 및 연락처]<br>
						주소 : 12345 경기 성남시 중원구 성남대로 1133 메트로칸빌딩 5층 502~509호(성남동 4169)<br>
						전화 : 02-000-0000<br>
						팩스 : 02-000-0000<br>
					</span>
				</div>
			</article>
		</div>		
		<footer>
			<%@ include file="/include/front/footer.jsp" %>
		</footer>
	</form>

	<!-- 카카오맵 스크립트 -->
	<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
	<script charset="UTF-8">
		new daum.roughmap.Lander({
			"timestamp" : "1728392491067",
			"key" : "2kucv",
			"mapWidth" : "640",
			"mapHeight" : "360"
		}).render();
	</script>
</body>
</html>