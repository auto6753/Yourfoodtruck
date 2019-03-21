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
	font-size: 50px;
}

#form {
	width: 500px;
	margin-top: 20px;
}


.card-header {
	width: 500px;
}
#next {
	float: left;
	margin: 10px 0;
	align: center;
	width: 200px
}
#next1 {
	float: right;
	margin: 10px 0;
	align: center;
	width: 200px
}

</style>


<script>
	
</script>
</head>

<body>

	<p id="logo">당신의 푸드트럭</p>

	<div>
		
			
			<div class="card-header">아이디찾기</div>
			<form id="form">
				<div class="form-group">
					<label for="exampleFormControlTextarea1">보유중인 아이디</label>
					<li><a href="" title="Banking & Insurance apps">
                                <span class="text">tmxk55</span></a>
                                <div class="clearfix"></div>
                            </li>
				</div>
				
				<button id="next1" type="button"
					class="btn btn-primary btn-lg btn-block">비밀번호찾기</button>
					<button id="next" type="button"
					class="btn btn-primary btn-lg btn-block">로그인하기</button>
			</form>
		</div>





	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>

</body>
</html>