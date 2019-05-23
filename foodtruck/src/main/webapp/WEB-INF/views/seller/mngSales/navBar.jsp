<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/seller/mngSales/navBar.js"/>"></script>
</head>
<body>
			<form id="salesInfo" action="salesInfo" method="GET">
				<div class="container">
					<nav id="navBar" class="row">
						<button class="col-md-2 navBtn" name="pageName" value="todaySales">금일</button>
						<button class="col-md-2 navBtn" name="pageName" value="weekSales">주간</button>
						<button class="col-md-2 navBtn" name="pageName" value="monthSales">월간</button>
						<button class="col-md-2 navBtn" name="pageName" value="yearSales">연간</button>
						<button class="col-md-2 navBtn" name="pageName" value="byDaySales">요일별</button>
						<button class="col-md-2 navBtn" name="pageName" value="byTimeSales">시간대별</button>
					</nav>
				</div>
			</form>
</body>
</html>


