<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../../header/header.jsp"></jsp:include>
<div id="wrap">
탑승자알림
<input type="button" id="forPush" value="푸쉬알림 테스트">
<input type="text" id="pushText" value=""/>
<div id="forToken"></div>
</div>
<h4>탑승자 현황 그래프</h4>
    <div id="Line_Controls_Chart">
      <!-- 라인 차트 생성할 영역 -->
      	<c:forEach var="i" items="${requestScope.On}">
          <div id="lineChartArea" style="padding:0px 20px 0px 0px;">
          	<input type="text" class="On_date" value ="${i.count_data}">
          </div>
      <!-- 컨트롤바를 생성할 영역 -->
          <div id="controlsArea" style="padding:0px 20px 0px 0px;"></div>
        <input class="Onboard"  value ="${i.onboard_date}">
        </c:forEach>
        </div>
		
		
<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.9.3/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.4/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.4/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.4/firebase-messaging.js"></script>
<%-- <script type="text/javascript" src="<c:url value="/resources/js/seller/psgpush.js"/>"></script> --%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- 구글차트 API js -->
<script>
	$(document).ready(function() {
		var truck_code = "${sessionScope.seller.truck_code}";
		alert(truck_code);
		/* $.ajax({
			type : "post",
			url : "/seller/CountOnboard",
			data : {
				"truck_code" : truck_code
			},success : function(data) {
				alert("성공");
			},error : function(err) {
				alert(err);
			}
		}); */
		/* if($(".Onboard").val() == null){
			$("#Line_Controls_Chart").css("visibility", "hidden");
			alert("탑승자가 없습니다");
		}else{
			var chartDrowFun = {
				chartDrow : function() {
					var chartData = '';
						//날짜형식 변경하고 싶으시면 이 부분 수정하세요.
					var chartDateformat = '';
						//라인차트의 라인 수
					var chartLineCount = 10;
						//컨트롤러 바 차트의 라인 수
					var controlLineCount = 10;
					function drawDashboard() {
						var data = new google.visualization.DataTable();
							//그래프에 표시할 컬럼 추가
						data.addColumn('datetime', '날짜');
						data.addColumn('number', '탑승자수');

							//그래프에 표시할 데이터
						var dataRow = [];
						var on = $(".On_date").val();
						alert(on);
						for (var i = 0; i < on; i++) { //랜덤 데이터 생성
							var total = "${On.count}";
							dataRow = [ ${On.onboard_date}, total ];
							data.addRow(dataRow);
						}

						var chart = new google.visualization.ChartWrapper({
							chartType : 'LineChart',
							containerId : 'lineChartArea', //라인 차트 생성할 영역
							options : {
								isStacked : 'percent',
								focusTarget : 'category',
								height : 350,
								width : '60%',
								legend : {
									position : "top",
									textStyle : {
										fontSize : 13
									}
								},
								pointSize : 5,
								tooltip : {
									textStyle : {
										fontSize : 12
									},
									showColorCode : true,
									trigger : 'both'
								},
								hAxis : {
									format : chartDateformat,
									gridlines : {
										count : chartLineCount,
										units : {
											years : {
												format : [ 'yyyy년' ]
											},
											months : {
												format : [ 'MM월' ]
											},
											days : {
												format : [ 'dd일' ]
											}
										}
									},
									textStyle : {
										fontSize : 12
									}
								},
								vAxis : {
									minValue : 100,
									viewWindow : {
										min : 0
									},
									gridlines : {
										count : -1
									},
									textStyle : {
										fontSize : 12
									}
								},
								animation : {
									startup : true,
									duration : 1000,
									easing : 'in'
								},
								annotations : {
									pattern : chartDateformat,
									textStyle : {
										fontSize : 15,
										bold : true,
										italic : true,
										color : '#871b47',
										auraColor : '#d799ae',
										opacity : 0.8,
										pattern : chartDateformat
									}
								}
							}
						});
						var control = new google.visualization.ControlWrapper({
							controlType : 'ChartRangeFilter',
							containerId : 'controlsArea', //control bar를 생성할 영역
							options : {
								ui : {
									chartType : 'LineChart',
									chartOptions : {
										chartArea : {
											'width' : '60%',
											'height' : 80
										},
											hAxis : {
												'baselineColor' : 'none',
												format : chartDateformat,
												textStyle : {
													fontSize : 12
												},
												gridlines : {
													count : controlLineCount,
													units : {
														years : {
															format : [ 'yyyy년' ]
														},
														months : {
															format : [ 'MM월' ]
														},
														days : {
															format : [ 'dd일' ]
														}													
													}
												}
											}
										}
									},
									filterColumnIndex : 0
								}
							});

							var date_formatter = new google.visualization.DateFormat({
								pattern : chartDateformat
							});
							date_formatter.format(data, 0);

							var dashboard = new google.visualization.Dashboard(document
									.getElementById('Line_Controls_Chart'));
							window.addEventListener('resize', function() {
								dashboard.draw(data);
							}, false); //화면 크기에 따라 그래프 크기 변경
							dashboard.bind([ control ], [ chart ]);
							dashboard.draw(data);

						}
						google.charts.setOnLoadCallback(drawDashboard);

					}
				}
			google.charts.load('current', {'packages' : [ 'line', 'controls' ]});
			chartDrowFun.chartDrow(); //chartDrow() 실행

		} */
	});
</script>