<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<script src="https://www.gstatic.com/firebasejs/5.9.3/firebase-database.js"></script>
</head>
<style>

#logo {
	text-align: center;
	font-weight: bold;
	font-size: 290%;
}

div a {
	color: rgb(255, 94, 24);
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
#box2::-webkit-scrollbar {display:none;}
#box3::-webkit-scrollbar {display:none;}
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
	width: 49.8%;
	float: left;
}

#click2 {
	background-color: rgb(255, 94, 24);
	color: white;
	width: 49.8%;
	float: right;
}

#click3 {
	width: 95%;
	text-align: center;
	margin: 0 auto;
}

.c1 {
	background-color: rgb(255, 94, 24);
	color: white;
	width: 22%;
	height: 50px;
	font-size: 120%;
	margin-top: 5px;
}

.food {
	width: 50%;
	height: 250px;
}

#foodlist {
	text-align: center;
	margin: 0 auto;
	margin-top: 30px;
}

h3 {
	padding-top: 1%;
	margin-left: 7.2%;
}

</style>
<body>
	<input type="hidden" id="sessionEmail" value="${sessionScope.sessionid.email}">
	<input type="hidden" id="sessionPw" value="${sessionScope.sessionid.password}">
	<input type="hidden" id="sessionTruckCode" value="${sessionScope.seller.truck_code}">
	<input type="hidden" id="orderTarget" value="${requestScope.orderTarget}">
	<input type="hidden" id="ref" >
	<div id="cuorder">
		<div id="logo">
			<a href="/project/rehome">현재 푸드트럭</a>
		</div>
		<div>
			<div id="box">
				<button id="click" class="btn">food</button>
				<button id="click2" class="btn">drink</button>
				<div id="box2">
					<div id="foodlist">
						<c:forEach var="s" items="${menulist}">
							<button class="btn food"></button>
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
					<button id="cash" class="btn c1">현금결제</button>
					<button id="kakaopay" class="btn c1">카카오페이</button>
					<button id="cancle1" class="btn c1">취소</button>
				</div>
			</div>
		</div>
	</div>
	<div id="seorder">
	</div>
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
var _uid=null;
var text;
var email='${sessionScope.sessionid.email}';
console.log(email);
var password='${sessionScope.sessionid.password}';
console.log(password);
firebase.auth().signInWithEmailAndPassword(email, password);
</script>
<script type="text/javascript" src="<c:url value="/resources/js/seller/order.js"/>"></script>
</body>
</html>
