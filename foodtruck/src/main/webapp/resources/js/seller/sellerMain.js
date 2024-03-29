/**
 * 
 */

function openMngSales(){
	var popupX = (window.screen.width / 2) - (1400 / 2);
	var popupY = (window.screen.height / 2) - (1000 / 2);
	
	var mngSales = window.open("/seller/mngSales", "매출관리", "width=1400, height=900, resizable=no, left=" + popupX + "," + "top=" + popupY);
//	mngSales.document.write("");
}





var chartDrowFun = {

	chartDrow : function() {
		var chartData = '';

		// 날짜형식 변경하고 싶으시면 이 부분 수정하세요.
		var chartDateformat = 'yyyy년MM월dd일';
		// 라인차트의 라인 수
		var chartLineCount = 10;
		// 컨트롤러 바 차트의 라인 수
		var controlLineCount = 10;

		function drawDashboard() {

			var data = new google.visualization.DataTable();
			// 그래프에 표시할 컬럼 추가
			data.addColumn('datetime', '날짜');
			data.addColumn('number', '매출액');

			// 그래프에 표시할 데이터
			var dataRow = [];
			
			for (var i = 0; i <= 30; i++) { // 랜덤 데이터 생성
				var total = Math.floor(Math.random() * 300) + 1;
				var sales = Math.floor(Math.random() * total) + 1;

				dataRow = [ new Date('2017', '09', i, '10'), sales];
				data.addRow(dataRow);
			}

			var chart = new google.visualization.ChartWrapper({
				chartType : 'LineChart',
				containerId : 'lineChartArea', // 라인 차트 생성할 영역
				options : {
					isStacked : 'percent',
					focusTarget : 'category',
					height : 500,
					width : '100%',
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
								},
								hours : {
									format : [ 'HH시' ]
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
				containerId : 'controlsArea', // control bar를 생성할 영역
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
										},
										hours : {
											format : [ 'HH시' ]
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
			}, false); // 화면
			// 크기에
			// 따라
			// 그래프
			// 크기
			// 변경
			dashboard.bind([ control ], [ chart ]);
			dashboard.draw(data);

		}
		google.charts.setOnLoadCallback(drawDashboard);

	}
}

$(document).ready(function() {
	google.charts.load('current', {
		'packages' : [ 'line', 'controls' ]
	});
	chartDrowFun.chartDrow(); // chartDrow() 실행
});

var chartDrowFun2 = {

		chartDrow2 : function() {
			var chartData = '';

			// 날짜형식 변경하고 싶으시면 이 부분 수정하세요.
			var chartDateformat = 'yyyy년MM월dd일';
			// 라인차트의 라인 수
			var chartLineCount = 10;
			// 컨트롤러 바 차트의 라인 수
			var controlLineCount = 10;

			function drawDashboard() {

				var data = new google.visualization.DataTable();
				// 그래프에 표시할 컬럼 추가
				data.addColumn('datetime', '날짜');
				data.addColumn('number', '탑승자');
				
				// 그래프에 표시할 데이터
				var dataRow = [];

				for (var i = 0; i <= 29; i++) { // 랜덤 데이터 생성
					var cus = Math.floor(Math.random() * 300) + 1;

					dataRow = [ new Date('2017', '09', i, '10'), cus];
					data.addRow(dataRow);
				}

				var chart = new google.visualization.ChartWrapper({
					chartType : 'LineChart',
					containerId : 'lineChartArea2', // 라인 차트 생성할 영역
					options : {
						isStacked : 'percent',
						focusTarget : 'category',
						height : 500,
						width : '100%',
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
									},
									hours : {
										format : [ 'HH시' ]
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
					containerId : 'controlsArea2', // control bar를 생성할 영역
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
											},
											hours : {
												format : [ 'HH시' ]
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
						.getElementById('Line_Controls_Chart2'));
				window.addEventListener('resize', function() {
					dashboard.draw(data);
				}, false); // 화면
				// 크기에
				// 따라
				// 그래프
				// 크기
				// 변경
				dashboard.bind([ control ], [ chart ]);
				dashboard.draw(data);

			}
			google.charts.setOnLoadCallback(drawDashboard);

		}
	}

	$(document).ready(function() {
		google.charts.load('current', {
			'packages' : [ 'line', 'controls' ]
		});
		chartDrowFun2.chartDrow2(); // chartDrow() 실행
	});