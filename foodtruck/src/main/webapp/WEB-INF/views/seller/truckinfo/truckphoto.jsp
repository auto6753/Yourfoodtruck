<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신의 푸드트럭</title>
<link rel="stylesheet" href="<c:url value="/resources/css/seller/truckinfo/truckphoto.css"/>"/>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/seller/truckinfo/truckphoto.js"/>"></script>
</head>
<body>
	<div class="addtruckTitle">
		<h2>메인이미지등록</h2>
	</div>
		<table class="addtruckTable">
			<tr>
				<td class="itemName">이미지</td>
				<td>
					<input type="file" id="filename" name="filename" onchange="previewImage(this,'previewId'); fileCheck(this);" accept=".jpg, .jpeg, .png, .gif, .bmp" required/>
				</td>
			</tr>
				
			<tr>
				<td class="itemName"></td>
				<td>
					<div id="previewId"> <!-- 이미지 미리보기 영역데스 --> 
						<img id="noImage" src="${pageContext.request.contextPath}/resources/image/icon/noimage.png"/>
					</div>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<div class="btns">
						<button class="addtruckphoto" id="add">등록</button>
						<button id="cancelBtn">취소</button>
					</div>
				</td>
			</tr>
		</table>

<script>
$(document).ready(function(){
	$("#add").click(function(){
		
		var files = $("#filename")[0].files;
		var file = files[0];
			
	
		
		var formData = new FormData();
		formData.append("file", file);
		
		var query = {
			formData:formData
	
		}
		$.ajax({
			type:"post",
			url:"/seller/upload",
			data:formData,
            processData: false,
            contentType: false,
			success:function(data){
				
				opener.parent.location.reload();
				window.close();
			}
		});
	});
});
</script>
</body>
</html>