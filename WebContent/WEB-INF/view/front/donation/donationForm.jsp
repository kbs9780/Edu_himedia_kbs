<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 himedia.co.kr에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 happySteps All Rights Reserved.
 *
 *
 * Program		:com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: donationForm.jsp
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [202410072000][rkdcodbs77#naver.com][CREATE: Initial Release]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/donation/donationForm.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/layoutSubmain.css" />
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>후원하기</title>
	<style>

	.donation-form h2 {
		text-align: center;
		font-size: 24px;
		font-weight: 700;
	}

	label, legend, input {
		font-size: 16px;
	}

		.donation-form {
			max-width: 40%;
			margin: 20px auto;
			padding: 20px;
			border: 1px solid #ddd;
			border-radius: 8px;
		}

		.donation-form h2 {
			text-align: center;
			font-size: 24px;
		}

		fieldset {
			margin-bottom: 20px;
			padding: 10px;
			border: 1px solid #ccc;
			border-radius: 5px;
		}

		legend {
			font-weight: bold;
			font-size: 18px;
		}

		label {
			display: block;
			margin: 10px 0 5px;
		}

		input[type="text"],
		input[type="email"],
		input[type="tel"],
		input[type="number"] {
			width: 90%;
			padding: 8px;
			margin-bottom: 10px;
			border: 1px solid #ccc;
			border-radius: 4px;
		}

		.cms-info {
			display: none;
		}

		input[name="payment_method"][value="cms"]:checked ~ .cms-info {
			display: block;
		}
		button {
				width: 100%;
				padding: 10px;
				background-color: #F9F3EC;
				color: black;
				border: none;
				border-radius: 4px;
				cursor: pointer;
				font-size: 16px;
				font-family: 'Nanum Gothic', sans-serif;
				font-weight: 700;
			}
	
		button[type="reset"] {
			background-color: #D3D3D3
		}
		/* 기본 레이아웃 */
.donation-form {
    max-width: 40%;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
}

/* 모바일 화면을 위한 반응형 설정 */
@media (max-width: 768px) {
    .donation-form {
        max-width: 100%; /* 화면 너비에 맞게 크기 조정 */
        padding: 15px;
    }

    input[type="text"],
    input[type="email"],
    input[type="tel"],
    input[type="number"],
    button {
        width: 100%; /* 입력 필드와 버튼이 화면에 맞게 너비 조정 */
    }

    .donation-form h2 {
        font-size: 20px; /* 헤더 글자 크기 조정 */
    }

    fieldset {
        padding: 15px; /* 폼 필드 여백 조정 */
    }

    button {
        font-size: 14px; /* 버튼 글자 크기 조정 */
    }
}

/* 아주 작은 화면 (모바일 세로 모드 등) */
@media (max-width: 480px) {
    .donation-form {
        padding: 10px;
    }

    input[type="text"],
    input[type="email"],
    input[type="tel"],
    input[type="number"] {
        padding: 3px; /* 더 작은 화면에서 여백을 키워서 사용 편의성 높이기 */
    }

    button {
        padding: 12px; /* 버튼 크기 키우기 */
    }
}
	</style>
	<script></script>
</head>
<body>
	<form>
		<div class="donation-form">
		<div style="position: relative; height: 250px; overflow: hidden; margin-top: 10px;">
				<a href="/front/">
				<img src="/images/logo/logo3.png" alt="로고" style="width: 380px; height: 250px; object-fit: cover; display: block; margin: 0 auto;" />
				</a>
				</div>
				<div style="text-align: left; margin: 30px 0; font-size: 18px;">
				※휴대전화번호 형식의 평생계좌는 CMS자동이체신청이 불가합니다.<br>
				※CMS자동이체 신청 시 전자금융거래법 제15조 및 동법 시행령 제10조에 따라 출금동의 인증이 필요합니다.<br>
				</div>
			<div style="text-align: center; margin: 30px 0; font-size: 20px;"><strong>후원신청</strong></div>
			<!-- 기본 정보 -->
			<fieldset>
				<legend>기본 정보</legend>
				
				<!-- 개인/단체 선택 -->
				<label><input type="radio" name="type" value="individual" checked> 개인</label>
				<label><input type="radio" name="type" value="organization"> 단체</label><br>
				
				<!-- 이름(단체명) -->
				<label>이름(단체명):</label>
				<input type="text" name="name" required><br>
				
				<!-- 연락처 -->
				<label>연락처:</label>
				<input type="tel" name="contact" required><br>
				
				<!-- 주민등록번호(사업자등록번호) -->
				<label>주민등록번호(사업자등록번호):</label>
				<input type="text" name="id_number" placeholder="주민(사업자)등록번호"><br><br>
				<small>*개인정보보호법 개정에 따라 기부금영수증 발행 시, 주민(사업자)등록번호를 기입해야 합니다.<br> &nbsp;&nbsp;발급을 원하지 않으실 경우 생년월일을 기입해주세요.</small><br>
				<br>
				<!-- 주소 검색 -->
				<label>주소:</label>
				<input type="text" name="address" placeholder="주소 검색"><br>
				
				<!-- 이메일 -->
				<label>이메일:</label>
				<input type="email" name="email" required><br>
				
				<!-- 연말정산 간소화 여부 -->
				<label>연말정산 간소화 여부:</label>
				<label><input type="radio" name="tax_simplification" value="agree" checked> 동의</label>
				<label><input type="radio" name="tax_simplification" value="disagree"> 미동의</label><br>
			</fieldset>

			<!-- 후원 정보 -->
			<fieldset>
				<legend>후원 정보</legend>
				
				<!-- 정기/비정기 후원 선택 -->
				<label><input type="radio" name="donation_type" value="regular" checked> 정기 후원</label>
				<label><input type="radio" name="donation_type" value="irregular"> 비정기 후원</label><br>
				
				<!-- 후원 금액 -->
				<label>후원 금액:</label>
				<label><input type="radio" name="donation_amount" value="5000"> 5,000원</label>
				<label><input type="radio" name="donation_amount" value="10000"> 10,000원</label>
				<label><input type="radio" name="donation_amount" value="30000"> 30,000원</label>
				<label><input type="radio" name="donation_amount" value="other"> 기타</label>
				<input type="number" name="custom_amount" placeholder="직접 입력" min="30000" disabled><br>
			</fieldset>

			<!-- 후원 방법 -->
			<fieldset>
				<legend>후원 방법</legend>
				
				<!-- 계좌 입금 -->
				<label><input type="radio" name="payment_method" value="bank" checked> 계좌 입금 (국민은행 000-01-0000-000 / 예금주: HappySteps)</label><br>
				
				<!-- CMS 자동이체 -->
				<label><input type="radio" name="payment_method" value="cms"> CMS 자동이체</label><br>
				
				<!-- CMS 출금 정보 -->
				<div class="cms-info">
					<label>은행명:</label>
					<input type="text" name="bank_name"><br>
					<label>계좌번호:</label>
					<input type="text" name="account_number"><br>
					<label>예금주명:</label>
					<input type="text" name="account_holder"><br>
					<label>매월 이체일:</label>
					<select name="transfer_day">
						<option value="10">10일</option>
						<option value="25">25일</option>
					</select><br>
					<label>전화번호:</label>
					<input type="tel" name="phone_number"><br>
				</div>
			</fieldset>

			<!-- 버튼 -->
			<button type="submit">신청 완료</button>
			<button type="reset">취소</button>
		</div>
	<footer>
		<%@ include file="/include/front/login_footer.jsp" %>
	</footer>
	</form>
</body>
</html>