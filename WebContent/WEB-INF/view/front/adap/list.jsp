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
 * Copyright (C) 2024 happySteps All Rights Reserved.
 *
 *
 * Program		:com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [202411011400][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/adap/list.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="pragma" content="no-cache" />
	<%@ include file="/include/front/header.jsp" %>
	<%@ include file="/include/front/top.jsp" %>
	<title>동물 입양공고 조회</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<style>
		.card-container {
			display: flex;
			flex-wrap: wrap;
			justify-content: space-between; /* 각 카드 사이 공간 확보 */
		}
		.animal-card {
			width: 23%; /* 카드의 너비를 조정하여 한 줄에 4개가 들어가도록 설정 */
			box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 카드 그림자 추가 */
			margin-bottom: 20px; /* 카드 아래 여백 */
			padding: 10px; /* 카드 내부 여백 */
			border: 1px solid #ccc; /* 카드 경계선 */
			border-radius: 5px; /* 카드 모서리 둥글게 */
			transition: transform 0.3s ease, box-shadow 0.3s ease; /* 부드러운 전환 효과 */
		}
		.animal-card img {
			width: 100%; /* 이미지 너비 100%로 설정 */
			height: 200px; /* 비율에 맞게 높이 조정 */
			object-fit: cover; /* 이미지 비율 유지 */
			border-radius: 5px; /* 이미지 모서리 둥글게 */
		}
		.animal-card:hover {
		transform: translateY(-5px); /* 마우스를 올렸을 때 위로 이동 */
		box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2); /* 그림자 강도 증가 */
	}

	/* 모바일 화면 (화면 너비 768px 이하) */
	@media (max-width: 768px) {
		.container {
			padding: 5px;
		}
	
		label, input, select, button {
			width: 100%;
			font-size: 14px;
		}
		.card-container {
			flex-direction: column;
			align-items: center;
		}
	}
	</style>
	<script>
	
	<%--
	function viewAnimalDetail(animalId, sigunCd, sigunNm, stateNm, pblancBeginDe, pblancEndDe, speciesNm, shterNm) {
		// AJAX를 통해 상세 정보를 요청합니다.
		$.ajax({
			url: '/front/adap/view.json', // 상세 정보 요청 URL
			method: 'POST',
			contentType: 'application/json',
			data: JSON.stringify({
				PBLANC_IDNTFY_NO: animalId, 	// 동물 ID
				SIGUN_CD: sigunCd, 				// 시군코드
				SIGUN_NM: sigunNm, 				// 시군명
				STATE_NM: stateNm,				// 상태
				PBLANC_BEGIN_DE: pblancBeginDe, // 공고시작일자
				PBLANC_END_DE: pblancEndDe,		// 공고종료일자
				SPECIES_NM: speciesNm, 			// 품종
				SHTER_NM: shterNm 				// 보호소명
			}),
			success: function(response) {
				// API 호출 성공 시, response에 대한 처리를 합니다.
				if (response) {
					// 서버에서 받은 데이터를 view.jsp에 넘겨주는 방법
					 const detailPageUrl = `/front/adap/view.web?PBLANC_IDNTFY_NO=${animalId || ''}&SIGUN_CD=${sigunCd || ''}&SIGUN_NM=${sigunNm || ''}&STATE_NM=${stateNm || ''}&PBLANC_BEGIN_DE=${pblancBeginDe || ''}&PBLANC_END_DE=${pblancEndDe || ''}&SPECIES_NM=${speciesNm || ''}&SHTER_NM=${shterNm || ''}`;
					// URL로 리다이렉션
					console.log(detailPageUrl);
					window.location.href = detailPageUrl; 
				} else {
					alert('상세 정보를 가져오는 데 실패했습니다.');
				}
			},
			error: function(xhr, status, error) {
				console.error('API 호출 실패:', error);
				alert('상세 정보를 가져오는 데 오류가 발생했습니다.');
			}
		});
	}
