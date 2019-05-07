<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet" href="<c:url value="/resources/css/seller/sellerMain.css"/>">
<div class="container">
	<div class="row">
		<div class="col-md-3">
			<jsp:include page="sideMenuBar/sideMenuBar.jsp"></jsp:include>
		</div>
		<div class="col-md-9">
			<div class="row content">
				<div class="col-md-6 mngbtn">매출관리</div>
				<div class="col-md-6 mngbtn">탑승자관리</div>
			</div>
		</div>
	</div>
</div>

<!--  -->
