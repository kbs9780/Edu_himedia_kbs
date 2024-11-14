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
 *				: [20240731120000][whslsl88@gmail.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<a href="/"><img src="/image/logo.jpg" alt="로고" width="200px" /></a>
		<span style="float:right;line-height:43px;vertical-align:middle;">
			<c:if test="${not empty sessionScope.SEQ_SLL}">
				<a href="/seller/myPage/" class="menuTop" title="<%=session.getAttribute("NAME")%>">[마이페이지]</a>
				 <a href="/seller/login/logout.web" class="menuTop">[로그아웃]</a>
			</c:if>
			<c:if test="${empty sessionScope.SEQ_SLL}">
				<a href="/seller/login/loginForm.web" class="menuTop">[로그인]</a>
			</c:if>
		</span>