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
<%@ page info="/WEB-INF/view/backoffice/center/board/faq/writeForm.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/bfc/header.jsp" %>
	<script type="text/javascript" src="/js/package/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="/js/package/tinymce.js"></script>
	<script>
		window.onload = function () {
			// HTML Editor
			tinymce.init({selector:'textarea'});
		}
		
		function goList(value) {
			var frmMain = document.getElementById("frmMain");
			document.getElementById("cd_bbs_type").value = value;
			frmMain.action="/console/center/board/list.web";
			frmMain.submit();
		}
		
		function writeProc(value) {
			var frmMain = document.getElementById("frmMain");
			document.getElementById("cd_bbs_type").value = value;
			
			if (document.getElementById("title").value == ""
					|| document.getElementById("cd_ctg").value == "0"
					|| tinymce.activeEditor.getContent() == "") {
				alert("필수 항목을 입력하세요!");
				return;
			}
			frmMain.action="/console/center/board/writeProc.web";
			frmMain.submit();
		}
	</script>
</head>
<body class="nav-md">
<%@ include file="/include/bfc/navi.jsp" %>
<form id="frmMain" method="POST" enctype="multipart/form-data">
<input type="hidden" id="cd_bbs_type" name="cd_bbs_type" />
<div class="table">
	<section class="right_col">
		<article class="x_panel">
			<table class="table table-striped" style="width: 100%; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 150px;">제목(*)</th>
					<td>
						<input type="text" id="title" name="title" style="width: 80%;" required />
					</td>
				</tr>
				<tr>
					<th>카테고리(*)</th>
					<td>
						<select id="cd_ctg" name="cd_ctg" required>
							<option value="0">선택</option>
							<option value="1">가입 및 탈퇴</option>
							<option value="2">상품</option>
							<option value="3">구매</option>
							<option value="4">결제</option>
							<option value="5">배송</option>
							<option value="6">환불</option>
							<option value="9">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>내용(*)</th>
					<td>
						<textarea id="content" name="content" required></textarea>
					</td>
				</tr>
			</table>
			<div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center;">
				<input type="button" value="등록" style="width:100px" onclick="javascript:writeProc(2);" />
				 <input type="button" value="목록" style="width:100px" onclick="javascript:goList(2);"/>
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