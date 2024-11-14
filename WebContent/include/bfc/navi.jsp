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
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241023][kbs@happySteps.com][CREATE: Initial Release]
 */
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						
					</div>
				<!-- menu profile quick info -->
					<div class="profile clearfix" style="text-align:right">
						<div class="profile_info">
							<c:if test="${empty sessionScope.SEQ_MNG}">
								<span></span>
								<h2>로그인이 필요합니다</h2>
							</c:if>
							<c:if test="${not empty sessionScope.SEQ_MNG}">
								<span>환영합니다</span>
								<h2><%=session.getAttribute("NICKNAME")%>님</h2>
							</c:if>
						</div>
					</div>
				<!-- /menu profile quick info -->
					<br />
				<!-- sidebar menu -->
					<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
						
							<ul class="nav side-menu">
								<li>
									<a href="/console/index.web">
										<i class="fa fa-home" style="color:#1ae080"></i> 홈페이지 
									</a>
								</li>
							</ul>
						<div class="menu_section active">
							<ul class="nav side-menu">
								<li>
									<a>
										<i class="fa fa-users"></i> 회원관리 
										<span class="fa fa-chevron-down"></span>
									</a>
									<ul class="nav child_menu">
										<li>
											<a href="/console/users/member/list.web">회원관리</a>
										</li>
										<li>
											<a href="/console/users/manager/list.web">관리자관리</a>
										</li>
									</ul>
								</li>
								<li>
									<a>
										<i class="fa fa-comment" style="color:yellow"></i> 게시판관리
										<span class="fa fa-chevron-down"></span>
									</a>
									<ul class="nav child_menu">
										<li><a href="/console/center/board/list.web?cd_bbs_type=1">공지사항</a></li>
										<li><a href="/console/center/board/list.web?cd_bbs_type=2">자주 찾는 질문(FAQ)</a></li>
										<li><a href="/console/center/board/list.web?cd_bbs_type=3">고객 문의</a></li>
										
									</ul>
								</li>
								<li>
									<a>
										<i class="fa fa-shopping-cart" style="color:#f777db"></i> 판매관리 
										<span class="fa fa-chevron-down"></span>
									</a>
									<ul class="nav child_menu">
										<li><a href="/console/product/list.web">상품 목록</a></li>
										<li><a href="/console/sale/list.web">판매 목록</a></li>
										<li><a href="#">상품 리뷰</a></li>
										<li><a href="/console/buy/history.web">주문관리</a></li>
									</ul>
								</li>
								<li>
									<a>
										<i class="fa fa-bar-chart" style="color:#78dbfa"></i> 통계 
										<span class="fa fa-chevron-down"></span>
									</a>
									<ul class="nav child_menu">
										<li>
											<a href="/console/statistics/sale.web">매출통계</a>
										</li>
										<li>
											<a href="/console/statistics/member.web">회원통계</a>
										</li>
										<li>
											<a href="#">게시판통계</a>
										</li>
									</ul>
								</li>
								<li>
									<a>
										<i class="fa fa-heart"></i> 후원 
										<span class="fa fa-chevron-down"></span>
									</a>
									<ul class="nav child_menu">
										<li>
											<a href="/console/donation/index.web">후원관리</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="/console/login/logout.web">
										<i class="fa fa-power-off" style="color:red"></i> 로그아웃 
										<span class="label label-success pull-right">important</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- /sidebar menu -->

			 <!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<nav>
						<div class="nav toggle">
							<a id="menu_toggle">
								<i class="fa fa-bars"></i>
							</a>
						</div>
						<c:if test="${empty sessionScope.SEQ_MNG}">
							<ul class="nav navbar-nav navbar-right" style="margin-right: 200px;">
								<li>
									<a href="/console/login/loginForm.web" class="menuTop">[로그인]</a>
								</li>
							</ul>
						</c:if>
						<c:if test="${not empty sessionScope.SEQ_MNG}">
							<ul class="nav navbar-nav navbar-right" style="margin-right: 15%;">
								<li>
									<a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
										<%=session.getAttribute("NICKNAME")%> 님
										<span class=" fa fa-angle-down"></span>
									</a>
									<ul class="dropdown-menu dropdown-usermenu pull-right">
										<li>
											<a href="/console/myPage/" class="menuTop" title="<%=session.getAttribute("NAME")%>">[마이페이지]</a>
										</li>
										<li>
											<a href="/console/login/logout.web" class="menuTop">[로그아웃]</a>
										</li>
									</ul>
								</li>
							</ul>
						</c:if>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->