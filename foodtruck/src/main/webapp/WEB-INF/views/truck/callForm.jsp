<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신의 푸드트럭</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value ="/resources/css/truck/callForm.css"/>" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"
	type="text/javascript"></script>	
	
<script>
	
	function autoHypenPhone(str){
            str = str.replace(/[^0-9]/g, '');
            var tmp = '';
            if( str.length < 4){
                return str;
            }else if(str.length < 7){
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3);
                return tmp;
            }else if(str.length < 11){
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 3);
                tmp += '-';
                tmp += str.substr(6);
                return tmp;
            }else{              
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 4);
                tmp += '-';
                tmp += str.substr(7);
                return tmp;
            }
            return str;
        }

	//input 비어있는거 체크
	function check(){
		var ok = true;
		var temp;
		var count = $(".input").length;
		//console.log(list);
		for(var i=0;i<count;i++){
			//alert(i);
			temp = $(".input").eq(i).val();
			console.log(temp);
			if(temp =="" || temp ==" "){
				temp = $(".input").eq(i).focus();
				//console.log(temp);
				ok = false;
				break;
			}
					
		}
		console.log(ok);
		return ok;
		
		
		var personname = $("#inname").val();
		if(personname=="" ||personname==" "){
			return false;
		}else{
			return true;
		}
		var tel = $("#intel").val();
		var festivalname = $("#inplace").val();
		var startdate = $("#Startdate").val();
		var enddate = $("#Enddate").val();
		var starttime = $("#Starttime").val();
		var endtime = $("#Endtime").val();
		var placenum = $("#postnum").val();
		var placeload = $("#loadaddr").val();
		var placedetail = $("#addrdetail").val();
		var cost = $("#cost").val();
		var content = $("#content").val();
		
	}
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				$("[name=addr1]").val(data.zonecode);
				$("[name=addr2]").val(fullRoadAddr);

				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
			}
		}).open();
	}
	 $(document).ready(function(){
		  var IMP = window.IMP; // 생략가능
		  IMP.init('imp91176976'); 
		 
			var cellPhone = document.getElementById('intel');
			cellPhone.onkeyup = function(event){
			        event = event || window.event;
			        var _val = this.value.trim();
			        this.value = autoHypenPhone(_val) ;
			}
		  
/* 		$("#btn2").click(function(){
			
			var personname = $("#inname").val();
			var tel = $("#intel").val();
			var festivalname = $("#inplace").val();
			var startdate = $("#Startdate").val();
			var enddate = $("#Enddate").val();
			var starttime = $("#Starttime").val();
			var endtime = $("#Endtime").val();
			var placenum = $("#postnum").val();
			var placeload = $("#loadaddr").val();
			var placedetail = $("#addrdetail").val();
			var cost = $("#cost").val();
			var content = $("#content").val();
			console.log(placenum);
			var place = placeload+ " " + placedetail;

			console.log(place);
			$.ajax({
				type: "post",
				url: "/project/truck/callList",
				data: {name:personname, calltel:tel, festival_name:festivalname, festival_startdate:startdate,festival_enddate:enddate, festival_starttime: starttime, festival_endtime: endtime, place:place, price:cost, content: content},
				success:function(data){
					console.log(data);
				},
				error:function(error){
					alert(error);
				}
			})
		}); */
		
	 $('#btn1').click(function() {
		 if(check()){
		  $('#pop').show();
		 }
		 else {
			 alert("빈칸을 채워주세요");
		 }
	    // $('#pop').show();
	     
	    });
	    
	    $('#close').click(function() {
	     $('#pop').hide();
	    });

	
			$("#agree").click(function(){
				//alert("1");
				var i = $('input[name="radio"]:checked').val();
				if(i==null)
					alert("결제수단을 선택해주세요");
				else if(i==1)
					card();
				else if(i==2)
					transfer();
				else if(i==3)
					notransfer();
			});
			
		
	 });
	function card(){
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : $("#truckname").val()+" 트럭호출",
		    amount : $("#cost").val(),
		    buyer_email : "",
		    buyer_name : $("#inname").val(),
		    buyer_tel : $("#intel").val()
		    //m_redirect_url : 'https://www.yourdomain.com/payments/complete' 
		}, function(rsp) {
			console.log(rsp);
		    if ( rsp.success ) {
		    	alert(rsp.paid_amount);
		    	var truckcode = $("#truck_code").val();
				var personname = $("#inname").val();
				var tel = $("#intel").val();
				var festivalname = $("#inplace").val();
				var startdate = $("#Startdate").val();
				var enddate = $("#Enddate").val();
				var starttime = $("#Starttime").val();
				var endtime = $("#Endtime").val();
				var placenum = $("#postnum").val();
				var placeload = $("#loadaddr").val();
				var placedetail = $("#addrdetail").val();
				var cost = $("#cost").val();
				var content = $("#content").val();
				var email = "${sessionScope.sessionid.email}";
				console.log(placenum);
				var place = placeload+ " " + placedetail;
		    	alert("ㅇ");
		    	$.ajax({
		    		type:"post",
		    		url:"/pay/CallPayment",
		    		async:false,
		    		data:{
		    			//imp_uid:rsp.imp_uid,
		    			merchant_uid : rsp.merchant_uid,
		    			name : personname,
		    			email : email ,
		    			truck_code :truckcode ,
		    			place : place ,
		    			festival_starttime : starttime ,
		    			festival_endtime :  endtime ,
		    			//reporting_date :,
		    			festival_startdate : startdate,
		    			festival_enddate : enddate ,
		    			price : rsp.paid_amount,
		    			pay_status : 1,
		    			festival_name : festivalname ,
		    			//deposit_name : ,
		    			//advance_rate : content ,
		    			content :content ,
		    			zip_code : placenum,
		    			calltel : tel
		    		
		    			//paid_amount: rsp.paid_amount, */
		    			//apply_num : rsp.apply_num
		    		},
		    		success:function(data){
		    			alert(data);
		    			if(data=="success"){
		    				window.location.href="/customer/callList";
		    			}
		    			else{
		    				alert(data);
		    			}
		    		},
		    		error:function(err){
		    			alert(err);
		    		}
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
	}
	function transfer(){
		
	}
	function notransfer(){
		
	}
</script>
</head>
<body>
	<div id="with" class="col">
		<h1>호출요청하기</h1>
		<div id="height" class="col">
			<div id="sg" class="col">
				<h4 id="name">호출트럭</h4>
				
				<h4 id="name">신청자명</h4>
				
				<h4>휴대전화</h4>

				<h4 id="festivalname">행사장명</h4>

				<h4 id="date">행사일</h4>

				<h4 id="time">행사시간</h4>

				<h4 id="place">행사장소</h4>

				<h4 id="truckcost">푸드트럭 섭외비용</h4>

				<h4 id="pluscontent">추가요구사항</h4>
			</div>

			<div id="sj" class="col">
				<!-- <input type="text"> -->
				<input id="truckname" class="form-control" value="${truck.brandname }" disabled="disabled">
				<input type="hidden" id="truck_code" class="form-control" value="${truck.truck_code }">
				<input id="inname" class="form-control input">
				<input class="form-control input" type="tel" name="tlno" id="intel" placeholder="전화번호 입력" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13">
				<input id="inplace" placeholder="행사장명 입력(20자 이내)" class="form-control input"> 
				<input id="Startdate" class="form-control input" type="date"> ~ <input id="Enddate" class="form-control input"  type="date"> 
				<input id="Starttime" type="time" class="form-control input"> ~ <input id="Endtime" type="time" class="form-control input">

				<div id="div3" class="form-group col"> 
					<input id="postnum" class="form-control" placeholder="우편번호" name="addr1"  type="text" readonly="readonly">
					<button id="btn3" type="button" class="btn btn-default" onclick="execPostCode();">
						<i class="fa fa-search"></i> 우편번호 찾기</button>
				</div>
				<div id="div1" class="form-group col">
					<input id="loadaddr" class="form-control" placeholder="도로명 주소" name="addr2"  type="text" readonly="readonly" />
				</div>
				<div id="div2" class="form-group col">
					<input class="form-control" placeholder="상세주소" name="addr3" id="addrdetail" type="text" />
				</div>
				<input id="cost" class="form-control input">
				<textarea id="content" class="form-control input" cols="30" rows="5"
					placeholder="관객연령대, 관객 예상수, 행사컨셉 등을 상세히 기술해주세요."></textarea>
			</div>
			<div id="oj">
				<button id="btn1" class="btn btn-default">선수금지불</button>
				
				
				<div id="pop" style="display: none;">
				<div id="gg">
				<div id="oo">
				<h3>결제창</h3>
				</div>
				<div id="radio">
				<input type="radio" value="3" name="radio">무통장입금
				<input type="radio" value="2" name="radio">계좌이체
				<br>
				<input type="radio" value="1" name="radio">카드
				</div>
				<div id="ff">
				<button id="agree">확인</button>
				<button id="close">취소</button>
				</div>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>