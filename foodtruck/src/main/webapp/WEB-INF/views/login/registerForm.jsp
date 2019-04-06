<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>당신의 푸드트럭</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/login/registerForm.css"/>">

<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/join.js"/>"></script>
<script>
	 /* function ck() {
		var isTrue = false;
		if (fr.m_name.value == "") {
			alert("이름 입력");
			isTrue = false;
			return false;
		} else if (fr.m_mail.value == "") {
			alert("이메일을 입력해주세요");
			isTrue = false;
			return false;
		} else if (fr.m_passwd.value == "") {
			alert("비밀번호를 입력하세요");
			isTrue = false;
			return false;
		} else if (fr.repasswd.value == "") {
			alert("비밀번호 확인을 입력하세요");
			isTrue = false;
			return false;
		} else if (fr.repasswd.value != fr.m_passwd.value) {
			alert("입력하신 비밀번호가 달라요");
			isTrue = false;
			return false;
		} else if (fr.m_nicname.value == "") {
			alert("닉네임을 입력해주세요");
			isTrue = false;
			return false;
		}
		else if (fr.hp.value == "") {
			alert("전화번호를 입력해주세요");
			isTrue = false;
			return false;
		}
		if (!isTrue) {
			var query = {
				m_mail : fr.m_mail.value,
				m_nicname : fr.m_nicname.value
			}
			$.ajax({
				url : "/project/login/idck",
				type : "get",
				data : query,
				success : function(data) {
					if ("success" == data) {
						$("#target").attr('onsubmit','true');
						$('#target').submit();
					} else if ("nicname" == data) {
						alert("사용중인 닉네임입니다");
					} else {
						alert("사용중인 이메일 입니다");
					}
				}
			});
		}
		return false;
	}  */
</script>
</head>
<body>

	<div id="logo">
		<a href="/project/rehome">당신의 푸드트럭</a>
	</div>
	<div id="all">
		<div id="member" class="card-header">회원가입</div>
		<div id="container">

			<div id="box" class="row justify-content-center">
				<div class="col-md-6">
					<div id="card" class="card">

						<article class="card-body">
							<form id="target" name="fr" action="/project/login/insert"
								onsubmit="return ck();" method="post">
								<!-- onsubmit="return ck();" -->
								<div class="form-group">
									<label>아이디</label> <input name="email" type="email"
										class="form-control" placeholder="">
								</div>
								<div class="form-group">
									<label>비밀번호</label> <input name="password" type="password"
										class="form-control" placeholder="">
								</div>
<!-- 								<div class="form-group">
									<label>비밀번호확인</label> <input id="repasswd" type="password"
										class="form-control" placeholder="">
								</div> -->
								<div class="form-group">
									<label>닉네임</label> <input name="nickname" type="text"
										class="form-control" placeholder="">
								</div>
								<!-- form-row.// -->
								<div class="form-group">
									<label>전화번호</label> <input name="telephone" class="form-control"
										type="tel" placeholder="전화번호입력">
								</div>
								<!-- form-group end.// -->
								<div class="form-group">
									<!-- <button type="submit" class="btn btn-primary btn-block">
										회원가입완료</button> -->
									<input id="register" type="submit"
										class="btn" value="회원가입" />
								</div>
							</form>
						</article>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
