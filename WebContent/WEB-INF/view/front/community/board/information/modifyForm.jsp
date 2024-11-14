<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HAPPYSTEPS.COM
 * HAPPYSTEPS.COM OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HAPPYSTEPS.COM ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 happysteps.com에 있으며,
 * happysteps.com이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * happysteps.com의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 himedia.co.kr All Rights Reserved.
 *
 *
 * Program		: happysteps.com
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [202410311040][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/community/board/sotryboard/modifyForm.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/css/form.css">
	<%@ include file="/include/front/header.jsp" %>
	<style></style>
	<script>
	
	// 서버에서 JSP로 넘어온 seq_bbs 값을 JavaScript 변수로 할당
	//document.addEventListener('DOMContentLoaded', () => {
	//var seq_bbs = "${communityDto.seq_bbs}"; 
	//});
	
	function goList() {
		var cd_bbs_type = document.getElementById("cd_bbs_type").value;
		redirectUrl = "/front/community/board/list.web?cd_bbs_type= 11";
		window.location.href = redirectUrl;
	}		
		function modifyProc(value) {
			var frmMain = document.getElementById("frmMain");
			var selected_cd_bbs_type = document.getElementById("cd_bbs_type").value; // 선택된 카테고리 값 가져오기
			//var nickname = document.getElementById("nickname").value;//닉네임 값 가져오기
			// 필수 항목 체크
			if (document.getElementById("title").value === "" ||
				document.getElementById("cd_ctg_pet").value === "0" ||
				document.getElementById("content").value === "") {
				alert("필수 항목을 입력하세요!");
			}

			// 태그 처리
			var tagInput = document.getElementById('tagInput');
			var escapedValue = escapeSpecialChars(tagInput.value);

			// 태그 값을 폼에 추가
			var tagHiddenInput = document.createElement('input');
			tagHiddenInput.type = 'hidden';
			tagHiddenInput.name = 'tag'; // 서버에서 사용할 이름
			tagHiddenInput.value = escapedValue;
			frmMain.appendChild(tagHiddenInput);


			// 게시판 유형에 따른 처리
			frmMain.action = "/front/community/board/modifyProc.web?cd_bbs_type=" + selected_cd_bbs_type;
			var seq_bbs = "${communityDto.seq_bbs}"; 
			frmMain.submit();
		}

		document.addEventListener('DOMContentLoaded', function () {
			var input = document.getElementById('tagInput');
			input.addEventListener('keyup', addHashToTag);
		});

		function addHashToTag() {
			var input = document.getElementById('tagInput');
			var tags = input.value.split(','); // 쉼표로 구분하여 배열로 변환

			// 각 태그에 #이 없으면 붙임
			for (var i = 0; i < tags.length; i++) {
				tags[i] = tags[i].trim(); // 앞뒤 공백 제거
				if (tags[i].length > 0 && tags[i].charAt(0) !== '#') {
					tags[i] = '#' + tags[i]; // 첫 글자가 #이 아니면 추가
				}
			}

			// 다시 쉼표로 구분된 문자열로 합침
			input.value = tags.join(', ');
		}

		function escapeSpecialChars(str) {
			return str.replace(/[\\"'&<>]/g, function (char) {
				switch (char) {
					case '"':
						return '&quot;';
					case "'":
						return '&#39;';
					case '&':
						return '&amp;';
					case '<':
						return '&lt;';
					case '>':
						return '&gt;';
					default:
						return char;
				}
			});
		}
	</script>
</head>
<body>
<form class="frmMain" id="frmMain" method="POST" enctype="multipart/form-data">
<input type="hidden" id="nickname" name="nickname" value="${nickname}" />
<input type="hidden" id="cd_bbs_type"	name="cd_bbs_type" 	value="${communityDto.cd_bbs_type}"/>
<input type="hidden" id="seq_bbs"		name="seq_bbs"		value="${communityDto.seq_bbs}" />
	<div class="content">
		<%@ include file="/include/front/gnb_community.jsp" %>
		<br>
		<section class="content">
		<article class="txtCenter">
			<table class="headLeft_01" style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 150px;">제목(*)</th>
					<td>
						<input value="${communityDto.title}"type="text" id="title" name="title" style="width: 90%;" required />
						
					</td>
				</tr>
				<tr>
					<th>카테고리(*)</th>
					<td>
					<div class="category-container">
						<select id="cd_bbs_type" name="cd_bbs_type" required>
							<option value="0" <c:if test="${communityDto.cd_bbs_type == 	'0'}"> selected</c:if>>선택</option>
							<option value="7" <c:if test="${communityDto.cd_bbs_type == 	'7'}"> selected</c:if>>자유게시판</option>
							<option value="9" <c:if test="${communityDto.cd_bbs_type == 	'9'}"> selected</c:if>>입양후기</option>
							<option value="11"<c:if test="${communityDto.cd_bbs_type == 	'11'}"> selected</c:if>>정보글</option>
						</select>
						&nbsp;&nbsp;&nbsp;
						<label class="label-pet">반려동물(*)</label>
						<select id="cd_ctg_pet" name="cd_ctg_pet" required>
							<option value="0" <c:if test="${communityDto.cd_ctg_pet == 	'0'}"> selected</c:if>>선택</option>
							<option value="1" <c:if test="${communityDto.cd_ctg_pet == 	'1'}"> selected</c:if>>강아지</option>
							<option value="2" <c:if test="${communityDto.cd_ctg_pet == 	'2'}"> selected</c:if>>고양이</option>
							<option value="3" <c:if test="${communityDto.cd_ctg_pet == 	'3'}"> selected</c:if>>햄스터</option>
							<option value="4" <c:if test="${communityDto.cd_ctg_pet == 	'4'}"> selected</c:if>>파충류</option>
							<option value="5" <c:if test="${communityDto.cd_ctg_pet == 	'5'}"> selected</c:if>>기타</option>
						</select>
					</div>
					</td>
				</tr>
				<tr>
					<th>내용(*)</th>
					<td>
					<textarea id="content" name="content" required>${communityDto.content}</textarea>
					</td>
				</tr>
				<tr>
					<th>태그</th>
					<td>
						<div class="tag-container">
							<input value="${communityDto.tag}"type="text" id="tagInput" name="tagInput" required style="width: 90%; padding: 8px; border: 1px solid #ccc; border-radius: 5px;"> 
						</div>
					</td>
				</tr>
				<tr>
					<th>첨부 파일</th>
					<td>
						<input type="file" id="fileOrig" name="fileOrig" />
					</td>
				</tr>
			</table>
			<div style="display: flex; justify-content: center; width: 70%; margin-left: auto; margin-right: auto;">
				<button type="button" class="submit-btn" style="margin-right: 10px; font-size: 0.9rem; width:25%; height:60px;" onclick="goList(11);">목록</button>
				<button type="button" class="submit-btn"style="margin-right: 10px; font-size: 0.9rem; width:25%; height:60px;" onclick="modifyProc(11);">수정하기</button>
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