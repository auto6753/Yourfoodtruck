<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<title>당신의 푸드트럭</title>
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
</head>
<body>
<!-- header -->
<jsp:include page="header/header.jsp"></jsp:include>

<!-- content -->
<jsp:include page="${content}"></jsp:include>

<script type="text/javascript" src="resources/js/jquery.min.js" ></script> 
<script type="text/javascript" src="resources/js/bootstrap.min.js" ></script>
</body>
</html>
