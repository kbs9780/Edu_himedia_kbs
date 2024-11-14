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
<%@ page info="/front/about/service.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>서비스 안내</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style>
		/* 반응형 스타일 */
    @media (max-width: 768px) {
        div[style*="display: flex"] {
            flex-direction: column;
            align-items: center;
        }
    }
	</style>
</head>
<body>
	<form id="frmServices">
		<div class="container" style="max-width: 1200px; margin: 0 auto; padding: 10px;">
			<article class="txtCenter">
				<div style="position: relative; height: 400px;  margin-top: 10px;">
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

				<h2 style="text-align: center; font-size: 30px; color: #444; margin-top: 130px;">서비스 안내</h2>

				<div style="display: flex; flex-direction: column; align-items: center; margin-top: 20px;">
				    <div style="display: flex; justify-content: center; flex-wrap: wrap; margin-bottom: 10px;">
				        <div style="border: 1px solid #ccc; border-radius: 10px; padding: 20px; margin: 10px; width: 280px; max-width: 100%;">
				            <h3 style="font-size: 24px; color: #444;">커뮤니티</h3>
				            <p>지역 사회와의 연결을 통해 다양한 정보와 경험을 나누는 공간입니다. 게시판과 활동을 통해 소통하세요.</p>
				        </div>
				        <div style="border: 1px solid #ccc; border-radius: 10px; padding: 20px; margin: 10px; width: 280px; max-width: 100%;">
				            <h3 style="font-size: 24px; color: #444;">후원</h3>
				            <p>소중한 후원을 통해 우리 기관의 활동을 지원할 수 있습니다. 다양한 후원 방법을 통해 참여해 보세요.</p>
				        </div>
				    </div>
				    <div style="display: flex; justify-content: center; flex-wrap: wrap;">
				        <div style="border: 1px solid #ccc; border-radius: 10px; padding: 20px; margin: 10px; width: 280px; max-width: 100%;">
				            <h3 style="font-size: 24px; color: #444;">유기동물 입양</h3>
				            <p>새로운 가족을 찾는 유기동물과의 만남을 제공합니다. 입양 절차와 유기동물 정보를 확인하세요.</p>
				        </div>
				        <div style="border: 1px solid #ccc; border-radius: 10px; padding: 20px; margin: 10px; width: 280px; max-width: 100%;">
				            <h3 style="font-size: 24px; color: #444;">전자상거래 기능</h3>
				            <p>우리 기관의 다양한 상품을 온라인에서 구매할 수 있는 기능을 제공합니다. 편리하게 쇼핑하세요.</p>
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