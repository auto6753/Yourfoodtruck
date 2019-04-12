<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트등록</title>
<link rel="stylesheet" href="<c:url value="/resources/css/seller/event/addEvent.css"/>"/>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/seller/event/addEvent.js"/>"></script>
</head>
<body>
	<div class="addMenuTitle">
		<h2>이벤트등록</h2>
	</div>
	<form action="" method="post" enctype="multipart/form-data">
		<table class="addMenuTable" border="1">
			<tr>
				<td class="itemName">이벤트명</td>
				<td><input class="inputText" type="text" name="menuName"/></td>
			</tr>
			<tr>
				<td class="itemName">기간</td>
				<td><input class="inputText" type="datetime-local" name="beginDate"/></td>
			</tr>
			<tr>
				<td class="itemName">대상</td>
				<td><input class="inputText" type="text" name="unitPrice"/></td>
			</tr>
			<tr>
				<td class="itemName">메뉴명</td>
				<td><input class="inputText" type="text" name="unitPrice"/></td>
			</tr>
			<tr>
				<td class="itemName">할인가격</td>
				<td><input class="inputText" type="text" name="unitPrice"/></td>
			</tr>
			<tr>
				<td class="itemName">옵션</td>
				<td><input class="inputText" type="text" name="unitPrice"/></td>
			</tr>
			<tr>
				<td class="itemName">중복적용</td>
				<td><input class="inputText" type="text" name="unitPrice"/></td>
			</tr>
			<tr>
				<td class="itemName">상세내용</td>
				<td><input class="inputText" type="text" name="unitPrice"/></td>
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