<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF com.happySteps.
 * com.happySteps OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 com.happySteps ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 com.happySteps에 있으며,
 * com.happySteps이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * com.happySteps의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 com.happySteps All Rights Reserved.
 *
 *
 * Program		: com.happySteps
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241004044802][son062121#gmail.com][CREATE: Initial Release]
 */
 
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page info="/WEB-INF/view/backoffice/test/index.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
	<head>
		<%@ include file="/include/bfc/header.jsp" %>
	</head>

<body class="nav-md">
		<%@ include file="/include/bfc/navi.jsp" %>
			<div class="right_col" role="main">
			<!-- top tiles -->
				 <div class="row tile_count">
					 <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
						 <span class="count_top"><i class="fa fa-user"></i> 전체 고객수</span>
						 <div class="count green">2,500</div>
						 <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>4% </i> 지난주 대비</span>
					 </div>
					 <div class="col-md-3 col-sm-4 col-xs-6 tile_stats_count">
						 <span class="count_top"><i class="fa fa-money"></i> 판매 수익</span>
						 <div class="count green">2,500,000₩</div>
						 <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> 지난주 대비</span>
					 </div>
					 <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
						 <span class="count_top"><i class="fa fa-cube"></i> 판매량</span>
						 <div class="count red">4,567</div>
						 <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>12% </i> 지난주 대비</span>
					 </div>
					 <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
						 <span class="count_top"><i class="fa fa-globe"></i> 자유게시판</span>
						 <div class="count ">2,315</div>
						 <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> 지난주 대비</span>
					 </div>
					 <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
						 <span class="count_top"><i class="fa fa-comments"></i> 고객센터 </span>
						 <div class="count">7,325</div>
						 <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>10% </i> 지난주 대비</span>
					 </div>
				 </div>
				 <!-- /top tiles -->

				 <div class="row">
					 <div class="col-md-12 col-sm-12 col-xs-12">
						 <div class="dashboard_graph">

							 <div class="row x_title">
								 <div class="col-md-6">
									 <h3>영업 이익 그래프 <small> 날짜별 </small></h3>
								 </div>
								 <div class="col-md-6">
									 <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
										 <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
										 <span>설정된날짜</span> <b class="caret"></b>
									 </div>
								 </div>
							 </div>

							 <div class="col-md-9 col-sm-9 col-xs-12">
								 <div id="chart_plot_01" class="demo-placeholder"></div>
							 </div>
							 <div class="col-md-3 col-sm-3 col-xs-12 bg-white">
								 <div class="x_title">
									 <h3>월별 매출</h3>
									 <div class="clearfix"></div>
								 </div>

								 <div class="col-md-12 col-sm-12 col-xs-6">
									 <div>
										 <p>9월</p>
										 <div class="">
											 <div class="progress progress_sm" style="width: 76%;">
												 <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="80"></div>
											 </div>
										 </div>
									 </div>
									 <div>
										 <p>8월</p>
										 <div class="">
											 <div class="progress progress_sm" style="width: 76%;">
												 <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="60"></div>
											 </div>
										 </div>
									 </div>
								 </div>
								 <div class="col-md-12 col-sm-12 col-xs-6">
									 <div>
										 <p>7월</p>
										 <div class="">
											 <div class="progress progress_sm" style="width: 76%;">
												 <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="40"></div>
											 </div>
										 </div>
									 </div>
									 <div>
										 <p>6월</p>
										 <div class="">
											 <div class="progress progress_sm" style="width: 76%;">
												 <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="50"></div>
											 </div>
										 </div>
									 </div>
								 </div>
							 </div>

							 <div class="clearfix"></div>
						 </div>
					 </div>

				 </div>
				 <br />

				 <div class="row">

					 <div class="col-md-4 col-sm-4 col-xs-12">
						 <div class="x_panel tile fixed_height_320 overflow_hidden">
							 <div class="x_title">
								 <h3>판매순위(동물별)</h3>
								 <div class="clearfix"></div>
							 </div>
							 <div class="x_content">
								 <table class="" style="width:100%">
									 <tr>
										 <th style="width:37%;">
											 <p>Top 5</p>
										 </th>
										 <th>
											 <div class="col-lg-5 col-md-6 col-sm-6 col-xs-6">
												 <p class="">종류</p>
											 </div>
											 <div class="col-lg-7 col-md-3 col-sm-3 col-xs-3">
												 <p class="">퍼센트</p>
											 </div>
										 </th>
									 </tr>
									 <tr>
										 <td>
											 <canvas class="canvasDoughnut2" height="140" width="140" style="margin: 15px 10px 10px 0"></canvas>
										 </td>
										 <td>
											 <table class="tile_info">
												 <tr>
													 <td>
														 <p><i class="fa fa-square aero"></i>강아지 </p>
													 </td>
													 <td>50%</td>
												 </tr>
												 <tr>
													 <td>
														 <p><i class="fa fa-square purple"></i>고양이 </p>
													 </td>
													 <td>30%</td>
												 </tr>
												 <tr>
													 <td>
														 <p><i class="fa fa-square red"></i>햄스터 </p>
													 </td>
													 <td>10%</td>
												 </tr>
												 <tr>
													 <td>
														 <p><i class="fa fa-square green"></i>파충류 </p>
													 </td>
													 <td>10%</td>
												 </tr>
												 <tr>
													 <td>
														 <p><i class="fa fa-square blue"></i>기타 </p>
													 </td>
													 <td>10%</td>
												 </tr>
											 </table>
										 </td>
									 </tr>
								 </table>
							 </div>
						 </div>
					 </div>
					 <div class="col-md-4 col-sm-4 col-xs-12">
						 <div class="x_panel tile fixed_height_320 overflow_hidden">
							 <div class="x_title">
								 <h3>판매순위(물품별)</h3>
								 <div class="clearfix"></div>
							 </div>
							 <div class="x_content">
								 <table class="" style="width:100%">
									 <tr>
										 <th style="width:37%;">
											 <p>Top 4</p>
										 </th>
										 <th>
											 <div class="col-lg-5 col-md-7 col-sm-7 col-xs-7">
												 <p class="">종류</p>
											 </div>
											 <div class="col-lg-7 col-md-5 col-sm-5 col-xs-5">
												 <p class="">퍼센트</p>
											 </div>
										 </th>
									 </tr>
									 <tr>
										 <td>
											 <canvas class="canvasDoughnut" height="140" width="140" style="margin: 15px 10px 10px 0"></canvas>
										 </td>
										 <td>
											 <table class="tile_info">
												 <tr>
													 <td>
														 <p><i class="fa fa-square aero"></i>사료 </p>
													 </td>
													 <td>40%</td>
												 </tr>
												 <tr>
													 <td>
														 <p><i class="fa fa-square purple"></i>간식 </p>
													 </td>
													 <td>30%</td>
												 </tr>
												 <tr>
													 <td>
														 <p><i class="fa fa-square red"></i>하우스 </p>
													 </td>
													 <td>20%</td>
												 </tr>
												 <tr>
													 <td>
														 <p><i class="fa fa-square blue"></i>기타 </p>
													 </td>
													 <td>10%</td>
												 </tr>
											 </table>
										 </td>
									 </tr>
								 </table>
							 </div>
						 </div>
					 </div>
					 <div class="col-md-4 col-sm-4 col-xs-12">
						 <div class="x_panel tile fixed_height_320 overflow_hidden">
							 <div class="x_title">
								 <h3>가입(지역별)</h3>
								 <div class="clearfix"></div>
							 </div>
							 <div class="x_content">
								 <table class="" style="width:100%">
									 <tr>
										 <th style="width:37%;">
											 <p>Top 5</p>
										 </th>
										 <th>
											 <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
												 <p class="">Device</p>
											 </div>
											 <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
												 <p class="">Progress</p>
											 </div>
										 </th>
									 </tr>
									 <tr>
										 <td>
											 <canvas class="canvasDoughnut" height="140" width="140" style="margin: 15px 10px 10px 0"></canvas>
										 </td>
										 <td>
											 <table class="tile_info">
												 <tr>
													 <td>
														 <p><i class="fa fa-square blue"></i>IOS </p>
													 </td>
													 <td>30%</td>
												 </tr>
												 <tr>
													 <td>
														 <p><i class="fa fa-square green"></i>Android </p>
													 </td>
													 <td>10%</td>
												 </tr>
												 <tr>
													 <td>
														 <p><i class="fa fa-square purple"></i>Blackberry </p>
													 </td>
													 <td>20%</td>
												 </tr>
												 <tr>
													 <td>
														 <p><i class="fa fa-square aero"></i>Symbian </p>
													 </td>
													 <td>15%</td>
												 </tr>
												 <tr>
													 <td>
														 <p><i class="fa fa-square red"></i>Others </p>
													 </td>
													 <td>30%</td>
												 </tr>
											 </table>
										 </td>
									 </tr>
								 </table>
							 </div>
						 </div>
					 </div>

				 </div>
			 </div>


	<!-- /page content -->

	<!-- footer content -->
	<footer>
		<%@ include file="/include/bfc/footer.jsp" %>
	</footer>
	<!-- /footer content -->

	<script>
			function init_chart_doughnut() {
				if (typeof Chart === 'undefined') {
					return;
				}

				console.log('init_chart_doughnut');

				if ($('.canvasDoughnut').length) {
					var chart_doughnut_settings = {
						type: 'doughnut',
						data: {
							labels: ["사료", "간식", "하우스", "기타"],
							datasets: [{
								data: [40, 30, 20, 10],
								backgroundColor: ["#BDC3C7", "#9B59B6", "#E74C3C", "#26B99A", "#3498DB"],
								hoverBackgroundColor: ["#CFD4D8", "#B370CF", "#E95E4F", "#36CAAB", "#49A9EA"]
							}]
						},
						options: {
							legend: false,
							responsive: false
						}
					};

					$('.canvasDoughnut').each(function() {
						var chart_element = $(this);
						var chart_doughnut = new Chart(chart_element, chart_doughnut_settings);
					});
				}
			}

			init_chart_doughnut();
		</script>
	
		 <script>
			// 기존의 init_chart_doughnut 대신 init_chart_doughnut2 호출
			function init_chart_doughnut2() {
				if (typeof Chart === 'undefined') {
					return;
				}

				console.log('init_chart_doughnut2');

				if ($('.canvasDoughnut2').length) {
					var chart_doughnut2_settings = {
						type: 'doughnut',
						data: {
							labels: ["강아지", "고양이", "햄스터", "파충류", "기타"],
							datasets: [{
								data: [50, 30, 10, 10, 10],
								backgroundColor: ["#BDC3C7", "#9B59B6", "#E74C3C", "#26B99A", "#3498DB"],
								hoverBackgroundColor: ["#CFD4D8", "#B370CF", "#E95E4F", "#36CAAB", "#49A9EA"]
							}]
						},
						options: {
							legend: false,
							responsive: false
						}
					};

					$('.canvasDoughnut2').each(function() {
						var chart_element2 = $(this);
						var chart_doughnut2 = new Chart(chart_element2, chart_doughnut2_settings);
					});
				}
			}

			// init_chart_doughnut2 함수 호출
			init_chart_doughnut2();
		</script>
	
	<script type="text/javascript">
		$(function() {
			moment.locale('ko'); // 한국어 로케일 설정

			$('#reportrange').daterangepicker({
				locale: {
					format: 'YYYY년 MM월 DD일',
					separator: ' - ',
					applyLabel: '적용',
					cancelLabel: '취소',
					fromLabel: '시작',
					toLabel: '종료',
					customRangeLabel: '사용자 정의',
					daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
					monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
					firstDay: 0
				},
				startDate: moment().subtract(29, 'days'),
				endDate: moment()
			});
		});
	</script>
	</body>
</html>
