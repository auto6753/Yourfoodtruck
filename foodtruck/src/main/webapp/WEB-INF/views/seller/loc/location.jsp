<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value="/resources/css/seller/loc/location.css"/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/seller/loc/addrlinkSample.css"/>" />
<head>
<script lang="javascript">
	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다.
	// (＂팝업 API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";


	function goPopup() { //경로는 시스템에 맞게 수정하여 사용
		//호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를
		//호출하게 됩니다.
		var pop = window.open("jusoPopup", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
		//** 2017년 5월 모바일용 팝업 API 기능 추가제공 **/
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서
		// 실제 주소검색 URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		// var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) { // 2017년 2월 제공항목이 추가되었습니다. 원하시는 항목을 추가하여 사용하시면 됩니다.
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.roadAddrPart2.value = roadAddrPart2;
		documentform.addrDetail.value = addrDetail;
		document.form.zipNo.value = zipNo;
	}
</script>

<title>위치관리</title>
<script type="text/javascript" src=""></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b1d1757d7f3887c30f0142b09e5ff2be&libraries=services,clusterer,drawing"></script>
<style>

</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<jsp:include page="../sideMenuBar/sideMenuBar.jsp"></jsp:include>
			</div>
			<%-- 
		<div class="col-md-9 content">
				<form name="form" id="form" method="post">
					<input type="button" onClick="goPopup();" value="팝업"/>
					도로명주소 전체(포맷)<input type="text" id="roadFullAddr" name="roadFullAddr" value=""/><br>
					도로명주소 <input type="text" id="roadAddrPart1" name="roadAddrPart1" value=""/><br>
					고객입력 상세주소<input type="text" id="addrDetail" name="addrDetail" value=""/><br>
					참고주소<input type="text" id="roadAddrPart2" name="roadAddrPart2" value=""/><br>
					우편번호<input type="text" id="zipNo" name="zipNo"/>
				</form>
			</div>
	</div> --%>
	<div class="col-md-9">
				<div class="col-md-12 paddingZero">
					<div class="menuTitle">위치등록</div>
					</div>
					</div>
			<div class="search">
				<input type="text" value="" id="keyword" >
				<input id="submit" type="button" class="btn" value="검색하기">
				<div id="map" ></div>
			</div>
			
			
			
			
			<div id="result">
			<p>
				<em>등록할 위치를 지도에 클릭하십시오.</em>
			</p>
			<form action="/seller/location" method="post"> 
			<div id="clickLatlng"><button id="store" style="display: none"> 검색위치로등록</button></div>
			<input id="lat_y" name="lat_y" type="hidden">
			<input id="lng_x" name="lng_x" type="hidden">
			<input id="truck_code" name="truck_code" value="${sessionScope.seller.truck_code }" type="hidden">
			</form>
			</div>
		</div>
	</div>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 15
		// 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var ps = new daum.maps.services.Places(map);

		function searchPlaces() {
			var keyword = document.getElementById('keyword').value;
			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}
			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다

			ps.keywordSearch(keyword, placesSearchCB); //나온데이터를 placesSerachCB 호출?

		}
		$("#submit").click(function() {
			searchPlaces();
		});
	
		function placesSearchCB(data, status) {
		      if (status === daum.maps.services.Status.OK) {
		         // 정상적으로 검색이 완료됐으면
		         // 검색 목록과 마커를 표출합니다
		         /* console.log(data); */
		         this.result = true;
		         //alert(result);
		         console.log(status);
		         /* console.log(pagination); */
		         
		         displayPlaces(data);
		         
		         // 페이지 번호를 표출합니다
		         /* displayPagination(pagination); */
		      } else if (status === daum.maps.services.Status.ZERO_RESULT) {

		         alert('검색 결과가 존재하지 않습니다.');
		         result = false;
		         return;

		      } else if (status === daum.maps.services.Status.ERROR) {
		         alert('검색 결과 중 오류가 발생했습니다.');
		         result = false;
		         return;
		      }
		   }
		   function displayPlaces(places) {
			      bounds = new daum.maps.LatLngBounds();
			      /* console.log(places); */
			      /*       var listEl = document.getElementById('placesList'), menuEl = document
			       .getElementById('menu_wrap'), fragment = document
			       .createDocumentFragment(), bounds = new daum.maps.LatLngBounds(), listStr = ''; */

			      // 검색 결과 목록에 추가된 항목들을 제거합니다
			      /* removeAllChildNods(listEl); */
						
			      // 지도에 표시되고 있는 마커를 제거합니다
			      /* removeMarker(); */

			      for (var i = 0; i < places.length; i++) {

			         // 마커를 생성하고 지도에 표시합니다
			         var placePosition = new daum.maps.LatLng(places[i].y, places[i].x);/* , marker = addMarker(
			                              placePosition, i), itemEl = getListItem(i, places[i]); */// 검색 결과 항목 Element를 생성합니다

			         // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			         // LatLngBounds 객체에 좌표를 추가합니다
			         bounds.extend(placePosition);
			         map.setBounds(bounds);
			         
			      }
			   
			 }
		
		//var location = "${location}";
		//console.log(location);
		console.log(${location});
		var lo= ${location};
		console.log(lo);
		console.log(typeof(lo));
		console.log(lo.lat_y);
		var markerPosition  = new daum.maps.LatLng(lo.lat_y, lo.lng_x); 
		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new daum.maps.Marker({
			// 지도 중심좌표에 마커를 생성합니다 
			position : markerPosition
		});
		// 지도에 마커를 표시합니다
		marker.setMap(map);

		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {

			// 클릭한 위도, 경도 정보를 가져옵니다 
			var latlng = mouseEvent.latLng;

			// 마커 위치를 클릭한 위치로 옮깁니다
			marker.setPosition(latlng);
			
			/* var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
			message += '경도는 ' + latlng.getLng() + ' 입니다'; */
			$("#store").css("display","block");
		/* 	var resultDiv = document.getElementById('clickLatlng');
			resultDiv.innerHTML = message; */
			//$('button').attr('id','store');
			$("#lat_y").val(latlng.getLat());
			$("#lng_x").val(latlng.getLng());
			console.log($("#lat_y").val());
			console.log($("#lng_x").val());	
		});
	</script>
</body>