<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HAPPYSTEPS.COM.
 * HAPPYSTEPS.COM OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HAPPYSTEPS.COM ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 happySteps.com에 있으며,
 * happySteps.com이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * happySteps.com의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 happySteps.com All Rights Reserved.
 *
 *
 * Program		: happySteps.com
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241004123400][kbs@>_<.co.kr][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" type="text/css" href="/css/vendor.css">

<%--

integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
--%>
</head>
<body>
<div class="container py-2" style="height: atuo;">
	<div class="row py-4 pb-0 pb-sm-4 align-items-center" style="align-items:center;">
		<!-- 로고 영역 -->
		<div class="col-sm-4 col-lg-3 text-center text-sm-start">
			<div class="main-logo">
				<a href="/front/index.web">
					<img src="/images/logo/logo3.png" alt="logo" class="img-fluid">
				</a>
			</div>
		</div>

		<!-- 검색창 영역 (로고 오른쪽) -->
		<div class="col-sm-4 col-lg-4 offset-lg-1"> <!-- 오른쪽으로 이동 -->
			<div class="search-bar border rounded-2 px-3 border-dark-subtle" style="width: calc(100%); height: 100px; border: none; background-color: transparent;"">
				<form id="search-form" class="text-center align-items-center" action="" method="">
					<input type="text" style="width: calc(100% - 40px); height: 100px; border: none; background-color: transparent;" placeholder="다양한 상품을 검색하세요" />
					<img src="/images/search.png" class="fs-4 me-3" alt="Search Icon" style="width: 24px; height: 24px;margin-right:0 !important;" />
				</form>
			</div>
		</div>
<%-- 
	 <!--검색창 영역 첫 번째 오프캔버스 검색창 (모바일에서 사용) -->
	<div class="offcanvas offcanvas-end d-lg-none" data-bs-scroll="true" tabindex="-1" id="offcanvasSearch" aria-labelledby="Search">
		<div class="offcanvas-header justify-content-center"> 
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button> 
		</div>
		<div class="offcanvas-body"> 
			<div class="order-md-last"> 
				<h4 class="text-primary text-uppercase mb-3">Search</h4>
				<div class="search-bar border rounded-2 border-dark-subtle">
					<form id="search-form" class="text-center d-flex align-items-center" action="" method="">
						<input type="text" class="form-control border-0 bg-transparent" placeholder="검색" />
						<img src="/images/search.png" class="fs-4 me-3" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<%-- 두 번째 고정 검색창 (데스크탑에서 사용) -->
	<div class="col-sm-6 offset-sm-2 offset-md-0 col-lg-5 d-none d-lg-block">
		<div class="search-bar border rounded-2 px-3 border-dark-subtle">
			<form id="search-form" class="text-center d-flex align-items-center" action="" method="">
				<input type="text" class="form-control border-0 bg-transparent" placeholder="다양한 상품을 검색하세요" />
				<img src="/images/search.png" class="fs-4 me-3" />
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"> 
					<path fill="currentColor" d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.39ZM11 18a7 7 0 1 1 7-7a7 7 0 0 1-7 7Z" />
				</svg>
			</form>
		</div>
	</div>
	<div class="container py-2" style="height: 270px;">
		<div class="row py-4 pb-0 pb-sm-4 align-items-center ">
			<div class="col-sm-4 col-lg-3 text-center text-sm-start">
			<span style="position: absolute; top: 0; right: 0; line-height: 43px; vertical-align: middle;"></span>


			<div class="main-logo">
				<a href="/front/index.web">
					<img src="/images/logo/logo3.png" alt="logo" class="img-fluid">
				</a>
			</div>
			</div>
			--%>
			<div class="col-sm-8 col-lg-4 d-flex justify-content-end gap-5 align-items-center mt-4 mt-sm-0 justify-content-center justify-content-sm-end">
				<ul class="list-unstyled d-flex m-0">
					<c:if test="${empty sessionScope.SEQ_MBR}">
						<li style="margin: 0 8px;">
							<a href="/front/login/loginForm.web">
								<img src="/images/login.png" style="width: 50px; height: 50px; object-fit: contain; vertical-align: middle;" />
							</a>
						</li>
					</c:if>	
					<c:if test="${not empty sessionScope.SEQ_MBR}">
						<li style="margin: 0 8px;">
							<a href="/front/login/logout.web"> 
							 <img src="/images/logout.png" class="fs-4" style="width: 65px; vertical-align: middle; margin-top: 0px;" />
							</a>
						</li>
						<li style="margin: 0 8px;">
							<a href="/front/myPage/index.web">
								 <img src="/images/mypage.png" class="fs-4" style="width: 50px; vertical-align: middle; margin-top: 11px;" />
							</a>
						</li>
						<li style="margin: 0 8px;">
							<a href="#">
								 <img src="/images/like.png" class="fs-4" style="width: 50px; vertical-align: middle; margin-top: 6px;" />
							</a>
						</li>
						<li style="margin: 0 8px;">
							<a href="/front/basket/index.web">
								 <img src="/images/cart.png" class="fs-4 position-relative" style="width: 50px; vertical-align: middle; margin-top: 7px;" />
							</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</body>