<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신의 푸드트럭</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value="/resources/css/help/myQuestion.css"/>" />
</head>
<body>
	<div class="container" style="max-width: 1650px;">
		<div class="row">
			<div class="col-md-2" style="margin-top: 50px;">
				<jsp:include page="../customer/sideMenuBar.jsp"></jsp:include>
			</div>
			<div class="col-md-10">
				<div id="with" class="col">
					<h1 style="text-align: center; padding-top: 20px;">문의내역</h1>
					<br>
					<table style="background-color: #f8f9fa" class="table table-hover"
						class="col">
						<tr>
							<th>문의번호</th>
							<th>제목</th>
							<th>내용</th>
							<th>상태</th>
							<th>등록일</th>
						</tr>
						<tbody id="g">
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(
				function() {
					var templist = ${list};
					var list = JSON.parse(JSON.stringify(templist));
					console.log(list);
					for (var i = 0; i < list.length; i++) {
						$("#g").append(
								"<tr><td>" + list[i].question_code
										+ "</td><td>" + list[i].question_title
										+ "</td><td>"
										+ list[i].question_content
										+ "</td><td> " + list[i].status
										+ "</td><td> "
										+ list[i].question_regdate
										+ "</td></tr>");
					}

				});
	</script>
</body>
<%-- <section class="display-inline">
      <h3>문의번호</h3>

      <c:forEach var="item" items="${list}" step=1>
          ${item.num}
      </c:forEach>
   </section>
   <section class="display-inline">
      <h3>제목</h3>
      <c:forEach var="item" items="${list}" step=1>
          ${item.title}
      </c:forEach>
   </section>
   <section class="display-inline">
      <h3>등록일</h3>
      <c:forEach var="item" items="${list}" step=1>
          ${item.regDate}
      </c:forEach>
   </section>
   <section class="display-inline">
      <h3>답변일</h3>
      <c:forEach var="item" items="${list}" step=1>
          ${item.resDate}
      </c:forEach>
   </section>
   <section class="display-inline">
      <h3>상태</h3>
      <c:forEach var="item" items="${list}" step=1>
          ${item.status}
      </c:forEach>
   </section>
   <footer>
   ${result}
   </footer>
   <div id="content">
   </div>
</div>  --%>



</html>