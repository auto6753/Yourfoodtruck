<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>푸드트럭NEWS</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/news/news.css"/>"/>

<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.min.js"/>"></script>

</head>

<body>
	<div id="title" class="card-header">
		<p>푸드트럭NEWS</p>
	</div>
	<div id="main">
		<div id="search">
			<nav class="navbar navbar-light bg-light">
				<form class="form-inline">
					<input id="searchbox" class="form-control mr-sm-2" type="search"
						placeholder="Search" aria-label="Search">
					
					<button id="search2"type="button" class="btn">검색</button>
					
				</form>
			</nav>
		</div>
		<div id="table">
		<table class="table">
			<thead>
				<tr>
					<th>제목</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="i" items="${postList}">
			<tr>
				<td>${i.post_title }</td>
				<td>${i.post_regdate}</td>
				<td>${i.post_visit}</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
		<div>
			<nav id="next" aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page"><a class="page-link" href="#"> <span>«</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#"><span>1</span></a></li>
					<li class="page-item"><a class="page-link" href="#"><span>2</span></a></li>
					<li class="page-item"><a class="page-link" href="#"><span>3</span></a></li>
					<li class="page-item"><a class="page-link" href="#"><span>»</span>
					</a></li>
				</ul>
			</nav>

		</div>
	</div>
	<div class="form-group">

		<a href="/project/news/addNews"><button id="add" type="button" class="btn" >등록</button></a>

	</div>
<%-- ${postList}
<button id="test">테스트</button> --%>


</body>
</html>
<!-- <script>
	$(function() {
		$('#test').click(function() {
			location.href="/project/news/specific";
		});
	});
</script> -->