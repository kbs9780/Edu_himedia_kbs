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
<%@ page info="/WEB-INF/view/backoffice/users/member/list.jsp" %>
<%@ taglib prefix="c"					uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="plutozoneUtilTag"	uri="/WEB-INF/tld/com.plutozone.util.tld" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/bfc/header.jsp" %>
	<style></style>
	<script>
		
		function goModifyState(seq_mbr, cd_state) {
			
			if (confirm("상태를 변경하시겠습니까?")) {
				var frmMain = document.getElementById("frmMain");
				
				document.getElementById("seq_mbr").value = seq_mbr;
				document.getElementById("cd_state").value = cd_state;
				frmMain.action="/console/users/member/modifyProc.web";
				frmMain.submit();
			}
		}
		
		function goModifyForm(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("cd_state").remove();
			
			document.getElementById("seq_mbr").value = value;
			frmMain.action="/console/users/member/modifyForm.web";
			frmMain.submit();
		}
		
		function goPage(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("currentPage").value = value;
			frmMain.action="/console/users/member/list.web";
			frmMain.submit();
		}
	</script>
</head>
<body class="nav-md">
<%@ include file="/include/bfc/navi.jsp" %>
<form id="frmMain" method="POST" action="/console/users/member/list.web">
<input type="hidden" name="seq_mbr"		id="seq_mbr" />
<input type="hidden" name="cd_state"	id="cd_state" />
<input type="hidden" name="currentPage"	id="currentPage" value="${paging.currentPage}" />
<div class="table">
	<section class="right_col">
		<article class="x_panel">
			<div class="form-group pull-right">
				<select name="searchKey">
					<option value="id"<c:if test="${paging.searchKey == 'id'}"> selected</c:if>>아이디</option>
					<option value="nickname"<c:if test="${paging.searchKey == 'nickname'}"> selected</c:if>>닉네임</option>
					<option value="mbr_nm"<c:if test="${paging.searchKey == 'mbr_nm'}"> selected</c:if>>성명</option>
				</select>
				<input type="text" name="searchWord" id="searchWord" value="${paging.searchWord}" /> <input type="submit" value="검색"/>
			</div>
			<div class="col-md-3 col-sm-3 col-xs-3">전체 ${paging.totalLine}개[${paging.currentPage}/${paging.totalPage} 페이지]</div>
			<table class="table table-striped">
				<tr>
					<th style="width: 5%; border-left:3px solid #369;">NO</th>
					<th style="width: 10%">아이디</th>
					<th style="width: 10%">닉네임</th>
					<th style="width: 10%">상태</th>
					<th style="width: 10%">성명</th>
					<th style="width: 7%">성별</th>
					<th style="width: 10%">등록일</th>
				</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="7">등록된 회원이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="list">
						<tr>
							<td style="border-left:3px solid #369;">
								${list.rnum}
							</td>
							<td class="txtCenter">
								<a href="javascript:goModifyForm(${list.seq_mbr});">
									<plutozoneUtilTag:masking text="${list.id}" letter="*" count="3" mode="right" />
								</a>
							</td>
							<td>
								<a href="javascript:goModifyForm(${list.seq_mbr});">
									${list.nickname}
								</a>
							</td>
							<td>
								<select style="background:#F0F0F0" onchange="goModifyState(${list.seq_mbr}, this.value);">
									<option value="0"<c:if test="${list.cd_state == 0}"> selected</c:if>>대기</option>
									<option value="1"<c:if test="${list.cd_state == 1}"> selected</c:if>>사용중</option>
									<option value="2"<c:if test="${list.cd_state == 2}"> selected</c:if>>반려</option>
									<option value="8"<c:if test="${list.cd_state == 8}"> selected</c:if>>탈퇴</option>
									<option value="9"<c:if test="${list.cd_state == 9}"> selected</c:if>>강퇴</option>
								</select>
							</td>
							<td>
								<plutozoneUtilTag:masking text="${list.mbr_nm}" letter="*" count="1" mode="right" />
							</td>
							<td>
								<c:choose>
									<c:when test="${list.gender == 'M'}">남</c:when>
									<c:otherwise>여</c:otherwise>
								</c:choose>
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
			<div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center;">
				<plutozoneUtilTag:page styleID="admin_text" currentPage="${paging.currentPage}" linePerPage="${paging.linePerPage}" totalLine="${paging.totalLine}" scriptFunction="goPage" />
			</div>
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