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
<%@ page info="/WEB-INF/view/backoffice/users/member/modifyForm.jsp" %>
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
		frmMain.action = "/console/users/member/list.web";
		frmMain.submit();
	}
	
	function togglePetOptions() {
		var petOptions = document.getElementById("petOptions");
		var isPetYes = document.getElementById("btnPetYes").checked;
		
		// 반려동물 있음일 경우 체크박스를 활성화
		var checkboxes = petOptions.getElementsByTagName("input");
		for (var i = 0; i < checkboxes.length; i++) {
			checkboxes[i].disabled = !isPetYes;
		}
}		
	</script>
</head>
<body class="nav-md">
<%@ include file="/include/bfc/navi.jsp" %>
<form id="frmMain" method="POST" action="/console/users/member/modifyProc.web">
<input type="hidden" name="seq_mbr" value="${memberDto.seq_mbr}"/>
<input type="hidden" name="phone" id="phone" />
<div class="table">
	<section class="right_col">
		<article class="x_panel">
			(*) 표시는 필수 입력 사항입니다.
			<table class="table table-striped" style="width: 1000px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 150px;border-left:3px solid #369;">아이디</th>
					<td >
						${memberDto.id}&nbsp;&nbsp;&nbsp;
						<select name="cd_state" style="background:white">
							<option value="0"<c:if test="${memberDto.cd_state == 0}"> selected</c:if>>대기</option>
							<option value="1"<c:if test="${memberDto.cd_state == 1}"> selected</c:if>>사용중</option>
							<option value="2"<c:if test="${memberDto.cd_state == 2}"> selected</c:if>>반려</option>
							<option value="8"<c:if test="${memberDto.cd_state == 8}"> selected</c:if>>탈퇴</option>
							<option value="9"<c:if test="${memberDto.cd_state == 9}"> selected</c:if>>강퇴</option>
						</select>
					</td>
					<th style="width: 150px;border-left:3px solid #369;">닉네임</th>
					<td>
						${memberDto.nickname}
					</td>
				</tr>
				<tr>
					<th style="width: 150px;border-left:3px solid #369;">성명</th>
					<td>
						${memberDto.mbr_nm}
					</td>
					<th style="width: 150px;border-left:3px solid #369;">성별</th>
					<td>
					<c:choose>
						<c:when test="${memberDto.gender == 'M'}">남</c:when>
						<c:otherwise>여</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr>
					<th style="width: 150px;border-left:3px solid #369;">IP</th>
					<td>
						${memberDto.last_ip}
					</td>
					<th style="width: 150px;border-left:3px solid #369;">마지막 접속 일시</th>
					<td>
						${memberDto.last_dt}
					</td>
				</tr>
				<tr>
					<th style="width: 150px;border-left:3px solid #369;">이메일</th>
					<td>
						${memberDto.email}
					</td>
				</tr>
				<tr>
					<th style="width: 150px;border-left:3px solid #369;">연락처(*)</th>
					<td colspan="3">
						<input type="text" id="phone1" name="phone1" maxlength="3"    value="${fn:split(memberDto.phone, '-')[0]}" style="text-align:center;width:30px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						 - <input type="text" id="phone2" name="phone2" maxlength="4" value="${fn:split(memberDto.phone, '-')[1]}" style="text-align:center;width:40px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						 - <input type="text" id="phone3" name="phone3" maxlength="4" value="${fn:split(memberDto.phone, '-')[2]}" style="text-align:center;width:40px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
					</td>
				</tr>
				<tr>
					<th style="width: 150px;border-left:3px solid #369;">주소(*)</th>
					<td colspan="3">
						<input type="text" maxlength="5" style="text-align:center;width:50px;background-color:#F0F0F0;pointer-events:none" id="post" name="post" required readonly value="${memberDto.post}"/>
						도로명 <input type="text" size="40" required id="addr1" name="addr1" style="background-color:#F0F0F0;pointer-events:none" readonly value="${memberDto.addr1}"/>
						<input type="hidden" id="jibunAdd" />
						<input type="hidden" id="extraAddress" />
						<span id="guide" style="color:#999; display:none"></span>
						상세 <input type="text" placeholder="상세 주소" required id="addr2" name="addr2" value="${memberDto.addr2}"/>
						<input type="button" value="우편번호 찾기" style="width:100px" onClick="execDaumPostcode();" />
					</td>
				</tr>
				<tr>
					<th style="width: 150px;border-left:3px solid #369;">반려동물 유/무</th>
					<td colspan="3">
						<input type="radio" name="flg_pets" value="Y" id="btnPetYes" onclick="togglePetOptions()"
							<c:if test="${memberDto.flg_pets == 'Y'}">checked</c:if> /> 있음
						<input type="radio" name="flg_pets" value="N" id="btnPetNo" onclick="togglePetOptions()"
							<c:if test="${memberDto.flg_pets == 'N'}">checked</c:if> /> 없음
					</td>
				</tr>
				<tr id="petOptions">
					<th style="width: 150px;border-left:3px solid #369;">반려동물 종류</th>
					<td colspan="3">
						<input type="checkbox" name="pet1" id="pet1" value="Y" 
							<c:if test="${fn:substring(memberDto.pets, 0, 1) == 'Y'}"> checked</c:if> /> 강아지 &nbsp;&nbsp;
						
						<input type="checkbox" name="pet2" id="pet2" value="Y" 
							<c:if test="${fn:substring(memberDto.pets, 1, 2) == 'Y'}"> checked</c:if> /> 고양이 &nbsp;&nbsp;
						
						<input type="checkbox" name="pet3" id="pet3" value="Y" 
							<c:if test="${fn:substring(memberDto.pets, 2, 3) == 'Y'}"> checked</c:if> /> 햄스터 &nbsp;&nbsp;
						
						<input type="checkbox" name="pet4" id="pet4" value="Y" 
							<c:if test="${fn:substring(memberDto.pets, 3, 4) == 'Y'}"> checked</c:if> /> 파충류 &nbsp;&nbsp;
						
						<input type="checkbox" name="pet5" id="pet5" value="Y" 
							<c:if test="${fn:substring(memberDto.pets, 4, 5) == 'Y'}"> checked</c:if> /> 기타
					</td>
				</tr>
				<tr>
					<th style="width: 150px;border-left:3px solid #369;">마케팅 수신 동의</th>
					<td colspan="3">
						SMS <input type="checkbox" name="flg_sms" 
							<c:if test="${memberDto.flg_sms == 'Y'}"> checked</c:if>/>
						Email <input type="checkbox" name="flg_email" 
							<c:if test="${memberDto.flg_email == 'Y'}"> checked</c:if>/>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center; padding-top: 10px;padding-bottom: 10px">
						<input type="submit" value="목록" style="width:100px" onclick="javascript:goList();" />&nbsp;&nbsp;&nbsp;&nbsp;
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