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
		 </div>
</div>
 <div class="pull-right">
		 HappyStpes - Bootstrap Admin Template by Colorlib
 </div>
 <div class="clearfix"></div>

		<!-- jQuery -->
		<script src="/bfc/vendors/jquery/dist/jquery.min.js"></script>
		<!-- Bootstrap -->
		<script src="/bfc/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
		<!-- FastClick -->
		<script src="/bfc/vendors/fastclick/lib/fastclick.js"></script>
		<!-- NProgress -->
		<script src="/bfc/vendors/nprogress/nprogress.js"></script>
		<!-- Chart.js -->
		<script src="/bfc/vendors/Chart.js/dist/Chart.min.js"></script>
		<!-- gauge.js -->
		<script src="/bfc/vendors/gauge.js/dist/gauge.min.js"></script>
		<!-- bootstrap-progressbar -->
		<script src="/bfc/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
		<!-- iCheck -->
		<script src="/bfc/vendors/iCheck/icheck.min.js"></script>
		<!-- Skycons -->
		<script src="/bfc/vendors/skycons/skycons.js"></script>
		<!-- Flot -->
		<script src="/bfc/vendors/Flot/jquery.flot.js"></script>
		<script src="/bfc/vendors/Flot/jquery.flot.pie.js"></script>
		<script src="/bfc/vendors/Flot/jquery.flot.time.js"></script>
		<script src="/bfc/vendors/Flot/jquery.flot.stack.js"></script>
		<script src="/bfc/vendors/Flot/jquery.flot.resize.js"></script>
		<!-- Flot plugins -->
		<script src="/bfc/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
		<script src="/bfc/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
		<script src="/bfc/vendors/flot.curvedlines/curvedLines.js"></script>
		<!-- DateJS -->
		<script src="/bfc/vendors/DateJS/build/date.js"></script>
		<!-- JQVMap -->
		<script src="/bfc/vendors/jqvmap/dist/jquery.vmap.js"></script>
		<script src="/bfc/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
		<script src="/bfc/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
		<!-- bootstrap-daterangepicker -->
		<script src="/bfc/vendors/moment/min/moment.min.js"></script>
		<script src="/bfc/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
	
		<!-- korea-calendar -->
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/moment/locale/ko.js"></script>

		<!-- Custom Theme Scripts	-->
		<script src="/bfc/build/js/custom.min.js"></script>
	
		<script>
			function gd(year, month, day) {
					return new Date(year, month - 1, day).getTime();
			}

			function randNum() {
					return Math.floor(Math.random() * 100);
			}

			function init_flot_chart() {
				
					if (typeof ($.plot) === 'undefined') { 
						return; 
					}

					console.log('init_flot_chart');

					var arr_data1 = [
							[gd(2024, 10, 1), 15000],
							[gd(2024, 10, 2), 20000],
							[gd(2024, 10, 3), 17000],
							[gd(2024, 10, 4), 22000],
							[gd(2024, 10, 5), 25000],
							[gd(2024, 10, 6), 19000],
							[gd(2024, 10, 7), 30000]
					];

					var chart_plot_01_settings = {
						series: {
								lines: {
										show: true,
										fill: true
								},
								points: {
										radius: 3,
										show: true
								},
								shadowSize: 2
						},
						grid: {
								hoverable: true,
								clickable: true,
								tickColor: "#d5d5d5",
								borderWidth: 1,
								color: '#fff'
						},
						colors: ["#26B99A"],
						xaxis: {
								mode: "time",
								tickSize: [1, "day"],
								timeformat: "%y년 %m월 %d일", // 한글 형식으로 변경
								axisLabel: "날짜",
								axisLabelUseCanvas: true,
								axisLabelFontSizePixels: 12,
								axisLabelFontFamily: 'Verdana, Arial',
								axisLabelPadding: 10
						},
						yaxis: {
								min: 0,
								ticks: 8,
								axisLabel: "영업 이익 (단위: 원)",
								tickColor: "rgba(51, 51, 51, 0.06)"
						},
						tooltip: true,
						tooltipOpts: {
								content: "%s: %y.0 원",
								shifts: {
										x: -30,
										y: -50
								}
						}
					};
					
					if ($("#chart_plot_01").length) {
							console.log('Plot1');
							$.plot($("#chart_plot_01"), [arr_data1], chart_plot_01_settings);
					}
			}
</script>

	