<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../header/header.jsp"></jsp:include>

<!-- 	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			Slide One - Set the background image for this slide in the line below
			<div class="carousel-item active"
				style="width: 100%; height: auto; background-image: url('resources/image/food1.png')">
				<div class="carousel-caption d-none d-md-block">
					<h3 class="display-4">First Slide</h3>
					<p class="lead">This is a description for the first slide.</p>
				</div>
			</div>
			Slide Two - Set the background image for this slide in the line below
			<div class="carousel-item"
				style="width: 100%; height: auto; background-image: url('resources/image/noodle.jpg')">
				<div class="carousel-caption d-none d-md-block">
					<h3 class="display-4">Second Slide</h3>
					<p class="lead">This is a description for the second slide.</p>
				</div>
			</div>
			Slide Three - Set the background image for this slide in the line below
			<div class="carousel-item"
				style="width: 100%; height: auto; background-image: url('resources/image/don.jpg')">
				<div class="carousel-caption d-none d-md-block">
					<h3 class="display-4">Third Slide</h3>
					<p class="lead">This is a description for the third slide.</p>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div> -->
	<header>
  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
      <!-- Slide One - Set the background image for this slide in the line below -->
      <div class="carousel-item active" style="background-image: url('resources/image/food1.png')">
        <div class="carousel-caption d-none d-md-block">
          <h3 class="display-4">닭치고 닭꼬치</h3>
          <!-- <p class="lead">닭치고 닭꼬치</p> -->
        </div>
      </div>
    
      
      <!-- Slide Two - Set the background image for this slide in the line below -->
      <div class="carousel-item" style="background-image: url('resources/image/food2.jpg')">
        <div class="carousel-caption d-none d-md-block">
          <h3 class="display-4">타코 트럭</h3>
          <!-- <p class="lead">오니기리</p> -->
        </div>
      </div>
      <!-- Slide Three - Set the background image for this slide in the line below -->
      <div class="carousel-item" style="background-image: url('resources/image/food3.jpg')">
        <div class="carousel-caption d-none d-md-block">
          <h3 class="display-4">커피 트럭</h3>
          <!-- <p class="lead">김밥천국</p> -->
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
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
			<button style="width: 50%" type="button" class="btn btn-warning">월간 맛트럭</button>
		</div>
	</div>

	<!-- 중앙 -->
	<div style="margin-left: 100px; margin-right: 100px;">
		<nav class="navbar navbar-light bg-light">
			<a class="navbar-brand" href="#">더 많은 이야기</a>
		</nav>
		<div class="card-deck">
			<div class="card">
				<a href="/eventOn"><img class="card-img-top" src="resources/image/event.jpg" alt="Card image cap"></a>
				<div class="card-body">
					<h4 class="card-title">이벤트</h4>
					<p class="card-text">각 푸드트럭에서 실시하는 이벤트를 알아보세요.</p>

				</div>
			</div>
			<div class="card"> 
				<a href="/news""><img class="card-img-top" src="resources/image/news.png" alt="Card image cap" ></a>
				<div class="card-body">
					<h4 class="card-title">푸드트럭 News</h4>
					<p class="card-text">당신의 푸드트럭의 새로운 소식을 알아보세요.</p>
				</div>
			</div>
		</div>
	</div>