--%>
	let currentPage = 1; // 전역 변수로 현재 페이지를 정의
	let totalPages = 10; // 예시로 최대 페이지 수를 10으로 설정. 실제 데이터에 따라 수정 필요.
	const itemsPerPage = 20; // 페이지당 보여줄 항목 수


	function changePage(direction) {
		currentPage += direction; // 페이지 변경

		// 페이지 범위 체크
		if (currentPage < 1) {
			currentPage = 1; // 최소 페이지 1
		} else if (currentPage > totalPages) {
			currentPage = totalPages; // 최대 페이지 제한
		}

		fetchAnimalData(currentPage); // 변경된 페이지에 대한 데이터 요청
	}

	function fetchAnimalData(page) {
		$.ajax({
			url: '/front/adap/list.json', // 데이터 요청 URL
			method: 'POST',
			contentType: 'application/json',
			dataType: 'json',
			data: JSON.stringify({ pageIndex: page }), // 요청 데이터
			success: function(response) {
				if (response.AbdmAnimalProtect) {
					let items = response.AbdmAnimalProtect[1].row; // 데이터 배열
					const listTotalCount = response.LIST_TOTAL_COUNT; // 전체 개수
					let html = ''; // 카드 HTML을 저장할 변수

					items.forEach(function(item, index) {
						// 카드 HTML 생성
						//html += '<div class="animal-card">';
						html += '<div class="animal-card" id="' + '" onclick="viewAnimalDetail(\'' 
						+ (item.PBLANC_IDNTFY_NO || '') + '\', \'' + (item.SIGUN_CD || '') + '\', \'' 
						+ (item.SIGUN_NM || '') + '\', \'' + (item.STATE_NM || '') + '\', \'' 
						+ (item.PBLANC_BEGIN_DE || '') + '\', \'' + (item.PBLANC_END_DE || '') + '\', \'' 
						+ (page || 1) + '\', \'' + (index+1) + '\', \'' 
						+ (item.SPECIES_NM || '') + '\', \'' + (item.SHTER_NM || '') + '\')">';
							html += '<img src="' + (item.IMAGE_COURS || '') + '" alt="동물 이미지">';
							html += '<p><strong>공고번호:</strong> ' + (item.PBLANC_IDNTFY_NO || '') + '</p>';
							html += '<p><strong>품종:</strong> ' + (item.SPECIES_NM || '') + '</p>';
							html += '<p><strong>성별:</strong> ' + (item.SEX_NM || '') + '</p>';
							html += '<p><strong>발견장소:</strong> ' + (item.DISCVRY_PLC_INFO || '') + '</p>';
							html += '<p><strong>특징:</strong> ' + (item.SFETR_INFO || '') + '</p>';
							html += '<p><strong>페이지:</strong> ' + page + ', <strong>번호:</strong> ' + (index + 1) + '</p>'; // 페이지와 인덱스 정보 표시
							html += '</div>'; // 카드 닫기
					});
					
					$('#animalList').html(html); // 동물 목록 업데이트
					// 공고 총 갯수 업데이트
					$('#total-count').text(response.totalCount || 0); // 응답에서 총 갯수를 가져와서 표시
				} else {
					$('#animalList').html('<p>데이터가 없습니다.</p>'); // 데이터 없음 메시지
					$('#total-count').text('0'); // 총 갯수도 0으로 초기화
				}
			},
			error: function(xhr, status, error) {
				console.error('API 호출 실패:', error);
				$('#animalList').html('<p>오류 발생: ' + error + '<br>상태 코드: ' + xhr.status + '</p>'); // 오류 메시지
			}
		});
	}
	function updatePagination() {
		// 현재 페이지와 총 페이지 수를 표시
		$('#current-page').text(currentPage + ' / ' + totalPages);
	}
	$(document).ready(function() {
		fetchAnimalData(currentPage); // 첫 페이지 데이터 가져오기
	});
	
	function viewAnimalDetail(animalId, sigunCd, sigunNm, stateNm, pblancBeginDe, pblancEndDe, page, index , speciesNm, shterNm) {
		//alert('sldkjfbsdkjlsd'+'|||||'+page+'||||||'+index+'||||||');
		// URL 파라미터로 전달할 데이터를 인코딩
		const params = new URLSearchParams({
			PBLANC_IDNTFY_NO: animalId || '',
			SIGUN_CD: sigunCd || '',
			SIGUN_NM: sigunNm || '',
			STATE_NM: stateNm || '',
			PBLANC_BEGIN_DE: pblancBeginDe || '',
			PBLANC_END_DE: pblancEndDe || '',
			SPECIES_NM: speciesNm || '',
			SHTER_NM: shterNm || '',
			index: index || 1,
			page: page || 1
		});
		
		// view.jsp로 이동
		window.location.href = `/front/adap/view.web?` + params.toString();
	}

	// view.jsp에 추가할 코드
	$(document).ready(function() {
		// URL에서 파라미터 가져오기
		const urlParams = new URLSearchParams(window.location.search);
		const animalId = urlParams.get('PBLANC_IDNTFY_NO');
		console.log('1212')
		
		if (animalId) {
			// AJAX 요청을 통해 상세 정보를 가져오기
			$.ajax({
				url: '/front/adap/view.json',
				method: 'POST',
				contentType: 'application/json',
				data: JSON.stringify({
					PBLANC_IDNTFY_NO: animalId,
					SIGUN_CD: urlParams.get('SIGUN_CD'),
					SIGUN_NM: urlParams.get('SIGUN_NM'),
					STATE_NM: urlParams.get('STATE_NM'),
					PBLANC_BEGIN_DE: urlParams.get('PBLANC_BEGIN_DE'),
					PBLANC_END_DE: urlParams.get('PBLANC_END_DE'),
					SPECIES_NM: urlParams.get('SPECIES_NM'),
					SHTER_NM: urlParams.get('SHTER_NM'),
					index: urlParams.get('index'),
					page: urlParams.get('page')
				}),
				success: function(response) {
					if (response && response.AbdmAnimalProtect && response.AbdmAnimalProtect[1].row[0]) {
						const data = response.AbdmAnimalProtect[1].row[0];
						
						// 데이터 바인딩
						$('#pblanc_idntfy_no').text(data.PBLANC_IDNTFY_NO || '');
						$('#species_nm').text(data.SPECIES_NM || '');
						$('#color_nm').text(data.COLOR_NM || '');
						$('#sex_nm').text(data.SEX_NM || '');
						$('#neut_yn').text(data.NEUT_YN || '');
						$('#age_info').text(data.AGE_INFO || '');
						$('#bdwgh_info').text(data.BDWGH_INFO || '');
						$('#sfetr_info').text(data.SFETR_INFO || '');
						$('#partclr_matr').text(data.PARTCLR_MATR || '');
						$('#discvry_plc_info').text(data.DISCVRY_PLC_INFO || '');
						$('#recept_de').text(data.RECEPT_DE || '');
						$('#shter_nm').text(data.SHTER_NM || '');
						$('#shter_telno').text(data.SHTER_TELNO || '');
						$('#protect_plc').text(data.PROTECT_PLC || '');
						$('#jurisd_inst_nm').text(data.JURISD_INST_NM || '');
						$('#chrgpsn_nm').text(data.CHRGPSN_NM || '');
						$('#chrgpsn_contct_no').text(data.CHRGPSN_CONTCT_NO || '');
					} else {
						alert('상세 정보를 가져오는 데 실패했습니다.');
					}
				},
				error: function(xhr, status, error) {
					console.error('API 호출 실패:', error);
					alert('상세 정보를 가져오는 데 오류가 발생했습니다.');
				}
			});
		} else {
			//alert('동물 정보를 찾을 수 없습니다.');
		}
	});
	
	</script>
