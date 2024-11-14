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
 *				: [20240704172500][pluto@himedia.co.kr][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/center/board/notice/view.jsp" %>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/bfc/header.jsp" %>
	<script>
		
		function download(type, sequence) {
			
			var frmMain = document.getElementById("frmMain");
			
			frmMain.type.setAttribute("value", type);
			frmMain.sequence.setAttribute("value", sequence);
			frmMain.action = "/console/center/board/download.web";
			frmMain.target = "frmBlank";
			frmMain.submit();
		}
		function remove(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("cd_bbs_type").value = value;
			frmMain.action="/console/center/board/remove.web";
			frmMain.submit();
		}
		
		function modifyForm(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("cd_bbs_type").value = value;
			frmMain.action="/console/center/board/modifyForm.web";
			frmMain.submit();
		}
		
		function goList(value) {
			
			var frmMain = document.getElementById("frmMain");
			
			document.getElementById("cd_bbs_type").value = value;
			frmMain.action="/console/center/board/list.web";
			frmMain.target = "";
			frmMain.submit();
		}
	</script>
</head>
<body class="nav-md">
<%@ include file="/include/bfc/navi.jsp" %>
<form id="frmMain" method="POST">
<input type="hidden" id="type"		name="type" />
<input type="hidden" id="sequence"	name="sequence" />
<input type="hidden" id="cd_bbs_type"	name="cd_bbs_type"	value="${boardDto.cd_bbs_type}" />
<input type="hidden" id="seq_bbs"		name="seq_bbs"		value="${boardDto.seq_bbs}" />
<div class="table">
	<section class="right_col">
		<article class="x_panel">
			<table class="table table-striped" style="width: 100%; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 150px;">제목</th>
					<td>
						${fn:escapeXml(boardDto.title)}
						<div class="pull-right">
						<input type="checkbox"  id="flg_top" name="flg_top" disabled <c:if test="${boardDto.flg_top == 'Y'}">checked</c:if>> 최상위
						</div>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td style="height:300px;">
						${boardDto.content}
					</td>
				</tr>
				<c:if test="${boardDto.file_orig != ''}">
				<tr>
					<th>첨부 파일</th>
					<td>
						<a href="javascript:download('BbsNotice', ${boardDto.seq_bbs});">다운로드</a>
					</td>
				</tr>
				</c:if>
				<c:if test="${boardDto.flg_top == 'Y'}">checked</c:if>
				<tr>
					<th>등록 일자</th>
					<td>
						${boardDto.dt_reg}
					</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>
						${boardDto.readed}
					</td>
				</tr>
			</table>
			<div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center;">
				<input type="button" value="삭제" style="width:100px" onclick="javascript:remove(1);" />
				 <input type="button" value="수정" style="width:100px" onclick="javascript:modifyForm(1);" />
				 <input type="button" value="목록" style="width:100px" onclick="javascript:goList(1);"/>
			</div>
		</article>
		<aside></aside>
	</section>
	<footer>
		<%@ include file="/include/bfc/footer.jsp" %>
	</footer>
</div>
<iframe name="frmBlank" id="frmBlank" width="0" height="0"></iframe>
</form>
</body>
</html>
