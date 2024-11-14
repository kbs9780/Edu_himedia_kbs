<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/pay/payment.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
	<title>결제 페이지</title>
	<link rel="stylesheet" type="text/css" href="/css/layoutMain.css" />
	<link rel="stylesheet" type="text/css" href="/css/table.css" />
	<script type="text/javascript">
		function paymentButtonClick() {
			var firstItem = "${basketList[0].sle_nm}"; // 첫 번째 상품명
			var itemCount = ${basketList.size()}; // 총 아이템 수
			var amount = "${totalPrice}"; // 총 결제 가격 
			var userName = "${member.mbr_nm}"; // 사용자의 이름 
			var orderNumber = "ORDER_" + Date.now(); // 고유한 주문 번호 생성 
			// 상품 이름 설정: "첫 번째 상품명 외 몇 개" 형식
			var itemName = itemCount > 1 ? firstItem + " 외 " + (itemCount - 1) + "건" : firstItem;
		}
	</script>
</head>
<body>
<div class="container">
	<header>
		<%@ include file="/include/front/top.jsp" %>
		<%@ include file="/include/front/header.jsp" %>
	</header>
<section>
	<c:if test="${not empty member}">
		<table id="productBasket" class="headTop_01" style="width: 900px; margin-left: auto; margin-right: auto;">
			<tr>
				<th>이미지</th>
				<th>상품명</th>
				<th>수량</th>
				<th>1개당 가격</th>
			</tr>
			<c:forEach var="item" items="${basketList}">
				<tr>
					<td><img src="${item.img}" alt="상품 이미지" height="100px"/></td>
					<td>${item.sle_nm}</td>
					<td>${item.count} 개</td>
					<td>${item.price} 원</td>
				</tr>
			</c:forEach>
		</table>
		<table id="mbrBasket" class="headTop_01" style="width: 900px; margin-left: auto; margin-right: auto;">
			<tr>
				<th style="padding: 8px; border-bottom: 1px solid #ddd;">항목</th>
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
				<td style="padding: 8px;">우편번호 (${member.post}) &nbsp; ${member.addr1} &nbsp; ${member.addr2}</td>
			</tr>
			<tr>
				<td style="padding: 8px;">주문정보</td>
				<td style="padding: 8px;">${itemName}</td>
			</tr>
			<tr>
				<td style="padding: 8px; border-top: 1px solid #ddd; ">총 결제 금액</td>
				<td style="padding: 8px; border-top: 1px solid #ddd; ">${totalPrice} 원</td>
			</tr>
			<tr>
				<td colspan="2" style="padding: 8px; text-align: center;">
					<button type="button" onclick="paymentButtonClick();" style="padding: 10px 20px; font-size: 16px;">결제 진행</button>
				</td>
			</tr>
		</table>
	</c:if>

	<c:if test="${empty member}">
		<p>회원 정보가 없습니다. 로그인을 해주세요.</p>
	</c:if>

	<aside></aside>
</section>
	<footer>
		<%@ include file="/include/front/footer.jsp" %>
	</footer>
</div>
</body>
</html>