<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../header/header.jsp"></jsp:include>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="/resources/js/seller/jquery.ajax-cross-origin.min.js"></script>
<script>
$(function(){
	var IMP = window.IMP;  //생략가능
	IMP.init('imp91176976');
	$(this).click(function(e){
		//console.log(e);
		var target = e.target;
		var temp= $(target).attr('class');
		if(temp=='cancel1'){
			//alert(temp);
			//var a= target.parents('tr');
			if(confirm("취소를 하시겠습니까?")){
			var mid = $(target).closest('tr').find('input').val();
			var temp = $(target).closest('tr').find('input');
			var name = temp.closest('td').next().children().html();
			var price = $(target).closest('tr').find('span').html();
			console.log(price);
			//var price;
			//var name = price.next();
			console.log(name);
			console.log(mid);
			//var mid;
			var reason ="트럭측의 취소";
			cancel(price,name,mid,reason);
			}	
		}else if(temp=='confirm2'){
			//alert(temp);
			confirm("행사장에 도착하신게 맞습니까? 혹시 행사장에 아직 도착하지 않았다면 취소를 눌러주세요 확인을 누르시면 취소가 어려울수도 있으니 행사장에 도착하였다면 호출하신분과 만나뵙고 확인을 눌러주세요");
			console.log($(target).closest('tr').find('input').val());
			var meid = $(target).closest('tr').find('input').val();
			var a = [meid,4];
			update(a);
		}else if(temp=='cancel3'){
			confirm("이미 호출하신분이 확인을 하셨기 때문에 취소가 바로 되지 않습니다. 상대방과 충분히 합의후에 취소신청을 하셨다면 네 를 눌러주세요");
			console.log($(target).closest('tr').find('input').val());
		}else if(temp=='confirm3'){
			//alert(temp);
			confirm("행사장에 도착하고 호출하신분과 만나뵈었으면 확인을 눌러주세요 확인을 누르면 거래가 완료됩니다.");
			console.log($(target).parents('tr').find('input').val());
			var meid = $(target).closest('tr').find('input').val();
			var a = [meid,5];
			update(a);
		}else if(temp=='agree'){
			//alert(temp);
			confirm("해당 호출에 대해서 승인을 하시겠습니까?");
			console.log($(target).closest('tr').find('input').val());
		}else if(temp=='cancel4'){
			//alert(temp);
			confirm("이미 확인을 하셨기 때문에 취소가 바로 되지 않습니다. 상대방과 충분히 합의후에 취소신청을 하셨다면 네 를 눌러주세요");
			console.log($(target).closest('tr').find('input').val());
		}else if(temp=='cancel2'){
			//alert(temp);
			confirm("승낙을 하셨는데 취소를 하시겠습니까?");
			console.log($(target).closest('tr').find('input').val());
		}
		});
	//$("#dd").click(function(){
		//alert("클릭");
		
	function update(i){
		var a = i;
		console.log(i[0]);
		console.log(i[1]);
		console.log(i);
		$.ajax({
			url:"",
			type:"post",
			data:{
				merchant_uid:i[0],
				progress :i[1]
			},
			success:function(data){
				alert(data);
				window.location.reload();
			}
		});
		
	}
	function cancel(price,name,uid,reason){
		
		$.ajax({
			 url:"http://localhost:3000/cardrefund",
			 crossOrigin:true,
		     "type": "POST",
		      "contentType": "application/json",
		      "data": JSON.stringify({
		        "merchant_uid": ""+uid+"", // 주문번호
		        "cancel_request_amount": ""+price+"", // 환불금액
		        "reason": ""+reason+"" // 환불사유
		        //"refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 가상계좌 예금주
		        //"refund_bank": "88" // [가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex. KG이니시스의 경우 신한은행은 88번)
		        //"refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
		      }),
		      "dataType": "json"
		    }).done(function(result) { // 환불 성공시 로직 
		    	console.log(result);
		    	console.log(result.merchant_uid);
		    	if(result=="error"){
		    		console.log(result);
		    		alert("취소 실패");
		    	}else{
		    		$.ajax({
		   			 url:"/pay/Callrefund",
		   			 async:false,
		   			 type:"post",
		   			 data:{
		   				merchant_uid : result.merchant_uid
		   			 },
		   			 success:function(data){
		   				alert("취소 성공");
		   				window.location.reload();
		   			 }
		    		});
		    	}
		        
		    }).fail(function(error) { // 환불 실패시 로직
		      alert(error);
		      console.log(error);
		      alert("환불 실패1");
		    });
	}
	//});
/* 	$("#test").click(function(){
		//alert("클릭");
		$.ajax({
			url:"localhost:3000/test",
		    type: "POST",
		    //crossOrigin : true
		});	     
	});
	
	$("#pay").click(function(){
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 200,
		    //buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    //m_redirect_url : 'https://www.yourdomain.com/payments/complete' 
		}, function(rsp) {
		    if ( rsp.success ) {
		    	 //$.ajax({
		    		//type:"post",
		    		//url:"",
		    		//async:false,
		    		//data:{
		    		//	imp_uid:rsp.imp_uid,
		    		//	merchant_uid : merchant_uid,
		    		//	paid_amount: rsp.paid_amount,
		    		//	apply_num : rsp.apply_num
		    		//},
		    		//success:function(data){
		    	//		if(data=="success")
		    	//			location.reload();
		    	//		else
		    	//			alert(data);
		    	//	},
		    	//	error:function(err){
		    	//		alert(err);
		    	//	}
		    	}); 
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	}); */ 
});

