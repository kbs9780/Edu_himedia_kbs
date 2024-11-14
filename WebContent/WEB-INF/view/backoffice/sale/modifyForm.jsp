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
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
<input type="hidden" id="seq_sle"	name="seq_sle"	value="${saleDto.seq_sle}"/>
	<%@ include file="/include/bfc/navi.jsp" %>
		<div class="right_col" role="main">
		<!-- top tiles -->
		<article class="txtCenter">
			<table style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 150px;">판매명</th>
					<td>
						<input style="width: 80%;" type="text" name="sle_nm" id="sle_nm" value="${saleDto.sle_nm}" required/>
					</td>
				</tr>
				<tr>
					<th>카테고리(*)</th>
					<td>
						<div style="display: flex; align-items: center; gap: 10px;">
							<select id="speciesSelect" name="species" required onchange="updatePetItems()" required>
								<option value="01"<c:if test="${saleDto.species == 01}"> selected</c:if>>강아지</option>
								<option value="02"<c:if test="${saleDto.species == 02}"> selected</c:if>>고양이</option>
								<option value="03"<c:if test="${saleDto.species == 03}"> selected</c:if>>햄스터</option>
								<option value="04"<c:if test="${saleDto.species == 04}"> selected</c:if>>파충류</option>
								<option value="05"<c:if test="${saleDto.species == 05}"> selected</c:if>>물고기</option>
							</select>
							<select id="petItemsSelect" name="pet_items" required>
								<!-- 초기 pet_items 옵션 목록은 JavaScript에서 동적으로 설정됨 -->
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th>설명</th>
					<td>
						<textarea required name="desces" id="desces" style="width: 650px;height:200px;" maxlength="1000">${saleDto.desces}</textarea>
					</td>
				</tr>
				<tr>
					<th>판매 가격</th>
					<td>
						<input type="text" id="price_sale" name="price_sale" value="<fmt:formatNumber value="${saleDto.price_sale}" type="number" />" style="width:100px; text-align:right" onkeyup="commaValue(this);" required/>원
					</td>
				</tr>
				<tr>
					<th>판매 상태</th>
					<td>
						<select id="cd_state_sale" name="cd_state_sale" required>
							<option value="1"<c:if test="${saleDto.cd_state_sale == '1'}"> selected</c:if>>판매중</option>
							<option value="2"<c:if test="${saleDto.cd_state_sale == '2'}"> selected</c:if>>판매 중지</option>
							<option value="3"<c:if test="${saleDto.cd_state_sale == '3'}"> selected</c:if>>반려</option>
							<option value="9"<c:if test="${saleDto.cd_state_sale == '9'}"> selected</c:if>>품절</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>첨부 파일</th>
					<td>
						<input type="file" id="fileOrig" name="fileOrig" />
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
						<input type="button" value="등록" style="width:100px" onclick="javascript:modifyProc();" />
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
			// HTML Editor 초기화
			tinymce.init({ selector: 'textarea' });
		};

		const petItems = {
			"01": [
				{ value: "11", text: "사료" },
				{ value: "12", text: "간식" },
				{ value: "13", text: "하우스" },
				{ value: "14", text: "기타" }
			],
			"02": [
				{ value: "21", text: "사료" },
				{ value: "22", text: "간식" },
				{ value: "23", text: "하우스" },
				{ value: "24", text: "기타" }
			],
			"03": [
				{ value: "31", text: "사료" },
				{ value: "32", text: "간식" },
				{ value: "33", text: "하우스" },
				{ value: "34", text: "기타" }
			],
			"04": [
				{ value: "41", text: "사료" },
				{ value: "42", text: "간식" },
				{ value: "43", text: "하우스" },
				{ value: "44", text: "기타" }
			],
			"05": [
				{ value: "51", text: "사료" },
				{ value: "52", text: "간식" },
				{ value: "53", text: "하우스" },
				{ value: "54", text: "기타" }
			]
		};

		function updatePetItems() {
			const species = document.getElementById("speciesSelect").value;
			const petItemsSelect = document.getElementById("petItemsSelect");

			// 기존 옵션을 제거
			petItemsSelect.innerHTML = "";

			// species에 맞는 pet_items 옵션 추가
			if (petItems[species]) {
				petItems[species].forEach(item => {
					const option = document.createElement("option");
					option.value = item.value;
					option.text = item.text;
					petItemsSelect.appendChild(option);
				});
			}
		}

		function commaValue(input) {
			// 입력된 값에서 숫자만 남기고 포맷팅
			let value = input.value.replace(/,/g, '');  // 기존 쉼표 제거
			value = Number(value).toLocaleString();	 // 숫자에 콤마 추가
			input.value = value;						// 변환된 값 다시 입력 필드에 설정
		}

		function modifyProc() {
			var frmMain = document.getElementById("frmMain");

			// 필수 입력 필드 검증
			if (document.getElementById("sle_nm").value === ""
				|| document.getElementById("price_sale").value === ""
				|| document.getElementById("speciesSelect").value === "0"
				|| document.getElementById("petItemsSelect").value === "0"
				|| document.getElementById("dt_sale_start").value === ""
				|| document.getElementById("dt_sale_end").value === ""
				|| document.getElementById("cd_state_sale").value === "0"
				|| tinymce.activeEditor.getContent() === "") {
				alert("필수 항목을 입력하세요!");
				return;
			}

			// 가격 필드의 쉼표 제거
			document.getElementById("price_sale").value = document.getElementById("price_sale").value.replace(/,/g, "");

			// 폼 제출
			frmMain.action = "/console/sale/modifyProc.web";
			frmMain.submit();
		}

		// 페이지 로드 후 기본 옵션 설정
		document.addEventListener("DOMContentLoaded", () => {
			updatePetItems();  // 선택된 카테고리에 따라 pet_items 옵션을 업데이트
			document.getElementById("petItemsSelect").value = "${saleDto.pet_items}";  // 저장된 pet_items 값을 설정
		});
	</script>
</form>
</body>
</html>