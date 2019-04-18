<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Product list for Ecommerce Website</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdn.jsdelivr.net/sockjs/0.3.4/sockjs.min.js"></script>
<style type="text/css">
body {
	font-family: "Open Sans", sans-serif;
}

.wrap {
	width: 1300px;
	height: 300px;
	overflow-x: scroll;
	white-space: nowrap;
	overflow-y: hidden;
}

.list {
	width: 300px;
	height: 100%;
	display: inline-block;
	border: solid 3px;
}

wrap {
	white-space: nowrap;
}

.menu {
	
}

.head {
	
}

h4 {
	text-align: center;
}

.num {
	color: darkgreen;
	float: left;
	font-size: 1.8em;
}

.num+span {
	float: right;
}

.num+span+div {
	border: solid 3px;
}
</style>
</head>
<body>
	<div class="wrap">
		<%-- <c:forEach var="i" items="list">
				<div class="list"></div>
					<h4>${i.number }</h4>
					<span class="num">01</span> <span>주문시간</span>
					<div style="margin-top:15%;">
						<span>경과시간</span>
					</div>
					<div class="menu" style="height: :140px; overflow-y:scroll;overflow-x:hidden;">
					
					
					</div>
		</c:forEach> --%>
		
			<%-- <div class="list" style="">
			<div class="head">
				<h4>01064364393</h4>
				<span class="num">01</span> <span class="">주문시간</span>
				<div style="margin-top: 15%;">
					<span>경과시간</span>
				</div>
			</div>
			<div class="menu"
				style="height: 140px; overflow-y: scroll; overflow-x: hidden;">
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
			</div>
			<button class="pay">결제확인1</button>
			<input type="hidden" value="01064364393">
			<input type="hidden" value="${sessionScope.seller.truck_code }">
			<button class="release">출고확인</button>
		</div> --%>
	</div>
	<button id="test">테스트</button>
</body>
<script>
	let sock = new SockJS("<c:url value="/project/echo"/>");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	$(".pay").click(function() {
		var a = $(this);
		var istrue = a.hasClass("pay");
		if (istrue) {
			var result = confirm('결제확인하시겠습니까?');
			if (result) {
				a.removeClass("pay");
				console.log(a);
				a.css("background-color", "red");
				
				var query = {
						payment_telephone:a.next().val(),
						truck_code:a.next().next().val()
				};
				$.ajax({					
					type:"post",
					url:"/project/pay/payck",
					async: false,
					data:query,
					success:function(data){
						console.log(data);
					}
				});
			} 
		}
	});

	// 메시지 전송
	function sendMessage() {
	}

	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		console.log(msg);
		var jsonString = msg.data;
		var datatest = JSON.parse(msg.data);
		console.log(datatest);
		console.log(typeof datatest);
		$("#forReceive").append(
				"<span class='result'>" + jsonString + "</span><br/>");
	}

	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#forReceive").append("연결 끊김");
	}
	$('#test').click(function() {
		var a = $('#forReceive').children(1);
		console.log(a.html());
		var test = JSON.parse(a.html());
		console.log(test);
		$.ajax({
			type : "POST",
			url : "/project/pay/insertPayment",
			data : JSON.stringify(test),
			contentType : "application/json;charset=UTF-8",
			traditional : true,
			success : function(data) {
				console.log('success');
			},
			error : function(err) {
				console.log(err);
			}
		});
	});
</script>
</html>
