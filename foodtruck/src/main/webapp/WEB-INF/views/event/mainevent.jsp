<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value ="/resources/css/news/event.css"/>" />
	<div id="with" class="col">
<ul class="tab" id="tab">
	<li>진행중인 이벤트</li>
	<li>종료된 이벤트</li>
	
</ul>

<div class="tab_con" id="tab_con">
	<div class="col" id="ingEvent">

		<c:forEach var="i" items="${ievent}">
					<div class="col-md-3">
					<div class="bace">
						<img class="img"
							src='${pageContext.request.contextPath}/resources/image/upload/${i.event_url}'>
						<div class="menuname">
							${i.event_name } <br>
							${i.event_start }~${i.event_end }<br>
							${i.brandname }
						</div>
					</div>
				</div>
		</c:forEach>
	</div>
	<div class="col" id="endEvent">
		
		<c:forEach var="e" items="${eevent}">
					<div class="col-md-3">
					<div class="bace">
						<img class="img"
							src='${pageContext.request.contextPath}/resources/image/food1.png'>
						<div class="menuname">
							${e.event_name } <br>
							${e.event_start }~${e.event_end }<br>
							${e.brandname }
						</div>
					</div>
					</div>
		</c:forEach>
	</div>
</div>
</div>
<script>
 	$(function() {
		tab('#tab', 0);
	});
	function tab(e, num){
	    var num = num || 0;
	    var menu = $(e).children();
	    var con = $(e+'_con').children();
	    var select = $(menu).eq(num);
	    var i = num;

	    select.addClass('on');
	    con.eq(num).show();
	    con.eq(num).find('*').css("display", "inline-block");

	    menu.click(function(){
	        if(select!==null){
	            select.removeClass("on");
	            con.eq(i).hide();
	        }

	        select = $(this);
	        i = $(this).index();

	        select.addClass('on');
	        con.eq(i).show();
	        con.eq(i).find('*').css("display", "inline-block");
	    });
	}
</script>
