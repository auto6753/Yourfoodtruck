<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>BootStrap</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
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

#all{

	margin-top: 50px;
	
	width: 50%;
	margin: 0 auto;

}
#form {
	margin-left: 10%;
	margin-right: 10%;
	
}


#login_box {
	
	margin-top: 20px;
}

#next {
	align: center;
	
}


</style>	


<script>
	
</script>
</head>

<body>

	<div id="logo"><a href="/project/rehome">당신의 푸드트럭</a></div>
	
	<div id= "all">
				<form id="form">
			<div id="title"class="card-header">비밀번호찾기</div>
			<div id="login_box">
				<div class="form-group">
					<input type="text" class="form-control" id="name" placeholder="아이디입력">
				</div>
				
					
					<button id="next" type="button"
						class="btn btn-primary btn-lg btn-block">다음</button>
				</div>

			</form>
	
			</div>
	

	<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
</body>
</html>