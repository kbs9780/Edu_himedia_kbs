<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 himedia.co.kr에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 himedia.co.kr All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241014174700][kbs@happySteps.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page info="/WEB-INF/view/front/basket/index.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>장바구니</title>
	<link rel="stylesheet" type="text/css" href="/css/layoutMain.css" />
	<link rel="stylesheet" type="text/css" href="/css/table.css" />
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="https://standard.testpayup.co.kr/assets/js/payup_standard_dev-1.0.js"></script>
		<script>
	
		<c:if test="${empty sessionScope.SEQ_MBR}">
		var isLogin = false;
		</c:if>
		
		<c:if test="${not empty sessionScope.SEQ_MBR}">
		var isLogin = true;
		</c:if>
		
		<%
		// [2024-10-17][pluto@himedia.co.kr][INSERT: Payup 신규 연동 규격서를 기반으로 한 결제 연동 예제]
		%>
		
		// 인증 완료 시 콜백 함수(해당 함수명, 폼 아이디 등 절대 변경 금지)
		function payupPaymentSubmit(payForm) {
			var formData = $("#PayupPaymentStandardForm").serializeArray();
			
			var dataObject = {};
			$.each(formData, function(index, field) {
				dataObject[field.name] = field.value;
			});
			
			$.ajax({
				url: '/front/interface/payup/pay.json',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(dataObject),
				success: function(responseObject) {
					
					if (responseObject.responseCode != "0000") {
						alert("[" + responseObject.responseCode + "]" + responseObject.responseMsg);
					}
					else {
						alert(responseObject.responseMsg);
					}
					location.href="/front/index.web";
				},
				error: function(error) {
					alert("연동 에러");
				}
			});
		}
		
		function order(){
			
			if (!isLogin) {
				alert("로그인이 필요합니다!");
				return;
			}
			
			$.ajax({
				url: '/front/interface/payup/order.json',
				type: 'POST',
				dataType: "json",
				data: $("#frmMain").serialize(),
				success: function(responseObject) {
					
					if (responseObject.responseCode != "0000") {
						alert(responseObject.responseMsg + "[" + responseObject.responseCode + "]");
						location.href="/front/index.web";
					}
					else {
						var data = {
							merchantId: responseObject.merchantId,
							itemName: responseObject.itemName,
							amount: responseObject.amount,
							userName: responseObject.userName,
							orderNumber: responseObject.orderNumber,
							returnUrl: responseObject.returnUrl
						};
						// 표준결제창 SDK 실행
						goPayupPay(data);
					}
				},
				error: function(error) {
					alert("연동 에러");
				}
			});
		}
	

	function removeItem(seqBsk) {
			$.ajax({
				url: '/front/basket/removeItem.web', // 장바구니 아이템 삭제 URL
				type: 'POST',
				data: { seq_bsk: seqBsk },
				success: function(response) {
					alert('상품이 삭제되었습니다.');
					window.location.reload(); // 페이지를 새로고침하여 장바구니를 다시 로드
				},
				error: function(xhr, status, error) {
					alert('상품 삭제 중 오류가 발생했습니다.');
				}
			});
		}
	</script>
</head>
<body>

<div class="container">
	<header>
		<%@ include file="/include/front/header.jsp" %>
		<%@ include file="/include/front/top.jsp" %>
	</header>
	<section class="content" style="width: 900px; margin-left: auto; margin-right: auto;">
		<nav></nav>
		<form id="frmMain" method="POST" >
			<c:forEach var="item" items="${basketList}" varStatus="status">
				<input type="hidden" name="buyList[${status.index}].price" value="${item.price}" />
				<input type="hidden" name="buyList[${status.index}].count" value="${item.count}" />
				<input type="hidden" name="buyList[${status.index}].seq_sle" value="${item.seq_sle}" />
				<input type="hidden" name="buyList[${status.index}].seq_prd" value="${item.seq_prd}" />
				<input type="hidden" name="buyList[${status.index}].sle_nm" value="${item.sle_nm}" />
			</c:forEach>
			<c:if test="${empty sessionScope.SEQ_MBR}">
				<script type="text/javascript">
					window.location.href = '/front/login/loginForm.web'; // 로그인 페이지로 이동
				</script>
				<p style="text-align:center">회원 정보가 없습니다. 로그인을 해주세요.</p>
			</c:if>
			
			<c:if test="${not empty sessionScope.SEQ_MBR}">
				<c:if test="${not empty basketList}">
					<table id="productBasket" class="headTop_01" style="width: 900px; margin-left: auto; margin-right: auto;">
						<tr>
							<th>이미지</th>
							<th>상품명</th>
							<th>수량</th>
							<th>1개당 가격</th>
							<th>삭제</th>
						</tr>
						<c:forEach var="item" items="${basketList}">
							<tr>
								<td><a href="/front/buy/writeForm.web?seq_sle=${item.seq_sle}"><img src="${item.img}" alt="상품 이미지" height="100px"/></a></td>
								<td><a href="/front/buy/writeForm.web?seq_sle=${item.seq_sle}">${item.sle_nm}</a></td>
								<td>${item.count}</td>
								<td>${item.price} 원</td>
								<td><a href="javascript:void(0);" onclick="removeItem(${item.seq_bsk})">삭제</a></td>
							</tr>
						</c:forEach>
					</table>
					<table id="productBasket" class="headTop_01" style="width: 900px; margin-left: auto; margin-right: auto;">
						<tr>
							<th style="padding: 8px; border-bottom: 1px solid #ddd;">배송정보</th>
							<th style="padding: 8px; border-bottom: 1px solid #ddd;">내용</th>
						</tr>
						<tr>
							<td style="padding: 8px;">이름</td>
							<td style="padding: 8px;">${member.mbr_nm}</td>
						</tr>
						<tr>
							<td style="padding: 8px;">전화번호</td>
							<td style="padding: 8px;">${member.phone}</td>
						</tr>
						<tr>
							<td style="padding: 8px;">주소</td>
							<td style="padding: 8px;">${member.post} &nbsp; ${member.addr1} &nbsp; ${member.addr2}</td>
						</tr>
						<tr>
							<td style="padding: 8px; border-top: 1px solid #ddd;">총 결제 금액</td>
							<td style="padding: 8px; border-top: 1px solid #ddd;">${totalPrice} 원</td>
						</tr>
						<tr>
							<td colspan="2" style="padding: 8px; text-align: center;">
								<button type="button" onclick="order();" style="padding: 10px 20px; font-size: 16px;">결제 진행</button>
							</td>
						</tr>
					</table>
				</c:if>
				<c:if test="${empty basketList}">
					
					<p style="width: 900px; margin-left: auto; margin-right: auto; text-align:center;">장바구니가 비어 있습니다.</p>
				</c:if>
			</c:if>
		</form>
		<aside></aside>
	</section>
	<footer>
		<%@ include file="/include/front/footer.jsp" %>
	</footer>
</div>
</body>
</html>