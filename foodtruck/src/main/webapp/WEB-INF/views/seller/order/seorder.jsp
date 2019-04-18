<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Product list for Ecommerce Website</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.9.3/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.4/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.4/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.9.3/firebase-database.js"></script>
<style type="text/css">
body {
	font-family: "Open Sans", sans-serif;
}

.wrap {
	width: 1300px;
	height: 300px;
	overflow-x: scroll;
	white-space: nowrap;
	overflow-y: hidden;
}

.list {
	width: 300px;
	height: 100%;
	display: inline-block;
	border: solid 3px;
}

wrap {
	white-space: nowrap;
}

.menu {
	
}

.head {
	
}

h4 {
	text-align: center;
}

.num {
	color: darkgreen;
	float: left;
	font-size: 1.8em;
}

.num+span {
	float: right;
}

.num+span+div {
	border: solid 3px;
}
</style>
</head>
<body>
	<div class="wrap">
		<%-- <c:forEach var="i" items="list">
				<div class="list"></div>
					<h4>${i.number }</h4>
					<span class="num">01</span> <span>주문시간</span>
					<div style="margin-top:15%;">
						<span>경과시간</span>
					</div>
					<div class="menu" style="height: :140px; overflow-y:scroll;overflow-x:hidden;">
					
					
					</div>
		</c:forEach> --%>
		
			<%-- <div class="list" style="">
			<div class="head">
				<h4>01064364393</h4>
				<span class="num">01</span> <span class="">주문시간</span>
				<div style="margin-top: 15%;">
					<span>경과시간</span>
				</div>
			</div>
			<div class="menu"
				style="height: 140px; overflow-y: scroll; overflow-x: hidden;">
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
				<p>dsf</p>
			</div>
			<button class="pay">결제확인1</button>
			<input type="hidden" value="01064364393">
			<input type="hidden" value="${sessionScope.seller.truck_code }">
			<button class="release">출고확인</button>
		</div> --%>

		<div id="forReceive"></div>
	</div>
	<button id="test">테스트</button>
	<input type="hidden" id="bfss" value="">
</body>
<script>
  	$(".pay").click(function() {
		var a = $(this);
		var istrue = a.hasClass("pay");
		if (istrue) {
			var result = confirm('결제확인하시겠습니까?');
			if (result) {
				a.removeClass("pay");
				console.log(a);
				a.css("background-color", "red");
				
				var query = {
						payment_telephone:a.next().val(),
						truck_code:a.next().next().val()
				};
				$.ajax({					
					type:"post",
					url:"/project/pay/payck",
					async: false,
					data:query,
					success:function(data){
						console.log(data);
					}
				});
			} 
		}
	});
var first=true;
var config = {
	apiKey : "AIzaSyDgw_gFc9MB7Rc8Z7WjJUOqeWT6YQOqvxU",
	authDomain : "fir-test-f3fea.firebaseapp.com",
	databaseURL : "https://fir-test-f3fea.firebaseio.com",
	projectId : "fir-test-f3fea",
	storageBucket : "fir-test-f3fea.appspot.com",
	messagingSenderId : "960564228551"
};
firebase.initializeApp(config);
var _uid='${requestScope._uid}';
console.log(_uid);
var beforeSnapshot='';

var forDblist=new Array();
$(function() {
	var ref=firebase.database().ref('/PaymentTest2/'+ _uid +'/').limitToFirst(15);
	ref.once('value').then(function(snapshot) {
		first=false;
	}).catch(function(err) {
		console.log(err.errorMessage);
	});
	var index;
	ref.on('value',function(snapshot) {
		if(beforeSnapshot!=snapshot.val()){
			var result=snapshot.val();
			for(var menus in result) {
				console.log('=====결과를 전화번호별로 구분=====');
				console.log(menus);
				console.log(result[menus]);
				var orderList=result[menus];
				
				for(var order in orderList) {
					console.log('=======전화번호별 거래내용들을 보여줌(같은번호로 했을떄 한개만)=======');
					console.log(orderList[order]);//전화번호별 거래내역
					console.log(order);//전화번호
					var order_index=order_index=orderList[order].length;//한사람당 주문한 제품개수
					console.log(order_index);
					$('#forReceive').append('<span class="orderInfo">' + order+'</span><br/>');
					if(order_index >1) {
						for(var i=0;i<order_index;i++) {
							$('#forReceive').append('<span class="orderInfo">'+orderList[order][i].name+'&nbsp;'+orderList[order][0].amount+'</span><br/>');
							$('#forReceive').append('<span class="orderInfo">'+orderList[order][i].total_price+'</span><br/>');
							$('#forReceive').append('<span class="orderInfo">'+orderList[order][i].payment_telephone+'</span><br/>');
						}
						$('#forReceive').append('<hr/>');	
					}else{
						$('#forReceive').append('<span class="orderInfo">'+orderList[order][0].name+'&nbsp;'+orderList[order][0].amount+'</span><br/>');
						$('#forReceive').append('<span class="orderInfo">'+orderList[order][0].total_price+'</span><br/>');
						$('#forReceive').append('<span class="orderInfo">'+orderList[order][0].payment_telephone+'</span><br/>');
						$('#forReceive').append('<hr/>');	
					}
					break;   
				}		
			}
		}
	});
});


/*$('#test').click(function() {
	 var a=$('#forReceive').children(1);
	console.log(a.html());
	var test=JSON.parse(a.html());
	console.log(test);
	 $.ajax({
		type:"POST",
		url:"/project/pay/insertPayment",
		data:JSON.stringify(test),
		contentType:"application/json;charset=UTF-8",
		traditional:true,
		success:function(data) {
			console.log('success');
		},error:function(err) {
			console.log(err);
		}
	});  
});*/
</script>
</html>
