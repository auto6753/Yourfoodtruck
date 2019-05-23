<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/seller/mngSales/todaySales.js"/>"></script> <!-- 사용자 js -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> <!-- 구글차트 API js -->
<title>매출관리 - 금일</title>
</head>
<body>
	<div id="wrap">
		<jsp:include page="navBar.jsp"></jsp:include>
		<div class="container">
			<div class="row">
				<section id="salesSec" class="col-md-12">
					<table border="1">
						<tr>
							<td></td>
							<td>회원</td>
							<td>비회원</td>
							<td>전체</td>
						</tr>
						<tr>
							<td>현금</td>
							<td><fmt:formatNumber value="${mCashSales}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nCashSales}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalCashSales}" pattern="#,###"/></td>
						</tr>
						<tr>
							<td>카드</td>
							<td><fmt:formatNumber value="${mCardSales}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nCardSales}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalCardSales}" pattern="#,###"/></td>
						</tr>
						<tr>
							<td>카카오페이</td>
							<td><fmt:formatNumber value="${mKakaoSales}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nKakaoSales}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalKakaoSales}" pattern="#,###"/></td>
						</tr>
						<tr>
							<td>총</td>
							<td><fmt:formatNumber value="${mTotalSales}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nTotalSales}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalSales}" pattern="#,###"/></td>
						</tr>
					</table>
				</section>
			</div>
		</div>
	</div>
	
	<!-- Hidden Input Area -->
		<input type="hidden" id="menuJArray" value="${menuJArray}"/>
	<!-- Hidden Input Area -->
</body>
</html>