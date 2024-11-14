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
<%@ page info="/WEB-INF/view/backoffice/product/writeForm.jsp" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="plutozoneUtilTag"	uri="/WEB-INF/tld/com.plutozone.util.tld" %>
<!DOCTYPE html>
<html lang="kr">
<head>
	<%@ include file="/include/bfc/header.jsp" %>
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
<form id="frmMain" method="POST">
<input type="hidden" id="seq_prd"	name="seq_prd" 		value="${productDto.seq_prd}"/>
<input type="hidden" id="pet_items"	name="pet_items" 		value="${productDto.pet_items}"/>
	<%@ include file="/include/bfc/navi.jsp" %>
		<div class="right_col" role="main">
		<!-- top tiles -->
			 <article class="txtCenter">
			<table style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 150px;">상품명(*)</th>
					<td>
						<input type="text" id="prd_nm" name="prd_nm" style="width: 700px;" required />
					</td>
				</tr>
				<tr>
					<th>상품 상태(*)</th>
					<td>
						<select name="cd_state_prd" id="cd_state_prd">
							<option value="1">판매중</option>
							<option value="2">판매중지</option>
							<option value="3">반려</option>
							<option value="9">재고소진</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>카테고리(*)</th>
					<td>
						<div style="display: flex; align-items: center; gap: 10px;">
							<select id="species" name="species" required onchange="showPetItems(this.value)" required>
							    <option value="0">종류</option>
							    <option value="01">강아지</option>
							    <option value="02">고양이</option>
							    <option value="03">햄스터</option>
							    <option value="04">파충류</option>
							    <option value="05">물고기</option>
							</select>
							
							<div id="pet_items">
							    <select id="dog_items" name="pet_items" onchange="document.getElementById('pet_items').value = this.value;" required style="display:none">
								    <option value="11">사료</option>
								    <option value="12">간식</option>
								    <option value="13">하우스</option>
								    <option value="14">기타</option>
								</select>
							
								<select id="cat_items" name="pet_items" onchange="document.getElementById('pet_items').value = this.value;" required style="display:none">
								    <option value="21">사료</option>
								    <option value="22">간식</option>
								    <option value="23">하우스</option>
								    <option value="24">기타</option>
								</select>
							
								<select id="hamster_items" name="pet_items" onchange="document.getElementById('pet_items').value = this.value;" required style="display:none">
								    <option value="31">사료</option>
								    <option value="32">간식</option>
								    <option value="33">하우스</option>
								    <option value="34">기타</option>
								</select>
								
								<select id="reptile_items" name="pet_items" onchange="document.getElementById('pet_items').value = this.value;" required style="display:none">
								    <option value="41">사료</option>
								    <option value="42">간식</option>
								    <option value="43">하우스</option>
								    <option value="44">기타</option>
								</select>
								
								<select id="fish_items" name="pet_items" onchange="document.getElementById('pet_items').value = this.value;" required style="display:none">
								    <option value="51">사료</option>
								    <option value="52">간식</option>
								    <option value="53">하우스</option>
								    <option value="54">기타</option>
								</select>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>상품 원가(*)</th>
					<td><input type="text" name="price_cost" id="price_cost" maxlength="11" style="text-align:right;" required /> 원</td>
				</tr>
				<tr>
					<th>재고 수량(*)</th>
					<td><input type="text" name="count_stock" id="count_stock" style="text-align:right;" required /> 개</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;padding-top: 10px;padding-bottom: 10px">
						<input type="button" value="등록" style="width:100px" onclick="javascript:writeProc();" />
						 <input type="button" value="목록" style="width:100px" onclick="javascript:location.href='/console/product/list.web';" />
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
	
	function writeProc() {
		var frmMain = document.getElementById("frmMain");
		
		if (document.getElementById("prd_nm").value == ""
				|| document.getElementById("species").value == "0"
				|| document.getElementById("pet_items").value == "0"
				|| document.getElementById("price_cost").value == ""
				|| document.getElementById("count_stock").value == "") {
			alert("필수 항목을 입력하세요!");
			return;
		}
		if(document.getElementById("price_cost").value <= 0) {
			alert("원가를 0원 이상 입력하세요!")
			return;
		}
		if(document.getElementById("count_stock").value < 1) {
			alert("재고 수량을 1개 이상 입력하세요!")
			return;
		}
		
		frmMain.action="/console/product/writeProc.web";
		frmMain.submit();
	}
	
	function showPetItems(value) {
	    // 모든 아이템 셀렉트 박스를 숨깁니다.
	    document.getElementById('dog_items').style.display = 'none';
	    document.getElementById('cat_items').style.display = 'none';
	    document.getElementById('hamster_items').style.display = 'none';
	    document.getElementById('reptile_items').style.display = 'none';

	    // 선택된 값에 따라 특정 아이템 셀렉트 박스를 표시하고, 해당 값을 hidden 필드에 저장합니다.
	    let selectedPetItems = '';

	    if (value === "01") {
	        document.getElementById('dog_items').style.display = 'block';
	        selectedPetItems = document.getElementById('dog_items').value;
	    } else if (value === "02") {
	        document.getElementById('cat_items').style.display = 'block';
	        selectedPetItems = document.getElementById('cat_items').value;
	    } else if (value === "03") {
	        document.getElementById('hamster_items').style.display = 'block';
	        selectedPetItems = document.getElementById('hamster_items').value;
	    } else if (value === "04") {
	        document.getElementById('reptile_items').style.display = 'block';
	        selectedPetItems = document.getElementById('reptile_items').value;
	    } else if (value === "05") {
	        document.getElementById('fish_items').style.display = 'block';
	        selectedPetItems = document.getElementById('fish_items').value;
	    }

	    // hidden input에 선택된 값을 저장
	    document.getElementById('pet_items').value = selectedPetItems;
	}
	</script>
</form>
</body>
</html>