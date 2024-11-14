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
 *				: [20241031175700][kbs@happySteps.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/buy/history.jsp" %>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<form id="frmMain" method="POST" action="/console/buy/history.web">
<input type="hidden" name="currentPage"	id="currentPage" value="${paging.currentPage}" />
<div class="table">
	<section class="right_col">
		<article class="x_panel">
			<div class="form-group pull-right">
				<select name="searchKey">
					<option value="seq_buy_mst"<c:if test="${paging.searchKey == 'seq_buy_mst'}"> selected</c:if>>구매번호</option>
					<option value="buy_price"<c:if test="${paging.searchKey == 'buy_price'}"> selected</c:if>>구매가격</option>
					<option value="buy_info"<c:if test="${paging.searchKey == 'buy_info'}"> selected</c:if>>구매정보</option>
				</select>
				<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}" /> <input type="submit" value="검색"/>
			</div>
			<div class="col-md-3 col-sm-3 col-xs-3">전체 ${paging.totalLine}개[${paging.currentPage}/${paging.totalPage} 페이지]</div>
			<table class="table table-striped" style="width: 100%; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 5%">	구매 번호</th>
					<th style="width: 20%">	구매 정보</th>
					<th style="width: 10%">	구매 가격</th>
					<th style="width: 8%">	구매 날짜</th>
					<th style="width: 10%">	배송 정보</th>
				</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="5">등록된 글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="list">
						<tr>
							<td style="text-align: center">
								${list.seq_buy_mst}
							</td>
							<td style="text-align: left">
								<a href="#">
									${list.buy_info}
								</a>
							</td>
							<td>
							<fmt:formatNumber value="${list.buy_price}" type="number" />원
							</td>
							<td>
								${list.dt_reg}
							</td>
							<td>
								<c:choose>
									<c:when test="${list.cd_state_delivery == 'C'}">주문확인중</c:when>
									<c:when test="${list.cd_state_delivery == 'P'}">배송준비중</c:when>
									<c:when test="${list.cd_state_delivery == 'D'}">배송중</c:when>
									<c:when test="${list.cd_state_delivery == 'Y'}">배송완료</c:when>
									<c:when test="${list.cd_state_delivery == 'R'}">반품및취소</c:when>
									<c:otherwise>오류</c:otherwise>
								</c:choose>
							</td>
						</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
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