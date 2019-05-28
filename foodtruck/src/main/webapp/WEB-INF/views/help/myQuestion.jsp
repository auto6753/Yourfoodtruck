<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 문의내역</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet" href="<c:url value="/resources/css/help/myQuestion.css"/>"/>
</head>
<body>
<div>

	
	<section class="display-inline">
		<h3>문의번호</h3>

<%-- 		<c:forEach var="item" items="${list}" step=1>
    		${item.num}
		</c:forEach> --%>
	</section>
	<section class="display-inline">
		<h3>제목</h3>
<%-- 		<c:forEach var="item" items="${list}" step=1>
    		${item.title}
		</c:forEach> --%>
	</section>
	<section class="display-inline">
		<h3>등록일</h3>
<%-- 		<c:forEach var="item" items="${list}" step=1>
    		${item.regDate}
		</c:forEach> --%>
	</section>
	<section class="display-inline">
		<h3>답변일</h3>
<%-- 		<c:forEach var="item" items="${list}" step=1>
    		${item.resDate}
		</c:forEach> --%>
	</section>
	<section class="display-inline">
		<h3>상태</h3>
<%-- 		<c:forEach var="item" items="${list}" step=1>
    		${item.status}
		</c:forEach> --%>
	</section>
	<footer>
	${result}
	</footer>
	<div id="content">
	</div>
</div>
<script>
$(document).ready(function(){
	var templist = ${list};
	var list = JSON.parse(JSON.stringify(templist));
	console.log(list);
	for(var i=0;i<list.length;i++){
		$("#content").append(list[i].question_code+" " + list[i].question_title+ " " + list[i].question_content + " " + list[i].status +  " " + list[i].question_regdate + "<br>");		
	}
	
});

</script>

</body>
</html>