</head>
<body>
<form id="frmMain" method="POST">
<input type="hidden" name="cd_bbs_type" id="cd_bbs_type" />
<div class="container">
	<header>
	</header>
	<nav>
	</nav>
	<section class="content">
	<nav>
	<%@ include file="/include/front/gnbAdap.jsp" %>
	</nav>
		<img src="/images/adap_benner.png" alt="입양페이지 공지" style="width: 100%; height: 40%; object-fit: cover; float: center; margin-left: 10px; margin-bottom: 10px; margin-top: 20px;"/>
	<div>
		<div style="margin-top: 20px;">
			<label>날짜:</label>
			<input type="date" id="startDate"> ~ <input type="date" id="endDate"><br>
			<label>시도:</label>
			<select id="sigun">
			<option value="all">		전체			</option>
			<option value="gangwon">	강원특별자치도	</option>
			<option value="gyeonggi">	경기도		</option>
			<option value="gyeongbuk">	경상북도		</option>
			<option value="gyeongnam">	경상남도		</option>
			<option value="gwangju">	광주광역시		</option>
			<option value="daegu">		대구광역시		</option>
			<option value="daejeon">	대전광역시		</option>
			<option value="busan">		부산광역시		</option>
			<option value="seoul">		서울특별시		</option>
			<option value="ulsan">		울산광역시		</option>
			<option value="incheon">	인천광역시		</option>
			<option value="jeonbuk">	전북특별자치도	</option>
			<option value="jeonnam">	전라남도		</option>
			<option value="jeju">		제주특별자치도	</option>
			<option value="chungbuk">	충청북도		</option>
			<option value="chungnam">	충청남도		</option>
			<option value="sejong">		세종특별자치시	</option>
			</select>
	
			<label>시군구:</label>
			<select id="sigungu">
			<option value="all">		전체</option>
			<!-- 시군구 옵션 추가 -->
			</select><br>
	
			<label>종류:</label>
			<select id="type">
				<option value="all">전체	</option>
				<option value="dog">개		</option>
				<option value="cat">고양이	</option>
				<option value="else">기타	</option>
			</select>
	
			<label>성별:</label>
			<select id="gender">
				<option value="all">전체</option>
				<option value="M">수컷</option>
				<option value="F">암컷</option>
				<option value="Q">미상</option>
			</select><br>
	
			<label>동물등록번호:</label>
			<input type="text" id="registrationNumber">
	
			<button onclick="searchAnimals()">조회</button>
			<br>
			<br>
			<br>
			 <p><strong>공고 총 갯수:11,014개</strong> 
			 <%-- 
			 <p><strong>공고 총 갯수:</strong> <span id="total-count">11,014</span></p>
			 --%>
			<!-- 카드 리스트 부분 -->
			<div class="card-container" id="animalList">
				
			</div>
		</div>
	</div>
	<div class="card-container"></div>
			<br/>
		<div style="display: flex; justify-content: center;">
			<span class="pageNavi_front_image">
				<img src="/images/btn/btn_pageFirst.gif" border="0" alt="처음으로" onclick="goToPage(1)" />&nbsp;
				<img src="/images/btn/btn_pagePrev.gif" border="0" alt="이전페이지" onclick="changePage(-1)" />&nbsp;
				<strong id="current-page"></strong>&nbsp;
				<img src="/images/btn/btn_pageNext.gif" border="0" alt="다음페이지" onclick="changePage(1)" />&nbsp;
				<img src="/images/btn/btn_pageLast.gif" border="0" alt="마지막으로" onclick="goToPage(totalPages)" />&nbsp;
			</span>
		</div>
			<br/>
	</section>
	<footer>
		<%@ include file="/include/front/footer.jsp" %>
	</footer>
</div>
</form>
</body>
</html>