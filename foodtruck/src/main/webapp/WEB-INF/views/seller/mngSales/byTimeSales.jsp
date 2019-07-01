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
<script type="text/javascript" src="/resources/js/seller/mngSales/byTimeSales.js"></script>
<title>매출관리 - 시간별</title>
<script>
	function checkForm() {
 		var yyyy_tb = $("#yyyy_tb").val().substring(0, 4);
		var yyyy_te = $("#yyyy_te").val().substring(0, 4);
		
		if(yyyy_tb > yyyy_te) {
			alert("범위가 유효하지 않습니다.");
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="navBar.jsp"></jsp:include>
		<div class="container">
			<div class="row">
				<section id="salesSec" class="col-md-12">
					<form id="salesInfo" action="salesInfo" method="GET" onsubmit="return checkForm();">
						<select id="yyyy_tb" name="yyyy_tb" required>
							<c:forEach var="byTimeValArrList" items="${byTimeValArrList}">
								<c:if test="${yyyy_tb eq byTimeValArrList}">
									<option value="${byTimeValArrList}" selected>${byTimeValArrList}</option>
								</c:if>
								<c:if test="${yyyy_tb ne byTimeValArrList}">
									<option value="${byTimeValArrList}">${byTimeValArrList}</option>
								</c:if>
							</c:forEach>					
						</select>
						<span>~</span>
						<select id="yyyy_te" name="yyyy_te" required>
							<c:forEach var="byTimeValArrList" items="${byTimeValArrList}">
								<c:if test="${yyyy_te eq byTimeValArrList}">
									<option value="${byTimeValArrList}" selected>${byTimeValArrList}</option>
								</c:if>
								<c:if test="${yyyy_te ne byTimeValArrList}">
									<option value="${byTimeValArrList}">${byTimeValArrList}</option>
								</c:if>
							</c:forEach>					
						</select>
						<button type="submit" id="byTimeSalesRe" name="pageName" value="byTimeSalesRe">확인</button>
					</form>
					<div id="chart_div"></div>
					<div id="table_div" style="display:none;">
					<c:forEach var="byTimeSalesResult" items="${byTimeSalesResult}">
						<table border="1">
							<tr>
								<td></td>
								<td>회원</td>
								<td>비회원</td>
								<td>전체</td>
							</tr>
							<tr>
								<td>현금</td>
								<td><fmt:formatNumber value="${byTimeSalesResult[0]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byTimeSalesResult[1]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byTimeSalesResult[2]}" pattern="#,###"/></td>
							</tr>
							<tr>
								<td>카드</td>
								<td><fmt:formatNumber value="${byTimeSalesResult[3]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byTimeSalesResult[4]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byTimeSalesResult[5]}" pattern="#,###"/></td>
							</tr>
							<tr>
								<td>카카오페이</td>
								<td><fmt:formatNumber value="${byTimeSalesResult[6]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byTimeSalesResult[7]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byTimeSalesResult[8]}" pattern="#,###"/></td>
							</tr>
							<tr>
								<td>합계</td>
								<td><fmt:formatNumber value="${byTimeSalesResult[9]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byTimeSalesResult[10]}" pattern="#,###"/></td>
								<td><fmt:formatNumber value="${byTimeSalesResult[11]}" pattern="#,###"/></td>
							</tr>
						</table>
						
						<input type="hidden" class="byTimeSalesResult9" value="${byTimeSalesResult[9]}"/>
						<input type="hidden" class="byTimeSalesResult10" value="${byTimeSalesResult[10]}"/>
						<input type="hidden" class="byTimeSalesResult11" value="${byTimeSalesResult[11]}"/>
					</c:forEach>
					</div>
				</section>
			</div>
		</div>
	</div>
	
	<input type="hidden" id="page" value="6"/>
</body>
</html>