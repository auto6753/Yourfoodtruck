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
					<li class="menu" ><a href="/seller/"  class="list-group-item"><i class="fa fa-credit-card"></i> <span style="font-family: 'Hanna', serif;">메인</span></a>
					<li class="menu"><a href="/seller/truckinfo"   class="list-group-item"><i class="fa fa-credit-card"></i> <span style="font-family: 'Hanna', serif;">트럭정보수정</span></a>
					<li class="menu"><a href="/seller/menu"   class="list-group-item"><i class="fa fa-credit-card"></i> <span style="font-family: 'Hanna', serif;">메뉴등록</span></a>
					<li class="menu"><a href="/seller/location"  class="list-group-item"><i class="fa fa-credit-card"></i> <span style="font-family: 'Hanna', serif;">위치등록</span></a>
					<li class="menu"><a href="/seller/event"   class="list-group-item"><i class="fa fa-credit-card"></i> <span style="font-family: 'Hanna', serif;">이벤트등록</span></a>
					<li class="menu"><a href="/seller/psgpush"   class="list-group-item"><i class="fa fa-credit-card"></i> <span style="font-family: 'Hanna', serif;">탑승자알림관리</span></a>
					<li class="menu"><a href="/seller/callmanage"   class="list-group-item"><i class="fa fa-credit-card"></i> <span style="font-family: 'Hanna', serif;"> 푸드트럭호출관리</span></a>
					<li class="menu"><a href="/seller/order"   class="list-group-item"><i class="fa fa-credit-card"></i> <span style="font-family: 'Hanna', serif;">주문관리</span></a> 
					<!-- <li class="menu"><a href="/seller/layout"  class="list-group-item active"><i class="fa fa-credit-card"></i> <span>레이아웃</span></a> -->
						<ul class="hide">
							<li><a>타입 A</a></li>
							<li><a>타입 B</a></li>
						</ul>
					</li>
				</ul>
	</div>
</body>
</html>