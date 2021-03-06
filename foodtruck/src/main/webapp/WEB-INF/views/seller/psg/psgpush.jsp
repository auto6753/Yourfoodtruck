<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head><title>당신의 푸드트럭</title></head>
<jsp:include page="../../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value="/resources/css/seller/psg/psg.css"/>" />
	
<div class="container mw1650"">
	<div class="row">
		<div class="col-md-2 mgt50">
			<jsp:include page="../sideMenuBar/sideMenuBar.jsp"></jsp:include>
		</div>
		<div class="col-md-10">
			<div id="with" class="col">
				<h1 class="menuTitle">탑승자관리</h1>
					<br>
					<div class="album py-5 bg-light" style="height: 80%; overflow-y: auto;">
						<div class="container">
							<div class="row">
								<div id="forPush">
									<textarea id="details" name="details" cols="54" rows="3"
										onFocus="clearMessage();" onKeyUp="checkByte();">내용을 입력해 주세요.</textarea>
								</div>
								<div class="showByte">
									<input type="text" id="messagebyte" name="messagebyte"
										value="0" size="1" maxlength="2" disabled> <font
										color="#000000">/ 1000 byte</font> <input type="button"
										id="forPushBtn" value="푸쉬알림 보내기">
								</div>
								<div id="forToken"></div>
							</div>
							<div class="row">
								<div id="Line_Controls_Chart">
				<h4 style="padding-top: 10px;">탑승자 현황 그래프</h4>
				<div id="buttonbar">
					<form action="/seller/psgpush" method="GET">
						<input type="date" name="inputBeginDate" /> <input type="date"
							name="inputEndDate" />
						<button type="submit" id="search">확인</button>
					</form>
				</div>
				<!-- 라인 차트 생성할 영역 -->
				<div id="chart_div"></div>
			</div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>
<%-- <div class="container">
	<div class="row">
		<div class="col-md-3">
			<jsp:include page="../sideMenuBar/sideMenuBar.jsp"></jsp:include>
		</div>
		<div class="col-md-9">
			<div class="col-md-12 paddingZero">
				<div class="menuTitle">탑승자알림관리</div>
			</div>
		</div>
		<div class="col">
			<div id="wrap">
				<h4 style="padding-top: 10px;">탑승자알림</h4>
				<div id="forPush">
					<textarea id="details" name="details" cols="54" rows="3"
						onFocus="clearMessage();" onKeyUp="checkByte();">내용을 입력해 주세요.
            </textarea>
				</div>
				<div class="showByte">
					<input type="text" id="messagebyte" name="messagebyte" value="0"
						size="1" maxlength="2" disabled> <font color="#000000">/
						1000 byte</font> <input type="button" id="forPushBtn" value="푸쉬알림 보내기">
				</div>
				<div id="forToken"></div>
			</div>
			<div id="Line_Controls_Chart">
				<h4 style="padding-top: 10px;">탑승자 현황 그래프</h4>
				<div id="buttonbar">
					<form action="/seller/psgpush" method="GET"
						style="position: relative; right: 25%;">
						<input type="date" name="inputBeginDate" /> <input type="date"
							name="inputEndDate" />
						<button type="submit" id="search">확인</button>
					</form>
				</div>
				<!-- 라인 차트 생성할 영역 -->
				<div id="chart_div"></div>
			</div>
		</div>
	</div>
</div> --%>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.9.3/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.4/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.4/firebase-auth.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/5.8.4/firebase-messaging.js"></script>
<%-- <script type="text/javascript" src="<c:url value="/resources/js/seller/psgpush.js"/>"></script> --%>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<!-- 구글차트 API js -->
<script>
var clearChk=true;
function clearMessage(){
   if(clearChk){ 
       $('#details').val("");
      clearChk=false;
   }
}
function checkByte() {
   var totalByte = 0;
   var limitByte =1000;
   var message = $('#details').val();
   for(var i =0; i < message.length; i++) {
      var currentByte = message.charCodeAt(i);
      if(currentByte > 128) totalByte += 2;
      else totalByte++;
   }
   $('#messagebyte').val(totalByte+"");
   if(totalByte > limitByte) {
      alert( limitByte+"바이트까지 전송가능합니다.");
      $('#messagebyte').val(message.substring(0,limitByte));
   }
}
   $(document).ready(function() {
      $('#forPushBtn').click(function() {
         var pushTxt = $('#details').val();
         var truck_code = '${sessionScope.seller.truck_code}';
         console.log(truck_code);
         var pushObj={};
         pushObj.notification={};
         pushObj.notification.title="[${sessionScope.seller.brandname}]";
         pushObj.notification.body=pushTxt;
         pushObj.notification.sound="default";
         pushObj.to="/topics/all";
         pushObj.priority="high";
         console.log(pushObj);
         
         $.ajax({
            type:"post",
            url:"/pushTest",
            data:JSON.stringify(pushObj),
            contentType: "application/json; chartset=UTF-8",
            success:function(data) {
               alert("성공적으로 보냈습니다!");
            },error:function(err) {
               alert("ajax 연결 실패!");
               console.log(JSON.stringify(err));
            }
         });
      });
      var jsonresult=${resultlist};
      var chartarray =[];
      console.log(jsonresult);
      if(jsonresult == null || jsonresult == ""){
         $("#Line_Controls_Chart").css("visibility", "hidden");
         alert("탑승자가 없습니다"); 
      }else{
         console.log(jsonresult);
         var length = jsonresult.length;
         console.log(length);
         for(var i=0; i<length;i++) {
            var asdf = [];
            asdf.push(jsonresult[i].onboard_date);
            console.log(typeof jsonresult[i].onboard_date);
            asdf.push(jsonresult[i].count);
            chartarray.push(asdf);
         }
         console.log(chartarray);
         google.charts.load('current', {packages: ['corechart', 'bar']});
         google.charts.setOnLoadCallback(drawBasic);          
            function drawBasic() {

               var data = new google.visualization.DataTable();
               data.addColumn('string', '요일');
               data.addColumn('number', '탑승자수(명)');
               for(var j=0; j<length;j++) {
                  data.addRow(chartarray[j]);
               }
               //data.addRows([chartarray]);
               var options = {
                  title: '탑승자 현황',
                  hAxis: {
                  title: '날짜',
                  viewWindow: {
                  min: [7, 30, 0],
                  max: [17, 30, 0]
                  }
               },
                  vAxis: {
                  title: '탑승자수(명)'
                  }
               };
                  var chart = new google.visualization.ColumnChart(
                  document.getElementById('chart_div'));
                  chart.draw(data, options);
            }
         } 
      });
</script>
