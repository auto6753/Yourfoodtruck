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
	$(document.body).on("click",".list",function(){
		var a = $(this);
		console.log(a.next().val());
		var code = a.next().val();
		var str = "/customer/poplist?request_code="+code;
		var win = window.open(str, "PopupWin", "width=400,height=500,location=no,resizable=no,toolbar=no");
	});
});
</script>
</head>
<body>
	<div id="with" class="col">
		<h1 id="bb" style="text-align: center; padding-top: 20px;">모집공고 작성 내역</h1>
		<br>
		<table class="table table-hover" class="col">
			<tr>
				<th>날짜</th>
				<th>제목</th>
				<th>모집기간</th>
				<th>신청현황</th>
				<th>모집상태</th>
				<th>D-day</th>
			</tr>
			<tbody id="g">
				<tr>
				<td>19/7/15</td>
				<td>OO 행사 푸드트럭 모집 </td>
				<td>1/15~1/16</td>
				<td>3명</td>
				<td>진행중 <button class="list">신청 목록</button> <input type="hidden" value="19071800017"></td>
				<td>3 일후에 종료됩니다.</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>