<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1, width=device=width, viewport-fit=cover">
<title>주문관리</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/news/news.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.ajax-cross-origin.min.js"/>"></script>
<script src="https://www.gstatic.com/firebasejs/5.9.3/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.4/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.4/firebase-auth.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/5.9.3/firebase-database.js"></script>
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"
	type="text/javascript"></script>	
</head>
<style>
@font-face {font-family: 'yg-jalnan';src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');font-weight: normal;font-style: normal; } 
@font-face {font-family: 'Handon3gyeopsal600g';src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal600g.woff') format('woff');font-weight: normal;font-style: normal; } 
#logo {
	text-align: center;
	font-weight: bold;
	font-size: 290%;
}

div a {
	color: rgb(255, 94, 24);
}
.brandname{
	font-family: 'yg-jalnan';
	font-size: 150%;
}

#box {
	border: 2px solid;
	border-radius: 10px;
	color: rgb(255, 94, 24);
	width: 90%;
	height: 1100px;
	margin: 0 auto;
	margin-top: 40px;
}

#box2 {
	border: 2px solid;
	color: rgb(255, 94, 24);
	width: 85%;
	height: 650px;
	margin: 0 auto;
	position: relative;
	margin-top: 70px;
	overflow: auto;
	-ms-overflow-style: none;
}

#box2::-webkit-scrollbar {
	display: none;
}

#box3::-webkit-scrollbar {
	display: none;
}

#box3 {
	border: 2px solid;
	color: rgb(255, 94, 24);
	width: 85%;
	height: 200px;
	margin: 0 auto;
	position: relative;
	margin-top: 20px;
	overflow: auto;
	-ms-overflow-style: none;
}

#click {
    background-color: rgb(255, 94, 24);
    color: white;
    width: 100%;
    float: left;
    height: 5%;
    font-size: 120%;
    font-family: 'Handon3gyeopsal600g';
	
}

#click2 {
	background-color: rgb(255, 94, 24);
	color: white;
	width: 49.8%;
	float: right;
}

#click3 {
	    width: 100%;
    font-size: 55%;
    text-align: center;
    margin: 0 auto;
    font-family: 'Handon3gyeopsal600g';
}

.c1 {
	background-color: rgb(255, 94, 24);
	color: white;
	width: 22%;
	height: 50px;
	font-size: 120%;
	margin-top: 5px;
}
.c2{
background-color: rgb(255, 94, 24);
    color: white;
    width: 40%;
    height: 50px;
    font-size: 120%;
    margin-top: 5px;
}

.food {
	
width: 100%;
}

#foodlist {
	text-align: center;
    margin: 0 auto;
    margin-top: 50px;
}
.panel-title {
	padding-top: 1%;
	margin-left: 7.2%;
}
h3 {
	
}
</style>
<body>
	<input type="hidden" id="sessionEmail"
		value="${sessionScope.sessionid.email}">
	<input type="hidden" id="sessionPw"
		value="${sessionScope.sessionid.password}">
	<input type="hidden" id="sessionTruckCode"
		value="${truck_code}">
	<input type="hidden" id="orderTarget"
		value="${requestScope.orderTarget}">
	<input type="hidden" id="ref">
	<div id="cuorder">
		<div id="logo">
			<a href="/rehome" class="brandname">${brandname.brandname}</a>
		</div>
		<div>
			<div id="box">
				<button id="click" class="btn">어서오십시오 고객님! ${brandname.brandname }입니다.</button>
				
				<div id="order">
					<div id="box2">
						<div id="foodlist">
							<c:forEach var="s" items="${menulist}">
								<button class="btn food"><img class="btn food" src="${pageContext.request.contextPath}/resources/image/upload/${s.menu_url}"></button>
								<p>${s.menu_name }</p>
								<p>${s.unit_price }</p>
								<input type="hidden" value="${s.menu_code }">
							</c:forEach>
						</div>
					</div>
					<h3 class="panel-title">주문목록</h3>
					<div id="box3" class="">
						<table class="table table-hover" id="">
							<thead>
								<tr>
									<th style="width: 30%">이름</th>
									<th style="width: 40%">수량</th>
									<th style="width: 30%">가격</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
					<div style="text-align: right; margin-right: 10%;">
						<span style="font-size: 30px;">총 가격:</span><span
							style="font-size: 30px" id="allprice">0</span>
					</div>
					<div id="click3">
						<button id="card" class="btn c1">카드결제</button>
			<!-- 		<button id="cash" class="btn c1">현금결제</button> -->
						<button id="kakaopay" class="btn c1">카카오페이</button>
						<button id="cancle1" class="btn c1">취소</button>
					</div>
				</div>
			<div id="cardtel"style="display: none; text-align: center; width: 100%; margin-top: 400px; height: 50%;">
				<div style="display: inline-block; width: 90%; height: 35%;">
					<h3 style="">주문받으실 전화번호를 입력해주세요</h3>
					<input id="cardphone" type="tel" style="width: 100%;"><br>
					<button id="cardok" class="btn c2">확인</button>
					<button id="cardcancle" class="btn c2">취소</button>
					<button id="back3" class="btn c2">주문추가</button>
				</div>
			</div>
			<div id="kakaotel"style="display: none; text-align: center; width: 100%; margin-top: 400px; height: 50%;">
				<div style="display: inline-block; width: 90%; height: 35%;">
					<h3 style="">주문받으실 전화번호를 입력해주세요</h3>
					<input id="kakaotelephone" type="tel" style="width: 100%;"><br>
					<button id="kakaohok" class="btn c2">확인</button>
					<button id="kakaocancle" class="btn c2">취소</button>
					<button id="back2" class="btn c2">주문추가</button>
				</div>
			</div>
			</div>
		</div>
	</div>
	<div id="seorder"></div>
	<script>
		var config = {
			apiKey : "AIzaSyDgw_gFc9MB7Rc8Z7WjJUOqeWT6YQOqvxU",
			authDomain : "fir-test-f3fea.firebaseapp.com",
			databaseURL : "https://fir-test-f3fea.firebaseio.com",
			projectId : "fir-test-f3fea",
			storageBucket : "fir-test-f3fea.appspot.com",
			messagingSenderId : "960564228551"
		};
		firebase.initializeApp(config);
		var _uid = null;
		var text;
		var email = '${member.email}';
		console.log(email);
		var password = '${member.password}';
		console.log(password);
		firebase.auth().signInWithEmailAndPassword(email, password);
	</script>
	<script type="text/javascript"
		src="<c:url value="/resources/js/seller/order.js"/>"></script>
</body>
</html>
