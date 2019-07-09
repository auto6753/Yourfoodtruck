<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Cabin" />
<style>
@font-face {font-family: 'yg-jalnan';src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');font-weight: normal;font-style: normal; } 

.fixed{
 width: 140%;
  top: 0;
  right: 0;
  left: -30%;
  z-index: 1030;
}
.carousel-item {
   height: 65vh;
   min-height: 350px;
   background: no-repeat center center scroll;
   -webkit-background-size: cover;
   -moz-background-size: cover;
   -o-background-size: cover;
   background-size: cover;
}
#main{


	height: 50px;
	width:80%;
	
	
}

#z::hover{
	?
}


.navbar{
z-index:2;
margin-top:3%;
margin-left:12%;
margin-right:12%;
height: 100px;
border-radius: 10px;
}

/* #top-right {

	padding: 0 auto;
} */

/* #top-right {

   padding: 0 auto;
} */

#top-right {
   margin-top: 50px;
}
.test{

	margin-left:20%;
	margin-right:20%;
 	font-family: 'yg-jalnan';
	font-size: 120%;
	font-weight: 700;
	
	
}
.navbar-light .navbar-brand {
    color: rgba(0, 0, 0, .9);
    font-family: 'yg-jalnan';
    width: 50%;
    position: relative;
    
}
a{
	color: rgb(255, 94, 24);


}
.collapse.show{
	display: block;
	text-align: center;
	background-color: white;
	margin-top: 5px;


}

.navbar-collapse {
   
 
    position: relative;
    left: 10%;
    font-size: 100%;
    width: 300%;
}
 
.navbar-light .navbar-nav .active>.nav-link, .navbar-light .navbar-nav .nav-link.active, .navbar-light .navbar-nav .nav-link.show, .navbar-light .navbar-nav .show>.nav-link {
    color: rgba(0, 0, 0, .9);
}

.navbar-light .navbar-nav .nav-link {
   
color: rgba(0,0,0,.9); 
}

light .navbar-nav .nav-link:hover{
color: rgba(255, 94, 24); 
}
.collapse navbar-collapse{
	margin-left: 300px;
}
.foodtruck{
	width: 100%;
    position: relative;
  	right: 20%
}
.fixed{
 width: 140%;
  top: 0;
  right: 0;
  left: -31.5%;
  z-index: 1030;
}




</style>
<!-- Navigation -->
<div class="test" >
<nav 
	class="navbar navbar-expand-lg navbar-light bg-light shadow fixed">
	<div id="main" class="container" >
		<a class="navbar-brand" href="/rehome" ><img class="foodtruck"src="/resources/image/KakaoTalk_20190530_140110049.png"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<!-- <li class="nav-item active"><a class="nav-link" href="#">서비스소개
						<span class="sr-only">(current)</span>
				</a></li> -->
				<li class="nav-item"><a class="nav-link" href="/search">트럭검색</a></li>
				<li class="nav-item"><a class="nav-link" href="/area">허가구역</a></li>
				<li id="z" class="nav-item"><a class="nav-link" href="/announce">모집공고</a></li>
				<!-- <li class="nav-item"><a class="nav-link" href="#">앱 다운로드</a></li> -->
				<li class="nav-item"><a class="nav-link" href="/help">고객센터</a></li>
			</ul>
			<div id="top-right">
				<c:if test="${sessionid == null}">
				<span id="login" class="badge badge-light"><a href="/login" style="color:rgba(255, 94, 24)">로그인</a></span>
				<span class="badge badge-light"><a href="/login/register" style="color:rgba(255, 94, 24)">회원가입</a></span>
				</c:if>
				<c:if test="${not empty sessionScope.sessionid}">	
					<span id="" class="badge badge-light" style="color:rgba(255, 94, 24)">${sessionScope.sessionid.nickname}님</span>
					<input id="sessione" type="hidden" value="${sessionScope.sessionid.email }">
					<input id="sessionp" type="hidden" value="${sessionScope.sessionid.point}">
					<span id="" class="badge badge-light" style="color:rgba(255, 94, 24)">포인트 : ${sessionScope.sessionid.point} 원</span>
					<span id="" class="badge badge-light"><a href="/customer" style="color:rgba(255, 94, 24)">마이페이지</a></span>
					<c:if test="${empty sessionScope.seller}">	
					<span id="" class="badge badge-light"><a href="/truck/register" style="color:rgba(255, 94, 24)">트럭등록</a></span>
					</c:if>
					<c:if test="${not empty sessionScope.seller}">
					<span id="" class="badge badge-light"><a href="/seller" style="color:rgba(255, 94, 24)">트럭관리</a></span>
					</c:if>
					<span id="" class="badge badge-light"><a href="/login/logout" style="color:rgba(255, 94, 24)">로그아웃</a></span>
				</c:if>
			</div>
		</div>
	</div>
</nav>
</div>
<script>
$(document).ready(function(){
   //alert("?");
   
   var email= $("#sessione").val();
   var point= $("#sessionp").val();
   //alert(a);
   if(email==null){
      return;
   }else{
      $.ajax({
         type:"post",
         url:"/login/pointck",
         data:{
            email:email,
            point:point
         },
         success:function(data){
            
            if(data=="different"){
               window.location.reload();
            }
            /* if(data.point==$("#sessionp").val()){
               //alert("같음");
            }else{
               alert(data.point);
               alert($("#sessionp").val());
            } */
         }
      });
   }

});
</script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>