<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>당신의 푸드트럭</title>
</head>
<jsp:include page="../header/header.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/mypage.js"></script>
<link rel="stylesheet" href="<c:url value ="/resources/css/customercss/mypage.css"/>"/>
<div class="container uContainer">
	<div class="row">
		<img class="col-md-3 mypage" src="/resources/image/mypage/마이페이지.png"/>
        <img class="col-md-3 mypage onboard cusorp" src="/resources/image/mypage/탑승트럭g.png"/>
        <img class="col-md-3 mypage review cusorp" src="/resources/image/mypage/리뷰관리g.png"/>
        <img class="col-md-3 mypage callList cusorp" src="/resources/image/mypage/호출내역g.png"/>
        <img class="col-md-3 mypage mozip cusorp" src="/resources/image/mypage/모집공고g.png"/>
        <img class="col-md-3 mypage cusInfo cusorp" src="/resources/image/mypage/회원정보관리g.png"/>
        <img class="col-md-3 mypage myQuestion cusorp" src="/resources/image/mypage/문의내역g.png"/>
        <img class="col-md-3 mypage goodbyeForm cusorp" src="/resources/image/mypage/회원탈퇴g.png"/>
    </div>
</div>