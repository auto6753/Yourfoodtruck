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
	<form action="" method="post" enctype="multipart/form-data">
		<table class="addMenuTable">
			<tr>
				<td class="itemName"><label for="menuName">메뉴명</label></td>
				<td><input id="menuName" class="inputText" type="text" name="menuName"/></td>
			</tr>
			<tr>
				<td class="itemName"><label for="unitPrice">가격(원)</label></td>
				<td><input id="unitPrice" class="inputText" type="text" name="unitPrice"/></td>
			</tr>
			<tr>
				<td class="itemName">이미지</td>
				<td>
					<input type="file" id="filename" name="filename" onchange="previewImage(this,'previewId'); fileCheck(this);" accept=".jpg, .jpeg, .png, .gif, .bmp"/>
				</td>
			</tr>
				
			<tr>
				<td class="itemName">미리보기</td>
				<td>
					<div id="previewId"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="btns">
						<input type="submit" value="등록">
						<button id="cancelBtn">취소</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>