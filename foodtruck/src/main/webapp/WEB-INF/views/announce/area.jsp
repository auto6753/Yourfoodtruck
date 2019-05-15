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
	<div id="title" class="card-header">
		<p>허가구역 안내</p>
	</div>
	
	<div id="searchall">
		<nav class="navbar navbar-light bg-light">
			<form class="form-inline" action="/area" method="post">
				<!-- <input id="searchbox" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
				<button id="searchbutton" type="button" class="btn">검색</button> -->
				<input placeholder="Search" aria-label="Search"id="searchbox" class="form-control mr-sm-2"name="keyword" value="${map.keyword}">
				<input type="hidden" name="post_class" value="2">
				<input type="submit" id="searchbutton" value="조회" class="btn">
				<c:if test="${not empty sessionScope.sessionid}">
				<a href="/area/addArea"><button id="pageadd" type="button" class="btn">등록</button></a>
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
 				<c:forEach var="row" items="${requestScope.areaList}">
 				<tr>
 					<td class="boardTitle">${row.POST_TITLE}</td>
 					<input type="hidden" value="${row.POST_CODE}">
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
		location.href="/area?curPage="+page+"&keyword=${map.keyword}";
	} 
   $(document).ready(function(){
      $('.boardTitle').on('click', function(){
      var a = $(this);
      var postCode= a.next().val();//next td 다음에 나오는 것을 지칭함 , val은 next에 해당하는 val에 해당하는 값
      /* query ={
            post_code : postCode
      }
      $.ajax({
         type:"post",
         url:"/project/news/specificck",
         data:query,
         success:function(data){
            //location.href="/project/news/specific";
            
         }//get 방식 주소치는거랑 똑같음
      }); */
      $(location).attr('href','/area/specificck?post_code='+postCode+"&curPage=${map.postPager.curPage}&keyword=${map.keyword}");
      });
      $('#title').click(function() {
    	 location.href="/area"; 
      });
   });
</script>	
</body>
</html>