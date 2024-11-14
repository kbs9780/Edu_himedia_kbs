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
 *				: [20240704172500][kbs@happySteps.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/center/board/question/view.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/layoutSubmain.css" />
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/lnb.css" />
	<link rel="stylesheet" href="/css/table.css">
	<style></style>
	<script>
		function download(type, sequence) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.type.setAttribute("value", type);
			frmMain.sequence.setAttribute("value", sequence);
			frmMain.action = "/front/center/board/download.web";
			frmMain.target = "frmBlank";
			frmMain.submit();
		}
		
		function remove(value) {
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("cd_bbs_type").value = value;
			frmMain.action="/front/center/board/remove.web";
			frmMain.submit();
		}
		
		function modifyForm(value) {
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("cd_bbs_type").value = value;
			frmMain.action="/front/center/board/modifyForm.web";
			frmMain.submit();
		}
		
		function goList(value) {
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("cd_bbs_type").value = value;
			frmMain.action="/front/center/board/list.web";
			frmMain.submit();
		}
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" id="type"			name="type" />
<input type="hidden" id="sequence"		name="sequence" />
<input type="hidden" id="cd_bbs_type"	name="cd_bbs_type" />
<input type="hidden" id="seq_bbs"		name="seq_bbs"		value="${boardDto.seq_bbs}" />
<div class="container">
	<header>
		<%@ include file="/include/front/header.jsp" %>
		<%@ include file="/include/front/top.jsp" %>
	</header>
	<section class="content">
		<nav>
			<%@ include file="/include/front/lnbCenter.jsp" %>
		</nav>
		<article class="txtCenter">
			<table class="headLeft_01" style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 150px;">제목</th>
					<td>
						${boardDto.title}
					</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<select id="cd_ctg" name="cd_ctg" disabled>
							<option value="0"<c:if test="${boardDto.cd_ctg == '0'}"> selected</c:if>>선택</option>
							<option value="1"<c:if test="${boardDto.cd_ctg == '1'}"> selected</c:if>>가입 및 탈퇴</option>
							<option value="2"<c:if test="${boardDto.cd_ctg == '2'}"> selected</c:if>>상품</option>
							<option value="3"<c:if test="${boardDto.cd_ctg == '3'}"> selected</c:if>>구매</option>
							<option value="4"<c:if test="${boardDto.cd_ctg == '4'}"> selected</c:if>>결제</option>
							<option value="5"<c:if test="${boardDto.cd_ctg == '5'}"> selected</c:if>>배송</option>
							<option value="6"<c:if test="${boardDto.cd_ctg == '6'}"> selected</c:if>>환불</option>
							<option value="9"<c:if test="${boardDto.cd_ctg == '9'}"> selected</c:if>>기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						${boardDto.content}
					</td>
				</tr>
				<c:if test="${boardDto.file_orig != ''}">
				<tr>
					<th>첨부 파일</th>
					<td>
						<a href="javascript:download('BbsQuestion', ${boardDto.seq_bbs});">다운로드</a>
					</td>
				</tr>
				</c:if>
				<tr>
					<th>등록 일자</th>
					<td>
						${boardDto.dt_reg}
					</td>
				</tr>
			</table>
			<c:if test="${boardDto.seq_reply > 0}">
				<br/>
				<div style="color: #369; font-size: 10pt; font-weight: bold;">[답변]</div>
				<table class="headLeft_01" style="width: 900px; margin-left: auto; margin-right: auto">
					<tr>
						<th style="width: 150px;">제목</th>
						<td>
							${boardReplyDto.title}
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							${boardReplyDto.content}
						</td>
					</tr>
					<c:if test="${boardReplyDto.file_orig != ''}">
					<tr>
						<th>첨부 파일</th>
						<td>
							<a href="javascript:download('BbsQuestion', ${boardReplyDto.seq_bbs});">다운로드</a>
						</td>
					</tr>
					</c:if>
					<tr>
						<th>등록 일시</th>
						<td>
							${boardReplyDto.dt_reg}
						</td>
					</tr>
				</table>
			</c:if>
			<div style="width: 900px; margin-left: auto; margin-right: auto">
				<c:if test="${boardDto.seq_reply == 0}">
					<input type="button" value="삭제" style="width:100px" onclick="javascript:remove(3);" />
					 <input type="button" value="수정" style="width:100px" onclick="javascript:modifyForm(3);" /> 
				</c:if>
				<input type="button" value="목록" style="width:100px" onclick="javascript:goList(3);"/>
			</div>
		</article>
		<aside></aside>
	</section>
	<footer>
		<%@ include file="/include/front/footer.jsp" %>
	</footer>
</div>
<iframe name="frmBlank" id="frmBlank" width="0" height="0"></iframe>
</form>
</body>
</html>
