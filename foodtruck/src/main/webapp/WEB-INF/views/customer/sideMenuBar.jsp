<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<style>
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
span {
	color: tomato;
	
}
.col-md-3 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 25%;
    flex: 0 0 25%;
    max-width: 100%;
    position: relative;
    right: 3%;
        top: 75px;
}

/* li { display:inline-block; padding:20px; cursor:pointer; } */
/* li.on { background-color:#eee; color:#f00; font-weight:bold;} */
</style>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/seller/sideMenuBar/sideMenuBar.css"/>">
<script type="text/javascript" src="<c:url value="/resources/js/seller/sideMenu.js"/>"></script>
<title>Insert title here</title>
</head>
<body>

	<div class="list-group">
				<ul class="sidebar">
					<li class="menu onboard" ><a href="/customer/onboard"  class="list-group-item"><span style="font-family: 'Hanna', serif;">탑승트럭</span></a>
					<li class="menu onboard2" style="display:none;"><a href="/customer/onboard"  class="list-group-item"><span style="font-family: 'Hanna', serif;">탑승한 트럭</span></a>
					<li class="menu onboard2" style="display:none;" ><a href="/customer/onSale"  class="list-group-item"><span style="font-family: 'Hanna', serif;">운행중인 트럭</span></a>
					<li class="menu review"><a href="/customer/review"   class="list-group-item"><span style="font-family: 'Hanna', serif;">리뷰관리</span></a>
					<li class="menu callList"><a href="/customer/callList"   class="list-group-item"><span style="font-family: 'Hanna', serif;">호출내역</span></a>
					<li class="menu"><a href="/customer/joinlist"  class="list-group-item"><span style="font-family: 'Hanna', serif;">모집공고</span></a>
					<li class="menu cusInfo"><a href="/customer/cusInfo"   class="list-group-item"><span style="font-family: 'Hanna', serif;">회원정보관리</span></a>
					<li class="menu myQuestion"><a href="/help/myQuestion"   class="list-group-item"><span style="font-family: 'Hanna', serif;">문의내역</span></a>
					<li class="menu goodbyeForm"><a href="/customer/goodbyeForm"   class="list-group-item"><span style="font-family: 'Hanna', serif;">회원탈퇴</span></a>
				</ul>
	</div>
</body>
</html>