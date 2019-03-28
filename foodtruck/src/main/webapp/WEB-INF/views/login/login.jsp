<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>BootStrap</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/login/login.css"/>">
<style>

</style>
<script>
	
</script>
</head>
<body>
	<div id="logo">
		<a href="/project/rehome">당신의 푸드트럭</a>
	</div>
	<form id="form">
		<div id="login_box">
			<div class="form-group">
				<input type="text" class="form-control" id="아이디" placeholder="아이디">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="비밀번호"
					placeholder="비밀번호">
			</div>
			<button type="button" class="btn btn-primary btn-lg btn-block">로그인</button>
			<br> <span class="txt_find"> <a href="/project/login/idSearch"
				class="link_find">아이디찾기</a> <a href="/project/login/passSearch" class="link_find">비밀번호찾기</a>
				<a href="/project/login/register" class="link_find">회원가입</a>
			</span>
		</div>
	</form>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
</body>
</html>