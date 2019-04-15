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
	width: 1000px;
	height: 300px;
	overflow-x: scroll;
	white-space: nowrap
}

.wrap div {
	width: 300px;
	height: 100%;
	display: inline-block;
}

wrap {
	white-space: nowrap;
}


</style>
</head>
<body>
	<div class="wrap">
		<div id="forReceive"></div>
	</div>
	<button id="test">테스트</button>
</body>
<script>
let sock = new SockJS("<c:url value="/project/echo"/>");
sock.onmessage = onMessage;
sock.onclose = onClose;

// 메시지 전송
function sendMessage() {
}

// 서버로부터 메시지를 받았을 때
function onMessage(msg) {
	console.log(msg);
	var jsonString=msg.data;
	var datatest = JSON.parse(msg.data);
	console.log(datatest);
	console.log(typeof datatest);
	$("#forReceive").append("<span class='result'>" + jsonString + "</span><br/>");
}

// 서버와 연결을 끊었을 때
function onClose(evt) {
	$("#forReceive").append("연결 끊김");
}
$('#test').click(function() {
	var a=$('#forReceive').children(1);
	console.log(a.html());
	var test=JSON.parse(a.html());
	console.log(test);
	 $.ajax({
		type:"POST",
		url:"/project/pay/insertPayment",
		data:JSON.stringify(test),
		contentType:"application/json;charset=UTF-8",
		traditional:true,
		success:function(data) {
			console.log('success');
		},error:function(err) {
			console.log(err);
		}
	}); 
});
</script>
</html>
