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
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.ajax-cross-origin.min.js"/>"></script>
<script src="https://www.gstatic.com/firebasejs/5.9.3/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.4/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.4/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.9.3/firebase-database.js"></script>
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
	width: 90%;
	height: 1100px;
	margin: 0 auto;
	margin-top: 40px;
}

#box2 {
	border: 2px solid;
	color: rgb(255, 94, 24);
	width: 85%;
	height: 650px;
	margin: 0 auto;
	position: relative;
	margin-top: 70px;
	overflow: auto;
	-ms-overflow-style: none;
}
#box2::-webkit-scrollbar {display:none;}
#box3::-webkit-scrollbar {display:none;}
#box3 {
	border: 2px solid;
	color: rgb(255, 94, 24);
	width: 85%;
	height: 200px;
	margin: 0 auto;
	position: relative;
	margin-top: 20px;
	overflow: auto;
	-ms-overflow-style: none;
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

#click3 {
	width: 95%;
	text-align: center;
	margin: 0 auto;
}

.c1 {
	background-color: rgb(255, 94, 24);
	color: white;
	width: 22%;
	height: 50px;
	font-size: 120%;
	margin-top: 5px;
}

.food {
	width: 50%;
	height: 250px;
}

#foodlist {
	text-align: center;
	margin: 0 auto;
	margin-top: 30px;
}

h3 {
	padding-top: 1%;
	margin-left: 7.2%;
}

