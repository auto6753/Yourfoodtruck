<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value="/resources/css/seller/truckinfo/truckinfo.css"/>" />
<head>
<title>트럭정보 수정</title>
<%-- <script type="text/javascript"
	src="<c:url value="/resources/js/seller/menu/menu.js"/>"></script> --%>
<script>
$(document).ready(function(){
	
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
});
                             

</script>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<jsp:include page="../sideMenuBar/sideMenuBar.jsp"></jsp:include>
			</div>
			<div class="col-md-9">
				<div class="col-md-12 paddingZero">
					<div class="menuTitle">트럭정보 수정</div>
					<form id="all" action="/seller/truckinfomodify" method="post" >
					<div id="container">

						<div id="box" class="row justify-content-center">
							<div class="col-md-6">
								<div id="card" class="card">

									<article class="card-body">

										<input type="hidden"  name="truck_code" value="${truckinfo.truck_code}">
										<div class="form-group">
											<label>트럭 상호명</label> 
											<input name="brandname" type="text"class="form-control" value="${truckinfo.brandname }">
										</div>
										<div class="form-group">
											<label>사업자번호</label> 
											<input name="crn" type="text"class="form-control" value="${truckinfo.crn}">
										</div>

										<div class="form-group">
											<label>트럭번호</label> 
											<input name="trucknum" type="text"class="form-control" value="${truckinfo.trucknum}">
										</div>
										<!-- form-row.// -->
										<div class="form-group">
											<label>계좌번호</label> 
											<input name="account" type="text" class="form-control" value="${truckinfo.account}">
										</div>
										<div class="form-group">
											<label>고객 결제수단 &nbsp;: &nbsp;&nbsp;</label> 
											<input type="checkbox" id="ck1" name="paytype" value="5"> 
											<label for="ck1">현금</label> 
											<input type="checkbox" id="ck2" name="paytype" value="3"> 
											<label for="ck2">카드</label> 
											<input type="checkbox" id="ck3" name="paytype" value="1"> 
											<label for="ck3">카카오페이</label>

										</div>
										<div class="form-group">
											<label>[추가 기입 사항]</label>
											<textarea class="form-control" rows="3" name="truck_desc">${truckinfo.truck_desc }</textarea>
										</div>

										<div id="menuBtns">
							
											<input type="submit" id="modifytruck" class="user-btn" value="수정">
									
									
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
	</div>
</body>






