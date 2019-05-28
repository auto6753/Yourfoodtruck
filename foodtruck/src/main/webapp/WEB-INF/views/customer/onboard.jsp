<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신의 푸드트럭</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet" href="<c:url value ="/resources/css/customercss/onboard.css"/>"/>
<script>
$(document).ready(function(){
	$(".delete").click(function(){
		alert("d");
		var a = $(this);
		//var truckcode = $("#truckcode").val();
		var truckcode = a.next().val();
		alert(truckcode);
		var email= "${sessionScope.sessionid.email}";
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
		alert(today);
		alert(truckcode);
		alert(email);
		
		$.ajax({
			type : "post",
			url : "/customer/Deleteride",
			data : {
				"truck_code" : truckcode, "email" : email, "out_date" : today
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
		//var truck_code = $("#truckcode").val();
		var a = $(this);
		var truck_code = a.next().next().val();
				location.href = "/truck/?truck_code="+truck_code;
	});
});
</script>
</head>
<body>
<div id="with" class = "col">
		<h1 style="text-align:center; margin-top:10px;">탑승중인 트럭</h1><br>
		<div class="album py-5 bg-light">
		<div class="container">
		<div class="row">
		<c:forEach var="i" items="${onboard}">
		<div class="col-md-4">
		<div class="card mb-4 shadow-sm">
		<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
		<rect width="100%" height="100%" fill="#55595c"></rect>
		<text x="50%" y="50%" fill="#eceeef" dy=".3m">Thumbnail</text>
		</svg>
		<div class="card-body">
		<p class="card-text">

			${i.brandname}
			${i.onboard_date}
		</p>
		<div class="d-flex justify-content-between align-items-center">
		<div class="btn-group">
		<button class="btn btn-sm btn-outline-secondary detail">상세정보</button>
		<button class="btn btn-sm btn-outline-secondary delete">하차</button>
		<input class="truckcode" type="hidden" value="${i.truck_code}"/>
		</div>
		</div>
		</div>
		</div>
		</div>
		</c:forEach>
		
	
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
</body>
</html>