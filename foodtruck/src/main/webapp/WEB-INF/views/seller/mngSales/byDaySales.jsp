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
<script type="text/javascript" src="/resources/js/seller/mngSales/byDaySales.js"></script>
<title>매출관리 - 주간</title>
</head>
<body>
	<div id="wrap">
		<jsp:include page="navBar.jsp"></jsp:include>
		<div class="container">
			<div class="row">
				<section id="salesSec" class="col-md-12">
					<div id="chart_div"></div>
					<c:forEach var="byDaySalesResult" items="${byDaySalesResult}" begin="1">
						<table border="1">
							<tr>
								<td></td>
								<td>회원</td>
								<td>비회원</td>
								<td>전체</td>
							</tr>
							<tr>
								<td>현금</td>
								<td><fmt:formatNumber value="${byDaySalesResult[0]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byDaySalesResult[1]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byDaySalesResult[2]}" pattern="#,###"/></td>
							</tr>
							<tr>
								<td>카드</td>
								<td><fmt:formatNumber value="${byDaySalesResult[3]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byDaySalesResult[4]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byDaySalesResult[5]}" pattern="#,###"/></td>
							</tr>
							<tr>
								<td>카카오페이</td>
								<td><fmt:formatNumber value="${byDaySalesResult[6]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byDaySalesResult[7]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byDaySalesResult[8]}" pattern="#,###"/></td>
							</tr>
							<tr>
								<td>합계</td>
								<td><fmt:formatNumber value="${byDaySalesResult[9]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byDaySalesResult[10]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byDaySalesResult[11]}" pattern="#,###"/></td>
							</tr>
						</table>
						
						<input type="hidden" class="byDaySalesResult9" value="${byDaySalesResult[9]}"/>
						<input type="hidden" class="byDaySalesResult10" value="${byDaySalesResult[10]}"/>
						<input type="hidden" class="byDaySalesResult11" value="${byDaySalesResult[11]}"/>
					</c:forEach>
					<c:forEach var="byDaySalesResult" items="${byDaySalesResult}" begin="0" end="0">
						<table border="1">
							<tr>
								<td></td>
								<td>회원</td>
								<td>비회원</td>
								<td>전체</td>
							</tr>
							<tr>
								<td>현금</td>
								<td><fmt:formatNumber value="${byDaySalesResult[0]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byDaySalesResult[1]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byDaySalesResult[2]}" pattern="#,###"/></td>
							</tr>
							<tr>
								<td>카드</td>
								<td><fmt:formatNumber value="${byDaySalesResult[3]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byDaySalesResult[4]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byDaySalesResult[5]}" pattern="#,###"/></td>
							</tr>
							<tr>
								<td>카카오페이</td>
								<td><fmt:formatNumber value="${byDaySalesResult[6]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byDaySalesResult[7]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byDaySalesResult[8]}" pattern="#,###"/></td>
							</tr>
							<tr>
								<td>합계</td>
								<td><fmt:formatNumber value="${byDaySalesResult[9]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byDaySalesResult[10]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byDaySalesResult[11]}" pattern="#,###"/></td>
							</tr>
						</table>
						
						<input type="hidden" class="byDaySalesResult9" value="${byDaySalesResult[9]}"/>
						<input type="hidden" class="byDaySalesResult10" value="${byDaySalesResult[10]}"/>
						<input type="hidden" class="byDaySalesResult11" value="${byDaySalesResult[11]}"/>
					</c:forEach>
				</section>
			</div>
		</div>
	</div>
</body>
</html>