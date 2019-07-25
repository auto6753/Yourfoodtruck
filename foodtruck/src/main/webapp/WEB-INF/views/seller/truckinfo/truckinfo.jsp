<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value="/resources/css/seller/truckinfo/truckinfo.css"/>" />
<head>
<style>
.qrcode img {
	width: 250px;
	height: 250px;
}
</style>
<title>당신의 푸드트럭</title>
<%-- <script type="text/javascript"
   src="<c:url value="/resources/js/seller/menu/menu.js"/>"></script> --%>
<script src="/resources/js/qrcode/qrcode.js"></script>
<script>
$(document).ready(function(){
   $("#print").click(function(){
         /* var truck_code = "${sessionScope.seller.truck_code }";
         var email2 ="${sessionScope.sessionid.email}"; */
         /* console.log(email2);
         
         var url = "/seller/qrcode/?truck_code=";
         url = url+truck_code;
         url+="&?email=";
         url+=email2;
         console.log(url);
         window.open(url,"팝업창이름","resizable=no,location=no"); */
         const completeParam = makeHtml();
          reportPrint(completeParam);
         
         function makeHtml(){
            console.log($(".qrcode").html());
             const obj = {html : ''};
             let html = '<div class="printPop">';
             html += '<div>';
             html += $(".qrcode").html();
             html += '</div>';
             html += '</div>';    
             obj.html = html;
             return obj;
         }
 
         function reportPrint(param){
             const setting = "width=890, height=841";
             const objWin = window.open('', 'print', setting);
             objWin.document.open();
             objWin.document.write('<html><head><title>QR코드</title>');
             objWin.document.write('<link rel="stylesheet" type="text/css" href="/resource/css/qr.css"/>');
             objWin.document.write('</head><body>');
             objWin.document.write(param.html);
             objWin.document.write('</body></html>');
             objWin.focus(); 
             objWin.document.close();
             objWin.print();
             objWin.close();
         }

      });
      
      var road_and_QR = function () {
           var truck_code = "${sessionScope.seller.truck_code}";
           var email2 ="${sessionScope.sessionid.email}";
           var seller = $('#seller').text();
           var buyer = $('#buyer').text();
           var pro_num = $('#pro_num').text();
           for (var i = 0; i < document.getElementsByClassName("qrcode").length; i++) {
             //var muid = $('.qrcode').text();
             var muid = $(".qrcode")[i].innerHTML;
             console.log(muid);
             var qrcode = new QRCode(document.getElementsByClassName("qrcode")[i], {
              // text: "http://15.164.137.166/seller/qrorder/?truck_code="+truck_code+"&email="+email2,
               text: "http://39.127.7.64:8080/seller/qrorder/?truck_code="+truck_code+"&email="+email2,
               width: 800,
               height: 800,
               colorDark: "#000000",
               colorLight: "#ffffff",
               correctLevel: QRCode.CorrectLevel.H
             });
           }
         }
      road_and_QR();
   
   
      $("#truckphoto").click(function(){
         var popupX = (window.screen.width / 2) - (430 / 2);
         var popupY = (window.screen.height / 2) - (600 / 2);
         
         window.open("truckphoto", "truckphoto", "width=430, height=460, left=" + popupX + "," + "top=" + popupY);
      });
      var a = "${truckinfo.paytype}";
      if(a==9){
      $("input:checkbox[id='ck1']").prop("checked", true);
      $("input:checkbox[id='ck2']").prop("checked", true);
      $("input:checkbox[id='ck3']").prop("checked", true);
      }else if(a==5){
         $("input:checkbox[id='ck1']").prop("checked", true);
      }else if(a==3){
         $("input:checkbox[id='ck2']").prop("checked", true);
      }else if(a==1){
         $("input:checkbox[id='ck3']").prop("checked", true);
      }else if(a==4){
         $("input:checkbox[id='ck2']").prop("checked", true);
         $("input:checkbox[id='ck3']").prop("checked", true);
         
      }else if(a==6){
         $("input:checkbox[id='ck3']").prop("checked", true);
         $("input:checkbox[id='ck1']").prop("checked", true);
      }else if(a==8){
         $("input:checkbox[id='ck1']").prop("checked", true);
         $("input:checkbox[id='ck2']").prop("checked", true);
      }
   });
   


    /* $(".user-btn").click(function(){
      var truckcode = "${truckinfo.truck_code}";
      
      
      alert(truckcode);
      
      var query = {
            
            truck_code : truckcode
      }
      $.ajax({
         url: "/seller/truckinfomodify",
         type: "post",
         data: query,
         success : function(data){
            
            location.reload();
         }
         
         
         
      })
      
   
      
      
      
      
      
   }); */
      
   
