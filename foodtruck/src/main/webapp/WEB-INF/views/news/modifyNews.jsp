<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸드트럭 등록</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/news/modifyNews.css"/>" /> 
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>





</head>
<body>
	<div id="title" class="card-header">
		<p>푸드트럭NEWS</p>
	</div>
	<form id="all">
	<div id="box">
		<div class="form-group">
			<label for="exampleInputEmail1">제목</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				rows="1">공지사항</textarea>
		
		</div>
		<div class="form-group">
			<label for="exampleFormControlTextarea1">내용</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				rows="6">오늘의 공지입니다. 확인바랍니다.</textarea>
		</div>
		<button type="submit" class="btn btn-primary">수정완료</button>
		<button type="submit" class="btn btn-primary">취소</button>
		</div>
	</form>
	



</body>
</html>