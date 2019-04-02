<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../header/header.jsp"></jsp:include>

<style>
#fr {
	margin-left: 40%;
}
</style>

<div style="margin-top: 180px; border: solid 1px;"></div>
<!-- <div id="menu_wrap" class="bg_white"> -->
<!-- 	<div class="option"> -->
<c:forEach var="test" items="${loc}">
${test.lat_y} // ${test.lng_x }
</c:forEach>
<form id="fr">
	검색 : <input type="text" value="" id="keyword" size="15"> <input
		id="submit" type="button" value="검색하기">
</form>
<!-- 	</div>
	<hr>
	<ul id="placesList"></ul>
	<div id="pagination"></div> -->
<!-- </div> -->
<div id="map" style="width: 60%; height: 50%; margin: 0 auto;"></div>

<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<!-- <script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04b9ba1fd8fa1800dc5a03023c8372db&libraries=clusterer"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04b9ba1fd8fa1800dc5a03023c8372db&libraries=services"></script> -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04b9ba1fd8fa1800dc5a03023c8372db&libraries=services,clusterer,drawing"></script>
<script>

	function reflash(){
		map.setBounds(37.566826, 126.9786567)
		level : 14
	}
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 14
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption);

	// 장소 검색 객체를 생성합니다.
	 var ps = new daum.maps.services.Places(map);
	
	// 마커 클러스터러를 생성합니다 
	var clusterer = new daum.maps.MarkerClusterer({
		map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
		averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
		minLevel : 10
	// 클러스터 할 최소 지도 레벨 
	});
	
	// 데이터를 가져오기 위해 jQuery를 사용합니다
	// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
	var positions = $.get("resources/js/food.json");
	
	
	/* for(var i=0;i<positions.length;i++){
	var marker = new daum.maps.Marker({
	    position: new daum.maps.LatLng(position.lat, position.lng)
	});
	
	alert(1);
	clusterer.addMarkers(marker);
	} */
	 $.get("resources/js/food.json", function(data) {
		// 데이터에서 좌표 값을 가지고 마커를 표시합니다
		// 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
		
		var markers = $(data.positions).map(function(i, position) {
			return new daum.maps.Marker({
				title:position.content,
				position : new daum.maps.LatLng(position.lat, position.lng)	
				
			}); 
		
			
			
		});
		for(var i=0;i<markers.length;i++){
		console.log(markers.map);
		console.log(markers);
		}
		
		// 클러스터러에 마커들을 추가합니다
		clusterer.addMarkers(markers);
		getMarkers()

		
	}); 

	// 키워드로 장소를 검색합니다
	$("#submit").click(function() {
		searchPlaces();
	});
	/* searchPlaces(); */
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

		var keyword = document.getElementById('keyword').value;

		if (!keyword.replace(/^\s+|\s+$/g, '')) {
			alert('키워드를 입력해주세요!');
			return false;
		}

		// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		ps.keywordSearch(keyword, placesSearchCB);
	}

	function placesSearchCB(data, status) {
		if (status === daum.maps.services.Status.OK) {

			// 정상적으로 검색이 완료됐으면
			// 검색 목록과 마커를 표출합니다
			/* console.log(data); */
			console.log(status);
			/* console.log(pagination); */
			displayPlaces(data);

			// 페이지 번호를 표출합니다
			/* displayPagination(pagination); */

		} else if (status === daum.maps.services.Status.ZERO_RESULT) {

			alert('검색 결과가 존재하지 않습니다.');
			return;

		} else if (status === daum.maps.services.Status.ERROR) {

			alert('검색 결과 중 오류가 발생했습니다.');
			return;

		}
	}
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {
		bounds = new daum.maps.LatLngBounds();
		/* console.log(places); */
		// 검색 결과 목록에 추가된 항목들을 제거합니다
		/* removeAllChildNods(listEl); */

		// 지도에 표시되고 있는 마커를 제거합니다
		/* removeMarker(); */

		for (var i = 0; i < places.length; i++) {

			// 마커를 생성하고 지도에 표시합니다
			var placePosition = new daum.maps.LatLng(places[i].y, places[i].x);/* , marker = addMarker(
					placePosition, i), itemEl = getListItem(i, places[i]); */ // 검색 결과 항목 Element를 생성합니다

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			bounds.extend(placePosition);
			console.log(bounds);
			console.log(placePosition);
			map.setBounds(bounds);
			// 마커와 검색결과 항목에 mouseover 했을때
			// 해당 장소에 인포윈도우에 장소명을 표시합니다
			// mouseout 했을 때는 인포윈도우를 닫습니다
			/* (function(marker, title) {
				daum.maps.event.addListener(marker, 'mouseover', function() {
					displayInfowindow(marker, title);
				});

				daum.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});

				itemEl.onmouseover = function() {
					displayInfowindow(marker, title);
				};

				itemEl.onmouseout = function() {
					infowindow.close();
				};
			}) */
			
/* 			(marker, places[i].place_name); */

			/* fragment.appendChild(itemEl); */
		}
	}
</script>
<style>
#map {
	height: 50%;
}
</style>