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
 *				: [202410041520][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/buy/history.jsp" %>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/front/header.jsp" %>
	<%@ include file="/include/front/top.jsp" %>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/layoutSubmain.css" />
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/table.css" />
	<link rel="stylesheet" href="/css/lnb.css">
	<style></style>
	<script>
	
	function goCancle(seq_buy_mst) {
		
		if (confirm("주문을 취소 또는 반품 하시겠습니까?")) {
			var frmMain = document.getElementById("frmMain");
			document.getElementById("seq_buy_mst").value = seq_buy_mst;
			frmMain.action="/front/buy/goCancle.web";
			frmMain.submit();
		}
	}
	
	function goConfirm(seq_buy_mst) {
		
		if (confirm("구매를 확정 하시겠습니까?")) {
			var frmMain = document.getElementById("frmMain");
			document.getElementById("seq_buy_mst").value = seq_buy_mst;
			frmMain.action="/front/buy/goConfirm.web";
			frmMain.submit();
		}
	}
	
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" id="seq_buy_mst" name="seq_buy_mst" />
<div class="container">
	<section class="content">
		<nav>
			<%@ include file="/include/front/lnbMyPage.jsp" %>
		</nav>
		<article class="txtCenter">
			<P style="width:900px;margin:0 auto;text-align:right;font-weight:bold;">총 구매 금액 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${total_price}" />원</p>
			<table class="headTop_01" style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 8%">주문번호</th>
					<th style="width: 20%">상품명</th>
					<th style="width: 10%">구매 가격</th>
					<th style="width: 8%">구매 수량</th>
					<th style="width: 10%">구매일</th>
					<th style="width: 8%">배송 상태</th>
				</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="6">구매 내역이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="list">
						<tr>
							<td>
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
								${list.buy_count}
							</td>
							<td>
								${list.dt_reg}
							</td>
							<td>
								<c:choose>
									<c:when test="${list.cd_state_delivery == 'C'}">주문확인중	<button type="button"	onclick="javascript:goCancle(${list.seq_buy_mst});">주문취소</button></c:when>
									<c:when test="${list.cd_state_delivery == 'P'}">배송준비중	<button type="button"	onclick="javascript:goCancle(${list.seq_buy_mst});">주문취소</button></c:when>
									<c:when test="${list.cd_state_delivery == 'D'}">배송중		<button type="button"	onclick="javascript:goCancle(${list.seq_buy_mst});">반품요청</button></c:when>
									<c:when test="${list.cd_state_delivery == 'Y'}">배송완료	
										<c:if test="${list.cd_state_buy == ''}">
											<button type="button"	onclick="javascript:goConfirm(${list.seq_buy_mst});">구매확정</button>
										</c:if>
										<c:if test="${list.cd_state_buy == 'Y'}">
											<span style="font-size: 13px; color:blue; bold"><br>구매확정완료</span>
										</c:if>
									</c:when>
									<c:when test="${list.cd_state_delivery == 'R'}">반품및취소	</c:when>
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
		<%@ include file="/include/front/footer.jsp" %>
	</footer>
</div>
</form>
</body>
</html>