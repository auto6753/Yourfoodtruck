<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>BootStrap</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">


<form class="form-horizontal" action="regi" method="get">
<fieldset>

<!-- Form Name -->
<legend>Register</legend>

<div class="form-group">
  <label class="col-md-4 control-label" for="m_mail">이메일</label>  
  <div class="col-md-2">
  <input id="emailaddr" name="m_mail" type="text" placeholder="Email" class="form-control input-md" required="">
    
  </div>
</div>
<!-- Password input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="m_passwd">패스워드</label>
  <div class="col-md-2">
    <input id="password" name="m_passwd" type="password" placeholder="Password" class="form-control input-md" required="">
    
  </div>
</div>


<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="m_nicname">닉네임</label>  
  <div class="col-md-2">
  <input id="emailaddr" name="m_nicname" type="text" placeholder="닉네임" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="m_name">이름</label>  
  <div class="col-md-2">
  <input id="hostkey" name="m_name" type="text" placeholder="이름" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="submit"></label>
  <div class="col-md-4">
    <button id="submit" name="submit" class="btn btn-primary">회원가입</button>
  </div>
</div>

</fieldset>
</form>
<div class="container">
	<div class="row">
	</div>
</div>


	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>

</body>
</html>