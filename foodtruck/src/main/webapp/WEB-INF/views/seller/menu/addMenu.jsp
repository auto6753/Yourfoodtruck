<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴등록</title>
<link rel="stylesheet" href="<c:url value="/resources/css/seller/menu/addMenu.css"/>"/>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/seller/menu/addMenu.js"/>"></script>
</head>
<body>
	<div class="addMenuTitle">
		<h2>메뉴등록</h2>
	</div>
		<table class="addMenuTable">
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
				<td class="itemName"><label>카테고리</label></td>
				<td>
					<select id="category" name="category" required>
						<option value="" selected>카테고리</option>
						<option value="1">카테고리A</option>
						<option value="2">카테고리B</option>
						<option value="3">카테고리C</option>
						<option value="4">카테고리D</option>
						<option value="5">카테고리E</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="itemName"><label for="menuName">메뉴명</label></td>
				<td><input id="menuName" class="inputText" type="text" name="menuName" required/></td>
			</tr>
			<tr>
				<td class="itemName"><label for="unitPrice">가격(원)</label></td>
				<td><input id="unitPrice" class="inputText" type="text" name="unitPrice" required/></td>
			</tr>
			<tr> <!-- 여기부터 -->
				<td class="itemName" valign="top"><label class="labelStyle" for="details">상세내용</label></td>
				<td><textarea id="details" name="details"> <!-- required onFocus="clearMessage(this.form);" onKeyUp="checkByte(this.form);" -->
					d
					</textarea>
			<!-- 		<div class="showByte">
						<input type="text" name="messagebyte" value="0" size="1" maxlength="2" readonly>
						<font color="#000000">/ 1000 byte</font>
					</div> -->
				</td>
			</tr> <!-- 여기까지 검토할 것 -->
			<tr>
				<td colspan="2">
					<div class="btns">
						<button class="addmenu" id="add">등록</button>
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
			
		var category = $("#category option:selected").val();
		var menuname = $("#menuName").val();
		var price = $("#unitPrice").val();
		//var desc =$("#details").text();
		var category = parseInt(category);
		
		console.log(file);
		console.log(category);
		console.log(menuname);
		console.log(price);
		//console.log(desc);
		var formData = new FormData();
		formData.append("file", file);
		formData.append("menu_category", category);
		formData.append("menu_name", menuname);
		formData.append("unit_price", price);
		var query = {
			formData:formData,
		/* 	menu_category:category,
			menu_name:menuname,
			unitPrice:price */
		}
		$.ajax({
			type:"post",
			url:"/project/upload/upload",
			data:formData,
            processData: false,
            contentType: false,
			success:function(data){
				//alert(data);
				opener.parent.location.reload();
				window.close();
			}
		});
	});
});
</script>
</body>
</html>