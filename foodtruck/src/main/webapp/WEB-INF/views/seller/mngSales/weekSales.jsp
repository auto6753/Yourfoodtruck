<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/seller/mngSales/mngSales.css"/>"> <!-- 사용자 css -->
<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/seller/mngSales.js"/>"></script> <!-- 사용자 js -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> <!-- 구글차트 API js -->
<title>매출관리 - 주간</title>
</head>
<body>
	<div id="wrap">
		<jsp:include page="navBar.jsp"></jsp:include>
		<section id="salesSec">
		</section>
	</div>
	
	<!-- Hidden Input Tag Area -->
		<input id="curYear2" type="hidden" value="${curYear4}"/> <!-- 현재 연도 값(2자리) -->
		<input id="curYear4" type="hidden" value="${curYear4}"/> <!-- 현재 연도 값(4자리) -->
		<input id="curMonth" type="hidden" value="${curMonth}"/> <!-- 현재 월 값 -->
		
		<input id="monthSales" type="hidden" value="${monthSales.get(0)}"/>
	<!-- Hidden Input Tag Area-->
</body>
</html>