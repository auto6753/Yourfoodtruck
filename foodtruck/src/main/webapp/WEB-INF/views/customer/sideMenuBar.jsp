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
	<div id="sideMenuBar">

		<div id="menuTitle">MYPAGE</div>
		<ul>
			<li class="menu mb"><a href="/customer/onboard"
				class=" onboard linkStyle">탑승트럭</a>
				<ul class="hide">
					<li><a href="/customer/onboard" class="linkStyle2">탑승트럭</a></li>
					<li><a href="/customer/onSale" class="linkStyle2">운행중인 트럭</a></li>
				</ul></li>

			<li class="menu mb"><a href="/customer/review" class="linkStyle">리뷰관리</a>
			</li>

			<li class="menu mb"><a href="/customer/callList"
				class="linkStyle">호출내역</a></li>

			<li class="menu mb"><a href="/customer/joinlist"
				class="linkStyle">모집공고</a></li>

			<li class="menu mb"><a href="/customer/cusInfo"
				class="linkStyle">회원정보관리</a></li>

			<li class="menu mb"><a href="/help/myQuestion" class="linkStyle">문의내역</a>
			</li>

			<li class="menu mb"><a href="/customer/goodbyeForm"
				class="linkStyle">회원탈퇴</a></li>
		</ul>
	</div>
</body>
</html>