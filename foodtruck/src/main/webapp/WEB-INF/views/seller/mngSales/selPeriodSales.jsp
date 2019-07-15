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
<script type="text/javascript" src="/resources/js/seller/mngSales/selPeriodSales.js"></script>
<title>매출관리 - 금일</title>

</head>
<body>
	<div id="wrap">
		<jsp:include page="navBar.jsp"></jsp:include>
		<div class="container">
			<div class="row">
				<section id="salesSec" class="col-md-12">
					<form id="salesInfo" action="salesInfo" method="GET">
						<input type="date" name="firstDate"/>
						<span>~</span>
						<input type="date" name="lastDate"/>
						<button type="submit" id="byDaySalesRe" name="pageName" value="selPeriodSalesRe">검색</button>
					</form>
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
							<td><fmt:formatNumber value="${mCashSalesSelPeriod}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nCashSalesSelPeriod}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalCashSalesSelPeriod}" pattern="#,###"/></td>
						</tr>
						<tr>
							<td>카드</td>
							<td><fmt:formatNumber value="${mCardSalesSelPeriod}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nCardSalesSelPeriod}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalCardSalesSelPeriod}" pattern="#,###"/></td>
						</tr>
						<tr>
							<td>카카오페이</td>
							<td><fmt:formatNumber value="${mKakaoSalesSelPeriod}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nKakaoSalesSelPeriod}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalKakaoSalesSelPeriod}" pattern="#,###"/></td>
						</tr>
						<tr>
							<td>합계</td>
							<td><fmt:formatNumber value="${mTotalSalesSelPeriod}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nTotalSalesSelPeriod}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalSalesSelPeriod}" pattern="#,###"/></td>
						</tr>
					</table>
					<table border="1">
						<tr>
							<!-- <td>메뉴코드</td> -->
							<td>메뉴명</td>
							<td>단가</td>
							<td>판매량</td>
							<td>매출액</td>
						</tr>
						<c:forEach var="menuSalesSelPeriod" items="${menuSalesSelPeriod}">
							<tr>
								<%-- <td>${menuSalesSelPeriod.menu_code}</td> --%>
								<td>${menuSalesSelPeriod.menu_name}</td>
								<td><fmt:formatNumber value="${menuSalesSelPeriod.unitPrice}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${menuSalesSelPeriod.amount}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${menuSalesSelPeriod.totalPrice}" pattern="#,###"/></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="2">합계</td>
							<td>${totalAmountSelPeriod}</td>
							<td><fmt:formatNumber value="${totalSalesSelPeriod}" pattern="#,###"/></td>
						</tr>
					</table>
				</section>
			</div>
		</div>
	</div>
	
	<input type="hidden" id="mCashSalesSelPeriod" value="${mCashSalesSelPeriod}"/>
	<input type="hidden" id="nCashSalesSelPeriod" value="${nCashSalesSelPeriod}"/>
	<input type="hidden" id="totalCashSalesSelPeriod" value="${totalCashSalesSelPeriod}"/>
	<input type="hidden" id="mCardSalesSelPeriod" value="${mCardSalesSelPeriod}"/>
	<input type="hidden" id="nCardSalesSelPeriod" value="${nCardSalesSelPeriod}"/>
	<input type="hidden" id="totalCardSalesSelPeriod" value="${totalCardSalesSelPeriod}"/>
	<input type="hidden" id="mKakaoSalesSelPeriod" value="${mKakaoSalesSelPeriod}"/>
	<input type="hidden" id="nKakaoSalesSelPeriod" value="${nKakaoSalesSelPeriod}"/>
	<input type="hidden" id="totalKakaoSalesSelPeriod" value="${totalKakaoSalesSelPeriod}"/>
	<input type="hidden" id="mTotalSalesSelPeriod" value="${mTotalSalesSelPeriod}"/>
	<input type="hidden" id="nTotalSalesSelPeriod" value="${nTotalSalesSelPeriod}"/>
	<input type="hidden" id="totalSalesSelPeriod" value="${totalSalesSelPeriod}"/>
	
	<input type="hidden" id="page" value="7"/>
</body>
</html>