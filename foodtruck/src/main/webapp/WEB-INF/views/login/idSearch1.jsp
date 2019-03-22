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
	float: right;
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
		<ul>
			<form id="form">
				<div class="form-group">
					<label for="exampleFormControlTextarea1">아이디찾기</label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="3"></textarea>
				</div>
				
				<button id="next1" type="button"
					class="btn btn-primary btn-lg btn-block">비밀번호찾기</button>
					<button id="next" type="button"
					class="btn btn-primary btn-lg btn-block">로그인하기</button>
	</div>

	</div>
	</form>
	</ul>
	</div>

	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>

</body>
</html>