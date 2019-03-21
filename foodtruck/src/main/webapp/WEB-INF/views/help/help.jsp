<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1 {
		text-align: center;
	}
	.container-fluid {
		height: 500px;
		border: 2px lightgray solid;
		margin-top: 100px;
		padding-top:160px;
	}
	.col-md-6 {
		text-align: center;
	}
	.btn {
		color: black !important;
	}
</style>
<jsp:include page="../header/header.jsp"></jsp:include>
</head>
<body>
<h1>고객센터</h1>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-6">
			<img alt="Bootstrap Image Preview" src="resources/image/question.png" /> 
			<button type="button" class="btn btn-link btn-lg">
				1:1 문의
			</button>
		</div>
		<div class="col-md-6">
			<img alt="Bootstrap Image Preview" src="resources/image/question_list.png" /> 
			<button type="button" class="btn btn-link btn-lg">
				문의내역
			</button>
		</div>
	</div>
</div>
</body>
</html>