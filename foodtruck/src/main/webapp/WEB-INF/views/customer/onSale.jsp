<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신의 푸드트럭</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value ="/resources/css/customercss/onSale.css"/>"/>

</head>
<body>
<div id="with" class = "col">
		<h1 style="text-align:center; margin-top:10px;">운행중인 트럭</h1><br>
		<div class="album py-5 bg-light">
		<div class="container">
		<div class="row">
		<c:if test="${onSale != null }">
		<c:forEach var="i" items="${onSale }">
			<div class="col-md-4" id="${i.truck_code}">
				<div class="card mb-4 shadow-sm">
					<img src="/resources/image/upload/${i.truck_url }" style="width: 100%;height: 225px;">
						<div class="card-body">
							<p class="card-text">
							${i.brandname}
							${i.onboard_date}
							</p>
							
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<button type="button" class="btn btn-sm btn-outline-secondary detail">상세정보</button>
									<button type="button" class="btn btn-sm btn-outline-secondary delete">하차</button>
									<input id="truckcode" type="hidden" value="${i.truck_code}"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			</c:if>
		</div>
	</div>

	</div>
	<div class="sunjae">
	<nav aria-label="Page navigation example" id="nav" class="sg" >
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only"></span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only"></span>
      </a>
    </li>
  </ul>
</nav>
		
</div>

</div>
<script>
	$(function(){
			$(".delete").click(function(){
				var a = $(this);
				
				//var truckcode = $("#truckcode").val();
				var truckcode= a.next().val();
				var email="${sessionScope.sessionid.email}";
				var date = new Date();
				var year = date.getFullYear();
				var month = date.getMonth() + 1; //months from 1-12
				var day = date.getDate();
				
				if((day+"").length < 2){
					day = "0" + day;
				}else if((month+"").length < 2){
					month = "0" + month;
				}
				var today = year + "-" + month + "-" + day;
				alert(truckcode);
				
				$.ajax({
					type : "post",
					url :"/customer/onboard",
					data : {
						"truckcode" : truckcode, "email" : email, "out_date": today
					},
					success : function(data) {
						alert("하차되었습니다.");
						location.reload();
					},
					error : function(err) {
						alert("오류발생");
					}
				});
			});
			$(".detail").click(function(){
				var a = $(this);
				//var truck_code = $("#truckcode").val();
				  var truck_code = a.next().next().val();
						location.href = "/truck/?truck_code="+truck_code;
			});
		});
</script>
</body>
</html>