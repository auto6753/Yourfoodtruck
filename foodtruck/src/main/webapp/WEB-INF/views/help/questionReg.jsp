<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet" href="<c:url value="/resources/css/help/questionReg.css"/>"/>
<script type="text/javascript" src="<c:url value="/resources/js/help/questionReg.js"/>"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h3 class="title-padding">1:1 문의</h3>
			<form role="form">
				<div class="form-group">
					<label for="title" class="text-padding-2">제목</label>
					<input type="text" id="title" class="form-control width-control"/>
				</div>
				
				<div class="form-group">
					<label class="text-padding-2">분류</label>
					<select class="form-control form-control-group">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
					</select>
					<select class="form-control form-control-group">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
					</select>
					<select class="form-control form-control-group">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
					</select>
				</div>
				
				<div class="form-group">
					<label for="content" class="text-padding-2">내용</label>
					<textarea class="form-control width-control textarea-height-control resize"></textarea>
				</div>
				<div class="form-group">
					<label for="email1" class="text-padding-1">이메일</label>
					<input type="email" class="form-control width-control" id="email1" />
					<p class="help-block">답변이 등록되면 이메일로 알림이 발송됩니다.</p>
				</div>
				<div class="buttons">
					<button type="reset" class="btn">리셋</button>
					<button type="submit" class="btn btn-primary">등록</button>
					<button class="btn" id="cancel">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>