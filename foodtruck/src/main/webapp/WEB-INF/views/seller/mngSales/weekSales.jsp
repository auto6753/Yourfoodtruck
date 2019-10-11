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
<script type="text/javascript" src="/resources/js/seller/mngSales/weekSales.js"></script>
<title>매출관리 - 주간</title>
</head>
<body>
	<div id="wrap">
		<jsp:include page="navBar.jsp"></jsp:include>
		<div class="container">
		<input type="hidden" name="type" value="app"/>
			<div class="row">
				<section id="salesSec" class="col-md-12">
					<div id="chart_div" style="text-align:center;"></div>
					<table border="1" class="hideTable">
						<tr>
							<td></td>
							<td>회원</td>
							<td>비회원</td>
							<td>전체</td>
						</tr>
						<tr>
							<td>현금</td>
							<td><fmt:formatNumber value="${mCashSalesWeek}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nCashSalesWeek}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalCashSalesWeek}" pattern="#,###"/></td>
						</tr>
						<tr>
							<td>카드</td>
							<td><fmt:formatNumber value="${mCardSalesWeek}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nCardSalesWeek}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalCardSalesWeek}" pattern="#,###"/></td>
						</tr>
						<tr>
							<td>카카오페이</td>
							<td><fmt:formatNumber value="${mKakaoSalesWeek}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nKakaoSalesWeek}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalKakaoSalesWeek}" pattern="#,###"/></td>
						</tr>
						<tr>
							<td>합계</td>
							<td><fmt:formatNumber value="${mTotalSalesWeek}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nTotalSalesWeek}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalSalesWeek}" pattern="#,###"/></td>
						</tr>
					</table>
					<table border="1" class="hideTable">
						<tr>
							<!-- <td>메뉴코드</td> -->
							<td>메뉴명</td>
							<td>단가</td>
							<td>판매량</td>
							<td>매출액</td>
						</tr>
						<c:forEach var="menuSalesWeek" items="${menuSalesWeek}">
							<tr>
								<%-- <td>${menuSalesWeek.menu_code}</td> --%>
								<td>${menuSalesWeek.menu_name}</td>
								<td><fmt:formatNumber value="${menuSalesWeek.unitPrice}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${menuSalesWeek.amount}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${menuSalesWeek.totalPrice}" pattern="#,###"/></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="2">합계</td>
							<td>${totalAmountWeek}</td>
							<td><fmt:formatNumber value="${totalSalesWeek}" pattern="#,###"/></td>
						</tr>
					</table>
				</section>
			</div>
		</div>
	</div>
	
	<input type="hidden" id="mCashSalesWeek" value="${mCashSalesWeek}"/>
	<input type="hidden" id="nCashSalesWeek" value="${nCashSalesWeek}"/>
	<input type="hidden" id="totalCashSalesWeek" value="${totalCashSalesWeek}"/>
	<input type="hidden" id="mCardSalesWeek" value="${mCardSalesWeek}"/>
	<input type="hidden" id="nCardSalesWeek" value="${nCardSalesWeek}"/>
	<input type="hidden" id="totalCardSalesWeek" value="${totalCardSalesWeek}"/>
	<input type="hidden" id="mKakaoSalesWeek" value="${mKakaoSalesWeek}"/>
	<input type="hidden" id="nKakaoSalesWeek" value="${nKakaoSalesWeek}"/>
	<input type="hidden" id="totalKakaoSalesWeek" value="${totalKakaoSalesWeek}"/>
	<input type="hidden" id="mTotalSalesWeek" value="${mTotalSalesWeek}"/>
	<input type="hidden" id="nTotalSalesWeek" value="${nTotalSalesWeek}"/>
	<input type="hidden" id="totalSalesWeek" value="${totalSalesWeek}"/>
	
	<input type="hidden" id="page" value="2"/>
</body>
</html>