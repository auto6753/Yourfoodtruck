<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../header/header.jsp"></jsp:include>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="/resources/js/seller/jquery.ajax-cross-origin.min.js"></script>
<script>
$(function(){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp91176976');
	$("#dd").click(function(){
		//alert("클릭");
		$.ajax({
			 url:"http://localhost:3000/cardrefund",
			 crossOrigin:true,
		     "type": "POST",
		      "contentType": "application/json",
		      "data": JSON.stringify({
		        "merchant_uid": "merchant_1557396551185", // 주문번호
		        "cancel_request_amount": 200, // 환불금액
		        "reason": "테스트 결제 환불" // 환불사유
		        //"refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 가상계좌 예금주
		        //"refund_bank": "88" // [가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex. KG이니시스의 경우 신한은행은 88번)
		        //"refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
		      }),
		      "dataType": "json"
		    }).done(function(result) { // 환불 성공시 로직 
		    	console.log(result);
		        alert("환불 성공");
		    }).fail(function(error) { // 환불 실패시 로직
		      alert(error);
		      console.log(error);
		      alert("환불 실패1");
		    });
	});
	$("#test").click(function(){
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
		    	/* $.ajax({
		    		type:"post",
		    		url:"",
		    		async:false,
		    		data:{
		    			imp_uid:rsp.imp_uid,
		    			merchant_uid : merchant_uid,
		    			paid_amount: rsp.paid_amount,
		    			apply_num : rsp.apply_num
		    		},
		    		success:function(data){
		    			if(data=="success")
		    				location.reload();
		    			else
		    				alert(data);
		    		},
		    		error:function(err){
		    			alert(err);
		    		}
		    	}); */
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
	});
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
					행사일 : ${i.festival_startdate } ~ ${i.festival_enddate } <br>
					행사시간 : ${i.festival_starttime } ~ ${i.festival_endtime } <br>
					행사장소 : ${i.place} <br>
					섭외비용 : ${i.price } 원<br>
					요구사항 : ${i.content } <br>
					</td>
					<td>
					신청자명 : ${i.name } <br>
					전화번호 : ${i.calltel }
					</td>
					<c:if test="${i.pay_status ==1}">
					<td>결제완료<br>
					</c:if>
					<c:if test="${i.pay_status ==2}">
					<td>미결제<br>
					</c:if>
					<c:if test="${i.pay_status ==0}">
					<td>취소<br>
					</c:if>
					<c:if test="${i.agreement ==2}">
					<button>승인하기</button><br>
					</c:if>
					<c:if test="${i.agreement ==1}">
					승인이 완료된 호출입니다.<br>
					</c:if>
					<c:if test="${i.agreement ==0}">
					취소된 호출입니다.<br>
					</c:if>
					<c:if test="${i.progress ==1}">
					진행중<br><button>도착</button><br></td>
					</c:if>
					<c:if test="${i.progress ==2}">
					거래가 완료된 호출입니다.<br></td>
					</c:if>
					<c:if test="${i.progress ==0}">
					취소<br></td>
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

