<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신의 푸드트럭</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<style>
#with{
	margin-top: 200px;
	margin-left:450px;
	width: 1000px;
	height: 650px;
	border: 1px solid darkgray;
}
img{
	width: 100px;
	height: 100px;
	margin-top: 20px;
	margin-left: 450px;
}
#check{
	width:1000px;
	height:300px;
	background-color: #E6E6E6;
}
h1,h2{
	text-align: center;
}
button{
	
}
</style>
</head>
<body>
<div id="with">
<img src='${pageContext.request.contextPath}/resources/image/text.png'>
<p style="margin-top:20px; text-align: center; font-size:50px;"><span style="color: #0080FF;">회원탈퇴</span>가 완료되었습니다.</p>
<div id="check">
<br>
<h1>그 동안 당신의 푸드트럭을 이용해주셔서 감사합니다.</h1>
<h2>보다 나은 서비스로 찾아뵙겠습니다.</h2>
<button style="margin-top:50px; margin-left: 400px; height: 60px; width:200px;">첫 화면</button>
</div>

</div>

</body>
</html>