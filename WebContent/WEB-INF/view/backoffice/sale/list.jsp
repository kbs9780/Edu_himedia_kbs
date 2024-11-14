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
<%@ page info="/WEB-INF/view/backoffice/sale/list.jsp" %>
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

    /* 마우스 오버 효과 */
    tr:hover {
        background-color: #f1f1f1;
    }

    /* 빈 데이터 행 스타일 */
    .emptyRow td {
        text-align: center;
        color: #777;
        font-style: italic;
    }
    /* 버튼 스타일 */
	a.btnBasic {
	    display: inline-block; /* a 태그를 버튼처럼 보이게 하기 위해 추가 */
	    width: 100px;
	    padding: 10px;
	    font-weight: bold;
	    color: white;
	    background-color: #3B5368;
	    text-align: center; /* 텍스트 가운데 정렬 */
	    text-decoration: none; /* 밑줄 제거 */
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	}
	
	/* 버튼 hover 효과 */
	a.btnBasic:hover {
	    background-color: #005bb5;
	}
</style>
</head>
<body class="nav-md">
<form id="frmMain" method="POST">
<input type="hidden" id="currentPage"	name="currentPage"	value="${paging.currentPage}" />
<input type="hidden" id="seq_sle"		name="seq_sle" 		value="${paging.seq_sle}"/>
<input type="hidden" id="sequence"		name="sequence" />
		<%@ include file="/include/bfc/navi.jsp" %>
			<div class="right_col" role="main">
			<!-- top tiles -->
				 <article class="x_panel">
					<div class="form-group pull-right">
						<select name="cd_state_sale">
						    <option value="0" <c:if test="${paging.cd_state_sale == 0}">selected</c:if>>전체</option>
						    <option value="1" <c:if test="${paging.cd_state_sale == 1}">selected</c:if>>판매중</option>
						    <option value="2" <c:if test="${paging.cd_state_sale == 2}">selected</c:if>>판매중지</option>
						    <option value="3" <c:if test="${paging.cd_state_sale == 3}">selected</c:if>>반려</option>
						    <option value="9" <c:if test="${paging.cd_state_sale == 9}">selected</c:if>>재고소진</option>
						</select>
						<select id="species" name="species" required >
					        <option value="0" <c:if test="${paging.species == 0}">selected</c:if>>전체 카테고리</option>
					        <option value="1" <c:if test="${paging.species == 1}">selected</c:if>>강아지</option>
					        <option value="2" <c:if test="${paging.species == 2}">selected</c:if>>고양이</option>
					        <option value="3" <c:if test="${paging.species == 3}">selected</c:if>>햄스터</option>
					        <option value="4" <c:if test="${paging.species == 4}">selected</c:if>>파충류</option>
					    </select>
						<select name="searchKey">
							<option value="sle_nm">상품명</option>
						</select>
						<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}" /> <input type="submit" value="검색"/>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-3">전체 ${paging.totalLine}개[${paging.currentPage}/${paging.totalPage} 페이지]</div>
					<table style="width: 100%; max-width: 1600px; margin-left: auto; margin-right: auto;">
						<tr>
							<th style="width: 5%">NO</th>
							<th>상품명</th>
							<th>상품 상태</th>
							<th style="width: 10%">카테고리</th>
							<th style="width: 10%">기격</th>
							<th style="width: 10%">등록일</th>
						</tr>
						<c:choose>
							<c:when test="${empty list}">
								<tr>
									<td colspan="7">등록된 상품이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="list">
								<tr>
									<td>
										${list.rnum}
									</td>
									<td style="text-align: center">
										<a href="/console/sale/view.web?seq_sle=${list.seq_sle}">${list.sle_nm} </a>
									</td>
									<td>
										<c:if test="${list.cd_state_sale == '1'}">판매중</c:if>
										<c:if test="${list.cd_state_sale == '2'}">판매중지</c:if>
										<c:if test="${list.cd_state_sale == '3'}">반려</c:if>
										<c:if test="${list.cd_state_sale == '9'}">재고소진</c:if>
										
									</td>
									<td>
										동물: ${list.species} / 상품: ${list.pet_items}
									</td>
									<td>
										<fmt:formatNumber value="${list.price_sale}" type="number" />
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
					<div class="center-container"  style= "display: flex; justify-content: center;">
						<a href="/console/sale/writeForm.web" class="btnBasic">판매 등록</a>
					</div>
				</article>
				 <!-- /top tiles -->
			</div>	 
	<footer>
		<%@ include file="/include/bfc/footer.jsp" %>
	</footer>
	<!-- /footer content -->
<script>
function removeList(seqPrd) {
	$.ajax({
		url: '/console/product/removeList.web', // 상품 리스트 삭제 URL
		type: 'POST',
		data: { seq_prd: seqPrd },
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
</form>
</body>
</html>
