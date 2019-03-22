<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/customercss.css">
<jsp:include page="../header/header.jsp"></jsp:include>
<script>
	$(document).ready(function() {
		$(".review").click(function(){
			location.href="customer/review";
		});
	});
	$(document).ready(function() {
		$(".callList").click(function(){
			location.href="customer/callList";
		});
	});

</script>
<div>
	<div id="title">
		<div id="container" class="snip1535 text">탑승<br>트럭</div>
		<div id="container" class="snip1535 text">운행중인<br>트럭</div>
		<div id="container" class="snip1535 text review" >리뷰 및<br>평점</div>
		<div id="container" class="snip1535 text callList">호출<br>내역</div>
	</div>
	<div id="title2">
		<div id="container2" class="snip1535 text2">회원 정보 관리</div>
		<div id="container2" class="snip1535 text2">1:1문의 내역</div>
		<div id="container2" class="snip1535 text2">회원탈퇴</div>
	</div>
	<!-- content -->
</div>