</style>
<body>
	<div id="logo">
		<a href="/project/rehome">현재 푸드트럭</a>
	</div>
	<div>
		<div id="box">
			<button id="click" class="btn">food</button>
			<button id="click2" class="btn">drink</button>
			<div id="box2">
				<div id="foodlist">
					<c:forEach var="s" items="${menulist}">
						<button class="btn food"></button>
						<p>${s.menu_name }</p>
						<p>${s.unit_price }</p>
						<input type="hidden" value="${s.menu_code }">
					</c:forEach>
				</div>
			</div>
			<h3 class="panel-title">주문목록</h3>
			<div id="box3" class="">
				<table class="table table-hover" id="">
					<thead>
						<tr>
							<th style="width: 30%">이름</th>
							<th style="width: 40%">수량</th>
							<th style="width: 30%">가격</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div style="text-align: right; margin-right: 10%;">
				<span style="font-size: 30px;">총 가격:</span><span
					style="font-size: 30px" id="allprice">0</span>
			</div>
			<div id="click3">
				<button id="card" class="btn c1">카드결제</button>
				<button id="cash" class="btn c1">현금결제</button>
				<button id="kakaopay" class="btn c1">카카오페이</button>
				<button id="cancle1" class="btn c1">취소</button>
			</div>
		</div>
	</div>
	<script>
	var config = {
			apiKey : "AIzaSyDgw_gFc9MB7Rc8Z7WjJUOqeWT6YQOqvxU",
			authDomain : "fir-test-f3fea.firebaseapp.com",
			databaseURL : "https://fir-test-f3fea.firebaseio.com",
			projectId : "fir-test-f3fea",
			storageBucket : "fir-test-f3fea.appspot.com",
			messagingSenderId : "960564228551"
	};
	firebase.initializeApp(config);
	console.log('${sessionScope.sessionid.password}');
	var email='${sessionScope.sessionid.email}';
	var password='${sessionScope.sessionid.password}';
	firebase.auth().signInWithEmailAndPassword(email, password).catch(function(error) {
	// Handle Errors here.
		var errorCode = error.code;
		var errorMessage = error.message;
		alert(errorMessage);
		// ...
	});
	var uid;
	firebase.auth().onAuthStateChanged(function(user) {
		  if (user) {
		    console.log(user);
		    console.log(firebase.auth());
		    uid=firebase.auth().currentUser.uid;
		  } else {
		    console.log('error');
		  }
		});
	var list = new Array();
	$(document).ready(
			function() {
				var is = false;
				var alltotal_price = 0;
				$("#foodlist").on('click',"button",function() {
							//var a=$(this).find('p');
							var a = $(this);
							//var name = a.html();
							var name = a.next().html();
							var total_price = a.nextAll().eq(1).html();
							var menu_code = a.nextAll().eq(2).val();
							var amount = 1;
							//클릭한 상품이 현재 목록에 있는지 확인
							for (var i = 0; i < list.length; i++) {
								if (list[i].menu_code == menu_code) { //있으면 수량만 더하기 
									list[i].amount += 1;
									list[i].total_price = list[i].amount * total_price;
									var k = list[i].menu_code;
									//해당 값 수정
									console.log($("#" + k).html());
									$("#" + k).html("<td>"+list[i].name+"</td><td>"+list[i].amount+"</td><td>"+ list[i].total_price+"</td>");
									console.log($("#" + k).html());
									alltotal_price += parseInt(total_price);
									$("#allprice").html(alltotal_price);
									is = true; // 상품이 있기때문에 true 로 바꿔서 추가못하게 함
								}
							}
							if (!is) { //상품이 없어서 추가하고 어팬드
								var temp = {
									menu_code : menu_code,
									amount : amount,
									total_price : parseInt(total_price),
									name : name
								}
								list.push(temp);
								var k = temp.menu_code;
								alltotal_price += parseInt(temp.total_price);
								$("#allprice").html(total_price);
								$("tbody").append("<tr id='"+k+"'><td>" + temp.name+ "</td><td>" + temp.amount+ "</td><td>" + temp.total_price + "</td>");
				
							}
							if (is) { //초기화
								//alert(is);
								is = false;
							}
						});
				$("#cancle1").click(function() {
					$("tbody").empty();
					var a = $("tbody"); //tebody 태그 없앰;
					alltotal_price = 0;
					$("#allprice").html(alltotal_price);
					list = new Array(); //list초기화
				});
				$("#kakaopay").click(function() {
					var date = new Date();
					var year=date.getFullYear().toString().substr(2);	var month=date.getMonth()+1;
					var day=date.getDate();	var hour=date.getHours();
					var minute=date.getMinutes(); var sec=date.getSeconds();
					if((day+'').length<2)	day="0"+day;
					if((month+'').length=1)	month="0"+month;
					var sysdate=year+month+'_'+day+'_'+hour+'_'+minute+'_'+sec;
					if (typeof list[0] == 'undefined') {
						alert("주문목록이업서여");
					} else {
						for(var a=0 ;a< list.length; a++) {
							list[a].payment_class=0;
							list[a].truck_code='${sessionScope.seller.truck_code}';
							list[a].payment_telephone='010-1111-4875';
							var orderRef=firebase.database().ref('/PaymentTest2/' +uid +'/'+list[0].payment_telephone +'/'+sysdate+'/'+a);
							orderRef.set(list[a]);
						}
						console.log(list);
						alert("주문등록 완료!");
						var ajaxdata='${sessionScope.sessionid.email}'+'_'+list[0].payment_telephone+'+'+sysdate;
						alert(ajaxdata);
/* 						$.ajax({
							crossOrigin:true,
							dataType:"jsonp",
							type:"GET",
							url:"https://us-central1-fir-test-f3fea.cloudfunctions.net/addMessage",
							data:{
								test:'${sessionScope.sessionid.email}_'+list[0].payment_telephone
							}
						});
					}		 */	
				});
				$("#cash").click(function() {
					var date = new Date();
					var year=date.getFullYear().toString().substr(2);	var month=date.getMonth()+1;
					var day=date.getDate();	var hour=date.getHours();
					var minute=date.getMinutes(); var sec=date.getSeconds();
					if((day+'').length<2)	day="0"+day;
					if((month+'').length=1)	month="0"+month;
					console.log(date.toString());
					var sysdate=year+month+'_'+day+'_'+hour+'_'+minute+'_'+sec;
					if (typeof list[0] == 'undefined') {
						alert("주문목록이업서여");
					} else {
						for(var a=0 ;a< list.length; a++) {
							list[a].payment_class=1;
							list[a].truck_code='${sessionScope.seller.truck_code}';
							list[a].payment_telephone='010-1111-4875';
							var orderRef=firebase.database().ref('/PaymentTest2/' +uid +'/'+list[0].payment_telephone +'/'+sysdate+'/'+a);
							orderRef.set(list[a]);
						}
						console.log(list);
						alert("주문등록 완료!");
					}

				});
				$("#card").click(function() {
					var date = new Date();
					var year=date.getFullYear().toString().substr(2);	var month=date.getMonth()+1;
					var day=date.getDate();	var hour=date.getHours();
					var minute=date.getMinutes(); var sec=date.getSeconds();
					if((day+'').length<2)	day="0"+day;
					if((month+'').length=1)	month="0"+month;
					console.log(date.toString());
					var sysdate=year+month+'_'+day+'_'+hour+'_'+minute+'_'+sec;
					if (typeof list[0] == 'undefined') {
						alert("주문목록이업서여");
					} else {
						for(var a=0 ;a< list.length; a++) {
							list[a].payment_class=2;
							list[a].truck_code='${sessionScope.seller.truck_code}';
							list[a].payment_telephone='010-1111-4875';
							var orderRef=firebase.database().ref('/PaymentTest2/' +uid +'/'+list[0].payment_telephone +'/'+sysdate+'/'+a);
							orderRef.set(list[a]);
						}
						console.log(list);
						alert("주문등록 완료!");
					}

				});
			});
	</script>
</body>
</html>
