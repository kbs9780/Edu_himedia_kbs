<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HAPPYSTEPS.COM.
 * HAPPYSTEPS.COM OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HAPPYSTEPS.COM ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 HAPPYSTEPS.COM에 있으며,
 * HAPPYSTEPS.COM이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * HAPPYSTEPS.COM의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 com.happySteps All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: list.jsp
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [2024-10-10][rkdcodbs77#naevr.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/community/board/storyboard/writeForm.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="/css/form.css">
	<style></style>
	<script>
		function goList() {
			var cd_bbs_type = document.getElementById("cd_bbs_type").value;
			redirectUrl = "/front/community/board/list.web?cd_bbs_type=" + cd_bbs_type;
			window.location.href = redirectUrl;
		}

		function writeProc() {
			var frmMain = document.getElementById("frmMain");
			var selected_cd_bbs_type = document.getElementById("cd_bbs_type").value;
			var nickname = document.getElementById("nickname").value;

			// 필수 항목 체크
			if (document.getElementById("title").value === "" ||
				selected_cd_bbs_type === "0" ||
				document.getElementById("cd_ctg_pet").value === "0" ||
				document.getElementById("content").value === "") {
				alert("필수 항목을 입력하세요!");
				return;
			}

			// 태그 처리
			var tagInput = document.getElementById('tagInput');
			var escapedValue = escapeSpecialChars(tagInput.value);

			// 태그 값을 폼에 추가
			var tagHiddenInput = document.createElement('input');
			tagHiddenInput.type = 'hidden';
			tagHiddenInput.name = 'tag';
			tagHiddenInput.value = escapedValue;
			frmMain.appendChild(tagHiddenInput);

			frmMain.action = "/front/community/board/writeProc.web?cd_bbs_type=" + selected_cd_bbs_type;
			frmMain.submit();
		}

		document.addEventListener('DOMContentLoaded', function () {
			var input = document.getElementById('tagInput');
			input.addEventListener('keyup', addHashToTag);
		});

		function addHashToTag() {
			var input = document.getElementById('tagInput');
			var tags = input.value.split(',');

			// 각 태그에 #이 없으면 붙임
			for (var i = 0; i < tags.length; i++) {
				tags[i] = tags[i].trim();
				if (tags[i].length > 0 && tags[i].charAt(0) !== '#') {
					tags[i] = '#' + tags[i];
				}
			}

			input.value = tags.join(', ');
		}

		function escapeSpecialChars(str) {
			return str.replace(/[\\"'&<>]/g, function (char) {
				switch (char) {
					case '"': return '&quot;';
					case "'": return '&#39;';
					case '&': return '&amp;';
					case '<': return '&lt;';
					case '>': return '&gt;';
					default: return char;
				}
			});
		}
	</script>
</head>
<body>
	<input type="hidden" id="nickname" name="nickname" value="${communityDto.nickname}" />  
	<div style="position: relative; height: 250px; overflow: hidden; margin-top: 10px;">
		<a href="/front/">
			<img src="/images/logo/logo3.png" alt="로고" style="width: 380px; height: 250px; object-fit: cover; display: block; margin: 0 auto;" />
		</a>
	</div>
	<br>
	<form class="frmMain" id="frmMain" method="POST" enctype="multipart/form-data">
		<div class="container">
			<%@ include file="/include/front/gnb_community.jsp" %>
			<br>
			<section class="content">
				<article class="txtCenter">
					<table class="headLeft_01" style="width: 900px; margin-left: auto; margin-right: auto">
						<tr>
							<th style="width: 150px;">제목(*)</th>
							<td>
								<input type="text" id="title" name="title" style="width: 90%;" required />
							</td>
						</tr>
						<tr>
							<th>카테고리(*)</th>
							<td>
								<div class="category-container">
									<select id="cd_bbs_type" name="cd_bbs_type" required class="category-select">
										<option value="0">선택</option>
										<option value="7">자유게시판</option>
										<option value="9">입양후기</option>
										<option value="11">정보글</option>
									</select>
									&nbsp;&nbsp;&nbsp;
									<label class="label-pet">반려동물(*)</label>
									<select id="cd_ctg_pet" name="cd_ctg_pet" required class="category-select">
										<option value="0">선택</option>
										<option value="1">강아지</option>
										<option value="2">고양이</option>
										<option value="3">햄스터</option>
										<option value="4">파충류</option>
										<option value="5">기타</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th>내용(*)</th>
							<td>
								<textarea id="content" name="content" required></textarea>
							</td>
						</tr>
						<tr>
							<th>태그</th>
							<td>
								<div class="tag-container">
									<input type="text" id="tagInput" name="tagInput" placeholder="태그를 입력하세요" style="width: 90%; padding: 8px; border: 1px solid #ccc; border-radius: 5px;">
								</div>
							</td>
						</tr>
						<tr>
							<th>첨부 파일</th>
							<td>
								<input type="file" id="files[0]" name="files[0]" />
							</td>
						</tr>
					</table>
					<div style="display: flex; justify-content: center; width: 70%; margin-left: auto; margin-right: auto;">
						<button type="button" class="submit-btn" style="margin-right: 10px; font-size: 0.9rem;" onclick="goList(9);">목록</button>
						<button type="button" class="submit-btn" onclick="writeProc(9);">게시글 작성</button>
					</div>
				</article>
			</section>
			<footer>
				<%@ include file="/include/front/login_footer.jsp" %>
			</footer>
		</div>
	</form>
</body>
</html>
