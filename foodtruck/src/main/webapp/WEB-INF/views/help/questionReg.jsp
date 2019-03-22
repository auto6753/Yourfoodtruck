<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<jsp:include page="../header/header.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h3>
				1:1 문의
			</h3>
			<form role="form">
				<div class="form-group">
					<label for="title">제목</label>
					<input type="text" id="title" class="form-control"/>
				</div>

				<div class="container">
					<div class="row">
						<div class="col-md-3">
							<select class="form-control">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</div>
						<div class="col-md-3">
							<select class="form-control">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</div>
						<div class="col-md-3">
							<select class="form-control">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="exampleInputEmail1">내용</label>
					<input type="text" class="form-control"/>
				</div>
				
				<div class="form-group">
					<label for="exampleInputEmail1">이메일</label>
					<input type="email" class="form-control" id="exampleInputEmail1" />
					<p class="help-block">답변이 등록되면 이메일로 알림이 발송됩니다.</p>
				</div>
				
				
				
				<button type="submit" class="btn btn-primary">등록</button>
			</form>
		</div>
	</div>
</div>
</body>
</html>