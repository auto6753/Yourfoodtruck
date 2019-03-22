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

#nextall {
	
	width: 52%;
	margin-left: 25.5%;
	margin-right: 25%;
	
}

#all {
	margin-top: 50px;
	width: 50%;
	margin: 0 auto;
}

#next {
	width: 47%;
	
	
}

#next1 {
	width: 47%;
	
}
#button{
	font-size: 60%;
}
#button1{
	font-size: 60%;
}
</style>


<script>
	
</script>
</head>

<body>

	<div id="logo">
		<a href="rehome">당신의 푸드트럭</a>
	</div>

	<div id="all">


		<div class="card-header">아이디찾기</div>
		<form id="form">
			<div class="form-group">
				<label for="exampleFormControlTextarea1">보유중인 아이디</label>
				<li><a href="" title="Banking & Insurance apps"> <span
						class="text">tmxk55</span></a>
					<div class="clearfix"></div></li>
			</div>
		</form>
	</div>
	<div id="nextall" >
		<div id="next" style="display: inline-block;">
			<button id="button"type="button" class="btn btn-primary btn-lg btn-block">비밀번호찾기</button>
		</div>

		<div id="next1" style="display: inline-block;">
			<button id="button1"type="button" class="btn btn-primary btn-lg btn-block">로그인하기</button>
		</div>
	</div>



	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>

</body>
</html>