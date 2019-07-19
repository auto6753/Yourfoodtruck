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

</head>
<body>

	<div id="title" class="">
		<p>공고 등록</p>
	</div>
	<div style="height: 800px;">
		
		<div id="content" style="display: inline-block;">



		<form id="all" action="/recruit/addRecruit" method="post" >
			<div id="box">
					<div class="form-group">
						<label for="exampleInputEmail1">제목</label> <input
							name="request_title" id="titles" type="text" class="form-control">
					</div>
					<div class="form-group">
						<label for="exampleFormControlTextarea1">내용</label>
						<span>
						<textarea name="request_content" id="contentt" class="form-control"
							id="exampleFormControlTextarea1" rows="6">장소: ex)서울시 동대문구 00박람회장
입점기간: ex)00년00월00일(월)~00년00월00일(일)
입점료: ex)3일 총 25만원
모집대수: ex)00대
희망메뉴: ex)치킨종류
전기지원여부: ex)전기지원가능
기타: ex)쓰레기통 및 쓰레기봉지 구비 필수 
희망: ex)메뉴당 200인분 이상 
선정발표일: ex) 00년00월00일 , 선정되는대로 즉시 발표
						
						 </textarea>
						 </span>
					</div>
					<input id="d" type="submit" class="btn" value="등록"> 
					<input id="dd" onclick="history.go(-1);" class="btn" value="취소">
				</div>
		</form>

		</div>

	</div>


</body>
</html>