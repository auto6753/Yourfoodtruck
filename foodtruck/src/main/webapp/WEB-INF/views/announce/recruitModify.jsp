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
		$("#modifysuccess").click(function(){
			
			var a = $(this);
			var requestcode = a.next().val();
			//alert(requestcode);
			var requesttitle = $("#titles").val();
			//alert(requesttitle);
			var requestcontent = $("#contentt").val();
			var requeststart = $("#beginDate").val();
			var requestend = $("#endDate").val();
			//alert(requestcontent);
			var query = {
					request_code : requestcode,
					request_title : requesttitle,
					request_content : requestcontent,
					request_start : requeststart,
					request_end : requestend
					
					
			}
			$.ajax({
				
				
				url: "/recruit/successmodify",
				type: "post",
				data: query,
				success:function(data){
					
					location.href="/recruit/specific?request_code="+requestcode;
				}
			});
			
		});
		
	});

</script>
</head>
<body>

	<div id="title" class="">
		<p>공고 수정</p>
	</div>
	<div style="height: 800px;">
		
		<div id="content" style="display: inline-block;">



	
			<div id="box">
					<div class="form-group">
						<label for="exampleInputEmail1">제목</label> <input
							name="request_title" id="titles" type="text" class="form-control" value="${requestmodify.request_title }">
					</div>
					<div class="form-group">
								<label for="exampleInputEmail1">기간</label>
								<div>
										<input type="datetime-local" id="beginDate" class="form-control" name="request_start" value="${requestmodify.request_start}"/>
										<span>~</span>
										<input type="datetime-local" id="endDate" class="form-control" name="request_end"  value="${requestmodify.request_end}"required/>
								</div>		
								
					</div>	
					<div class="form-group">
						<label for="exampleFormControlTextarea1">내용</label>
						<span>
						<textarea name="request_content" id="contentt" class="form-control"
							 rows="8">${requestmodify.request_content }</textarea>
						 </span>
						
					</div>
					<button id="modifysuccess" class="btn" >수정완료</button>
					 <input type="hidden" name="request_code"value="${requestmodify.request_code }">
					<input id="dd" onclick="history.go(-1);" class="btn" value="취소">
				</div>
	

		</div>

	</div>


</body>
</html>