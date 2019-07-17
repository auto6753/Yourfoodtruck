<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>당신의 푸드트럭</title>
</head>

<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet" href="<c:url value ="/resources/css/customercss/customercss.css"/>"/>
<script>
	$(document).ready(function() {
		$(".review").click(function() {
			location.href = "/customer/review";
		});
		$(".callList").click(function() {
			location.href = "/customer/callList";
		});
		$(".goodbyeForm").click(function() {
			location.href = "/customer/goodbyeForm";
		});
		$(".onboard").click(function() {
			location.href = "/customer/onboard";
		});
		$(".onSale").click(function() {
			location.href = "/customer/onSale";
		});
		$(".joinlist").click(function() {
			location.href = "/customer/joinlist";
		});
		$(".cusInfo").click(function() {
			location.href = "/customer/cusInfo";
		});
		$(".myQuestion").click(function() {
			location.href = "/help/myQuestion";
		});
	});
</script>

<div>
	<div id="title" class="col">

		<button id="container3" class="text onboard col btn btn-default"><h4>탑승트럭</h4><img src="/resources/image/onboard.svg" class="img2"></button>
		<button id="container3" class="text onSale col btn btn-default"><h4>운행중인트럭</h4><img src="/resources/image/onSale.svg" class="img2"></button>
		<button id="container3" class="text review col btn btn-default" ><h4>리뷰관리</h4><img src="/resources/image/review.svg" class="img2"></button>
		<button id="container3" class="text callList col btn btn-default"><h4>호출내역</h4><img src="/resources/image/callList.svg" class="img2"></button>
	</div>
	<div id="title2" class="col">
		<button id="container2" class="text2 cusInfo col btn btn-default"><h4>회원정보관리</h4><img src="/resources/image/cusInfo.svg" class="img1"></button>
		<button id="container2" class="text2 col myQuestion btn btn-default"><h4>1:1문의내역</h4><img src="/resources/image/myQuestion.svg" class="img1"></button>
		<button id="container2" class="text2 goodbyeForm col btn btn-default"><h4>회원탈퇴</h4><img src="/resources/image/goodbyeForm.svg" class="img1"></button>
		<button id="container2" class="text joinlist col btn btn-default"><h4>참가신청 내역</h4><img src="/resources/image/goodbyeForm.svg" class="img1"></button>
		
	</div>
</div>

