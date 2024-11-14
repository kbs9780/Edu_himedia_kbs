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
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241106102900][kbs@happySteps.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/buy/writeForm.jsp" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"					uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="plutozoneUtilTag"	uri="/WEB-INF/tld/com.plutozone.util.tld" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/front/header.jsp" %>
	<%@ include file="/include/front/top.jsp" %>
	<style>
		ul {
			list-style-type: none;
			padding: 0;
			margin: 0;
		}
		body {
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 0;
		}
		
		.product-detail {
			display: flex;
			padding: 20px;
			margin-top: 50px;
			justify-content: space-between; /* 두 요소를 좌우에 배치 */
			align-items: flex-start; /* 세로 정렬을 상단에 맞춤 */
		}
		
		.product-image {
			flex: 1;
			padding-right: 20px;
		}
		
		.product-image img {
			max-width: 100%;
			height: auto;
		}
		
		.product-info {
			flex: 1;
		}
		
		.product-name {
			font-size: 24px;
			font-weight: bold;
			margin-bottom: 10px;
		}
		
		.product-description {
			font-size: 16px;
			margin-bottom: 20px;
		}
		
		.sale-price {
			font-size: 20px;
			color: #000000; /* 원하는 가격 색상 */
			font-weight: bold;
		}
		
		.button-container {
			margin-top: 20px;
			margin: 0 10px;
		}
		.item_goods_tab ul {
			list-style: none; /* 기본 리스트 스타일 제거 */
			padding: 0; /* 패딩 제거 */
			margin: 0; /* 마진 제거 */
			display: flex; /* 가로로 배치 */
		}
		
		.item_goods_tab li {
			margin-right: 20px; /* 항목 간 간격 조정 (필요에 따라 조정) */
		}
		
		.item_goods_tab li.on a {
			font-weight: bold; /* 선택된 항목 강조 (필요에 따라 조정) */
		}
		.product-image {
			flex: 1; /* 이미지 영역의 크기를 조정 (필요에 따라 변경 가능) */
		}
		
		.product-count input[type="number"],
		.product-count input[type="submit"] {
			font-size: 20px; /* 글씨 크기 조정 */
			border: 0;
			border-radius: 15px;
			outline: none;
			background-color: #F5F5F5;
			text-align: center; /* 텍스트를 중앙으로 정렬 */
		}
		.circular-button {
			width: 30px; /* 너비 설정 */
			height: 30px; /* 높이 설정 */
			border: 0;
			border-radius: 60%; /* 원형 만들기 */
			outline: none;
			background-color: #F5F5F5;
			line-height: 10px;
			cursor: pointer; /* 포인터 커서 추가 (선택 사항) */
		  }
		  .button list-button {
		  	width:100%; 
		  	padding:10px; 
		  	background-color:#dead6f; 
		  	color:white; 
		  	border:none; 
		  	border-radius:5px; 
		  	cursor:pointer; 
		  	font-size:16px;
		  }
		  .tabcontent {
			display: none; /* 기본적으로 숨김 */
			border: 1px solid #ccc;
			padding: 10px;
			margin-top: 10px;
		}
		
		.tablinks {
			cursor: pointer;
		}
		
		.tablinks:hover {
			text-decoration: underline;
		}
		.reviews {
			font-size:16px;
		}
		#reviewContent {
		    width: 100%;           /* 전체 너비 */
		    height: 150px;         /* 높이를 크게 설정하여 댓글 창처럼 보이게 */
		    padding: 10px;         /* 텍스트 주변에 여유 공간을 줍니다 */
		    font-size: 16px;       /* 글씨 크기를 적당히 설정 */
		    border: 1px solid #ddd; /* 테두리를 가볍게 지정 */
		    border-radius: 5px;    /* 모서리를 둥글게 */
		    resize: vertical;      /* 사용자가 높이를 조정할 수 있게 설정 */
		    box-sizing: border-box; /* padding을 포함해 정확한 너비와 높이를 유지 */
		}
		#submitReviewButton {
		    background-color: #DEAD6F;  /* 버튼 배경색 */
		    color: white;               /* 텍스트 색상 */
		    padding: 10px 20px;         /* 패딩으로 버튼 크기를 키우기 */
		    font-size: 16px;            /* 폰트 크기 */
		    border: none;               /* 테두리 제거 */
		    border-radius: 5px;         /* 모서리를 둥글게 */
		    cursor: pointer;            /* 마우스 오버 시 커서가 포인터로 변경 */
		    transition: background-color 0.3s; /* 호버 효과에 부드러운 전환 추가 */
		}
		.reviews-table {
		    width: 100%;
		    border-collapse: collapse;
		    margin-top: 20px;
		}
		
		.reviews-table th, .reviews-table td {
		    border: 1px solid #ddd;
		    padding: 8px;
		    text-align: center;
		}
		
		.reviews-table th {
		    background-color: #f2f2f2;
		    font-weight: bold;
		}
		
		.reviews-table tr:nth-child(even) {
		    background-color: #f9f9f9;
		}
		
		.reviews-table tr:hover {
		    background-color: #f1f1f1;
		}
		/* 공통 버튼 스타일 */
	    .button {
	        padding: 10px 20px;
	        font-size: 16px;
	        border: none;
	        border-radius: 5px;
	        cursor: pointer;
	        background-color: #DEAD6F; /* 버튼 기본 색상 */
	        color: white;
	    }
	
	    /* 목록 버튼 스타일 */
	    .list-button {
	        background-color: #DEAD6F; /* 동일한 색상 */
	    }
	
	    /* 구매 버튼 스타일 */
	    .buy-button {
	        background-color: #DEAD6F; /* 동일한 색상 */
	    }
	
	    /* 장바구니 버튼 스타일 */
	    .cart-button {
	        background-color: #DEAD6F; /* 동일한 색상 */
	    }
	
	    /* 버튼 컨테이너 스타일 */
	    .button-container {
	        text-align: center;
	        padding-top: 30px;
	        padding-bottom: 60px;
	    }
	</style>
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
	// [2024-11-06][kbs@happySteps.com][INSERT: Payup 신규 연동 규격서를 기반으로 한 결제 연동 예제]
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

	function writeProc() {
		
		if (!isLogin) {
			alert("로그인이 필요합니다!");
			return;
		}
		
		var frmMain = document.getElementById("frmMain");
		frmMain.action = "/front/buy/writeProc.web";
		frmMain.submit();
	}

	
	function goList(value) {
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action = "/front/sale/shop/list.web";
		frmMain.submit();
	}
	
	
	function addToCart(seqSle, seqPrd, sleNm, price, img) {
		
		const count = parseInt(document.getElementById("count").value);
		
		const data = {
			seq_sle: seqSle,
			seq_prd: seqPrd, 
			sle_nm: sleNm,
			price: price,
			count: count, 
			img: img
		};

		$.ajax({
			url: '/front/basket/addItem.web', // 장바구니 추가 요청을 처리할 URL
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(data),
			success: function(response) {
				if (confirm('상품이 장바구니에 추가되었습니다. 장바구니 페이지로 이동할까요?')) {
					window.location.href ='/front/basket/index.web'; // 장바구니 페이지로 이동
				}
			},
			error: function(xhr, status, error) {
				alert('장바구니 추가 중 오류가 발생했습니다.');
			}
		});
	}
	
	function changeQuantity(delta) {
		var countInput = document.getElementById("count");
		var currentValue = parseInt(countInput.value) || 0; // 현재 수량 가져오기
		var newValue = currentValue + delta; // 새로운 수량 계산하기
		if (newValue >= 1) { // 최소 수량 제한
			countInput.value = newValue; // 새로운 수량 설정
		}
	}
	function validateInput(input) {
		// 숫자가 아닌 문자 제거
		input.value = input.value.replace(/[^0-9]/g, '');

		// 입력값이 1보다 작으면 1로 설정
		if (input.value === '' || parseInt(input.value) < 1) {
			input.value = '1';
		}
	}
	function openTab(evt, tabName) {
		// 모든 탭 내용을 숨김
		const tabcontents = document.querySelectorAll('.tabcontent');
		tabcontents.forEach(tab => {
			tab.style.display = "none";
		});

		// 클릭한 탭 버튼 활성화
		const tablinks = document.querySelectorAll('.tablinks');
		tablinks.forEach(tab => {
			tab.classList.remove('active');
		});

		// 클릭한 탭 내용 표시 및 버튼 활성화
		document.getElementById(tabName).style.display = "block";
		evt.currentTarget.classList.add('active');
	}

	// 기본적으로 첫 번째 탭 열기
	document.addEventListener('DOMContentLoaded', () => {
		document.querySelector('.tablinks').click(); // 첫 번째 탭 클릭
	});
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" name="buyList[0].price" 			value="${saleDto.price_sale}" />
<input type="hidden" name="buyList[0].seq_sle" 			value="${saleDto.seq_sle}" />
<input type="hidden" name="buyList[0].seq_prd" 			value="${saleDto.seq_prd}" />
<input type="hidden" name="buyList[0].sle_nm" 			value="${saleDto.sle_nm}" />
<input type="hidden" name="cd_ctg_pet" 					value="${saleDto.cd_ctg_pet}" />
<div class="container">
	<div style="text-align: center;">
	<%@ include file="/include/front/gnb_shopping.jsp" %>
	</div>
	<section class="content">
		<article class="txtCenter">
			<div class="product-detail" style="display: flex; justify-content: center; align-items: top; margin: 30px;">
				<div class="product-image">
					<img src="${saleDto.img}" class="img-fluid rounded-4" />
				</div>
				<div class="product-biginfo" style="flex: 1; text-align: left; margin-left: 40px">
					<div class="product-info">
						<h1 class="product-name">${saleDto.sle_nm}</h1>
						<p class="product-description">${saleDto.desces}</p>
						<p class="sale-price">할인가: <fmt:formatNumber value="${saleDto.price_sale}" pattern="#,###" />원</p>
					</div>
					<div class="rating_star">
						<span class="rating secondary-font">
							⭐️
							⭐️
							⭐️
							⭐️
							⭐️
							5.0
						</span>
						<a href="#">
						<span class="reviews">상품후기</span>
						</a>
					</div>
					<div class="quantity-container" style="margin: 55px; margin-left: 0px ">
						<button type="button" onclick="changeQuantity(-1)" class="circular-button">-</button>
						<input type="text" id="count" name="buyList[0].count" value="1" style="text-align: center; width:60px; " oninput="validateInput(this)">
						<button type="button" onclick="changeQuantity(1)" class="circular-button">+</button>
					</div>
				</div>
			</div>
			<div class="button-container" style="text-align:center; padding-top:30px; padding-bottom:60px">
				<button class="button list-button"	type="button"	onclick="javascript:goList(${saleDto.cd_ctg_pet});">목록</button>
				<button class="button buy-button"	type="button"	onclick="javascript:order();">구매</button>
				<button class="button cart-button"	type="button"	onclick="javascript:addToCart(${saleDto.seq_sle}, ${saleDto.seq_prd}, '${saleDto.sle_nm}', ${saleDto.price_sale}, '${saleDto.img}');">장바구니</button>
			</div>
			<div class="item_goods_tab">
				<ul style="list-style: none; padding: 0; margin: 0; display: flex; justify-content: center;">
					<li style="margin-right: 20px;" class="tablinks" onclick="openTab(event, 'details')">
						상품상세정보
					</li>
					<li style="margin-right: 20px;" class="tablinks" onclick="openTab(event, 'delivery')">
						배송안내
					</li>
					<li style="margin-right: 20px;" class="tablinks" onclick="openTab(event, 'returns')">
						교환 및 반품안내
					</li>
					<li style="margin-right: 20px;" class="tablinks" onclick="openTab(event, 'reviews')">
						상품후기 <strong>(3)</strong>
					</li>
					<li style="margin-right: 20px;" class="tablinks" onclick="openTab(event, 'inquiries')">
						상품문의 <strong>(${paging.totalLine})</strong>
					</li>
				</ul>
			</div>
			<div id="details" class="tabcontent" style="text-align: center;">
				<img src="${saleDto.desces_img}" style="display: inline-block; width:100%; margin: 0 auto;" />
			</div>
			<div id="delivery" class="tabcontent">
			    <h3 style="color: #333; font-weight: bold; margin-bottom: 15px;">배송안내</h3>
			    <p style="line-height: 1.6;">
			        <span style="font-weight: bold; color: #007acc;">배송비</span> : 기본배송료는 <strong>3,000원</strong> 입니다. (도서, 산간, 오지 일부지역은 추가 배송비가 발생할 수 있습니다)  
			        <br><br>
			        <strong>40,000원</strong> 이상 구매 시 무료배송입니다.
			        <br><br>
			        일부 부피가 큰 제품의 경우 제품당 <strong>5,000원</strong>의 추가 배송비가 부과됩니다.
			        <br><br>
			        <span style="font-weight: bold; color: #007acc;">평균 배송일</span> : 본 상품의 평균 배송일은 <strong>2~3일</strong>입니다. <br>
			        (입금 확인 후) 설치 상품의 경우 다소 늦어질 수 있습니다.
			        <br><br>
			        <small style="color: #666;">[배송예정일은 주문 시점에 따라 유동성이 있을 수 있으며, 평균 배송일과 차이가 발생할 수 있습니다.]</small>
			        <br><br>
			        
			        <span style="font-weight: bold; color: #007acc;">배송 가능일</span> : 본 상품의 배송 가능일은 <strong>2~3일</strong> 입니다.<br>
			        배송 가능일은 고객님께 상품 배송이 가능한 기간을 의미합니다. <br>
			        (단, 연휴 및 공휴일은 기간 계산 시 제외되며, 현금 주문일 경우 입금일 기준입니다.)
			    </p>
			</div>
		
			<div id="returns" class="tabcontent">
			    <h3 style="color: #333; font-weight: bold; margin-bottom: 15px;">교환 및 반품안내</h3>
			    <p style="line-height: 1.6">
			        <span style="font-weight: bold; color: #007acc;">교환 및 반품 안내</span>
			        <ul style="padding-left: 20px;">
			            <li>상품 택(tag) 제거 또는 개봉으로 상품 가치가 훼손된 경우, <strong>수령 후 7일 이내</strong>라도 교환 및 반품이 불가능합니다.</li><br>
			            <li>저단가 상품 및 일부 특가 상품은 고객 변심에 의한 교환/반품 시 배송비를 고객님께서 부담하셔야 합니다. (단, 제품의 하자 또는 배송 오류는 제외)</li><br>
			            <li>일부 상품의 가격은 신모델 출시 또는 제조사의 사정으로 변동될 수 있습니다.</li><br/>
			            <li>신발의 경우 실외 착화나 사용 흔적이 있을 시 교환/반품 기간 내라도 교환 및 반품이 불가능합니다.</li><br>
			            <li>수제화와 같은 개별 주문 제작 상품(굽 높이, 발볼, 사이즈 변경 포함)은 제작 완료 후 교환 및 반품이 불가능합니다.</li><br>
			            <li>수입/명품 제품의 경우, 제품 및 박스 훼손 시 교환 및 반품이 불가능하오니 주의 바랍니다.</li><br>
			            <li>특가 상품의 경우, 단순 변심에 의한 교환/반품이 제한될 수 있으므로 각 상품의 상세정보를 참조하십시오.</li>
			        </ul>
			        <br>
			        
			        <span style="font-weight: bold; color: #007acc;">환불 안내</span><br>
			        - 상품 청약 철회 가능 기간은 <strong>상품 수령일로부터 7일 이내</strong>입니다.
			    </p>
			</div>
		
			<div id="reviews" class="tabcontent">
				<h3 style="color: #333; font-weight: bold; margin-bottom: 15px;">상품후기</h3>
				<div class="rating_star">					
					<span class="rating secondary-font">
						⭐️
						⭐️
						⭐️
						⭐️
						⭐️
						5.0
					</span>
				</div>
				<div id="review-section" style="margin-top: 10px">
				    <form id="reviewForm">
				        <textarea id="reviewContent" placeholder="상품 후기를 작성해보세요!"></textarea>
				        <button type="button" onclick="submitReview()" id="submitReviewButton">상품 후기 작성</button>
				    </form>
				</div>
				<div id="reviewsList">
				    <table class="reviews-table">
				        <thead>
				            <tr>
				                <th>작성자</th>
				                <th>내용</th>
				                <th>작성일</th>
				            </tr>
				        </thead>
				        <tbody>
				            <tr>
				                <td>***023</td>
				                <td>이 제품 정말 좋아요! 강력 추천합니다.</td>
				                <td>2024-10-01</td>
				            </tr>
				            <tr>
				                <td>***dkf</td>
				                <td>품질이 매우 만족스럽고 배송도 빨라서 좋았습니다.</td>
				                <td>2024-10-02</td>
				            </tr>
				            <tr>
				                <td>***f11</td>
				                <td>가성비 최고! 꼭 구매하세요.</td>
				                <td>2024-10-03</td>
				            </tr>
				        </tbody>
				    </table>
				</div>
			</div>
		
			<div id="inquiries" class="tabcontent" style="margin-left: auto; margin-right: auto">
				<h3 style="color: #333; font-weight: bold; margin-bottom: 15px;">상품문의</h3>
				<a href="/front/center/board/list.web?cd_bbs_type=3" style="color: #DEAD6F; font-weight: bold; text-decoration: none;">상품문의하기></a>
				<br/>
				<div class="brdSearchArea" >
					<select name="searchKey">
						<option value="title"<c:if test="${paging.searchKey == 'title'}"> selected</c:if>>제목</option>
						<option value="contents"<c:if test="${paging.searchKey == 'contents'}"> selected</c:if>>내용</option>
						<option value="title+contents"<c:if test="${paging.searchKey == 'title+contents'}"> selected</c:if>>제목 또는 내용</option>
					</select>
					<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}" /> <input type="submit" value="검색"/>
				</div>
				<br/>
					<table style="width: 100%; margin-left: auto; margin-right: auto">
						<c:choose>
							<c:when test="${empty list}">
								<tr>
									<td style="text-align: center;" colspan="2">등록된 글이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:set var="inquiryCount" value="${paging.totalLine}" />
								<c:forEach items="${list}" var="list">
								<tr style="border-bottom: 1px solid #ccc;">
									<td style="text-align: left; padding: 15px;">
										<a href="javascript:goView(${list.seq_bbs});">
											<c:if test="${list.seq_reply == 0}">[미답변] </c:if>
											<c:if test="${list.seq_reply > 0}">[답변 완료] </c:if>
											${list.title}
										</a>
									</td>
									<td>
										${list.dt_reg}
									</td>
								</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					
				<br/>
				<div class="center-container"  style= "display: flex; justify-content: center;">
					<plutozoneUtilTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPage" />
				</div>
				<br/>
			</div>
			
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