<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../header/header.jsp"></jsp:include>
<header>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
		</ol>

		<div class="carousel-inner" role="listbox">
			<!-- Slide One - Set the background image for this slide in the line below -->
			<c:forEach var="i" items="${mainimage }">
				<c:if test="${i.rank==1 }">

					<div class="carousel-item active"
						style="background-image: url('resources/image/upload/${i.truck_url}')">
						<div class="carousel-caption d-none d-md-block">
							<h3 class="display-4">${i.brandname }</h3>
							<input type="hidden" value="${i.truck_code }" />
						</div>
					</div>

				</c:if>
				<c:if test="${i.rank>1 }">
					<div class="carousel-item"
						style="background-image: url('resources/image/upload/${i.truck_url}')">
						<div class="carousel-caption d-none d-md-block">
							<h3 class="display-4">${i.brandname }</h3>
							<input type="hidden" value="${i.truck_code }" />
							<!-- <p class="lead">김밥천국</p> -->
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<!--  </div>
      Slide Two - Set the background image for this slide in the line below
      <div class="carousel-item" style="background-image: url('resources/image/food2.jpg')">
        <div class="carousel-caption d-none d-md-block">
          <h3 class="display-4">타코 트럭</h3>
          <p class="lead">오니기리</p>
        </div>
      </div>
      Slide Three - Set the background image for this slide in the line below
      <div class="carousel-item" style="background-image: url('resources/image/food3.jpg')">
        <div class="carousel-caption d-none d-md-block">
          <h3 class="display-4">커피 트럭</h3>
          <p class="lead">김밥천국</p>
        </div>
      </div>
            <div class="carousel-item" style="background-image: url('resources/image/food3.jpg')">
        <div class="carousel-caption d-none d-md-block">
          <h3 class="display-4">커피 트럭</h3>
          <p class="lead">김밥천국</p>
        </div>
      </div>
      <div class="carousel-item" style="background-image: url('resources/image/food3.jpg')">
        <div class="carousel-caption d-none d-md-block">
          <h3 class="display-4">커피 트럭</h3>
          <p class="lead">김밥천국</p>
        </div>
      </div>
    </div> -->

		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</header>
<div>
	<div style="display: inline">
		<!-- <button style="width:50%; float: right" type="button" class="btn btn-outline-secondary">주간 맛트럭</button> -->
		<button style="width: 50%; float: right" type="button"
			class="btn btn-warning">주간 맛트럭</button>
	</div>
	<div style="display: inline;">
		<!-- <button style="width:50%" type="button" class="btn btn-outline-secondary">월간 맛트럭</button> -->
		<button style="width: 50%" type="button" class="btn btn-warning">월간
			맛트럭</button>
	</div>
</div>

<!-- 중앙 -->
<div style="margin-left: 100px; margin-right: 100px;">
	<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand" href="#">더 많은 이야기</a>
	</nav>
	<div class="card-deck">
		<div class="card">
			<a href="/eventOn"><img class="card-img-top"
				src="resources/image/event.jpg" alt="Card image cap"></a>
			<div class="card-body">
				<h4 class="card-title">이벤트</h4>
				<p class="card-text">각 푸드트럭에서 실시하는 이벤트를 알아보세요.</p>

			</div>
		</div>
		<div class="card">
			<a href="/news""><img class="card-img-top"
				src="resources/image/news.png" alt="Card image cap"></a>
			<div class="card-body">
				<h4 class="card-title">푸드트럭 News</h4>
				<p class="card-text">당신의 푸드트럭의 새로운 소식을 알아보세요.</p>
			</div>
		</div>
	</div>
</div>
<script>
	$(function() {
		$(document.body).on('click','.carousel-item',function(){
			var a = $(this);
			var b=a.find('input').val();
			console.log(b);
			location.href="/truck/?truck_code="+b;
		});
		$.get('resources/json/result.json',function(){})
		.done(function(result) {
			console.log(result);
			$.ajax({
				type:"post",
				url:"/announce/jsonToDB",
				contentType:"application/json;charset=UTF-8",
				data:JSON.stringify(result),
				success:function(good) {
					if(good =="Yes")alert("json데이터 들어감")
					else if(good=="No")alert("안들어가도댐");
				},error:function(err) {
					console.log('json저장 실패');
					console.log(err);
				}
			});
		});
	});
</script>