</script>
<style>
	#wrapper {
		width: 80%;
		margin-top: 15%;
	}
</style>
<div class="container">
	<div class="row">
		<div class="col-md-3">
			<jsp:include page="../sideMenuBar/sideMenuBar.jsp"></jsp:include>
		</div>
		<div class="col-md-9">
			<table style="width:1000px;" id="wrapper" border="1">
				<!-- #wrapper에 스타일 지정 -->
				<tr>
					<td style="width:50%"id="col_1">요청정보</td>
					<!-- #col_1에 스타일 지정 -->
					<td style="width:30%"id="col_2">신청자정보</td>
					<!-- #col_2에 스타일 지정 -->
					<td style="width:20%"id="col_3">진행상태</td>
					<!-- #col_3에 스타일 지정 -->
				</tr>
			<c:forEach var="i" items="${callList}">
				<tr>
					<!-- 요청된 호출 수만큼 <tr> 태그 생성 -->
					<td>
					<input type="hidden" value="${i.merchant_uid}"/>
					행사일 : ${i.festival_startdate } ~ ${i.festival_enddate } <br>
					행사시간 : ${i.festival_starttime } ~ ${i.festival_endtime } <br>
					행사장소 : ${i.place} <br>
					섭외비용 : <span>${i.price }</span> 원<br>
					요구사항 : ${i.content } <br>
					</td>
					<td>
					신청자명 : <span>${i.name }</span> <br>
					전화번호 :${i.calltel }
					</td>
					<c:if test="${i.pay_status ==1}">
					<td>결제 : 결제 완료<br>
					</c:if>
					<c:if test="${i.pay_status ==2}">
					<td>결제 : 미결제<br>
					</c:if>
					<c:if test="${i.pay_status ==0}">
					<td>결제 : 취소<br>
					</c:if>
					<c:if test="${i.progress ==1}">
					상태 : 진행중<br><button class="agree">승인</button><button class="cancel1">취소</button></td>
					</c:if>
					<c:if test="${i.progress ==2}">
					상태 : 진행중<br><button class="confirm2">확인</button><button class="cancel2">취소</button>
					</td>
					</c:if>
					<c:if test="${i.progress ==3}">
					상태 : 행사측 확인완료<br><button class="confirm3">확인</button><button class="cancel3">취소</button></td>
					</c:if>
					<c:if test="${i.progress ==4}">
					상태 : 행사측 미확인<br><button class="cancel4">취소</button></td>
					</c:if>
					<c:if test="${i.progress ==5}">
					상태 : 거래종료<br></td>
					</c:if>
					<c:if test="${i.progress ==6}">
					상태 : 취소<br></td>
					</c:if>
					<c:if test="${i.progress ==7}">
					취소 신청을 하셨습니다.<br></td>
					</c:if>
				</tr>
			</c:forEach>
			</table>
		</div>
		<button id="pay">결제하기</button>
		<button id="dd">환불</button>
		<button id="test">test</button>
	</div>
</div>
