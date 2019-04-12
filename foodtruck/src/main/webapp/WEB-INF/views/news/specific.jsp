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
	href="<c:url value="/resources/css/news/specific.css"/>" />
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>





</head>
<body>
	<div id="title" class="card-header">
		<p id="title2">푸드트럭NEWS</p>
	</div>

	<form id="all">
		<div id="box">
			<div class="jumbotron">
				<h1 id="titles"class="display-10">4월정기점검안내</h1>
				<hr class="my-4">
				<p>이번주 공지사항 입니다.
				항상 감사드리고 푸드트럭 많이 방문해주세요!</p>
				<p class="lead">
					<button id="d" type="submit" class="btn">수정</button>
					<button id="d" type="submit" class="btn">삭제</button>
				</p>
			</div>


		</div>
	</form>





</body>
</html>
