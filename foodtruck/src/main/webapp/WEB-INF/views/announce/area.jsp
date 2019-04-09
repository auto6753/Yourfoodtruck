<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header/header.jsp"></jsp:include>
<script src="http://cdn.jsdelivr.net/sockjs/0.3.4/sockjs.min.js"></script>
<button id="toOne">첫번째</button>
<button id="toTwo">두번째</button>
<div id="one">one영역</div>
<div id="two">two영역</div>
<input id="socketTest" type="button" value="json보내보기" />
<div id="data"></div>
<script>
	$('#two').hide();
	$(function() {
		$('#toOne').click(function() {
			$('#one').show();
			$('#two').hide();
		});
		$('#toTwo').click(function() {
			$('#one').hide();
			$('#two').show();
		});
		$('#socketTest').click(function() {
			sendMessage();
		});
	});

	var message = '${list}';
	var forTest = JSON.parse(message);
	console.log(message);
	let sock = new SockJS("<c:url value="/project/echo"/>");
	sock.onmessage = onMessage;
	sock.onclose = onClose;

	// 메시지 전송
	function sendMessage() {
		sock.send(JSON.stringify(forTest));
	}

	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		console.log(msg);
		var jsonString=msg.data;
		var datatest = JSON.parse(msg.data);
		console.log(datatest);
		console.log(typeof datatest);
		$("#two").append(jsonString + "<br/>");
	}

	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#data").append("연결 끊김");
	}
</script>
