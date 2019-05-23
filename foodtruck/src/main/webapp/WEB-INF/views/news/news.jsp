<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>푸드트럭NEWS</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/news/news.css"/>"/>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
</head>
<body>
	<div id="title" class="card-header">
		<p>푸드트럭NEWS</p>
	</div>
	<div id="searchall">
		<nav class="navbar navbar-light bg-light">
			<form class="form-inline" action="/news" method="post" >
               	<input id="searchbox" name="keyword" value="${map.keyword}">
				<input type="hidden" name="post_class" value="0">
				<input id="searchbutton"type="submit" value="조회" class="btn">
				<c:if test="${not empty sessionScope.sessionid}">
				<a href="/news/addNews"><button id="pageadd" type="button" class="btn">등록</button></a>
				</c:if>
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
				<c:forEach var="row" items="${requestScope.newsList}">
					<tr>
						<td class="boardTitle">${row.POST_TITLE}</td>
						<input type="hidden" value="${row.POST_CODE }">
						<td>${row.POST_REGDATE}</td>
 						<td>${row.POST_VISIT}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div id="nextall">
		<nav id="next" aria-label="Page navigation example">
			<ul class="pagination">
				<li class="page"><a class="page-link" href="javascript:list('1')"><span>&lt;&lt;</span></a></li>
				<c:forEach var="num" begin="${map.postPager.blockBegin}" end="${map.postPager.blockEnd}">
					<li class="page-item"><a class="page-link" href="javascript:list('${num}')"><span>${num}</span></a></li>
				</c:forEach>			
				<li class="page-item"><a class="page-link" href="javascript:list('${map.postPager.nextPage}')"><span>>></span></a></li>
			</ul>
		</nav>
	</div>
	<script>
	function list(page) {
		location.href="/news?curPage="+page+"&keyword=${map.keyword}";
	}
	$(document).ready(function(){
		$('.boardTitle').on('click', function(){
			var a = $(this);
			var postCode= a.next().val();//next td 다음에 나오는 것을 지칭함 , val은 next에 해당하는 val에 해당하는 값
			$(location).attr('href','/news/specificck?post_code='+postCode+
				"&curPage=${map.postPager.curPage}&keyword=${map.keyword}");
		});
	});
	</script>
</body>
</html>
