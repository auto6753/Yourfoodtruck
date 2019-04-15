<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header/header.jsp"></jsp:include>
<script src="http://cdn.jsdelivr.net/sockjs/0.3.4/sockjs.min.js"></script>
dd
<div id="forReceive">

</div>
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
		$("#forReceive").append(jsonString + "<br/>");
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#forReceive").append("연결 끊김");
	}
</script>