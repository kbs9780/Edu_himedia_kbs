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
 * Copyright (C) 2024 HAPPYSTEPS.COM All Rights Reserved.
 *
 *
 * Program		: com.github.ecommerce7th
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [202411112035][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/myPage/exitForm.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/front/header.jsp" %>
	<script type="text/javascript" src="/js/jquery-3.7.1.min.js"></script>
	<style></style>
	<script>
	function goMyPage() {
		window.location.href = "/front/myPage/index.web";
	}
	 //var memberDto = ${memberDto}
	 
function exit() {
	if (confirm("정말로 탈퇴하시겠습니까?")) {
		fetch(`/front/myPage/exitProc.web?seq_mbr=${seq_mbr}`, {
			method: 'POST', 
			credentials: 'include' 
		})
		.then(response => {
			if (response.redirected) {
				window.location.href = response.url; 
			} else {
				alert("탈퇴 처리가 실패했습니다.");
			}
		})
		.catch(error => {
			console.error("탈퇴 처리 중 오류:", error);
			alert("탈퇴 처리 중 오류가 발생했습니다.");
		});

		return true;
	}
	return false;
}
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<div class="container">
	<section class="content">
		<nav></nav>
		<article class="txtCenter">
		<hr>
		<h3>회원 탈퇴</h3>
		<hr>
		회원 탈퇴하시겠습니까?
		<input type="button" value="목록으로" style="width:100px" onClick="goMyPage();"/>
		<input type="button" value="탈퇴하기" style="width:100px" onClick="exit();"/>
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