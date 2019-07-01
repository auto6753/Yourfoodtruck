<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신의 푸드트럭</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/seller/menu/addMenu.css"/>" />
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/seller/menu/addMenu.js"/>"></script>
</head>
<body>
	<div class="addMenuTitle">
		<h2>메뉴수정</h2>
	</div>
	<table class="addMenuTable">
		<tr>
			<td class="itemName">메뉴명</td>
			<td><input id="menuname" class="inputText change" type="text"
				name="menuName" value="" /></td>
		</tr>
		<tr>
			<td class="itemName">가격(원)</td>
			<td><input id="price" class="inputText change" type="text"
				name="unitPrice" /></td>
		</tr>
		<tr>
			<td class="itemName">이미지</td>
			<td><input id="file" type="file" id="filename" class="change"
				name="filename"
				onchange="previewImage(this,'previewId'); fileCheck(this);"
				accept=".jpg, .jpeg, .png, .gif, .bmp"></td>
		</tr>

		<tr>
			<td class="itemName">미리보기</td>
			<td>
				<div id="previewId">
					<img style="margin: 0; width: 100%; height: 100%;" id="noImage"
						src="" />
				</div>
			</td>
		</tr>
		<tr>
			<td class="itemName"><label>카테고리</label></td>
			<td><select class="change" id="category" name="category"
				required>
					<option value="" selected>카테고리</option>
					<option value="1">카테고리A</option>
					<option value="2">카테고리B</option>
					<option value="3">카테고리C</option>
					<option value="4">카테고리D</option>
					<option value="5">카테고리E</option>
			</select></td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="btns">
					<button class="addmenu" id="modify">수정</button>
					<button id="cancel2Btn">취소</button>
				</div>
			</td>
		</tr>
	</table>
	<script>
$(document).ready(function(){
			//var i = $("#category option:eq(1)").prop("selected", true);
			
			
		   istrue = false;
		   isfile = false;
		   // var ssurl = $(".1", opener.document).attr('src');
		   
		   var i = $(".5", opener.document).val();
		   var i = parseInt(i);
		   console.log(i);
		   //console.log($(".5", opener.document).val());
		   $("#category option:eq("+i+")").prop("selected", true);
		   $("#menuname").val($(".2", opener.document).html());
		   console.log($(".4", opener.document).val());
		   var menu_code = $(".4", opener.document).val();
		   //alert($(".4", opener.document).val());		  
		   var price = $(".3", opener.document).html();
		   var price = price.substr(0,price.length-1);
		   //alert(price);
		  // var ssurl = $(".1", opener.document).attr('src');
		 	var ssurl = $(".7", opener.document).val();
		   //console.log(ssurl); 
		   console.log(ssurl);
		   //alert(ssurl);
		   var surl = ssurl.replace("/resources/image/upload/","");
		   //alert(surl);
		  // alert(url);
		  //alert(surl);
		   var url = ssurl.replace("\\s_","\\");
		   console.log(url);
		   //alert(url);
		  // alert(url);
		   $("#price").val(price);
		  // $("#price").val($(".3", opener.document).html());
		   $("#noImage").attr("src",url);
		   url = surl.replace("/s_","/");
		   //$("#voltage").val($(".4", opener.document).text());
		  // $("#manufacturer").val($(".5", opener.document).text());
		   // url = surl.replace("\\s_","\\");
		   console.log(url);
		   //alert(url);
		  remove();
		  $("#cancel2Btn").click(function(){
			  //remove();
			  window.close();
		  });
		  $("#modify").click(function(){
			 	if(!istrue){
			 		 window.close();
			 	}else{
			 	if($("#file").val() ==""){
					var category = $("#category option:selected").val();
					var menuname = $("#menuname").val();
					var price = $("#price").val();
					var category = parseInt(category);
			 		var query = {
			 				menu_category : category,
			 				unit_price : price,
			 				menu_name : menuname,
			 				menu_code : menu_code,
			 				menu_url : url,
			 				menu_surl : surl
			 		}
		 			$.ajax({
						type:"post",
						url:"/upload/modify",
						data:query,
			            async:false,
						success:function(data){
							//alert(data);
							remove();
							opener.parent.location.reload();
							window.close();
						}
					}); 
			 	}else{
			 		var files = $("#file")[0].files;
					var file = files[0];	
					var category = $("#category option:selected").val();
					var menuname = $("#menuname").val();
					var price = $("#price").val();
					var category = parseInt(category);
					
					console.log(file);
					console.log(category);
					console.log(menuname);
					console.log(price);
					
					var formData = new FormData();
					formData.append("file", file);
					formData.append("menu_category", category);
					formData.append("menu_name", menuname);
					formData.append("unit_price", price);
					formData.append("menu_url",url);
					formData.append("menu_surl",surl);
					formData.append("menu_code",menu_code);
		 			$.ajax({
						type:"post",
						url:"/upload/modify",
						data:formData,
			            processData: false,
			            contentType: false,
			            async:false,
						success:function(data){
							//alert(data);
							remove();
							opener.parent.location.reload();
							window.close();
						}
					}); 
			 	}
			 }
			});
		  
		  $(".change").change(function(){
			  istrue = true;
		  });
	});
function remove(){
    $(".7" ,opener.document).removeClass("7");
    $(".2" ,opener.document).removeClass("2");
    $(".3" ,opener.document).removeClass("3");
    $(".4" ,opener.document).removeClass("4");
    $(".5" ,opener.document).removeClass("5");
    //$(".5" ,opener.document).removeClass();
 }
 
 
</script>
</body>
</html>