<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신의 푸드트럭</title>

<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/truck/registerForm.css"/>">

<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script>
	$(document).ready(function(){
			var arrayParam = new Array();
			
			$("input:checkbox[name=paytype]:checked").each(function(){
					
				arrayParam.push($(this).val());
			});
			
		
	});

</script>
</head>
<!-- <body>
	<div id="all">
		<div id="member" class="card-header">트럭등록</div>
		<div id="container">
			<div id="box" class="row justify-content-center">
				<div class="col-md-6">
					<div id="card" class="card">

						<article class="card-body">
							<form id="target" name="fr" action="/truck/insert" onsubmit="" method="post">
								onsubmit="return ck();"
								<div class="form-group">
									<label>트럭 상호명</label> <input name="brandname" type="text"
										class="form-control" placeholder="">
								</div>
								<div class="form-group">
									<label>사업자번호</label> <input name="crn" type="text"
										class="form-control" placeholder="">
								</div>
								<div class="form-group">
									<label>트럭번호</label> <input name="trucknum" type="text"
										class="form-control" placeholder="">
								</div>
								<div class="form-group">
									<label>계좌번호</label> <input name="account" type="text"
										class="form-control" placeholder="">
								</div>
															<div class="form-group">
									<label>비밀번호확인</label> <input id="repasswd" type="password"
										class="form-control" placeholder="">
								</div>
								form-group end.//
								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-block">
										회원가입완료</button>
									<input id="register" type="submit" class="btn" value="트럭등록" />
								</div>
							</form>
						</article>
					</div>
				</div>
			</div>
		</div>
	</div>
</body> -->
<body>

	<div id="logo">
		<a href="/rehome">당신의 푸드트럭</a>
	</div>
	<div id="all">
		<div class="card-header">트럭 등록</div>
		<div id="container">

			<div id="box" class="row justify-content-center">
				<div class="col-md-6">
					<div id="card" class="card">

						<article class="card-body">
							<form id="target" name="fr" action="/truck/insert" onsubmit="return ck();" method="post">
								<!-- onsubmit="return ck();" -->
								<div class="form-group">
									<label>트럭 상호명</label> <input name="brandname"type="text"
										class="form-control" placeholder="">
								</div>
								<div class="form-group">
									<label>사업자번호</label> <input  name="crn" type="text"
										class="form-control" placeholder="">
								</div>

								<div class="form-group">
									<label>트럭번호</label> <input name="trucknum" type="text"
										class="form-control" placeholder="">
								</div>
								<!-- form-row.// -->
								<div class="form-group">
									<label>계좌번호</label> <input name="account" class="form-control"
										type="tel" >
								</div>
								<div class="form-group">
									<label>고객 결제수단 &nbsp;: &nbsp;&nbsp;</label>
							
									<input type="checkbox" id="ck1" name="pay"value="5">
									<label for="ck1">현금</label>
									
									<input type="checkbox" id="ck2" name="pay"value="3">
									<label for="ck2">카드</label>
									
									<input type="checkbox" id="ck3" name="pay" value="1">
									<label for="ck3">카카오페이</label>
									
								</div>
								<div class="form-group">
											<label>운영시간</label>
											<input id="Starttime" name="truck_starttime" type="time" class="form-control">~
											<input id="Endtime" name="truck_endtime"type="time" class="form-control">
										
								</div>
								<div class="form-group">
									<label>[추가 기입 사항]</label> 
									<textarea class="form-control" rows="3" name="truck_desc"></textarea>
								</div>
							

								<div class="form-group">
									<!-- <button type="submit" class="btn btn-primary btn-block">
										회원가입완료</button> -->
									<input id="register" type="submit"
										class="btn" value="트럭등록" />
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