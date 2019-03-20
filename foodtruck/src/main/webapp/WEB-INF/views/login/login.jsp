<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>BootStrap</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<style>
body{
background-color: rgb(248,249,250);
}

#logo {
	text-align: center;
	margin-top: 100px;
	color:blue;
	font-weight:bold;
	font-size: 50px;
}

body {
	text-align: center;
}

#login_box {
	width: 400px;
	margin: 0 auto;
}
#form{
	margin-top: 50px;
}
</style>
 <script>
 
 </script>
</head>
<body>
		<p id="logo"><a href="rehome">당신의 푸드트럭</a></p>
	<form id="form" >
		<div id="login_box">
			<div class="form-group">
				<input type="text" class="form-control" id="아이디" placeholder="아이디">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="비밀번호"
					placeholder="비밀번호">
			</div>
			<button type="button" class="btn btn-primary btn-lg btn-block">로그인</button>



			<br> <span class="txt_find"> <a href="forgetid" class="link_find">아이디찾기</a>

				<a href="" class="link_find">비밀번호찾기</a> <a href="register" class="link_find">회원가입</a>

			</span>
			 
		</div>
	</form> 
	
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>