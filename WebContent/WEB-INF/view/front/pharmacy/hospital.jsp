<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HAPPYSTEPS.COM.
 * HAPPYSTEPS.COM OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HAPPYSTEPS.COM ALL RIGHTS RESERVED.
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/pharmacy/list.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include/front/header.jsp" %>
<%@ include file="/include/front/top.jsp" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>동물병원 목록</title>
		<style>
			.container {
				width: 80%;
				margin: 0 auto;
				padding: 20px;
			}

			h1 {
				text-align: center;
				color: #333;
			}

			.hospital-list {
				list-style-type: none;
				padding: 0;
			}

			.hospital-item {
				border-bottom: 1px solid #ddd;
				padding: 10px 0;
			}

			.hospital-item:last-child {
				border-bottom: none;
			}

			.hospital-name {
				font-weight: bold;
				font-size: 18px;
			}

			.hospital-address,
			.hospital-phone {
				color: #555;
				font-size: 14px;
			}

			.hospital-name a {
				text-decoration: none;
				color: #007BFF;
			}

			.hospital-name a:hover {
				text-decoration: underline;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<h1>동물병원 목록</h1>
			<ul class="hospital-list">
				<li class="hospital-item">
					<div class="hospital-name"><a href="#">아프리카 동물병원</a></div>
					<div class="hospital-address">경기도 성남시 분당구 서현로 170</div>
					<div class="hospital-phone">전화번호: 705-7776</div>
				</li>
				<li class="hospital-item">
					<div class="hospital-name"><a href="#">해마루 동물병원</a></div>
					<div class="hospital-address">경기도 성남시 분당구 황새울로319번길 8-6</div>
					<div class="hospital-phone">전화번호: 031-781-2992</div>
				</li>
				<li class="hospital-item">
					<div class="hospital-name"><a href="#">분당중앙 동물병원</a></div>
					<div class="hospital-address">경기도 성남시 분당구 중앙공원로39번길 49</div>
					<div class="hospital-phone">전화번호: 031-708-8875</div>
				</li>
				<li class="hospital-item">
					<div class="hospital-name"><a href="#">우성동물병원</a></div>
					<div class="hospital-address">경기도 성남시 분당구 돌마로 481</div>
					<div class="hospital-phone">전화번호: 707-1776</div>
				</li>
				<li class="hospital-item">
					<div class="hospital-name"><a href="#">이레외과동물병원</a></div>
					<div class="hospital-address">경기도 성남시 분당구 백현로101번길 11</div>
					<div class="hospital-phone">전화번호: 031-605-0190</div>
				</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">현대 동물병원</a>
				</div>
				<div class="hospital-address">경기도 성남시 분당구 성남대로 30</div>
				<div class="hospital-phone">전화번호: 718-7282</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">나라 동물병원</a>
				</div>
				<div class="hospital-address">경기도 성남시 분당구 미금로 48</div>
				<div class="hospital-phone">전화번호: 712-0707</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">365동물병원 분당점</a>
				</div>
				<div class="hospital-address">경기도 성남시 분당구 미금일로90번길 32</div>
				<div class="hospital-phone">전화번호: 718-0365</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">정동물병원</a>
				</div>
				<div class="hospital-address">경기도 성남시 중원구 금상로 72</div>
				<div class="hospital-phone">전화번호: 749-7557</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">한국동물병원</a>
				</div>
				<div class="hospital-address">경기도 성남시 중원구 둔촌대로 155</div>
				<div class="hospital-phone">전화번호: 746-8990</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">모란동물병원</a>
				</div>
				<div class="hospital-address">경기도 성남시 중원구 성남대로 1126</div>
				<div class="hospital-phone">전화번호: 752-7779</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">최재호 한방동물병원</a>
				</div>
				<div class="hospital-address">경기도 성남시 중원구 둔촌대로63번길 11</div>
				<div class="hospital-phone">전화번호: 031-722-2235</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">분당밝은아이동물병원</a>
				</div>
				<div class="hospital-address">경기도 성남시 중원구 성남대로997번길 51-16</div>
				<div class="hospital-phone">전화번호: 031-754-0201</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">25시 동물병원</a>
				</div>
				<div class="hospital-address">경기도 성남시 중원구 산성대로504번길 1</div>
				<div class="hospital-phone">전화번호: 031-731-0025</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">동물병원 Dr.정</a>
				</div>
				<div class="hospital-address">경기도 성남시 중원구 산성대로 498</div>
				<div class="hospital-phone">전화번호: 031-733-9325</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">세이브 동물병원</a>
				</div>
				<div class="hospital-address">경기도 성남시 중원구 산성대로 336-3</div>
				<div class="hospital-phone">전화번호: 735-5995</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">서현 동물병원</a>
				</div>
				<div class="hospital-address">경기도 성남시 중원구 성남대로 1110</div>
				<div class="hospital-phone">전화번호: 031-755-5095</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">광장동물병원</a>
				</div>
				<div class="hospital-address">경기도 성남시 수정구 위례광장로 300</div>
				<div class="hospital-phone">전화번호: 070-8656-1500</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">그레이동물병원 위례점</a>
				</div>
				<div class="hospital-address">경기도 성남시 수정구 창곡동 509-3 214호</div>
				<div class="hospital-phone">전화번호: 753-0303</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">365동물병원위례점</a>
				</div>
				<div class="hospital-address">경기도 성남시 수정구 위례동로 153</div>
				<div class="hospital-phone">전화번호: 없음</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">위례나무동물병원</a>
				</div>
				<div class="hospital-address">경기도 성남시 수정구 위례동로 141</div>
				<div class="hospital-phone">전화번호: 031-778-8738</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">아이유동물메디컬센터</a>
				</div>
				<div class="hospital-address">경기도 성남시 수정구 창곡동 560 위례우남역아이파크</div>
				<div class="hospital-phone">전화번호: 604-0975</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">중앙동물병원</a>
				</div>
				<div class="hospital-address">경기도 성남시 수정구 수정로 139</div>
				<div class="hospital-phone">전화번호: 755-9429</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">건국 동물병원</a>
				</div>
				<div class="hospital-address">경기도 성남시 수정구 수정로 131</div>
				<div class="hospital-phone">전화번호: 031-721-4111</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">시드니동물병원</a>
				</div>
				<div class="hospital-address">경기도 성남시 수정구 태평로 10</div>
				<div class="hospital-phone">전화번호: 723-7508</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">강남동물병원</a>
				</div>
				<div class="hospital-address">경기도 성남시 중원구 광명로 341</div>
				<div class="hospital-phone">전화번호: 741-3012</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">서울동물병원</a>
				</div>
				<div class="hospital-address">경기도 성남시 중원구 산성대로 388-1</div>
				<div class="hospital-phone">전화번호: 031-741-8119</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">에코바이오</a>
				</div>
				<div class="hospital-address">경기도 성남시 중원구 산성대로420번길 3</div>
				<div class="hospital-phone">전화번호: 733-1330</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">도촌 동물병원</a>
				</div>
				<div class="hospital-address">경기도 성남시 중원구 도촌남로 37</div>
				<div class="hospital-phone">전화번호: 755-5975</div>
			</li>
			<li class="hospital-item">
				<div class="hospital-name">
					<a href="#">분당우리동물의료센터</a>
				</div>
				<div class="hospital-address">경기도 성남시 분당구 양현로94번길 19</div>
				<div class="hospital-phone">전화번호: 031-705-0175</div>
			</li>
		</ul>
		</div>
		<div style="display: flex; justify-content: center;">
			<span class="pageNavi_front_image">
				<img src="/images/btn/btn_pageFirst.gif" border="0" alt="처음으로" onclick="goToPage(1)" />&nbsp;
				<img src="/images/btn/btn_pagePrev.gif" border="0" alt="이전페이지" onclick="changePage(-1)" />&nbsp;
				<strong id="current-page">1</strong>&nbsp;
				<img src="/images/btn/btn_pageNext.gif" border="0" alt="다음페이지" onclick="changePage(1)" />&nbsp;
				<img src="/images/btn/btn_pageLast.gif" border="0" alt="마지막으로" onclick="goToPage(totalPages)" />&nbsp;
			</span>
		</div>
		<footer>
			<%@ include file="/include/front/footer.jsp" %>
		</footer>
	</body>
</html>