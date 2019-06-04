<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/font/font.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script>
	$(document).ready(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 50) {
				$('.top').fadeIn();
			} else {
				$('.top').fadeOut();
			}
		});
		
		$('.top').click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
</script>
<style>
a.top {
  position: fixed;
  left: 93%;
  bottom: 10%;
  display: none;
  z-index: 1;
} 

.butn {
  -webkit-border-radius: 7;
  -moz-border-radius: 7;
  border-radius: 7px;
  color: #ff5e18;
  font-size: 20px;
  background: #ffffff;
  padding: 10px 20px 10px 20px;
  text-decoration: none;
}

.butn:hover {
  background: #ffffff;
  text-decoration: none;
}
</style>
</head>
<body>
	<a href="#" class="top">Top</a>
	<form id="salesInfo" action="salesInfo" method="GET">
		<div class="container">
			<nav id="navBar" class="row">
				<button class="col-md-2 navBtn butn hanna" name="pageName" value="todaySales">금일</button>
				<button class="col-md-2 navBtn butn hanna" name="pageName" value="weekSales">주간</button>
				<button class="col-md-2 navBtn butn hanna" name="pageName" value="monthSales">월간</button>
				<button class="col-md-2 navBtn butn hanna" name="pageName" value="yearSales">연간</button>
				<button class="col-md-2 navBtn butn hanna" name="pageName" value="byDaySales">요일별</button>
				<button class="col-md-2 navBtn butn hanna" name="pageName" value="byTimeSales">시간대별</button>
			</nav>
		</div>
	</form>
</body>
</html>


