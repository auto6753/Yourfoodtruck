<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>당신의 푸드트럭</title>
<title>BootStrap</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/login/login.css"/>">

<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script>
	$(document).ready(function() {
		var isTrue = false;
		$("#login").click(function(){
			chk();
			if(isTrue){
					var query =  {
					email: $("#id").val(),
					password: $("#pw").val()
				}
				$.ajax({
					type:"post",
					url:"/project/login",
					data: query,
					success:function(data){
						if("idfail"==data){
							alert("해당 아이디가없습니다");
						}else if("pwfail"==data){
							alert("비밀번호가 틀렸습니다");
						}else{
							/* window.location.href="/project/rehome";  */
							window.location.replace("/project");
						}
					}
				/* 	 complete : function(data) {
						 window.location.replace("/project");
		           } */

				});
			}
		});
		function chk(){
			var id ="";
			var pw ="";
			if(id==$("#id").val()){
				alert("아이디 입력해주세요");
				isTrue = false;
			}else if (id==$("#pw").val()){
				alert("비밀번호 입력해주세요");
				isTrue = false;
			}else{
				isTrue = true;
			}
		}
	});
</script>
</head>
<body>
	<div id="logo">
		<a href="/project/rehome">당신의 푸드트럭</a>
	</div>
	<!-- <form id="form"> --> <!-- 폼으로 묶으면 처음에 ajax 결과 반환이 안됨 -->
		<div id="login_box">
			<div class="form-group">
				<input id="id" type="text" class="form-control"  placeholder="아이디" name="m_mail" value="">
			</div>
			<div class="form-group">
				<input id="pw" type="password" class="form-control"  placeholder="비밀번호" name="m_passwd" value="">
			</div>
			<button id="login"  class="btn btn-primary btn-lg btn-block" >로그인</button>
			<br> <span class="txt_find"> <a
				href="/project/login/idSearch" class="link_find">아이디찾기</a> <a
				href="/project/login/passSearch" class="link_find">비밀번호찾기</a> <a
				href="/project/login/register" class="link_find">회원가입</a>
			</span>
		</div>
	<!-- </form> -->
</body>
</html>