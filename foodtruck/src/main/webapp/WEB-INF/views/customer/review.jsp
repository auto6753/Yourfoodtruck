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
	href="<c:url value ="/resources/css/customercss/review.css"/>" />
</head>
<body>
	<div style="overflow: auto" id="with" class="col">
	
		<h1 style="text-align: center; margin-top: 10px;">리뷰 및 평점</h1>
		<br>
		<table class="table table-hover" class="col">

			<thead>
				<th>푸드트럭명</th>
				<th>평점</th>
				<th>내용</th>
				<th>등록일</th>
				<th>관리</th>
			</thead>
			<tbody>
			<c:forEach var="i" items="${rlist }">
				<tr>
				
				
					<td>${i.brandname}</td>
					<td><span class="star-input"> <span class="input">
								<input type="radio" name="star-input" id="p1" value="1">
								<label for="p1">1</label> 
								<input type="radio" name="star-input" id="p2" value="2">
								<label for="p2">2</label> 
								<input type="radio"name="star-input" id="p3" value="3">
								<label for="p3">3</label>
								<input type="radio" name="star-input" id="p4" value="4">
								<label for="p4">4</label>
								<input type="radio" name="star-input" id="p5" value="5">
								<label for="p5">5</label> 
								<input type="radio" name="star-input" id="p6" value="6">
								<label for="p6">6</label>
								<input type="radio" name="star-input" id="p7" value="7">
								<label for="p7">7</label> 
								<input type="radio" name="star-input" id="p8" value="8">
								<label for="p8">8</label> 
								<input type="radio" name="star-input" id="p9" value="9">
								<label for="p9">9</label>
								<input type="radio" name="star-input" id="p10" value="10">
								<label for="p10">10</label>
						</span>
					</span></td> 
					<td>${i.review_content }</td>
					<td>${i.review_regdate }</td>
					
					
					<td><button>삭제</button>
						<button>수정</button></td>
				</tr>
				</c:forEach>

			</tbody>

		</table>
	</div>

</body>
</html>