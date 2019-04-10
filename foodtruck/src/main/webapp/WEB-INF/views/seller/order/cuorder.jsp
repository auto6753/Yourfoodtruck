<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!------ Include the above in your HEAD tag ---------->
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<style>
table {
	width: 100px;
}

thead, tbody, tr, td, th {
	display: block;
}

thead th {
	height: 30px;
}

tbody {
	overflow-y: auto;
	height: 150px;
}

tbody td, thead th {
	float: left;
	width: 20%;
}

tr:after {
	clear: both;
	content: ' ';
	display: block;
	visibility: hidden;
}

.qty .count {
	color: #000;
	display: inline-block;
	vertical-align: top;
	font-size: 25px;
	font-weight: 700;
	line-height: 30px;
	padding: 0 2px;
	min-width: 35px;
	text-align: center;
}

.qty .plus {
	cursor: pointer;
	display: inline-block;
	vertical-align: top;
	color: white;
	width: 30px;
	height: 30px;
	font: 30px/1 Arial, sans-serif;
	text-align: center;
	border-radius: 50%;
}

.qty .minus {
	cursor: pointer;
	display: inline-block;
	vertical-align: top;
	color: white;
	width: 30px;
	height: 30px;
	font: 30px/1 Arial, sans-serif;
	text-align: center;
	border-radius: 50%;
	background-clip: padding-box;
}

div {
	text-align: center;
}

.minus:hover {
	background-color: #717fe0 !important;
}

.plus:hover {
	background-color: #717fe0 !important;
}
/*Prevent text selection*/
span {
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

input {
	border: 0;
	width: 2%;
}

nput::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

input:disabled {
	background-color: white;
}
</style>
<div id="test" class="box"
	style="border: solid 1px black; width: 450px; height: 500px; display: inline-block;">
	<c:forEach var="s" items="${menulist}">
		<div style="display: inline-block;" class="forTest">
			<input style="width: 100%; height: 100px;" type="button"
				value="${s.menu_code }">
			<p>${s.menu_name }</p>
			<p>${s.unit_price }</p>
			<input type="hidden" value="${s.menu_code }" />
		</div>
	</c:forEach>
</div>
<div id="list"></div>
<div class="container">
	<div class="row">
		<h2>주문목록</h2>
	</div>
<form>
	<table class="table table-fixed table-striped">
		<thead>
			<tr>
				<th>메뉴</th>
				<th>수량</th>
				<th>가격</th>
			</tr>
		</thead> --%>
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

<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.min.js"/>"></script>

<script>
	$(document).ready(
			function() {
				var list = new Array();
				var is = false;
				var allprice = 0;
				$("#foodlist").on('click',"button",function() {
							//var a=$(this).find('p');
							var a = $(this);
							//var name = a.html();
							var name = a.next().html();
							var price = a.nextAll().eq(1).html();
							var code = a.nextAll().eq(2).val();
							var count = 1;
							//클릭한 상품이 현재 목록에 있는지 확인
							for (var i = 0; i < list.length; i++) {
								if (list[i].code == code) { //있으면 수량만 더하기 
									list[i].count += 1;
									list[i].price = list[i].count * price;
									var k = list[i].code;
									//해당 값 수정
									console.log($("#" + k).html());
									$("#" + k).html("<td>"+list[i].name+"</td><td>"+list[i].count+"</td><td>"+ list[i].price+"</td>");
									console.log($("#" + k).html());
									allprice += parseInt(price);
									$("#allprice").html(allprice);
									is = true; // 상품이 있기때문에 true 로 바꿔서 추가못하게 함
								}
							}
							if (!is) { //상품이 없어서 추가하고 어팬드
								var temp = {
									code : code,
									count : count,
									price : parseInt(price),
									name : name
								}
								list.push(temp);
								var k = temp.code;
								allprice += parseInt(temp.price);
								$("#allprice").html(allprice);
								$("tbody").append("<tr id='"+k+"'><td>" + temp.name+ "</td><td>" + temp.count+ "</td><td>" + temp.price + "</td>");
				
							}
							if (is) { //초기화
								//alert(is);
								is = false;
							}
						});
				$("#cancle1").click(function() {
					$("tbody").empty();
					var a = $("tbody"); //tebody 태그 없앰;
					allprice = 0;
					$("#allprice").html(allprice);
					list = new Array(); //list초기화
				});
				$("#kakaopay").click(function() {
					console.log(list);
					console.log(JSON.parse(JSON.stringify(list)));
					if (typeof list[0] == 'undefined') {
						alert("주문목록이업서여");
					} else {

						alert("카카오페이결제 총 결제금액" + allprice);
					}
				});
				$("#cash").click(function() {
					console.log(list);
					if (typeof list[0] == 'undefined') {
						alert("주문목록이업서여");
					} else {
						alert("현금결제 총 결제금액" + allprice);
					}

				});
				$("#card").click(function() {
					console.log(list);
					if (typeof list[0] == 'undefined') {
						alert("주문목록이업서여");
					} else {
						alert("카드결제 총 결제금액" + allprice);
					}

				});
			});
</script>
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
</body>
</html>

