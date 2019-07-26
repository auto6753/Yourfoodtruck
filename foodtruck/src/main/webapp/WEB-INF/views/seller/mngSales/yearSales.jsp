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
<script type="text/javascript" src="/resources/js/seller/mngSales/yearSales.js"></script>
<title>매출관리 - 연간</title>
</head>
<body>
	<div id="wrap">
		<jsp:include page="navBar.jsp"></jsp:include>
		<div class="container">
			<div class="row">
				<section id="salesSec" class="col-md-12">
					<form id="salesInfo" action="salesInfo" method="GET">
						<select id="yy" name="yy" class="hideTable" required>
							<c:forEach var="yearValArrList" items="${yearValArrList}">
								<c:if test="${yy eq yearValArrList}">
									<option value="${yearValArrList}" selected>${yearValArrList}</option>
								</c:if>
								<c:if test="${yy ne yearValArrList}">
									<option value="${yearValArrList}">${yearValArrList}</option>
								</c:if>
							</c:forEach>					
						</select>
						<button type="submit" id="yearSalesRe" name="pageName" value="yearSalesRe" style="display:none"></button>
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
							<td><fmt:formatNumber value="${mCashSalesYear}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nCashSalesYear}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalCashSalesYear}" pattern="#,###"/></td>
						</tr>
						<tr>
							<td>카드</td>
							<td><fmt:formatNumber value="${mCardSalesYear}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nCardSalesYear}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalCardSalesYear}" pattern="#,###"/></td>
						</tr>
						<tr>
							<td>카카오페이</td>
							<td><fmt:formatNumber value="${mKakaoSalesYear}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nKakaoSalesYear}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalKakaoSalesYear}" pattern="#,###"/></td>
						</tr>
						<tr>
							<td>합계</td>
							<td><fmt:formatNumber value="${mTotalSalesYear}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${nTotalSalesYear}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${totalSalesYear}" pattern="#,###"/></td>
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
						<c:forEach var="menuSalesYear" items="${menuSalesYear}">
							<tr>
								<%-- <td>${menuSalesYear.menu_code}</td> --%>
								<td>${menuSalesYear.menu_name}</td>
								<td><fmt:formatNumber value="${menuSalesYear.unitPrice}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${menuSalesYear.amount}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${menuSalesYear.totalPrice}" pattern="#,###"/></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="2">합계</td>
							<td>${totalAmountYear}</td>
							<td><fmt:formatNumber value="${totalSalesYear}" pattern="#,###"/></td>
						</tr>
					</table>
				</section>
			</div>
		</div>
	</div>
	
	<input type="hidden" id="mCashSalesYear" value="${mCashSalesYear}"/>
	<input type="hidden" id="nCashSalesYear" value="${nCashSalesYear}"/>
	<input type="hidden" id="totalCashSalesYear" value="${totalCashSalesYear}"/>
	<input type="hidden" id="mCardSalesYear" value="${mCardSalesYear}"/>
	<input type="hidden" id="nCardSalesYear" value="${nCardSalesYear}"/>
	<input type="hidden" id="totalCardSalesYear" value="${totalCardSalesYear}"/>
	<input type="hidden" id="mKakaoSalesYear" value="${mKakaoSalesYear}"/>
	<input type="hidden" id="nKakaoSalesYear" value="${nKakaoSalesYear}"/>
	<input type="hidden" id="totalKakaoSalesYear" value="${totalKakaoSalesYear}"/>
	<input type="hidden" id="mTotalSalesYear" value="${mTotalSalesYear}"/>
	<input type="hidden" id="nTotalSalesYear" value="${nTotalSalesYear}"/>
	<input type="hidden" id="totalSalesYear" value="${totalSalesYear}"/>
	
	<input type="hidden" id="page" value="4"/>
</body>
</html>