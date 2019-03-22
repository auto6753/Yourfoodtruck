<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
<title>BootStrap</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<style>
body{
background-color: rgb(248,249,250);
}

#logo {
	text-align: center;
	margin-top: 150px;
	color:blue;
	font-weight:bold;
	font-size: 40px;

}

body {
	text-align: center;
}

#login_box {
	width: 360px;
	margin: 0 auto;
}
#form{
	margin-top: 50px;
}
</style>
 <script>
 $(document).ready(function(){
	$("#login").click(function(){
		alert("클릭");
		var path = "check";
		var query = {
				m_mail:$("#id").val(),
				m_passwd:$("#pw").val()
		}
		$.ajax({
			url:path,
			type:"post",
			data:query,
			success:function(data){
				console.log(data);
				if(data=="idfail") //아이디틀림
				alert("아이디 틀렸당");
				else if(data == "pwfail")//비번틀림
				alert("비번 틀렸당")
				else{
					alert("성공");
					location.href="rehome";
				}
					
			}
		});
	});
 });
 </script>
</head>
<body>
		<p id="logo"><a href="rehome">당신의 푸드트럭</a></p>
	<form id="form" >
		<div id="login_box">
			<div class="form-group">
				<input type="text" class="form-control" id="id" placeholder="아이디" value="">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="pw" placeholder="비밀번호" value="">
			</div>
			<button id="login" type="button" class="btn btn-primary btn-lg btn-block">로그인</button>
			<br> <span class="txt_find"> <a href="forgetid" class="link_find">아이디찾기</a>
				<a href="" class="link_find">비밀번호찾기</a> <a href="register" class="link_find">회원가입</a>
			</span>
		</div>
	</form> 
</body>
</html>