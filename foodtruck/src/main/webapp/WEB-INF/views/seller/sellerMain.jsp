<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet" href="<c:url value="/resources/css/seller/seller.css"/>">
<div class="title border">
	<ul class="navbar-nav ml-auto">
		<li class="nav-item active"><a class="nav-link" href="/project/seller">관리페이지 메인
			<span class="sr-only">(current)</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="/project/seller/menu">메뉴관리</a></li>
		<li class="nav-item"><a class="nav-link" href="/project/seller/location">위치관리</a></li>
		<li class="nav-item"><a class="nav-link" href="/project/seller/event">이벤트관리</a></li>
		<li class="nav-item"><a class="nav-link" href="/project/seller/psgpush">탑승자알림</a></li>
		<li class="nav-item"><a class="nav-link" href="/project/seller/callmanage">호출관리</a></li>
		<li class="nav-item"><a class="nav-link" href="/project/seller/order">주문관리</a></li>
		<li class="nav-item"><a class="nav-link" href="/project/seller/layout">레이아웃</a></li>
	</ul>
</div>
<div class="revenue border">
	<div class="revenueSpecific borderBlue"></div>
	<div class="revenueSpecific borderBlue"></div>
	<div class="revenueSpecific borderBlue" id="d"></div>
	<div class="revenueSpecific borderBlue"></div>
</div>
<div class="passenger border">
	<div class="passSpecific borderBlue"></div>
	<div class="passSpecific borderBlue"></div>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
$(function() {
	google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['Task', 'Count per Day'],
        ['핫도그',     54],
        ['커피',      77],
        ['닭강정',  24],
        ['샌드위치', 20],
        ['타꼬야끼',    30]
      ]);

      var options = {
        title: '하루 판매량',
        pieHole: 0.4,
      };
		var container = $("#d");
		console.log(container);
      var chart = new google.visualization.PieChart(document.getElementById('d'));
      chart.draw(data, options);
    }
});
      
    </script>
