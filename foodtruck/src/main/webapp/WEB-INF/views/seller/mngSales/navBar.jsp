<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
   href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet"
   href="<c:url value="/resources/css/font/font.css"/>">
<script type="text/javascript"
   src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script>
	$(document).ready(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 50) {
				$('.top').fadeIn();
			} else {
				$('.top').fadeOut();
			}
		});

		$('.top').click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});

		var pageVal;
		pageVal = $("#page").val();

		switch (pageVal) {
		case "1":
			$(".today").css("background-color", "#ff5e18");
			$(".today").css("color", "white");
			break;
		case "2":
			$(".week").css("background-color", "#ff5e18");
			$(".week").css("color", "white");
			break;
		case "3":
			$(".month").css("background-color", "#ff5e18");
			$(".month").css("color", "white");
			break;
		case "4":
			$(".year").css("background-color", "#ff5e18");
			$(".year").css("color", "white");
			break;
		case "5":
			$(".byDay").css("background-color", "#ff5e18");
			$(".byDay").css("color", "white");
			break;
		case "6":
			$(".byTime").css("background-color", "#ff5e18");
			$(".byTime").css("color", "white");
			break;
		case "7":
			$(".selPeriod").css("background-color", "#ff5e18");
			$(".selPeriod").css("color", "white");
		}
	});
</script>
<style>
a.top {
   position: fixed;
   left: 93%;
   bottom: 10%;
   display: none;
   z-index: 1;
}

.butn {
   -webkit-border-radius: 7;
   -moz-border-radius: 7;
   border-radius: 7px;
   color: #ff5e18;
   font-size: 14px;
   background: #ffffff;
   padding: 10px 20px 10px 20px;
   text-decoration: none;
}

.butn:hover {
   background: #ffffff;
   text-decoration: none;
}

.navBtn {
   width: 14.2%;
   height: 50px;
}
</style>

</head>
<body>
   <input type="hidden" id="type" value="${type}"/>
   <script>
      $(document).ready(function(){
         var type = "${type}";
         
         if(type == "app"){
            $(".displayNone").hide();
            $(".navBtn").css("width", "24.85%");
         }
      });
   </script>
   <a href="#" class="top">Top</a>
   <form id="salesInfo" action="salesInfo" method="GET"
      style="padding-top: 10px;">
      <div class="container">
         <nav id="navBar" class="row">
         	<input type="hidden" name="type" value="${type}"/>
            <button class="navBtn butn hanna today" name="pageName"
               value="todaySales">금일</button>
            <button class="navBtn butn hanna week" name="pageName"
               value="weekSales">주간</button>
            <button class="navBtn butn hanna month displayNone" name="pageName"
               value="monthSales">월간</button>
            <button class="navBtn butn hanna year displayNone" name="pageName"
               value="yearSales">연간</button>
            <button class="navBtn butn hanna byDay" name="pageName"
               value="byDaySales">요일별</button>
            <button class="navBtn butn hanna byTime" name="pageName"
               value="byTimeSales">시간대별</button>
            <button class="navBtn butn hanna selPeriod displayNone" name="pageName"
               value="selPeriodSales">사용자지정</button>
         </nav>
      </div>
   </form>
</body>
</html>