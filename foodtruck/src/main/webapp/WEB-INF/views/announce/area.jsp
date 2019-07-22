 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>당신의 푸드트럭</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/announce/area.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zprqsl0tqo"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=zprqsl0tqo&submodules=geocoder"></script>
<style>
	.layerPopup {
		border:4px solid #ddd;
		background:#fff;
	}
	
	.layerPopup button {
		cursor:pointer;
	}
</style>
</head>
<body>
	<script>
		$(document).ready(function() {
			$(".contents > a").click(function() {
				var sa = $(this).parent().prev().val();
				getData(sa);
			});
		});
		function getData(sa) {
			result = naver.maps.Service.geocode({
				query : sa
			}, function(status, response) {
				if (status !== naver.maps.Service.Status.OK) {
					return alert('Something wrong!');
				}

				var resultmap = response.v2, // 검색 결과의 컨테이너
				items = resultmap.addresses; // 검색 결과의 배열
				x = eval(items[0].x);
				y = eval(items[0].y);
				var point = new naver.maps.Point(x, y);

				$("#map").css("display", "block");
				$("#closeX").css("display", "block");
				drawMap(x, y);
			});

		}

		function drawMap(x, y, sa) {

			// do Something

			var HOME_PATH = window.HOME_PATH || '.';
			var cityhall = new naver.maps.LatLng(y, x),

			map = new naver.maps.Map('map', {
				center : new naver.maps.LatLng(y, x),
				zoom : 10
			}),

			marker = new naver.maps.Marker({
				map : map,
				position : cityhall
			});

			var contentString = [ '<div class="iw_inner">',
					'   <h3>' + sa + '</h3>', '</div>' ].join('');

/* 			var infowindow = new naver.maps.InfoWindow({
				anchorSkew : true
			}); */

/* 			naver.maps.Event.addListener(marker, "click", function(e) {
				if (infowindow.getMap()) {
					infowindow.close();
				} else {
					infowindow.open(map, marker);
				}
			}); */

			infowindow.open(map, marker);
		}
	</script>
	
	<script>
		$(window).resize(function() { //창크기 변화 감지
			$(".layerPopup").hide();
			$("#closeX").hide();
		});

		$(document).ready(function(){
			$(".contents > a").click(function(){
				var lay_pop = $(".layerPopup");
				var pos = $(this).offset();
				
				var closeX = $("#closeX");
				
				lay_pop.css('position', 'absolute');
				lay_pop.css('top', (pos.top)+10 + 'px');    // 레이어 위치 지정
				lay_pop.css('left', (pos.left)+10 + 'px');
				
				closeX.css('position', 'absolute');
				closeX.css('top', (pos.top)-12 + 'px');    // 레이어 위치 지정
				closeX.css('left', (pos.left)+247 + 'px');
				
				$(".layerPopup").hide();
				$(this).blur();
				$(".layerPopup").show();
				$(".layerPopup a").focus();
				return false;
			});
			
			$("#closeX").click(function(){
				$(".layerPopup").hide();
				$("#closeX").hide();
			});
		});
	</script>
	<div id="title" class="card-header">
		<p>허가구역 안내</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             

	</div>
	<div id="content" >
	<div id="searchall">
		<nav class="navbarr">
			<form class="form-inline" action="/area" method="post">
				<!-- <input id="searchbox" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
				<button id="searchbutton" type="button" class="btn">검색</button> -->
				<select id="forSido"name="sido" onchange="changeSido()" value="${sido}">
					<option value="1">서울</option>
					<option value="2">부산</option>
					<option value="3">대구</option>
					<option value="4">인천</option>
					<option value="5">광주</option>
					<option value="6">대전</option>
					<option value="9">경기</option>
					<option value="10">강원</option>
					<option value="11">충북</option>
					<option value="12">충남</option>
					<option value="13">전북</option>
					<option value="14">전남</option>
					<option value="15">경북</option>
					<option value="16">경남</option>
					<option value="17">제주</option>
				</select>				
				<input id="searchbox"name="keyword" size="10" value="${map.keyword}">
				<input type="hidden" name="post_class" value="2">
				<input id="searchbutton" type="submit" value="검색" class="btn">
			</form>
		</nav>
	</div>

	<div id="table">
		<table class="table">
			<thead>
				<tr>
					<th class="boardsido">지역</th>
					<th class="boardTitle">구역명</th>
					<th class="boardaddr">주소</th>
					<th>문의전화번호</th>
				</tr>
			</thead>
			<tbody>
 				<c:forEach var="row" items="${requestScope.areaList}">
 				<tr>
 					<td class="boardsido">${row.SIDO_NAME}</td>
 					<td class="boardTitle">${row.AREA_NAME}
 						<input type="hidden" class="latitude" value="${row.LATITUDE}">
 						<input type="hidden" class="longitude" value="${row.LONGITUDE}">
 					</td>
 					<td style="position:relative;">${row.ADDR}
 						<input type="hidden" value="${row.ADDR}"/>
	 					<div class="contents" style="display:inline-block; position:relative;">
							<a href="#layerPopup">
								<img src="resources/image/map-marker-32.png" style="width:auto; height:15px; position:relative; top:-2px; "/>
							</a>
					    </div>
 					</td>
 					<td>${row.GOVERN_NAME}</td>
 					<td>${row.GOVERN_PHONE}</td>
 				</tr>
 				</c:forEach>
			</tbody>
		</table>
	</div>
	<img id="closeX" src="resources/image/close_x.png" style="width:22px; height:22px; cursor:pointer; display:none;"/>
	<div class="layerPopup" style="display:none; z-index:100; position:relative;">
		
		<div id="map" style="width:250px; height:250px; display: none; position:relative;"></div>
	</div>
	
	<div id="nextall">
		<nav id="next" aria-label="Page navigation example">
			<ul class="pagination">
				<li class="page"><a class="page-link" href="javascript:list('1')"><span>&lt;&lt;</span></a></li>
				<c:forEach var="num" begin="${map.postPager.blockBegin}" end="${map.postPager.blockEnd}">
					<li class="page-item"><a class="page-link" href="javascript:list('${num}')"><span>${num}</span></a></li>
				</c:forEach>			
				<li class="page-item"><a class="page-link" href="javascript:list('${map.postPager.nextPage}')"><span>&gt;&gt;</span></a></li>
			</ul>
		</nav>
	</div>
	</div>
<script>
	function list(page) {
		location.href = "/area?sido="+${sido}+"&curPage=" + page + "&keyword=${map.keyword}";
		
	}
	function changeSido() {
		var sido = $('#forSido').val();
		location.href="/area?sido="+sido;
	}
	$(document).ready(function() {
		console.log("${sido}");
		$('#forSido').val("${sido}");
		$('#title').click(function() {
			location.href = "/area";
		});
		$(".table td").addClass("word-break");
		$(".table th").addClass("word-break");
	});
</script>
</body>
</html>
