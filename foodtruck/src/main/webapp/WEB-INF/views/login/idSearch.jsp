<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	font-size: 50px;
}

#form {
	margin-top: 50px;
}


#login_box {
	width: 500px;
	margin-top: 20px;
}

#next {
	align: center;
	width: 100px
}

.test {
	width: 85%
}

.test2 {
	display: block;
	float: right;
}

#mcheck {
	margin-top: -38px;
}

#next {
	float: right;
	margin: 10px 0;
}
.card-header{
	width: 500px;
}
</style>	


<script>
	
</script>
</head>

<body>

	<p id="logo">당신의 푸드트럭</p>
	
	<div>
		<ul>	
		<form id="form">
			<div class="card-header">아이디찾기</div>
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
		</ul>
	</div>

	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>

</body>
</html>