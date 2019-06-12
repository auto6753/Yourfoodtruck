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
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="/resources/js/seller/jquery.ajax-cross-origin.min.js"></script>
<script>

$(document).ready(function(){
   //console.log("${CallList2}");
   var IMP = window.IMP;  //생략가능
   IMP.init('imp91176976');
   $(this).click(function(e){
   console.log(e);
   var target = e.target;
   var temp= $(target).attr('class');
   if(temp=='cancel1'){
      //alert(temp);
      //var a= target.parents('tr');
      if(confirm("아직 트럭이 승낙을 하지않았습니다. 취소를 하시겠습니까?")){
      console.log($(target).closest('tr').html());
      var merchant_uid = $(target).closest('tr').find('input').val();
      cancel(merchant_uid);
      }
   }else if(temp=='confirm2'){
      //alert(temp);
      if(confirm("트럭이 행사장에 도착하신게 맞습니까? 혹시 행사장에 아직 도착하지 않았다면 취소를 눌러주세요 확인을 누르시면 취소가 어려울수도 있으니 트럭이 행사장에 도착하였다면 확인을 눌러주세요")){
      console.log($(target).closest('tr').html());
      var meid = $(target).closest('tr').find('input').val();
      var a = [meid,3];
      update(a);
      }
   }else if(temp=='cancel3'){
      if(confirm("이미 확인을 하셨기 때문에 취소가 바로 되지 않습니다. 상대방과 충분히 합의후에 취소신청을 하셨다면 네를 눌러주세요")){
      console.log($(target).closest('tr').html());
      var meid = $(target).closest('tr').find('input').val();
      var a = [meid,7];
      update(a);
      }
   }else if(temp=='confirm4'){
      //alert(temp);
      if(confirm("트럭이 행사장에 도착하였다면 확인을 눌러주세요 확인을 누르면 거래가 완료됩니다.")){
      console.log($(target).closest('tr').html());
      var meid = $(target).closest('tr').find('input').val();
      var a = [meid,5];
      update(a);
      }
   }else if(temp=='cancel2'){
      //alert(temp);
      //confirm("트럭이 행사장에 도착하였다면 확인을 눌러주세요 확인을 누르면 거래가 완료됩니다.");
      if(confirm("트럭이 승낙을 하였습니다. 취소를 하시겠습니까?")){
      console.log($(target).closest('tr').find('input').val());
      var merchant_uid = $(target).closest('tr').find('input').val();
      cancel(merchant_uid);
      }
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
         progress="진행중<button class='confirm2'>확인</button><button class='cancel2'>취소</button>";
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
      }else if(a[i].progress ==7){
         progress="취소 신청";   
         agreement="승인";
      }
      
      if(a[i].pay_status ==1){
         pay_status="결제 완료"
      }else if(a[i].pay_status ==2){
         pay_status="미결제";
      }/* else if(a[i].pay_status ==3){
         pay_status="계좌이체 완료";   
      }else if(a[i].pay_status ==4){
         pay_status="무통장입금 완료";    */
      else if(a[i].pay_status ==3){
         pay_status="취소";   
      }
      
      $("#g").append("<tr><td>"+brandname+"</td>"
             +"<td>"+place+"</td>"
             +"<td>"+festival_name+"</td>"
             +"<td>"+a[i].festival_startdate+"~"+a[i].festival_enddate+"</td>"
             +"<td>"+a[i].request_date+"</td>"
             +"<td>"+pay_status+"</td>"
             +"<td>"+agreement+"</td>"
             +"<td>"+progress+"</td>"
             +"<input type='hidden' value='"+a[i].merchant_uid+"'></td></tr>"
      );
   }
      /*       "<tr>"+
            +"<td>"+a[i].brandname+"</td>"
             +"<td>"+a[i].place+"</td>"
             +"<td>"+a[i].festival_name+"</td>"
             +"</tr>"
             /* +"<td>"+i.festival_startdate+"~"+{i.festival_enddate}+"</td>"
             +"<td>"+i.festival_starttime+"~"+{i.festival_endtime}+"</td>"
             +"<td>"+i.reporting_date+"</td>"
             +"<td>"+i.progress+"</td>" */
             
      
   /*    <td>${i.name}</td>
      <td>${i.place}</td>
      <td>${i.festival_name}</td>
      <td>${i.festival_startdate}~${i.festival_enddate}</td>
      <td>${i.festival_starttime}~${i.festival_endtime}</td>
      <td>${i.reporting_date}</td>
      <td>${i.progress}</td> */   
function cancel(i){
      var merchant_uid = i;
      alert(merchant_uid);
         $.ajax({
            type:"post",
            url:"/pay/GetPayment",
            data:{
               merchant_uid:i
            },
            success:function(data){   
               console.log(data);
               $.ajax({
                   url:"http://localhost:3000/cardrefund",
                   crossOrigin:true,
                    "type": "POST",
                     "contentType": "application/json",
                     "data": JSON.stringify({
                       "merchant_uid": ""+data.merchant_uid+"", // 주문번호
                       "cancel_request_amount": ""+data.price+"", // 환불금액
                       "reason": "행사측 단순 취소" // 환불사유
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
                              merchant_uid : result.merchant_uid,
                              progress :6,
                              pay_status : 3
                              
                            },
                            success:function(data){
                              if(data=='success'){
                              window.location.reload();
                              }else{
                                 alert("실패");
                              }
                            }
                         });
                      }
                       
                   }).fail(function(error) { // 환불 실패시 로직
                     alert(error);
                     console.log(error);
                     alert("환불 실패1");
                   });
            }
         });
   }
   function update(i){
      var a = i;
      console.log(i[0]);
      console.log(i[1]);
      console.log(i);
      $.ajax({
         url:"/pay/Callrefund",
         type:"post",
         data:{
            merchant_uid:i[0],
            progress :i[1]
         },
         success:function(data){
            if(data=='success'){
               window.location.reload();
            }else{
               alert("실패");
            }
            
         }
      });
      
   }
   
});
</script>
</head>
<body>
	<div id="with" class="col">
		<h1 id="bb" style="text-align: center; padding-top: 20px;">호출내역</h1>
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
				<%--       <c:forEach var="i" items="${CallList}">
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
</body>
</html>