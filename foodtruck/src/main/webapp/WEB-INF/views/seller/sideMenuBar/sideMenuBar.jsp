<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<style>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);

span {
	color: tomato;
}

.col-md-3 {
	-webkit-box-flex: 0;
	-ms-flex: 0 0 25%;
	flex: 0 0 25%;
	max-width: 100%;
	position: relative;
	right: 3%;
	top: 75px;
}

/* li { display:inline-block; padding:20px; cursor:pointer; } */
/* li.on { background-color:#eee; color:#f00; font-weight:bold;} */
</style>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="<c:url value="/resources/css/seller/sideMenuBar/sideMenuBar.css"/>">
<script type="text/javascript"
	src="<c:url value="/resources/js/seller/sideMenu.js"/>"></script>
<title>Insert title here</title>
<style>
.menu a {
	cursor: pointer;
}

.menu .hide {
	display: none;
}

.linkStyle {
	font-family: 'hanna';
	font-size: 20px;
	color: rgba(255, 94, 24);
}

.linkStyle2 {
	font-family: 'hanna';
	font-size: 18px;
	color: rgba(255, 94, 24);
}

.mb {
	margin-bottom: 10px;
}

#menuTitle {
	text-align: center;
	font-family: 'yg-jalnan';
	font-size: 30px;
	margin-bottom: 15px;
}

#sideMenuBar {
	height: 600px;
	border: 5px solid lightgray;
	border-radius: 10px;
	background-color: #f8f9fa;
	padding: 10% 0;
}
</style>
</head>
<body>

	<!-- 	<div class="list-group">
		<ul class="sidebar">
			<li class="menu"><a href="/seller/" class="list-group-item"><i
					class="fa fa-credit-card"></i> <span
					style="font-family: 'Hanna', serif;">메인</span></a>
			<li class="menu"><a href="/seller/truckinfo"
				class="list-group-item"><i class="fa fa-credit-card"></i> <span
					style="font-family: 'Hanna', serif;">트럭정보관리</span></a>
			<li class="menu"><a href="/seller/menu" class="list-group-item"><i
					class="fa fa-credit-card"></i> <span
					style="font-family: 'Hanna', serif;">메뉴등록</span></a>
			<li class="menu"><a href="/seller/location"
				class="list-group-item"><i class="fa fa-credit-card"></i> <span
					style="font-family: 'Hanna', serif;">위치등록</span></a>
			<li class="menu"><a href="/seller/event" class="list-group-item"><i
					class="fa fa-credit-card"></i> <span
					style="font-family: 'Hanna', serif;">이벤트등록</span></a>
			<li class="menu"><a href="/seller/psgpush"
				class="list-group-item"><i class="fa fa-credit-card"></i> <span
					style="font-family: 'Hanna', serif;">탑승자알림관리</span></a>
			<li class="menu"><a href="/seller/callmanage"
				class="list-group-item"><i class="fa fa-credit-card"></i> <span
					style="font-family: 'Hanna', serif;"> 푸드트럭호출관리</span></a>
			<li class="menu"><a href="/seller/order" class="list-group-item"><i
					class="fa fa-credit-card"></i> <span
					style="font-family: 'Hanna', serif;">주문관리</span></a> <li class="menu"><a href="/seller/layout"  class="list-group-item active"><i class="fa fa-credit-card"></i> <span>레이아웃</span></a>
				<ul class="hide">
					<li><a>타입 A</a></li>
					<li><a>타입 B</a></li>
				</ul></li>
		</ul>
	</div> -->

	<div id="sideMenuBar">

		<div id="menuTitle">트럭관리</div>
		<ul>
			<li class="menu mb"><a href="/seller/" class="linkStyle">매출관리</a></li>

			<li class="menu mb"><a href="/seller/truckinfo"
				class="linkStyle">트럭정보수정</a></li>

			<li class="menu mb"><a href="/seller/menu" class="linkStyle">메뉴관리</a></li>

			<li class="menu mb"><a href="/seller/location" class="linkStyle">위치등록</a></li>

			<li class="menu mb"><a href="/seller/event" class="linkStyle">이벤트등록</a></li>

			<li class="menu mb"><a href="/seller/psgpush" class="linkStyle">탑승자관리</a></li>

			<li class="menu mb"><a href="/seller/callmanage"
				class="linkStyle">호출관리</a></li>

			<li class="menu mb"><a href="/seller/order" class="linkStyle">주문관리</a></li>
		</ul>
	</div>
</body>
</html>