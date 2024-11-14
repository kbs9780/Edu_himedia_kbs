<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 com.happySteps에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 com.happySteps All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: history.jsp
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [202411121730][kbs@happySteps.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/donation/index.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/bfc/header.jsp" %>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/layoutSubmain.css" />
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/table.css" />
	<link rel="stylesheet" href="/css/lnb.css">
	<style></style>
	<script></script>
</head>
<body class="nav-md">
<%@ include file="/include/bfc/navi.jsp" %>
<div class="table">
	<section class="right_col">
		<article class="x_panel">
			<table class="table table-striped" style="width: 100%; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 5%">후원 번호</th>
					<th style="width: 10%">후원자 아이디</th>
					<th style="width: 10%">후원자 이름</th>
					<th style="width: 10%">후원 금액</th>
					<th style="width: 10%">후원 목적</th>
					<th style="width: 15%">영수증 번호</th>
				</tr>
				<tr><td>1</td><td>cjftn131</td><td>김철수</td><td>7,000원</td><td>일반후원</td><td>202401010001</td></tr>
				<tr><td>2</td><td>dudgml991</td><td>이영희</td><td>12,000원</td><td>보호소후원</td><td>202401010002</td></tr>
				<tr><td>3</td><td>93wlgnsdl</td><td>박지훈</td><td>5,000원</td><td>일반후원</td><td>202402100001</td></tr>
				<tr><td>4</td><td>00alstn00</td><td>최민수</td><td>10,000원</td><td>보호소후원</td><td>202402310001</td></tr>
				<tr><td>5</td><td>tnqlsdlekd</td><td>정수빈</td><td>8,000원</td><td>일반후원</td><td>202403010001</td></tr>
				<tr><td>6</td><td>1alwjd1</td><td>장미정</td><td>15,000원</td><td>보호소후원</td><td>202403010002</td></tr>
				<tr><td>7</td><td>dkssudgktpdy</td><td>김지수</td><td>6,000원</td><td>일반후원</td><td>202403010003</td></tr>
				<tr><td>8</td><td>tpgnslsep</td><td>오세훈</td><td>9,000원</td><td>보호소후원</td><td>202403010004</td></tr>
				<tr><td>9</td><td>12alsdk12</td><td>신민아</td><td>13,000원</td><td>일반후원</td><td>202403010005</td></tr>
				<tr><td>10</td><td>89wlals</td><td>박지민</td><td>11,000원</td><td>보호소후원</td><td>202403010006</td></tr>
				<tr><td>11</td><td>sksmswotjr1</td><td>유재석</td><td>14,000원</td><td>일반후원</td><td>202404010001</td></tr>
				<tr><td>12</td><td>guswjddl</td><td>이정현</td><td>7,000원</td><td>보호소후원</td><td>202404090001</td></tr>
				<tr><td>13</td><td>dntjd9rmfnq</td><td>정우성</td><td>9,000원</td><td>일반후원</td><td>202404090002</td></tr>
				<tr><td>14</td><td>tn12wl12</td><td>배수지</td><td>6,000원</td><td>보호소후원</td><td>202407010001</td></tr>
				<tr><td>15</td><td>qksrkdnj5535</td><td>김혜수</td><td>10,000원</td><td>일반후원</td><td>202407210001</td></tr>
			</table>
		</article>
		<aside></aside>
	</section>
</div>
<footer>
	<%@ include file="/include/bfc/footer.jsp" %>
</footer>
</body>
</html>