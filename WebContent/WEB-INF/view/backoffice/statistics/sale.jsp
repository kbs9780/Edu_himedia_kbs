<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF happySteps.com.
 * happySteps.com OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 happySteps.com ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 happySteps.com에 있으며,
 * happySteps.com이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * happySteps.com의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 happySteps.com All Rights Reserved.
 *
 *
 * Program		: kr.co.himedia.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240730145700][kbs@happySteps.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/statistics/sale.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/bfc/header.jsp" %>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/layoutSubmain.css" />
	<style></style>
	<!-- Google Charts 라이브러리 로드 -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawCharts);
	
		function drawCharts() {
			// 연도별 데이터
			var data6 = google.visualization.arrayToDataTable([
				['년도', '매출', '원가', '이익'],
				['2020', 15000, 9000, 6000],
				['2021', 20000, 13000, 7000],
				['2022', 25000, 16000, 9000],
				['2023', 30000, 20000, 10000],
				['2024', 40000, 25000, 15000]
			]);
	
			var options6 = {
				title: '연도별 매출과 원가를 통한 판매 이익 추이 (만원 단위)',
				width: 500,
				height: 400,
				isStacked: true
			};
	
			var chart6 = new google.visualization.ColumnChart(document.getElementById('chart_div6'));
			chart6.draw(data6, options6);
	
			var data7 = google.visualization.arrayToDataTable([
				['23년도', '매출', '원가', '이익'],
				['01월', 2800, 1800, 1000], 
				['02월', 2200, 1500, 700],  
				['03월', 2500, 1600, 900], 
				['04월', 3200, 2000, 1200], 
				['05월', 2700, 1700, 1000], 
				['06월', 3000, 1900, 1100], 
				['07월', 2600, 1700, 900],  
				['08월', 3400, 2100, 1300], 
				['09월', 3100, 2000, 1100], 
				['10월', 2900, 1800, 1100], 
				['11월', 2700, 1700, 1000], 
				['12월', 3500, 2300, 1200]  
			]);
	
			var options7 = {
				title: '23년도 매출과 원가를 통한 월별 이익 추이 (만원 단위)',
				width: 500,
				height: 400,
				isStacked: true
			};
	
			var chart7 = new google.visualization.ColumnChart(document.getElementById('chart_div7'));
			chart7.draw(data7, options7);
			
			var data8 = google.visualization.arrayToDataTable([
				['24년도', '매출', '원가', '이익'],
				['01월', 3500, 2100, 1400],
				['02월', 3000, 1900, 1100],
				['03월', 4000, 2500, 1500],
				['04월', 3200, 2000, 1200],
				['05월', 3600, 2300, 1300],
				['06월', 3700, 2400, 1300],
				['07월', 4200, 2600, 1600],
				['08월', 3800, 2400, 1400],
				['09월', 3300, 2100, 1200],
				['10월', 4300, 2700, 1600],
				['11월', 3800, 2300, 1500],
				['12월', 0, 0, 0]
			]);

			var options8 = {
				title: '24년도 매출과 원가를 통한 월별 이익 추이 (만원 단위)',
				width: 500,
				height: 400,
				isStacked: true
			};

			var chart8 = new google.visualization.ColumnChart(document.getElementById('chart_div8'));
			chart8.draw(data8, options8);
		}
	</script>

</head>
<body class="nav-md">
		<%@ include file="/include/bfc/navi.jsp" %>
<form id="frmMain" method="POST">
<div class="table">
	<section class="right_col">
		<article class="x_panel">
			<div id="chart_div6" style="float: left;"></div>
			<div id="chart_div7" style="float: left;"></div>
			<div id="chart_div8" style="float: left;"></div>
		</article>
		<aside></aside>
	</section>
	<footer>
		<%@ include file="/include/bfc/footer.jsp" %>
	</footer>
</div>
</form>
</body>
</html>