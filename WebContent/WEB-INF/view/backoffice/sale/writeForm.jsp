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
 * Program		: kr.co.himedia.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240702172500][pluto@himedia.co.kr][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/sale/writeForm.jsp" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="plutozoneUtilTag"	uri="/WEB-INF/tld/com.plutozone.util.tld" %>
<!DOCTYPE html>
<html lang="kr">
<head>
	<%@ include file="/include/bfc/header.jsp" %>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script type="text/javascript" src="/js/package/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="/js/package/tinymce.js"></script>
<style>
	.styled-table {
	width: 900px;
	margin: 20px auto;
	border-collapse: collapse;
	border: 1px solid #ddd; /* 테이블 외부 경계 */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	}
	
	.styled-table thead {
		background-color: #f2f2f2; /* 헤더 배경 색상 */
	}
	
	.styled-table th,
	.styled-table td {
		border: 1px solid #ddd; /* 셀 경계 */
		padding: 12px; /* 셀 안쪽 여백 */
		text-align: left; /* 텍스트 왼쪽 정렬 */
	}
	
	.styled-table tbody tr:hover {
		background-color: #f1f1f1; /* 마우스 오버 시 행 배경 색상 */
	}
	
	.no-data {
		text-align: center; /* 중앙 정렬 */
		font-weight: bold; /* 굵게 표시 */
		color: #888; /* 색상 변경 */
	}
	table {
		width: 900px;
		margin: 20px auto;
		border-collapse: collapse;
		font-family: Arial, sans-serif;
	}

	/* 테이블 제목 셀 스타일 */
	th {
		width: 150px;
		padding: 10px;
		text-align: left;
		background-color: #f2f2f2;
		border-bottom: 2px solid #ddd;
	}

	/* 일반 데이터 셀 스타일 */
	td {
		padding: 10px;
		border-bottom: 1px solid #ddd;
	}

	/* 각 입력 필드 스타일 */
	input[type="text"], select {
		width: 95%;
		padding: 8px;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-sizing: border-box;
		font-size: 14px;
	}
	/* 각 입력 필드 스타일 */
	input[type="date"], select {
		width: 20%;
		padding: 8px;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-sizing: border-box;
		font-size: 14px;
	}

	/* 필수 입력항목 스타일 */
	input[required] {
		border-color: #0073e6;
	}
	select[required] {
		border-color: #0073e6;
	}
	/* 상품 항목 선택 컨테이너 */
	#pet_items {
		display: flex;
		align-items: center;
		gap: 10px;
		width: 100%;
	}

	/* 버튼 스타일 */
	input[type="button"] {
		width: 100px;
		padding: 10px;
		font-weight: bold;
		color: white;
		background-color: #3B5368;
		border: none;
		border-radius: 4px;
		cursor: pointer;
	}

	/* 버튼 hover 효과 */
	input[type="button"]:hover {
		background-color: #005bb5;
	}

	/* 마지막 줄 중앙 정렬 */
	tr:last-child td {
		text-align: center;
		padding-top: 10px;
		padding-bottom: 10px;
	}
</style>
</head>
<body class="nav-md">
<form id="frmMain" method="POST" enctype="multipart/form-data">
	<input type="hidden" id="seq_sle" name="seq_sle" value="${saleDto.seq_sle}"/>
	<input type="hidden" id="pet_items" name="pet_items" value="${saleDto.pet_items}" />
	<input type="hidden" id="species" name="species" value="${saleDto.species}" />
	<input type="hidden" id="price_cost" name="price_cost" value="${saleDto.price_cost}" />
	
	<%@ include file="/include/bfc/navi.jsp" %>
	<div class="right_col" role="main">
		<!-- top tiles -->
		<article class="txtCenter">
			<table style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 150px;">상품명</th>
					<td>
					<c:choose>
						<c:when test="${empty listPrd}">
							판매 가능한 상품이 없습니다.
						</c:when>
						<c:otherwise>
							<select style="width: 80%" id="seq_prd" name="seq_prd" onchange="updatePetItems(this)">
								<option value="">상품 선택</option>
								<c:forEach items="${listPrd}" var="product">
									<option value="${product.seq_prd}" data-species="${product.species}" data-pet-items="${product.pet_items}" data-price-cost="${product.price_cost}">
										${product.prd_nm}
									</option>
								</c:forEach>
							</select>
						</c:otherwise>
					</c:choose>
				</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<div style="display: flex; align-items: center; gap: 10px;">
							<span id="selectedSpecies">종류: <span id="speciesValue"></span></span>
							<span id="selectedPetItems">아이템: <span id="petItemsValue"></span></span>
						</div>
					</td>
				</tr>
				<tr>
					<th style="width: 150px;">판매명</th>
					<td>
						<input style="width: 80%" type="text" name="sle_nm" id="sle_nm" required/>
					</td>
				</tr>
				<tr>
					<th>설명</th>
					<td>
						<textarea name="desces" id="desces" style="width: 650px;height:200px;" maxlength="1000" required></textarea>
					</td>
				</tr>
				<tr>
					<th>판매 가격</th>
					<td>
						<input type="text" id="price_sale" name="price_sale" style="width:100px; text-align:right" required/>원 // 
						<span id="selectedPrice">원가: <span id="priceCostValue"></span> </span>
						// 권장 판매가격 : <span id="recommendedPrice"></span>
					</td>
				</tr>
				<tr>
					<th>판매 상태</th>
					<td>
						<select name="cd_state_sale" id="cd_state_sale" style="width:100px;" required>
							<option value="1">판매중</option>
							<option value="2">판매 중지</option>
							<option value="9">품절</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>이미지(대표)</th>
					<td>
						<input type="file" id="files[0]" name="files[0]"/>
					</td>
				</tr>
				<tr>
					<th>판매 시작일</th>
					<td>
						<input type="date" id="dt_sale_start" name="dt_sale_start" value="${saleDto.dt_sale_start}" required/>
					</td>
				</tr>
				<tr>
					<th>판매 종료일</th>
					<td>
						<input type="date" id="dt_sale_end" name="dt_sale_end" value="${saleDto.dt_sale_end}" required/>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;padding-top: 10px;padding-bottom: 10px">
						<input type="button" value="등록" style="width:100px" onclick="javascript:writeProc();"/>
						<input type="button" value="목록" style="width:100px" onclick="javascript:location.href='/console/sale/list.web';"/>
					</td>
				</tr>
			</table>
		</article>
		<!-- /top tiles -->
	</div>	 

	<footer>
		<%@ include file="/include/bfc/footer.jsp" %>
	</footer>
	<!-- /footer content -->
<script>
	window.onload = function () {
		// HTML Editor
		tinymce.init({selector:'textarea'});
	}
	

	function updatePetItems(selectElement) {
		const selectedOption = selectElement.options[selectElement.selectedIndex];
		
		if (selectedOption.value === "") {
			document.getElementById("species").value = ""; 
			document.getElementById("pet_items").value = ""; 
			document.getElementById("price_cost").value = ""; 

			document.getElementById('speciesValue').innerText = "종류 없음";
			document.getElementById('petItemsValue').innerText = "아이템 없음";
			document.getElementById('priceCostValue').innerText = "원가 없음";
			document.getElementById('recommendedPrice').innerText = "권장 판매가격 없음";
			return;
		}
		
		const species = selectedOption.getAttribute('data-species');
		const petItems = selectedOption.getAttribute('data-pet-items');
		const priceCost = parseFloat(selectedOption.getAttribute('data-price-cost'));

		document.getElementById("species").value = species; 
		document.getElementById("pet_items").value = petItems; 
		document.getElementById("price_cost").value = priceCost;

		document.getElementById('speciesValue').innerText = species || "종류 없음";
		document.getElementById('petItemsValue').innerText = petItems || "아이템 없음";
		document.getElementById('priceCostValue').innerText = priceCost || "원가 없음";

		// 권장 판매가격을 계산하여 표시
		const recommendedPrice = priceCost ? (priceCost * 1.5) : "권장 판매가격 없음";
		document.getElementById('recommendedPrice').innerText = recommendedPrice;
	}

	function writeProc() {
		var frmMain = document.getElementById("frmMain");

		if (document.getElementById("sle_nm").value == ""
				|| document.getElementById("price_sale").value == ""
				|| document.getElementById("species").value == ""
				|| document.getElementById("pet_items").value == ""
				|| document.getElementById("dt_sale_start").value == ""
				|| document.getElementById("dt_sale_end").value == ""
				|| document.getElementById("cd_state_sale").value == "0"
				|| document.getElementById("files[0]").value == ""
				|| tinymce.activeEditor.getContent() == "") {
			alert("비어있는 항목을 체크하세요!");
			return;
		}
		document.getElementById("price_sale").value = document.getElementById("price_sale").value.replaceAll(",", "");

		frmMain.action="/console/sale/writeProc.web";
		frmMain.submit();
	}
</script>
</form>
</body>
</html>