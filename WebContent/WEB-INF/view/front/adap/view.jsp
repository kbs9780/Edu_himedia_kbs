<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/front/adap/view.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="pragma" content="no-cache" />
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<title>동물 입양공고 상세조회</title>
	<%@ include file="/include/front/header.jsp" %>
	<%@ include file="/include/front/top.jsp" %>
<style>
		table {
			width: 100%;
			border-collapse: collapse;
			margin-top: 20px;
			font-family: Arial, sans-serif;
		}
		
		th, td {
			padding: 12px 15px;
			text-align: left;
			border: 1px solid #ddd;
		}
		
		th {
			background-color: #f4f4f4;
			font-weight: bold;
		}
		
		td {
			background-color: #fff;
		}
		
		tr:nth-child(even) td {
			background-color: #f9f9f9;
		}
		
		tr:hover td {
			background-color: #f1f1f1;
		}
		
		h1 {
			font-size: 24px;
			margin-bottom: 10px;
		}
		
		button:hover {
			background-color: #45a049;
		}
		
		/* 반응형 설정: 화면 크기가 작아지면 테이블이 가로 스크롤 가능하도록 */
		@media ( max-width : 768px) {
			table {
				display: block;
				overflow-x: auto;
				white-space: nowrap;
			}
			th, td {
				white-space: nowrap;
			}
		}
</style>
<script>

function adapAnimal() {
	if (confirm("입양하시겠습니까?")) {
		// 사용자가 확인을 클릭한 경우, 지정된 URL로 이동
		window.location.href = "/front/adap/list.web";
	}
	return false;
}

// 페이지 로드 시 데이터 가져오기
$(document).ready(function() {
					// URL에서 파라미터 가져오기
					const urlParams = new URLSearchParams(
							window.location.search);
					const animalId = urlParams
							.get('PBLANC_IDNTFY_NO');
					const page = urlParams
							.get('page');
					const index = urlParams
							.get('index');

					if (animalId) {
						// AJAX 요청
						$.ajax({	url : '/front/adap/view.json',
									method : 'POST',
									contentType : 'application/json',
									data : JSON.stringify({
												PBLANC_IDNTFY_NO : animalId,
												page : page,
												index : index
											}),
									success : function(response) {
										if (response
												&& response.AbdmAnimalProtect
												&& response.AbdmAnimalProtect[1].row[0]) {
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
									error : function(xhr,status, error) {
										console.error('API 호출 실패:',error);
										alert('상세 정보를 가져오는 데 오류가 발생했습니다.');
									}
								});
					} else {
						console.error('동물 ID가 없습니다.');
					}
				});
</script>
</head>
<body>
	<form id="frmMain" method="POST">
		<div class="container">
			<section class="content">
				<nav>
					<%@ include file="/include/front/gnbAdap.jsp" %>
				</nav>
				<h1>상세 정보</h1>
				<table>
					<thead>
						<tr>
							<th>항목</th>
							<th colspan="3">내용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>공고번호</th>
							<td id="pblanc_idntfy_no" colspan="3"></td>
						</tr>
						<tr>
							<th>품종</th>
							<td id="species_nm" colspan="3"></td>
						</tr>
						<tr>
							<th>색상</th>
							<td id="color_nm" colspan="3"></td>
						</tr>
						<tr>
							<th>성별</th>
							<td id="sex_nm"></td>
							<th>중성화</th>
							<td id="neut_yn"></td>
						</tr>
						<tr>
							<th>나이</th>
							<td id="age_info"></td>
							<th>체중</th>
							<td id="bdwgh_info"></td>
						</tr>
						<tr>
							<th>동물의 특이사항</th>
							<td id="sfetr_info" colspan="3"></td>
						</tr>
						<tr>
							<th>특징</th>
							<td id="partclr_matr" colspan="3"></td>
						</tr>
						<tr>
							<th>발견장소</th>
							<td id="discvry_plc_info"></td>
							<th>접수일시</th>
							<td id="recept_de"></td>
						</tr>
						<tr>
							<th>관할기관 이름</th>
							<td id="shter_nm"></td>
							<th>관할기관 연락처</th>
							<td id="shter_telno"></td>
						</tr>
						<tr>
							<th>동물이 보호되는 장소</th>
							<td id="protect_plc"></td>
							<th>관할 기관 이름</th>
							<td id="jurisd_inst_nm"></td>
						</tr>
						<tr>
							<th>담당자 이름</th>
							<td id="chrgpsn_nm"></td>
							<th>담당자 연락처</th>
							<td id="chrgpsn_contct_no"></td>
						</tr>
					</tbody>
				</table>
				<br>
					<input type="button" value="입양하기" style="width:200px" onClick="adapAnimal();"/>
			</section>
			<footer>
				<%@ include file="/include/front/footer.jsp" %>
			</footer>
		</div>
	</form>
</body>
</html>