<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../../header/header.jsp"></jsp:include>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<script>
$(function(){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp91176976');
	$("#dd").click(function(){
		var query = {
				id : 3
		}
		$.ajax({
			type:"get",
			data :query,
			dataType:'jsonp',
			url:"http://localhost:3000/refund",
			success : function(data){
				console.log(data);
			},
			error : function(err){
				console.log(err);
			}
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
<div class="container">
		<div class="row">
			<div class="col-md-3">
				<jsp:include page="../sideMenuBar/sideMenuBar.jsp"></jsp:include>
			</div>
			<div class="col-md-9">호출관리 content</div>
			<button id="pay">결제하기</button>
			<button id="dd">환불</button>
		</div>
</div>