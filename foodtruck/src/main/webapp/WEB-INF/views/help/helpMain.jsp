<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet" href="<c:url value="/resources/css/help/helpMain.css"/>"/>
<!-- <script>
	$(document).ready(function(){
		$("#questionReg").click(function(){
			location.href = "help/question_reg";
		});
	});
</script> -->
<title>고객센터</title>
</head>
<body>
<div class="helpTitle"><h1>고객센터</h1></div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-6">
			<img alt="Bootstrap Image Preview" src='${pageContext.request.contextPath}/resources/image/question.png' /> 
			<a class="nav-link" href="/help/questionReg">1:1문의</a>
<!-- 		버튼말고 a태그로 하고 스타일	
			<button type="button" id="questionReg" class="btn btn-link btn-lg">1:1 문의</button> -->
		</div>
		<div class="col-md-6">
			<img alt="Bootstrap Image Preview" src="${pageContext.request.contextPath}/resources/image/question_list.png" /> 
<!-- 		버튼말고 a태그로 하고 스타일
			<button type="button" class="btn btn-link btn-lg">문의내역</button> -->
			<a class="nav-link" href="/help/myQuestion">나의문의내역</a>
		</div>
	</div>
</div>
</body>
</html>