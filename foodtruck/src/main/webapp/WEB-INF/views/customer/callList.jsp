<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>당신의 푸드트럭</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value ="/resources/css/customercss/callList.css"/>" />
<style>
</style>
<script>

$(document).ready(function(){
	//console.log("${CallList2}");
	
	$(this).click(function(e){
	console.log(e);
	var target = e.target;
	var temp= $(target).attr('class');
	if(temp=='cancel1'){
		//alert(temp);
		//var a= target.parents('tr');
		confirm("아직 트럭이 승낙을 하지않았습니다. 취소를 하시겠습니까?");
		console.log($(target).closest('tr').html());
	}else if(temp=='confirm2'){
		//alert(temp);
		confirm("트럭이 행사장에 도착하신게 맞습니까? 혹시 행사장에 아직 도착하지 않았다면 취소를 눌러주세요 확인을 누르시면 취소가 어려울수도 있으니 트럭이 행사장에 도착하였다면 확인을 눌러주세요");
		console.log($(target).closest('tr').html());
	}else if(temp=='cancel3'){
		confirm("이미 확인을 하셨기 때문에 취소가 바로 되지 않습니다. 상대방과 충분히 합의후에 취소신청을 하셨다면 네를 눌러주세요");
		console.log($(target).closest('tr').html());
	}else if(temp=='confirm4'){
		//alert(temp);
		confirm("트럭이 행사장에 도착하였다면 확인을 눌러주세요 확인을 누르면 거래가 완료됩니다.");
		console.log($(target).closest('tr').html());
	}
	});
	
	/* $(".cancel1").click(function(){
		alert("ㅇ");
		var a=$(this);
		console.log(a);
		
	});
	$(".confirm2").click(function(){
		alert("ㅇ");
		var a=$(this);
		console.log(a);
	});
	$(".cancel3").click(function(){
		alert("ㅇ");
		var a=$(this);
		console.log(a);
	});
	$(".confirm4").click(function(){
		alert("ㅇ");
		var a=$(this);
		console.log(a);
	}); */
	
	$(".page-item").click(function(){
		alert("ㅁ");
	});
	$("#a").click(function(){
		alert("ㅇ");
	});
	console.log("-----");
	var a = JSON.parse(JSON.stringify(${CallList2}));
	//var b = JSON.parse(a);
	//console.log(b);
	//a =JSON.stringify(a);
	//a = JSON.parse(a);
	console.log(typeof(a));
	console.log(a);
	//var c=console.log(a.length);
	console.log(a[0].brandname);
	for(var i=0;i<a.length;i++){
		var place = a[i].place;
		var brandname = a[i].brandname;
		var festival_name = a[i].festival_name
		if(place.length >= 7){
		    place = place.substr(0,7)+"..";
		}
		if(festival_name.length >= 5){
			festival_name = festival_name.substr(0,5)+"..";
		}
		if(brandname.length >= 5){
			brandname = brandname.substr(0,5)+"..";
		}
		console.log(brandname);
		console.log(place);
		console.log(festival_name);
		/* console.log(a[i].brandname);
		console.log(a[i].brandname); */
		var progress;
		var agreement;
		var pay_status;
		
		if(a[i].progress ==1){
			progress="진행중<button class='cancel1'>취소</button>";
			agreement="대기";
		}else if(a[i].progress ==2){
			progress="진행중<button class='confirm2'>확인</button>";
			agreement="승인";
		}else if(a[i].progress ==3){
			progress="트럭 미확인<button class='cancel3'>취소</button>";	
			agreement="승인";
		}else if(a[i].progress ==4){
			progress="트럭 확인<button class='confirm4'>확인</button>";	
			agreement="승인";
		}else if(a[i].progress ==5){
			progress="거래종료";	
			agreement="승인";
		}else if(a[i].progress ==6){
			progress="취소";	
			agreement="취소";
		}
		
		if(a[i].pay_status ==1){
			pay_status="카드결제 완료"
		}else if(a[i].pay_status ==2){
			pay_status="무통장입금 대기";
		}else if(a[i].pay_status ==3){
			pay_status="계좌이체 완료";	
		}else if(a[i].pay_status ==4){
			pay_status="무통장입금 완료";	
		}else if(a[i].pay_status ==5){
			pay_status="취소";	
		}
		
		$("#g").append("<tr><td>"+brandname+"</td>"
				 +"<td>"+place+"</td>"
				 +"<td>"+festival_name+"</td>"
				 +"<td>"+a[i].festival_startdate+"~"+a[i].festival_enddate+"</td>"
				 +"<td>"+a[i].request_date+"</td>"
				 +"<td>"+pay_status+"</td>"
				 +"<td>"+agreement+"</td>"
				 +"<td>"+progress+"</td></tr>"
		);
	}
		/* 		"<tr>"+
				+"<td>"+a[i].brandname+"</td>"
			    +"<td>"+a[i].place+"</td>"
			    +"<td>"+a[i].festival_name+"</td>"
			    +"</tr>"
			    /* +"<td>"+i.festival_startdate+"~"+{i.festival_enddate}+"</td>"
			    +"<td>"+i.festival_starttime+"~"+{i.festival_endtime}+"</td>"
			    +"<td>"+i.reporting_date+"</td>"
			    +"<td>"+i.progress+"</td>" */
			    
		
	/* 	<td>${i.name}</td>
		<td>${i.place}</td>
		<td>${i.festival_name}</td>
		<td>${i.festival_startdate}~${i.festival_enddate}</td>
		<td>${i.festival_starttime}~${i.festival_endtime}</td>
		<td>${i.reporting_date}</td>
		<td>${i.progress}</td> */	
	
	
});
</script>
</head>
<body>
	<div id="with" class="col">
		<h1 id="bb">호출내역</h1>
		<br>
		<table class="table table-hover" class="col">
			<tr>
				<th>푸드트럭명</th>
				<th>위치</th>
				<th>행사명</th>
				<th>행사일정</th>
				<th>신청일</th>
				<th>입금현황</th>
				<th>승인상태</th>
				<th>거래상태</th>
			</tr>
			<tbody id="g">
				<%-- 		<c:forEach var="i" items="${CallList}">
				<tr>
					<td>${i.name}</td>
					<td>${i.place}</td>
					<td>${i.festival_name}</td>
					<td>${i.festival_startdate}~${i.festival_enddate}</td>
					<td>${i.festival_starttime}~${i.festival_endtime}</td>
					<td>${i.reporting_date}</td>
					<td>${i.progress}</td>									
				</tr>
</c:forEach> --%>
			</tbody>
		</table>
	</div>
	<div class="sunjae">
		<nav aria-label="Page navigation example" id="nav" class="sg">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						<span class="sr-only"></span>
				</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
						class="sr-only"></span>
				</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>