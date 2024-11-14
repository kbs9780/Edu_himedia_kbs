<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF com.happySteps.
 * com.happySteps OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 com.happySteps ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 com.happySteps에 있으며,
 * com.happySteps이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * com.happySteps의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 com.happySteps All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241007032838][son062121#gmail.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/sale/view.jsp" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"					uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="plutozoneUtilTag"	uri="/WEB-INF/tld/com.plutozone.util.tld" %>
<!DOCTYPE html>
<html lang="kr">
<head>
	<%@ include file="/include/bfc/header.jsp" %>
<style>
	
    /* 헤더 스타일 */
    th {
        background-color: #f2f2f2;
        color: #333;
        padding: 10px;
        border-bottom: 2px solid #ddd;
        text-align: center;
    }

    /* 데이터 셀 스타일 */
    td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
        text-align: center;
    }

    /* 링크 스타일 */
    td a {
        color: #337ab7;
        text-decoration: none;
    }
    td a:hover {
        color: #0056b3;
        text-decoration: underline;
    }

    /* 홀수 줄 배경색 */
    tr:nth-child(odd) {
        background-color: #f9f9f9;
    }

    /* 빈 데이터 행 스타일 */
    .emptyRow td {
        text-align: center;
        color: #777;
        font-style: italic;
    }

</style>
</head>
<body class="nav-md">
<form id="frmMain" method="POST">
<input type="hidden" id="seq_prd"		name="seq_prd" 		value="${saleDto.seq_prd}"/>
<input type="hidden" id="seq_sle"		name="seq_sle" 		value="${saleDto.seq_sle}"/>
<input type="hidden" id="sequence"		name="sequence" />
<input type="hidden" id="cd_state_sale" name="cd_state_sale"value="${saleDto.cd_state_sale}"/>
<input type="hidden" id="pet_items" 	name="pet_items" 	value="${saleDto.pet_items}"/>
		<%@ include file="/include/bfc/navi.jsp" %>
			<div class="right_col" role="main">
			<!-- top tiles -->
				 <article class="x_panel">
					<table style="width: 100%; max-width: 1600px; margin-left: auto; margin-right: auto;">
						<tr>
					<th style="width: 150px;" >판매명</th>
					<td>
						${saleDto.sle_nm}
					</td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td>
								동물: ${saleDto.species} / 상품: ${saleDto.pet_items}
							</td>
						</tr>
						<tr>
							<th>설명</th>
							<td class="content">
								${saleDto.desces}
							</td>
						</tr>
						<tr>
							<th>판매 가격</th>
							<td>
								<fmt:formatNumber value="${saleDto.price_sale}" type="number" />원
							</td>
						</tr>
						<tr>
							<th>판매 상태</th>
							<td>
								<c:if test="${saleDto.cd_state_sale == '1'}">판매중</c:if>
								<c:if test="${saleDto.cd_state_sale == '2'}">판매중지</c:if>
								<c:if test="${saleDto.cd_state_sale == '3'}">반려</c:if>
								<c:if test="${saleDto.cd_state_sale == '9'}">재고소진</c:if>
							</td>
						</tr>
						<tr>
							<th>이미지(대표)</th>
							<td>
								<img src="/image/sale/${saleDto.img}" height="200"/>
							</td>
						</tr>
						<tr>
							<th>판매 시작일</th>
							<td>
								${saleDto.dt_sale_start}
							</td>
						</tr>
						<tr>
							<th>판매 종료일</th>
							<td>
								${saleDto.dt_sale_end}
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align:center;padding-top: 10px;padding-bottom: 10px">
								<input type="button" value="판매 중지" style="width:100px" onclick="javascript:stop();" />
								<input type="button" value="판매 재개" style="width:100px" onclick="javascript:re();" />
								<input type="button" value="품절" style="width:100px" onclick="javascript:soldout();" />
								 <input type="button" value="수정" style="width:100px" onclick="javascript:modifyForm();" />
								 <input type="button" value="목록" style="width:100px" onclick="javascript:location.href='/console/sale/list.web';"/>
							</td>
						</tr>
					</table>
					<br/>
					<div class="center-container"  style= "display: flex; justify-content: center;">
						<plutozoneUtilTag:page styleID="front_image" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPage" />
					</div>
					<br/>
				</article>
				 <!-- /top tiles -->
			</div>	 
	<footer>
		<%@ include file="/include/bfc/footer.jsp" %>
	</footer>
	<!-- /footer content -->
<script>

	function stop(value) {
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action="/console/sale/stop.web";
		frmMain.submit();
	}
	
	function re(value) {
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action="/console/sale/re.web";
		frmMain.submit();
	}
	
	function soldout(value) {
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action="/console/sale/soldout.web";
		frmMain.submit();
	}
	
	function modifyForm(value) {
		var frmMain = document.getElementById("frmMain");
		
		frmMain.action="/console/sale/modifyForm.web";
		frmMain.submit();
	}
</script>
</form>
</body>
</html>
