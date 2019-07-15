<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>당신의 푸드트럭</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet" href="<c:url value ="/resources/css/customercss/callList.css"/>" />
<style>
</style>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<script type="text/javascript" src="/resources/js/seller/jquery.ajax-cross-origin.min.js"></script>
<script>
$(document).ready(function(){
});
</script>
</head>
<body>
	<div id="with" class="col">
		<h1 id="bb" style="text-align: center; padding-top: 20px;">참가내역</h1>
		<br>
		<table class="table table-hover" class="col">
			<tr>
				<th>제목</th>
				<th>위치</th>
				<th>행사명</th>
				<th>행사일정</th>
				<th>신청일</th>
				<th>입금현황</th>
				<th>승인상태</th>
				<th>거래상태</th>
			</tr>
			<tbody id="g">
			</tbody>
		</table>
	</div>
</body>
</html>