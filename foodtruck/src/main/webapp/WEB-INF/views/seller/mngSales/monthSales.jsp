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
<script type="text/javascript" src="/resources/js/seller/mngSales/monthSales.js"></script>
<title>매출관리 - 월간</title>
</head>
<body>
	<div id="wrap">
		<jsp:include page="navBar.jsp"></jsp:include>
		<div class="container">
			<div class="row">
				<section id="salesSec" class="col-md-12">
					<form id="salesInfo" action="salesInfo" method="GET">
						<select id="yymm" name="yymm" required class="hideTable">
							<c:forEach var="monthValArrList" items="${monthValArrList}" varStatus="status">
								<c:if test="${yymm eq monthValArrList}">
									<option value="${monthValArrList}" selected>${monthValArrList}</option>
								</c:if>
								<c:if test="${yymm ne monthValArrList}">
									<option value="${monthValArrList}">${monthValArrList}</option>
								</c:if>
							</c:forEach>					
						</select>
						<button type="submit" id="monthSalesRe" name="pageName" value="monthSalesRe" style="display:none"></button>
					</form>
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
							<td><fmt:formatNumber value="${mCashSalesMonth}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nCashSalesMonth}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalCashSalesMonth}" pattern="#,###"/></td>
						</tr>
						<tr>
							<td>카드</td>
							<td><fmt:formatNumber value="${mCardSalesMonth}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nCardSalesMonth}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalCardSalesMonth}" pattern="#,###"/></td>
						</tr>
						<tr>
							<td>카카오페이</td>
							<td><fmt:formatNumber value="${mKakaoSalesMonth}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nKakaoSalesMonth}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalKakaoSalesMonth}" pattern="#,###"/></td>
						</tr>
						<tr>
							<td>합계</td>
							<td><fmt:formatNumber value="${mTotalSalesMonth}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nTotalSalesMonth}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalSalesMonth}" pattern="#,###"/></td>
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
						<c:forEach var="menuSalesMonth" items="${menuSalesMonth}">
							<tr>
								<%-- <td>${menuSalesMonth.menu_code}</td> --%>
								<td>${menuSalesMonth.menu_name}</td>
								<td><fmt:formatNumber value="${menuSalesMonth.unitPrice}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${menuSalesMonth.amount}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${menuSalesMonth.totalPrice}" pattern="#,###"/></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="2">합계</td>
							<td>${totalAmountMonth}</td>
							<td><fmt:formatNumber value="${totalSalesMonth}" pattern="#,###"/></td>
						</tr>
					</table>
				</section>
			</div>
		</div>
	</div>
	
	<input type="hidden" id="mCashSalesMonth" value="${mCashSalesMonth}"/>
	<input type="hidden" id="nCashSalesMonth" value="${nCashSalesMonth}"/>
	<input type="hidden" id="totalCashSalesMonth" value="${totalCashSalesMonth}"/>
	<input type="hidden" id="mCardSalesMonth" value="${mCardSalesMonth}"/>
	<input type="hidden" id="nCardSalesMonth" value="${nCardSalesMonth}"/>
	<input type="hidden" id="totalCardSalesMonth" value="${totalCardSalesMonth}"/>
	<input type="hidden" id="mKakaoSalesMonth" value="${mKakaoSalesMonth}"/>
	<input type="hidden" id="nKakaoSalesMonth" value="${nKakaoSalesMonth}"/>
	<input type="hidden" id="totalKakaoSalesMonth" value="${totalKakaoSalesMonth}"/>
	<input type="hidden" id="mTotalSalesMonth" value="${mTotalSalesMonth}"/>
	<input type="hidden" id="nTotalSalesMonth" value="${nTotalSalesMonth}"/>
	<input type="hidden" id="totalSalesMonth" value="${totalSalesMonth}"/>
	
	<input type="hidden" id="page" value="3"/>
</body>
</html>