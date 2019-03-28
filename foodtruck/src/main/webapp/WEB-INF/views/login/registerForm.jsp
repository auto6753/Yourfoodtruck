<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>BootStrap</title>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/login/registerForm.css"/>">
<style>

</style>
<script>
	
</script>
</head>
<body>

	<div id="logo">
		<a href="/project/rehome">당신의 푸드트럭</a>
	</div>
	<div id="all">
	<div id="member" class="card-header">회원가입</div>
	<div id="container">
		
			<div id="box"class="row justify-content-center">
				<div class="col-md-6">
					<div id="card"class="card">
						
						<article class="card-body">
							<form>
								<div class="form-row">
									<div class="col form-group">
										<label>이름</label> <input type="text"
											class="form-control" placeholder="">
									</div>
									
								</div>
								
								<div class="form-group">
									<label>아이디</label> <input type="email"
										class="form-control" placeholder=""> 
								</div>
								<div class="form-group">
									<label>비밀번호</label> <input type="text"
										class="form-control" placeholder=""> 
								</div>
								<div class="form-group">
									<label>비밀번호확인</label> <input type="text"
										class="form-control" placeholder=""> 
								</div>
								<div class="form-group">
									<label>닉네임</label> <input type="text"
										class="form-control" placeholder=""> 
								</div>
							
							
								<!-- form-row.// -->
								<div class="form-group">
									<label>휴대폰인증</label> <input class="form-control"
										type="password"placeholder="전화번호입력">
										<button id="mcheck" type="button" class="btn btn-primary test2">인증</button>
								</div>
								<div class="form-group">
									<label>인증번호</label> <input class="form-control"
										type="password"placeholder="인증번호입력">
								</div>
								<!-- form-group end.// -->
								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-block">
										회원가입완료</button>
								</div>
								
							</form>
						</article>
						
					</div>
					
				</div>
				

			</div>
			


		</div>

	</div>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

</body>
</html>
