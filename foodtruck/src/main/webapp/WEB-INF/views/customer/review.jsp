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
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<script>
	
	
	/* $(document).ready(function(){
		$('.modify').on('click',function(){
			
			var a = $(this);
			var truckcode = a.next().val();
			
			alert(truckcode);
			
			location.href='/truck/?truck_code='+truckcode;
			
			
		});
		
		
	}); */
</script>
</head>
<body>

	<div  id="with" class="col">
	
		<h1 style="text-align: center; margin-top: 10px;">리뷰 및 평점</h1>
		<br>
	
		<table style="overflow: auto" class="table table-hover" class="col">
		
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
					<td>
					
						
					<c:if test="${i.review_score==1 }">
					<a id="on"class="on">★</a>
					</c:if>
					<c:if test="${i.review_score==2 }">
					<a id="on"class="on">★★</a>
					</c:if>
					<c:if test="${i.review_score==3 }">
					<a id="on"class="on">★★</a>
					</c:if>
					<c:if test="${i.review_score==4 }">
					<a id="on"class="on">★★★★</a>
					</c:if>
					<c:if test="${i.review_score==5 }">
					<a id="on"class="on">★★★★★</a>
					</c:if>
					
					
							
						
					
					</td> 
					<td>${i.review_content }</td>
					<td>${i.review_regdate }</td>
					
					
					<td>
						<a href="/truck/send/?truck_code=${i.truck_code}&send=1&review_code=${i.review_code}"><input type="button" class="modify" value="수정/삭제"></a>
						<input type="hidden" value="${i.truck_code }">
					</td>
				</tr>
				</c:forEach>

			</tbody>

		</table>
	
	</div>

</body>
</html>