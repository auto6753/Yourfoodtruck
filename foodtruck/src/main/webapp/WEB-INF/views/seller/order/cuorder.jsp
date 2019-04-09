<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!------ Include the above in your HEAD tag ---------->
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<style>
table {
	width: 100px;
}

thead, tbody, tr, td, th {
	display: block;
}

thead th {
	height: 30px;
}

tbody {
	overflow-y: auto;
	height: 150px;
}

tbody td, thead th {
	float: left;
	width: 20%;
}

tr:after {
	clear: both;
	content: ' ';
	display: block;
	visibility: hidden;
}

.qty .count {
	color: #000;
	display: inline-block;
	vertical-align: top;
	font-size: 25px;
	font-weight: 700;
	line-height: 30px;
	padding: 0 2px;
	min-width: 35px;
	text-align: center;
}

.qty .plus {
	cursor: pointer;
	display: inline-block;
	vertical-align: top;
	color: white;
	width: 30px;
	height: 30px;
	font: 30px/1 Arial, sans-serif;
	text-align: center;
	border-radius: 50%;
}

.qty .minus {
	cursor: pointer;
	display: inline-block;
	vertical-align: top;
	color: white;
	width: 30px;
	height: 30px;
	font: 30px/1 Arial, sans-serif;
	text-align: center;
	border-radius: 50%;
	background-clip: padding-box;
}

div {
	text-align: center;
}

.minus:hover {
	background-color: #717fe0 !important;
}

.plus:hover {
	background-color: #717fe0 !important;
}
/*Prevent text selection*/
span {
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

input {
	border: 0;
	width: 2%;
}

nput::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

input:disabled {
	background-color: white;
}
</style>
<script>
$(document).ready(function(){
	$("#test").on('click',"div",function(){
		var a= $(this).find('p')
		var name = a.html();
		var price = a.next().html();
		var code = a.next().eq(1).val();
		alert(name + price + code);
		/* console.log(a.html());
		console.log(a.next().html());
		console.log(a.next().eq(1).val()); */
		
	$("tbody").append("<tr><td>"+name+"</td><td>"+"<div style='display: inline-block;' class='qty mt-5'><span class='minus bg-dark'>-</span><input type='number' class='count' name='qty' value='1'/><span class='plus bg-dark'>+</span></div>"+"</td><td>"+price+"</td>");
	});
	$("#cancle1").click(function(){
		$("tbody").empty();
		var a= $("tbody");
		
	});		
	    $('.count').prop('disabled', true);
			$(document).on('click','.plus',function(){
			$('.count').val(parseInt($('.count').val()) + 1 );
		});
    	$(document).on('click','.minus',function(){
			$('.count').val(parseInt($('.count').val()) - 1 );
				if ($('.count').val() == 0) {
					$('.count').val(1);
				}
	    	});
		
	
});
</script>
<div id="test" class="box"
	style="border: solid 1px black; width: 450px; height: 500px; display: inline-block;">
	<c:forEach var="s" items="${menulist}">
		<div style="display: inline-block;" class="forTest">
			<input style="width: 100%; height: 100px;" type="button"
				value="${s.menu_code }">
			<p>${s.menu_name }</p>
			<p>${s.unit_price }</p>
			<input type="hidden" value="${s.menu_code }" />
		</div>
	</c:forEach>
</div>
<div id="list"></div>
<div class="container">
	<div class="row">
		<h2>주문목록</h2>
	</div>
	<table class="table table-fixed table-striped">
		<thead>
			<tr>
				<th>메뉴</th>
				<th>수량</th>
				<th>가격</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>
총가격					<div style="display: inline-block;" class="qty mt-5">
                        <span class="minus bg-dark">-</span>
                        <input type="number" class="count" name="qty" value="1">
                        <span class="plus bg-dark">+</span>
                    </div>
<button id="cancle1">취소</button> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>주문관리</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/news/news.css"/>" />

<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.min.js"/>"></script>

</head>
<style>
#logo {
	text-align: center;
	font-weight: bold;
	font-size: 290%;
}

div a {
	color: rgb(255, 94, 24);
}

#box {
	border: 2px solid;
	border-radius: 10px;
	color: rgb(255, 94, 24);
	width: 70%;
	height: 1100px;
	margin: 0 auto;
	margin-top: 40px;
	
}
#box2{
	border: 2px solid;
	color: rgb(255, 94, 24);
	width:85%;
	height:650px;
	margin:0 auto;
	position:relative;
	margin-top: 70px;
	overflow: auto;
	
	
}
#box3{
	border: 2px solid;
	color: rgb(255, 94, 24);
	width: 85%;
	height: 200px;
	margin:0 auto;
	position: relative;
	margin-top:40px;
	overflow: auto;
}

#click {
	background-color: rgb(255, 94, 24);
	color: white;
	width: 49.8%;
	float: left;
}

#click2 {
	background-color: rgb(255, 94, 24);
	color: white;
	width: 49.8%;
	float: right;
}  
#click3{
	
	width:85%;
	text-align: center;
	margin: 0 auto;
	
	
	
	
	
}
#c1{
	
	background-color: rgb(255, 94, 24);
	color: white;
	width:28%;
	height:50px;
	font-size:60%;
	margin-top:40px;
	
}
#c2{
	background-color: rgb(255, 94, 24);
	color: white;
	width:28%;
	height:50px;
	font-size:60%;
	margin-top:40px;
	
}
#c3{
	background-color: rgb(255, 94, 24);
	color: white;
	width:28%;
	height:50px;
	font-size:50%;
	margin-top:40px;
}

#food{
	
	width:50%;
	height:250px;
	
}
#food1{
	
	width:50%;
	height:250px;
	
}
#food2{
	
	width:50%;
	height:250px;
	
}

#foodlist {
	text-align:center;
	margin: 0 auto;
	margin-top:30px;
} 








/* #foodlist button {
	width: 35%;
	height: 0;
	padding-bottom: 10%;
	align: center;
} */


</style>

<body>
	<div id="logo">
		<a href="/project/rehome">당신의 푸드트럭</a>
	</div>
	<div>
		<div id="box">
			<button id="click" class="btn">food</button>
			<button id="click2" class="btn">drink</button>
	 		<div id="box2" >
	 			<div id="foodlist">
	 			<button id="food" class="btn" ></button>
	 			<p>고추장불고기</p>
	 			<p>4500원</p>
	 			<button id="food1" class="btn"></button>
	 			<p>닭강정</p>
	 			<p>4000원</p>
	 			<button id="food2" class="btn"></button>
	 			<p>회오리감자</p>
	 			<p>3000원</p>
	 			
	 			</div>
	 		</div>
	 		
	 		<div id="box3">
	 			<table>
	 				<thead>
	 					<tr>
	 					<th width="50%">
	 						<div id="list">메뉴</div>
	 					</th>
	 					<th width="25%">
	 						<div id="list">수량</div>
	 					</th>	
	 					<th width="25%">
	 						<div id="list">가격</div>
	 					</th>
	 					</tr>
	 				</thead>
	 				<tbody>
	 				<tr>
	 					<td>1</td>
	 					<td>1</td>
	 					<td>1</td>
	 				</tr>
	 					
	 					
	 					
	 						 				
	 					
	 						
	 						
	 					
	 				</tbody>
	 			</table>
	 		
	 		</div>
	 		<div id="click3">
	 			<button id="c1" class="btn">카드결제</button>
	 			<button id="c2"class="btn">현금결제</button>
	 			<button id="c3"class="btn">카카오페이</button>
	 		</div>
	 	</div>
	 	

	</div>





</body>
</html>