<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height, target-densitydpi=device-dpi" />
<title>당신의 푸드트럭</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/announce/area.css"/>" />
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.min.js"/>"></script>

<script>
	$(document).ready(function(){
		$("#delete").click(function(){
			var request_code = ${specific.request_code};
			//alert(request_code);
			var query = {
					request_code : request_code
					
			}
			$.ajax({
				
				url: "/recruit/delete",
				type: "post",
				data: query,
				success : function(data){
					
					location.href="/recruit";
				}
				
			});
			
			
		});
		$("#modify").click(function(){
			var a = $(this);
			var requestcode = a.next().val();
			//alert(requestcode);
			location.href="/recruit/modify?request_code="+requestcode;
		
		$("#request").click(function(){
			var a = $(this);
			var requestcode = a.next().val();
			//alert(requestcode);
			location.href="/recruit/requestsuccess?request_code="+requestcode;
			
			
		});	
		

			
			
			
			
		});
	});

</script>
</head>
<body>

	<div id="title" class="">
		<p>${specific.request_title }</p>
	</div>
	<div style="height: 800px;">
		
		<div id="content" style="display: inline-block;">



	
			<div id="box">
					
					<div class="form-group">
						<label for="exampleFormControlTextarea1">내용</label>
						
						<span>
						
						<textarea name="request_content" id="contentt" class="form-control"
							id="exampleFormControlTextarea1"  rows="8"  readonly>${specific.request_content}</textarea>
					
						 </span>
						
					</div>
					<c:if test="${sessionScope.sessionid.email != specific.request_email}">
					<button id="request" class="btn" >참가신청</button> 
					<input type="hidden" value="${specific.request_code}">
					</c:if>
					<c:if test="${sessionScope.sessionid.email == specific.request_email}">
					<input id="delete" type="button" class="btn" value="삭제">
					<input type="hidden" value="${specific.request_code}">
					<input id="modify" type="button" class="btn" value="수정">
					<input type="hidden" value="${specific.request_code}">
					</c:if>
					<input id="dd" onclick="history.go(-1);" class="btn" value="취소">
				</div>


		</div>

	</div>


</body>
</html>