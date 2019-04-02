<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>푸드트럭NEWS</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">

<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

<script>


</script>
<style>
#title {
	width: 100%;
	margin: 0 auto;
	font-size: 200%;
	border-top: solid gray;
	border-bottom: solid gray;
	border-width: thin;
}

#title {
	color: rgb(0, 123, 255);
}

#next {
	display: table;
	magin-top: 250px;
	margin-left: auto;
	margin-right: auto;
}
#add{
	float: right;
}

</style>

</head>

<body>
	<div id="title" class="card-header">
		<p>푸드트럭NEWS</p>
	</div>
	<div>
		<div id="search">
			<nav class="navbar navbar-light bg-light">
				<form class="form-inline">
					<input id="searchbox" class="form-control mr-sm-2" type="search"
						placeholder="Search" aria-label="Search">
					<button type="button" class="btn btn-primary">검색</button>

				</form>
			</nav>
		</div>

		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>

				<tr>
					<td>1</td>
					<td>푸드트럭 공지사항</td>
					<td>오영준</td>
					<td>2019.04.01</td>
					<td>50</td>

				</tr>
				<tr>
					<td>1</td>
					<td>푸드트럭 공지사항</td>
					<td>오영준</td>
					<td>2019.04.01</td>
					<td>50</td>

				</tr>



			</tbody>



		</table>





		<div>
			<nav id="next" aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">«</span> <span
							class="sr-only">Previous</span>
					</a></li>
					<li class="page-item active"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">»</span> <span
							class="sr-only">Next</span>
					</a></li>
				</ul>
			</nav>





		</div>
	</div>
	<div id="add" class="form-group">

		<button type="button" class="btn btn-primary" >등록</button>
	</div>


</body>
</html>
