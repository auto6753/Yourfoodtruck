<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value="/resources/css/seller/psg/psg.css"/>" />
<div id="wrap">
탑승자알림
<input type="button" id="forPush" value="푸쉬알림 테스트">
<input type="text" id="pushText" value=""/>
<div id="forToken">
</div>
</div>
<h4>탑승자 현황 그래프</h4>
<div class="container">
	<div class="row">
		<div class="col">
		<div class="sidemenu">
			<jsp:include page="../sideMenuBar/sideMenuBar.jsp"></jsp:include>
		</div>
			<div id="Line_Controls_Chart">
				<div id="buttonbar">
					<form action="/seller/psgpush" method="GET">
						<input type="date" name="inputBeginDate" /> <input type="date"
							name="inputEndDate" />
						<button type="submit" id="search"></button>
					</form>
				</div>
				<!-- 라인 차트 생성할 영역 -->
				<div id="chart_div"></div>
			</div>
		</div>
		
	</div>
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
		var jsonresult=${resultlist};
		var chartarray =[];
		console.log(jsonresult);
		if(jsonresult == null || jsonresult == ""){
			$("#Line_Controls_Chart").css("visibility", "hidden");
			alert("탑승자가 없습니다"); 
		}else{
			console.log(jsonresult);
			var length = jsonresult.length;
			console.log(length);
			for(var i=0; i<length;i++) {
				var asdf = [];
				asdf.push(jsonresult[i].onboard_date);
				console.log(typeof jsonresult[i].onboard_date);
				asdf.push(jsonresult[i].count);
				chartarray.push(asdf);
			}
			console.log(chartarray);
			google.charts.load('current', {packages: ['corechart', 'bar']});
			google.charts.setOnLoadCallback(drawBasic);			 
				function drawBasic() {

					var data = new google.visualization.DataTable();
					data.addColumn('string', '요일');
					data.addColumn('number', '탑승자수(명)');
					for(var j=0; j<length;j++) {
						data.addRow(chartarray[j]);
					}
					//data.addRows([chartarray]);
					var options = {
						title: '탑승자 현황',
						hAxis: {
						title: '날짜',
						viewWindow: {
						min: [7, 30, 0],
						max: [17, 30, 0]
						}
					},
						vAxis: {
						title: '탑승자수(명)'
						}
					};
						var chart = new google.visualization.ColumnChart(
						document.getElementById('chart_div'));
						chart.draw(data, options);
				}
			} 
		});
</script>