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
 *				: [2024-10-09][rkdcodbs77#naevr.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/front/about/vision.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>소개</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style>
	</style>
</head>
<body>
	<form id="frmMain">
		<div class="container">
			<article class="txtCenter">
				<div style="position: relative; height: 400px; margin-top: 10px; margin-bottom: 20px;">
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

				<div style="text-align: center; padding: 20px; border-radius: 10px; margin-top: 90px;">
					<h2 style="font-size: 25px; color: #444;">미션 (Mission)</h2>
					<p><strong>"반려동물과 유기동물의 행복한 삶을 함께 만들어가는 따뜻한 플랫폼"</strong></p>
					<p>저희 플랫폼의 미션은 반려동물과 유기동물이 행복한 삶을 영위할 수 있도록 돕는 것입니다.<br> 반려동물에게는 최고의 케어와 애정을, 유기동물에게는 따뜻한 가정과 희망을 제공함으로써,<br> 사람들과 동물이 더불어 살아가는 세상을 만들어 나가는 것이 우리의 목표입니다.</p>
				</div>
				<div style="text-align: center; padding: 20px; border-radius: 10px; margin-top: 10px;">
					<h2 style="font-size: 25px; color: #444;">비전 (Vision)</h2>
					<p><strong>"반려동물과 유기동물 공동체의 연결, 더 나은 삶을 위한 협력"</strong></p>
					<div style="text-align: left; margin: 0 auto; width: 60%;">
						<div style="padding: 20px; border-radius: 10px; margin-top: 10px;">
							<strong>반려동물의 삶의 질 향상</strong>:<br> 반려동물의 행복을 위해 필요한 모든 제품과 서비스를 제공하며, 반려동물이 주는 사랑에 보답하는 삶의 질을 높여갑니다.<br><br>
							<strong>유기동물 입양 활성화</strong>:<br> 유기동물이 새로운 가정을 찾아 사랑받으며 살아갈 수 있도록 입양 문화를 확산하고, 지원하는 체계를 강화합니다.<br><br>
							<strong>따뜻한 커뮤니티</strong>:<br> 반려동물과 유기동물에 대한 정보와 경험을 공유하는 따뜻한 커뮤니티를 통해, 사람들과 동물이 서로의 삶에 긍정적인 영향을 미칠 수 있도록 돕습니다.<br><br>
							<strong>지속 가능한 반려동물 문화 형성</strong>:<br> 반려동물과 유기동물을 사랑하는 모든 이들이 연결되어 지속 가능한 반려동물 문화를 만들어 나가도록, 필요한 서비스와 지원을 아끼지 않겠습니다.<br><br>
							<strong>전문적인 의료 지원 및 건강 관리</strong>:<br> 반려동물의 건강을 책임질 수 있는 병원 예약 서비스와 건강 정보를 제공하여, 반려동물이 행복하고 건강하게 살아갈 수 있도록 적극적인 도움을 제공합니다.<br>
						</div>
					</div>
				</div>
			</article>
		</div>
		<footer>
			<%@ include file="/include/front/footer.jsp" %>
		</footer>
	</form>
</body>
</html>