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
 * Program		: kr.co.himedia.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241021105200][kbs@happySteps.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/users/manager/modifyForm.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/bfc/header.jsp" %>
	<script type="text/javascript" src="/js/console.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<style></style>
	<script>
	
	function goList(value) {
		var frmMain = document.getElementById("frmMain");
		frmMain.action = "/console/users/manager/list.web";
		frmMain.submit();
	}

	</script>
</head>
<body class="nav-md">
<%@ include file="/include/bfc/navi.jsp" %>
<form id="frmMain" method="POST" action="/console/users/manager/modifyProc.web">
<input type="hidden" name="seq_mng" value="${managerDto.seq_mng}"/>
<input type="hidden" name="phone" id="phone" />
<div class="table">
	<section class="right_col">
		<article class="x_panel">
			(*) 표시는 필수 입력 사항입니다.
			<table class="table table-striped" style="width: 100%; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 150px;border-left:3px solid #369;">아이디</th>
					<td>
						${managerDto.id}&nbsp;&nbsp;&nbsp;
						<select name="cd_state" style="background:white">
							<option value="0"<c:if test="${managerDto.cd_state == 0}"> selected</c:if>>대기</option>
							<option value="1"<c:if test="${managerDto.cd_state == 1}"> selected</c:if>>사용중</option>
							<option value="2"<c:if test="${managerDto.cd_state == 2}"> selected</c:if>>사용불가</option>
						</select>
					</td>
					<th style="width: 150px;border-left:3px solid #369;">닉네임</th>
					<td>
						${managerDto.nickname}
					</td>
				</tr>
				<tr>
					<th style="width: 150px;border-left:3px solid #369;">성명</th>
					<td>
						${managerDto.mng_nm}
					</td>
					<th style="width: 150px;border-left:3px solid #369;">연락처(*)</th>
					<td>
						<input type="text" id="phone1" name="phone1" maxlength="3"    value="${fn:split(managerDto.phone, '-')[0]}" style="text-align:center;width:30px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						 - <input type="text" id="phone2" name="phone2" maxlength="4" value="${fn:split(managerDto.phone, '-')[1]}" style="text-align:center;width:40px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						 - <input type="text" id="phone3" name="phone3" maxlength="4" value="${fn:split(managerDto.phone, '-')[2]}" style="text-align:center;width:40px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
					</td>
				</tr>
				<tr>
					<th style="width: 150px;border-left:3px solid #369;">이메일</th>
					<td colspan="3">
						${managerDto.email}
					</td>
				</tr>
				<tr>
					<th style="width: 150px;border-left:3px solid #369;">주소(*)</th>
					<td colspan="3">
						<input type="text" maxlength="5" style="text-align:center;width:50px;background-color:#F0F0F0;pointer-events:none" id="post" name="post" required readonly value="${managerDto.post}"/>
						도로명 <input type="text" size="40" required id="addr1" name="addr1" style="background-color:#F0F0F0;pointer-events:none" readonly value="${managerDto.addr1}"/>
						<input type="hidden" id="jibunAdd" />
						<input type="hidden" id="extraAddress" />
						<span id="guide" style="color:#999; display:none"></span>
						상세 <input type="text" placeholder="상세 주소" required id="addr2" name="addr2" value="${managerDto.addr2}"/>
						<input type="button" value="우편번호 찾기" style="width:100px" onClick="execDaumPostcode();" />
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center; padding-top: 10px;padding-bottom: 10px">
						<input type="submit" value="목록" style="width:100px" onclick="javascript:goList();" />
						<input type="submit" value="수정 하기" style="width:100px" />
					</td>
				</tr>
			</table>
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