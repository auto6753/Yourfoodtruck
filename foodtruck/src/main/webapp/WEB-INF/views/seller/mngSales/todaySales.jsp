<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> <!-- 구글차트 API js -->
<script type="text/javascript" src="/resources/js/seller/mngSales/todaySales.js"></script>
<title>매출관리 - 금일</title>
</head>
<body>
	<div id="wrap">
		<jsp:include page="navBar.jsp"></jsp:include>
		<div class="container">
			<div class="row">
				<section id="salesSec" class="col-md-12">
					<div id="chart_div"></div>
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
							<td>합계</td>
							<td><fmt:formatNumber value="${mTotalSales}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nTotalSales}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalSales}" pattern="#,###"/></td>
						</tr>
					</table>
					<table border="1">
						<tr>
							<td>메뉴코드</td>
							<td>메뉴명</td>
							<td>단가</td>
							<td>판매량</td>
							<td>매출액</td>
						</tr>
						<c:forEach var="menuSales" items="${menuSales}">
							<tr>
								<td>${menuSales.menu_code}</td>
								<td>${menuSales.menu_name}</td>
								<td><fmt:formatNumber value="${menuSales.unitPrice}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${menuSales.amount}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${menuSales.totalPrice}" pattern="#,###"/></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="3">합계</td>
							<td>${totalAmount}</td>
							<td><fmt:formatNumber value="${totalSales}" pattern="#,###"/></td>
						</tr>
					</table>
				</section>
			</div>
		</div>
	</div>
	
	<input type="hidden" id="mCashSales" value="${mCashSales}"/>
	<input type="hidden" id="nCashSales" value="${nCashSales}"/>
	<input type="hidden" id="totalCashSales" value="${totalCashSales}"/>
	<input type="hidden" id="mCardSales" value="${mCardSales}"/>
	<input type="hidden" id="nCardSales" value="${nCardSales}"/>
	<input type="hidden" id="totalCardSales" value="${totalCardSales}"/>
	<input type="hidden" id="mKakaoSales" value="${mKakaoSales}"/>
	<input type="hidden" id="nKakaoSales" value="${nKakaoSales}"/>
	<input type="hidden" id="totalKakaoSales" value="${totalKakaoSales}"/>
	<input type="hidden" id="mTotalSales" value="${mTotalSales}"/>
	<input type="hidden" id="nTotalSales" value="${nTotalSales}"/>
	<input type="hidden" id="totalSales" value="${totalSales}"/>
</body>
</html>