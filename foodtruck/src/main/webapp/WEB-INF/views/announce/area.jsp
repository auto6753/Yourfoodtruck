<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>허가구역 안내</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/announce/area.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
</head>
<body>
	<button id="toRecruit" class="btn">모집공고 보기</button>
	<div id="title" class="card-header">
		<p>허가구역 안내</p>
	</div>
	<div id="searchall">
		<nav class="navbar navbar-light bg-light">
			<form class="form-inline" action="/area" method="post">
				<!-- <input id="searchbox" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
				<button id="searchbutton" type="button" class="btn">검색</button> -->
				<select id="forSido"name="sido" onchange="changeSido()" value="${sido}">
					<option value="1">서울</option>
					<option value="2">부산</option>
					<option value="3">대구</option>
					<option value="4">인천</option>
					<option value="5">광주</option>
					<option value="6">대전</option>
					<option value="9">경기</option>
					<option value="10">강원</option>
					<option value="11">충북</option>
					<option value="12">충남</option>
					<option value="13">전북</option>
					<option value="14">전남</option>
					<option value="15">경북</option>
					<option value="16">경남</option>
					<option value="17">제주</option>
				</select>				
				<input id="searchbox"name="keyword" value="${map.keyword}">
				<input type="hidden" name="post_class" value="2">
				<input id="searchbutton" type="submit" value="조회" class="btn">
			</form>
		</nav>
	</div>

	<div id="table">
		<table class="table">
			<thead>
				<tr>
					<th>지역</th>
					<th>구역명</th>
					<th>주소</th>
					<th>관할구역</th>
					<th>문의전화번호</th>
				</tr>
			</thead>
			<tbody>
 				<c:forEach var="row" items="${requestScope.areaList}">
 				<tr>
 					<td>${row.SIDO_NAME}</td>
 					<td class="boardTitle">${row.AREA_NAME}
 						<input type="hidden" class="latitude" value="${row.LATITUDE}">
 						<input type="hidden" class="longitude" value="${row.LONGITUDE}">
 					</td>
 					<td>${row.ADDR}</td>
 					<td>${row.GOVERN_NAME}</td>
 					<td>${row.GOVERN_PHONE}</td>
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
		location.href = "/area?sido="+${sido}+"&curPage=" + page + "&keyword=${map.keyword}";
		
	}
	function changeSido() {
		var sido = $('#forSido').val();
		location.href="/area?sido="+sido;
	}
	$(document).ready(function() {
		console.log("${sido}");
		$('#forSido').val("${sido}");
		$('#title').click(function() {
			location.href = "/area";
		});
		$('#toRecruit').click(function() {
			location.href = "/announce";
		});
	});
</script>	
</body>
</html>