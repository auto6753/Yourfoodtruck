<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>BootStrap</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<style>
* {
	margin: 0 auto;
}

body {
	background-color: rgb(248, 249, 250);
}

#logo {
	text-align: center;
	margin-top: 100px;
	color: blue;
	font-weight: bold;
	font-size: 300%;
}

#form {
	margin-left: 25%;
	margin-right: 25%;
}
#form1 {
	
	margin-left: 20%;
	margin-right: 20%;
}

#all {
	margin-top: 50px;
	width: 60%;
	margin: 0 auto;
}

#login_box {
	margin-top: 20px;
}

#next {
	align: center;
}

.test2 {
	display: block;
	float: right;
}

#next {
	float: right;
	margin: 10px 0;
}

#title {
	width: 100%;
	margin-right: auto;
	margin-left: auto;
}



/* #nextall {
	
	margin-left:auto;
	margin-rignt:auto;
	
	
} */
#button{
	font-size: 60%;
}
#button1{
	font-size: 60%;
}


</style>
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function(){
		$("#next").click(function(){
			$("#idsearch").css("display","none");
			$("#idsearch1").css("display","block");
		});
	});
</script>
</head>

<body>

	<div id="logo">
		<a href="rehome">당신의 푸드트럭</a>
	</div>

	<div id="idsearch">
		<form id="form">
			<div id="title" class="card-header">아이디찾기</div>
			<div id="login_box">
				<div class="form-group">
					<input type="text" class="form-control" id="name" placeholder="이름">
				</div>
				<div style="display: block" class="form-group">
					<input type="text" class="form-control test" id="email"
						placeholder="이메일">
					<button id="mcheck" type="button" class="btn btn-primary test2">인증</button>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="check"
						placeholder="인증번호 입력">
					<button id="next" type="button"
						class="btn btn-primary btn-lg btn-block">다음</button>
				</div>
			</div>
		</form>
	</div>
	
	<div id="idsearch1" style="display: none">
		<form id="form1">
		<div id="title" class="card-header">아이디찾기</div>
			<div class="form-group">
				<label for="exampleFormControlTextarea1">보유중인 아이디</label>
				<li><a href="" title="Banking & Insurance apps"> <span
						class="text">tmxk55</span></a>
					<div class="clearfix"></div></li>
			</div>
	

		
			<div id="pwnext" style="display: inline-block;">
				<button id="button" type="button"
					class="btn btn-primary btn-lg btn-block">비밀번호찾기</button>
			</div>

			<div id="loginnext" style="display: inline-block;">
				<button id="button1" type="button"
					class="btn btn-primary btn-lg btn-block">로그인하기</button>
			</div>
		
		</form>
	</div>


</body>
</html>