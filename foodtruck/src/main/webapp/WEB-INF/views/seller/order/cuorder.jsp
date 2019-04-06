<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<button id="cancle1">취소</button>