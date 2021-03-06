<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height, target-densitydpi=device-dpi" />
<title>당신의 푸드트럭</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/announce/area.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>

</head>
<body>
   
   <div id="title" >
      <p>일반 모집공고</p>
      <div id="side">
   <jsp:include page="sidebar.jsp"></jsp:include>
   </div>
   </div>
   <div style="height: 800px;">
   


   <div id="content1" style="display: inline-block; ">
   
   <div id="searchalll">
      <nav class="navbarrr">
         <form class="form-inline" action="/recruit" method="post">
            <input id="searchbox"name="keyword" value="${map.keyword}">
            <input type="hidden" name="post_class" value="1">
            <input id="searchbutton"type="submit" value="검색" class="btn" id="search">
            <c:if test="${not empty sessionScope.sessionid}">
            <a href="/recruit/addRecruit"><button id="pageadd" type="button" class="btn">등록</button></a>
            </c:if>
         </form>
      </nav>
   </div>
   
   <div id="table">
      <table class="table">
         <thead>
            <tr>
               <th>조회수</th>
               <th>제목</th>
               <th>등록일</th>
               <th>참여현황</th>
               <th>모집여부</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="row" items="${recruit }">
            <tr>
               <td>${row.request_view}</td>
               
               <td class="boardTitle">${row.request_title}</td>
               <input type="hidden" value="${row.request_code }"> 
               <td><fmt:formatDate value="${row.request_regdate}" pattern="yyyy.MM.dd"/></td>
               <td>${row.request_truck_count }</td>
               <c:if test="${row.request_status == 0}">
               <td>모집중</td>
               </c:if>
               <c:if test="${row.request_status == 1 }">
               <td>모집마감</td>
               </c:if>
            </c:forEach>
         </tbody>
      </table>
   </div>

   <div id="nextall">
      <nav id="next" aria-label="Page navigation example">
         <ul class="pagination">
            <li class="page"><a class="page-link" href="#"><span>&lt;&lt;</span></a></li>
               <li class="page-item"><a class="page-link" href="javascript:list('1')"><span>1</span></a></li>                     
            <li class="page-item"><a class="page-link" href="#"><span>&gt;&gt;</span></a></li>
         </ul>
      </nav>
   </div>
</div>
</div>

<script>
$(document).ready(function(){
   $('tr').on('click', function(){
      var a = $(this);
      a = a.find(".boardTitle");
      var requestCode= a.next().val();//next td 다음에 나오는 것을 지칭함 , val은 next에 해당하는 val에 해당하는 값
      $(location).attr('href','/recruit/specific?request_code='+requestCode);
   });
});
   function list(page) {
      location.href="/announce?curPage="+page+"&keyword=${map.keyword}";
   }
   $(function() {
      //next td 다음에 나오는 것을 지칭함 , val은 next에 해당하는 val에 해당하는 값
      $('#title').click(function() {
         location.href="/announce"; 
      }); 
      $('#view').click(function() {
         location.href="/area"; 
      });
      $(".table td").addClass("word-break");
      $(".table th").addClass("word-break");
   });
</script>
</body>
</html>