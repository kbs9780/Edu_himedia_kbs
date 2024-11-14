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
 * Program		: kr.co.himedia.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240802100000][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/member/modifyForm.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/include/front/header.jsp" %>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/layoutSubmain.css" />
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/table.css" />
	<script type="text/javascript" src="/js/front.js"></script>
	<script type="text/javascript" src="/js/jquery-3.7.1.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<style></style>
	<script></script>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" name="phone" id="phone" />
<input type="hidden" name="pets" id="pets" />
<input type="hidden" name="_pets" id="_pets"				value ="${memberDto.pets}" />				<!-- 기존 반려동물 값 -->
<input type="hidden" name="_flg_sms" id="_flg_sms"			value ="${memberDto.flg_sms}" />			<!-- 기존 문자 수신동의 값 -->
<input type="hidden" name="_flg_email" id="_flg_email"		value ="${memberDto.flg_email}" />			<!-- 기존 이메일 수신동의 값 -->
<div class="container">
		<article class="txtCenter">
			(*) 표시는 필수 입력 사항입니다.
			<table class="headLeft_01" style="width: 900px; margin-left: auto; margin-right: auto">
				<tr>
					<th style="width: 150px;">성명(*)</th>
					<td>
						${memberDto.mbr_nm}
					</td>
					<th style="width: 150px;border-left:3px solid #369;">성별(*)</th>
					<td>
					<c:choose>
						<c:when test="${memberDto.gender == 'M'}">남</c:when>
						<c:otherwise>여</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td colspan="3">
						${memberDto.nickname}
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td colspan="3">
						${memberDto.id}
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td colspan="3">
						<c:if test="${not empty memberDto}">
							 Email: ${memberDto.email}
						</c:if>
					</td>
				</tr>
				<tr>
					<th>연락처(*)</th>
					<td colspan="3">
						<input type="text" id="phone1" name="phone1" maxlength="3"    value="${fn:split(memberDto.phone, '-')[0]}" style="text-align:center;width:30px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						 - <input type="text" id="phone2" name="phone2" maxlength="4" value="${fn:split(memberDto.phone, '-')[1]}" style="text-align:center;width:40px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						 - <input type="text" id="phone3" name="phone3" maxlength="4" value="${fn:split(memberDto.phone, '-')[2]}" style="text-align:center;width:40px" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
					</td>
				</tr>
				<tr>
					<th>주소(*)</th>
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
					<th>반려동물</th>
					<td colspan="5">
						강아지<input type="checkbox" name="pets" id="pets1" <c:if test="${memberDto.pets.substring(0, 1) == 'Y'}"> checked</c:if> />
						고양이<input type="checkbox" name="pets" id="pets2" <c:if test="${memberDto.pets.substring(1, 2) == 'Y'}"> checked</c:if> />
						햄스터<input type="checkbox" name="pets" id="pets3" <c:if test="${memberDto.pets.substring(2, 3) == 'Y'}"> checked</c:if> />
						파충류<input type="checkbox" name="pets" id="pets4" <c:if test="${memberDto.pets.substring(3, 4) == 'Y'}"> checked</c:if> />
						기타  <input type="checkbox" name="pets" id="pets5" <c:if test="${memberDto.pets.substring(4, 5) == 'Y'}"> checked</c:if> />
					</td>
				</tr>

				<tr>
					<th>마케팅 수신 동의</th>
					<td colspan="3">
						SMS <input type="checkbox" name="flg_sms" id="flg_sms" value="Y"<c:if test="${memberDto.flg_sms == 'Y'}"> checked</c:if>/>
						Email <input type="checkbox" name="flg_email" id="flg_email" value="Y"<c:if test="${memberDto.flg_email == 'Y'}"> checked</c:if>/>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center; padding-top: 10px;padding-bottom: 10px">
						<input type="button" value="수정 하기" style="width:100px" onClick="checkModify();"/>
					</td>
				</tr>
			</table>
		</article>
		<aside></aside>
	<footer>
		<%@ include file="/include/front/footer.jsp" %>
	</footer>
</div>
</form>
</body>
</html>