var arrayParam = new Array();

$("input:checkbox[name=paytype]:checked").each(function(){
      
   arrayParam.push($(this).val());
});

                             

</script>
</head>

<body>
	<div class="container mw1650">
		<div class="row">
			<div class="col-md-2 mgt50">
				<jsp:include page="../sideMenuBar/sideMenuBar.jsp"></jsp:include>
			</div>
			<div class="col-md-10">
				<div id="with" class="col">
					<h1 class="menuTitle">트럭정보수정</h1>
					<br>
					<div class="album py-5 bg-light" style="height: 80%; overflow-y: auto;">
						<div class="container">
							<div class="row">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>







	<%-- <div id="with" class="col">
					<div class="menuTitle">트럭정보 수정</div>
					<form id="all" action="/seller/truckinfomodify" method="post">
						<div id="container">

							<div id="box" class="row justify-content-center">
								<div class="col-md-6">
									<div id="card1" class="card1">

										<article class="card-body">


											<input type="hidden" name="truck_code"
												value="${truckinfo.truck_code}">
											<div class="form-group">
												<label>트럭 상호명</label> <input name="brandname" type="text"
													class="form-control" value="${truckinfo.brandname }">
											</div>
											<div class="form-group">
												<label>사업자번호</label> <input name="crn" type="text"
													class="form-control" value="${truckinfo.crn}">
											</div>

											<div class="form-group">
												<label>트럭번호</label> <input name="trucknum" type="text"
													class="form-control" value="${truckinfo.trucknum}">
											</div>
											<!-- form-row.// -->
											<div class="form-group">
												<label>계좌번호</label> <input name="account" type="text"
													class="form-control" value="${truckinfo.account}">
											</div>

											<div class="form-group">
												<label>고객 결제수단 &nbsp;: &nbsp;&nbsp;</label> <input
													type="checkbox" id="ck1" name="paytype" value="5">
												<label for="ck1">현금</label> <input type="checkbox" id="ck2"
													name="paytype" value="3"> <label for="ck2">카드</label>
												<input type="checkbox" id="ck3" name="paytype" value="1">
												<label for="ck3">카카오페이</label>

											</div>
											<div class="form-group">
												<label>운영시간</label> <input id="Starttime"
													name="truck_starttime" type="time" class="form-control"
													value="${truckinfo.truck_starttime }"> ~ <input
													id="Endtime" name="truck_endtime" type="time"
													class="form-control" value="${truckinfo.truck_endtime }">

											</div>

											<div class="menut">
												<div class="imgBox">
													<img class="img editMenu changeToBlock"
														src="${pageContext.request.contextPath}/resources/image/upload/${truckinfo.truck_surl}" />
												</div>

											</div>
											<button class="user-btn" type="button" id="truckphoto"
												name="truckphoto">메인이미지 등록/수정</button>

											<div class="qrcode"></div>
											<input id="print" type="button" class="user-btn"
												value="qr코드 인쇄">
											<div class="form-group">
												<label>[추가 기입 사항]</label>
												<textarea class="form-control" rows="3" name="truck_desc">${truckinfo.truck_desc }</textarea>
											</div>

											<div id="menuBtns">

												<input type="submit" id="modifytruck" class="user-btn"
													value="수정">

											</div>


										</article>
									</div>
								</div>

							</div>

						</div>
					</form>
					</div>
			</div>
		</div>
	</div> --%>
</body>





