<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
	width: 60%;
	margin: 0 auto;
	
}
#font {
	font-size: 100%;
}



#next {
	
	
	margin: 0 auto;
	width: 150px
}


</style>


<script>
	
</script>
</head>

<body>

	<div id="logo"><a href="/project/rehome">당신의 푸드트럭</a></div>

	<div id="all">
		
			
			<div class="card-header">비밀번호찾기</div>
			<form id="form">
				<div class="form-group">
					<label id="font" for="exampleFormControlTextarea1">회원님의 입력하신 이메일로 임시비밀번호가 발송 됩니다.</label>
					
				</div>
				
				
					<button id="next" type="button"
					class="btn btn-primary btn-lg btn-block">로그인하기</button>
			</form>
		</div>





	<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

</body>
</html>