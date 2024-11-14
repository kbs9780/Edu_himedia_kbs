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
<%@ page info="/front/about/ethics.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>윤리경영</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
				<div class="box-container">
					    <div style="text-align: center; padding: 20px; border-radius: 10px; margin-top: 90px;">
					        <h2 style="font-size: 25px; color: #444;">윤리와 책임 (Mission)</h2>
					        <p><strong>"열성, 도덕성의 원천이자 총합입니다."</strong></p>
					        반려동물과 함께 생활하기에 도덕성이 우선되며, 예산 대부분과 재무관리는 투명해야 하며,<br> 이를 어떻게 운용하는지는 윤리의 문제입니다.<br>
					        또한, 세금과 후원금에 대한 또 다른 윤리는 '최선의 책임'을 다하는 것입니다.<br> 이는 고객들에게 최상의 서비스를 제공하기 위한 책임을 다하는 것입니다.
					    </div>
					</div>
					
					<div class="box-container">
					    <div style="text-align: center; padding: 20px; border-radius: 10px; margin-top: 10px;">
					        <h2 style="font-size: 25px; color: #444;">윤리헌장 (Vision)</h2>
					        <div style="text-align: left; margin: 0 auto; width: 60%;">
					            <div style="padding: 20px; border-radius: 10px; margin-top: 10px;">
					                <p>우리 기관의 모든 직원은 생명존중사상에 기초하여 동물들의 존엄성과 가치를 존중합니다.</p>
					                <p>특히 버려진 동물들을 위해 생명의 가치를 실현하기 위해 앞장섭니다.</p>
					                <p>우리는 함께 일하며, 사회적 지위와 기능을 향상시키기 위한 사회제도 개선 활동에도 적극 참여합니다.</p>
					                <p>이를 위해 전문적인 지식과 기술을 개발하고 사회적 가치를 실현하는 전문가로서 능력과 품위를 유지하기 위해 노력할 것입니다.</p>
					            </div>
					        </div>
					    </div>
					</div>
					
					<div class="box-container">
					    <div style="text-align: center; padding: 20px; border-radius: 10px; margin-top: 10px;">
					        <h2 style="font-size: 25px; color: #444;">윤리선언 (Vision)</h2>
					        <p><strong>"반려동물과 유기동물 공동체의 연결, 더 나은 삶을 위한 협력"</strong></p>
					        <div style="text-align: left; margin: 0 auto; width: 60%;">
					            <div style="padding: 20px; border-radius: 10px; margin-top: 10px;">
					                <p>우리는 전문가로서의 품위와 자질을 유지·개발하며, 인격을 훼손하는 언행을 하지 않습니다.</p>
					                <p>우리는 상호 신뢰와 존중으로 동료를 대하며, 타 전문직과도 긴밀히 협력하여 효율적인 서비스를 제공합니다.</p>
					                <p>우리는 지역사회의 이익과 권익을 최우선으로 여기며, 직무 수행 중 얻은 정보를 철저히 비밀로 유지합니다.</p>
					                <p>우리는 소외된 동물들을 위해 노력하며, 보다 나은 삶을 위해 최선을 다합니다.</p>
					            </div>
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