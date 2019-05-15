<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../header/header.jsp"></jsp:include>
<style>
 	.wrap {/* position: absolute; left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden; */font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    /* .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')} */
    .info .link {color: #5085BB;}

#fr {
	margin-left: 40%;
}

.profile-teaser-left {
	float: left;
	width: 20%;
	margin-right: 1%;
}

.profile-img img {
	width: 100%;
	height: auto;
}

.profile-teaser-main {
	float: left;
	width: 79%;
}
</style>
<div style="margin-top: 180px; border: solid 1px;"></div>
<!-- <div id="menu_wrap" class="bg_white"> -->
<!--    <div class="option"> -->
<form id="fr">
   <select id="select" onchange="change()">
      <option value='map'>지도</option>
      <option value='list'>목록</option>
   </select> 검색 : <input type="text" value="" id="keyword" size="15"> <input
      id="submit" type="button" value="검색하기">
</form>
<div id="list" style="display: none">
	<%-- <c:forEach var="test" items="${loc}">
${test.lat_y} // ${test.lng_x }
</c:forEach> --%>
	<div class="container">
		<div class="row">
			<div id="list-group" class="list-group">
				<!--             <div class="list-group-item clearfix">
                <div class="profile-teaser-left">
                    <div class="profile-img"><img src="https://static.pexels.com/photos/21011/pexels-photo-large.jpg"/></div>
                </div>
                <div class="profile-teaser-main">
                    <h2 class="profile-name">무슨트럭</h2>
                    <div class="profile-info">
                        <div class="info"><span class="">영업시간:</span> 09~17</div>
                        <div class="info"><span class="">트럭번호:</span> 13가1234</div><br>
                        <div class="info"><span class="">★★★★☆</span> 9.4</div>
                        <div class="info"><span class="">댓글</span> 400</div>
                    </div>
                    <button style="float: right;">탑승하기</button>
                    <button style="float: right;">호출하기</button>
                </div>
            </div>item -->

			</div>
		</div>
	</div>
</div>
<!--    </div>
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
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b1d1757d7f3887c30f0142b09e5ff2be&libraries=services,clusterer,drawing"></script>
<script>

	
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
   var result = false; //검색결과가 있으면 true 없으면 false
   //JSON.stringify
   //JSON.parse
   var a = '${loc}'; //
   console.log(a);
   var obj = JSON.parse(a);
   obj = JSON.parse(a);
   
   //resources/js/food.json
   // 데이터를 가져오기 위해 jQuery를 사용합니다
   // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
   console.log(obj);
   
 /*   for(var i=0;i<obj.length;i++){
      console.log(obj.data[i].lng);
   } */
var test2=[];
for(var i=0;i<obj.length;i++){
   var a={};
   a.latlng = new daum.maps.LatLng(obj[i].lay_y,obj[i].lng_x);
   test2.push(a);	
   
}
/* console.log(JSON.parse(JSON.stringify(test2)));
console.log(test2);  */
//}
   //console.log(obj.positions[i].lng);
   //var positions = obj;
   //console.log(positions);
   
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
daum.maps.event.addListener(map, 'zoom_changed', function() {        
    
    // 지도의 현재 레벨을 얻어옵니다
    var level = map.getLevel();
	infowindow.close();
});
// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다

   
markers=[]; //마커를 넣을배열 생성
var imageSrc = '/project/resources/image/트럭사진.png';// 마커이미지의 주소입니다    


 for (var i = 0; i < test2.length; i ++) {
	 var imageSize = new daum.maps.Size(54, 59);
	 var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
	 	
       var marker;
       marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: test2[i].latlng,
        image : markerImage,// 마커를 표시할 위치
        clickable: true
    });
       
       var infowindow = new daum.maps.InfoWindow({
           content: '<div class="wrap">' + 
           '    <div class="info">' + 
           '        <div class="title">' + obj[i].brandname + 
           '        </div>' + 
           '        <div class="body">' + 
           '            <div class="img">' +
           '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
           '           </div>' + 
           '            <div class="desc">' + 
           '                <div class="ellipsis">트럭번호 : ' +obj[i].trucknum+'</div>' + 
           '                <div class="jibun ellipsis">운행시간 : '+ obj[i].hours + '</div>' +  
           '            </div>' + 
           '        </div>' + 
           '    </div>' +    
           '</div>', // 인포윈도우에 표시할 내용
           removable : true
       });

       daum.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));         
    	    
    	    // 지도의 현재 레벨을 얻어옵니다
       markers.push(marker); 
} 
 clusterer.addMarkers(markers);
   /*$.get('resources/js/food.json', function(data) {
    // 데이터에서 좌표 값을 가지고 마커를 표시합니다
    // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
    alert(data+"데이터요");
    var marker = $(data.positions).map(function(i, position) {
    return new daum.maps.Marker({
   // title : position.content,
    position : new daum.maps.LatLng(position.lat, position.lng)
       });
    });
       
     var infowindow = $(data.positions).map(function(i,position){
         return new daum.maps.InfoWindow({
            position : new daum.maps.LatLng(position.lat,position.lng),
            content : '<div>'+position.content+'</div>',
         });
     });
     
        
    //infowindow.open(map,markers[i]);
   
    // 클러스터러에 마커들을 추가합니다
      for(var i=0;i<data.positions.legnth;i++){
         infowindow.open(map, marker[i]);
       }   
    
    clusterer.addMarkers(marker);
   
/*        for(var i=0;i<data.positions.length;i++){
          daum.maps.event.addListener(marker[i], 'mouseover', makeOverListener(map, marker[i], infowindow[i]));
              daum.maps.event.addListener(marker[i], 'mouseout', makeOutListener(infowindow[i]));
          }
   });*/ 
       function makeClickListener(map, marker, infowindow) {
           return function() {
               infowindow.open(map, marker);
           };
       }
  
    // 키워드로 장소를 검색합니다
function change(){
    var select= $("#select option:selected").val();
    if(select == "map"){
       $("#keyword").val("");
       map.setLevel(14);
      $("#map").css("display",'block');
      $("#list").css("display",'none');
   }else if(select == "list"){
       $("#keyword").val("");
      $("#map").css("display", 'none');
      $("#list").css("display", 'block');
      $("#list-group").empty();
   }
}
    
    $("#submit").click(function() {
       searchPlaces();
    });
   
   // 키워드 검색을 요청하는 함수입니다
   function searchPlaces() {
      var keyword = document.getElementById('keyword').value;
      if (!keyword.replace(/^\s+|\s+$/g, '')) {
         alert('키워드를 입력해주세요!');
         return false;
      }
      // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
      
      ps.keywordSearch(keyword, placesSearchCB); //나온데이터를 placesSerachCB 호출?
      
   }

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
   // 검색 결과 목록과 마커를 표출하는 함수입니다
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
   
       var select= $("#select option:selected").val(); 
       if(select =="list") {//선택한값이 list라면
          var position = getposition();
         console.log(position);
         var posit = JSON.stringify(position);
         var sub = posit.split(',');
         var lng = sub[0].substr(6);
         var xtemp = sub[1].substr(5);
         var lat = xtemp.substr(0,xtemp.length-1);
         console.log(lng);
         console.log(lat);
         
         var list2 = [];
         for(var i=0;i<obj.length;i++){
             var a = getDistanceFromLatLonInKm(lat,lng,obj[i].lay_y,obj[i].lng_x); 
             a = a.toPrecision(3); //소숫점자리 제한
             a = a*1000; // 정수로만듬
             //alert(a);
             if(a<=3000){ //3km내 반경안에있으면 리스트추가
                //alert("추가");
                //JSON.stringfiy(obj[i]);
                //console.log(JSON.stringfiy(obj[i]));
                list2.push(obj[i]);//${"list[i].name"}
                
             }else{
                //alert("안추가");
             }
          }
         $("#list-group").empty();
         if(list2[0] == null){
      	 	$("#list-group").append("해당지역 중심부 부터 3km 내에 푸드트럭이 존재하지 않습니다");
      	 	//alert("fail");
         }else{ 
         	for(var i=0;i<list2.length;i++){
         		//alert("ok");
         		//var truckcode = ""+list2[i].truck_code;
         		var a='d';
         		var c=1;
         		var truck=list2[i].truck_code;
             	$("#list-group").append("<div class='list-group-item clearfix'><div class='profile-teaser-left'><div class='profile-img'><a href='/project/truck/?truck_code="+list2[i].truck_code+"'><img src='https://static.pexels.com/photos/21011/pexels-photo-large.jpg'/></a></div></div><div class='profile-teaser-main'><div class='infobox' style='cursor:pointer'><h2 class='profile-name'>"+list2[i].brandname+"</h2><div class='info'><span class=''>영업시간:</span>" + list2[i].hours+"</div><div class='info'><span class=''>트럭번호:</span>" + list2[i].trucknum+"</div></div><br><div class='info'><span class=''>★★★★☆</span> 9.4</div><div class='info'><span class=''>댓글 " + list2[i].total_review + "</span> </div> </div> <button style='float: right;'>탑승하기</button><button style='float: right;'>호출하기</button> </div></div>");

         	}
        	
         }
         
   }
 }

	  
   /* handler(a){
	 	return function(e){
			alert(a);
	 	}
  } */
	/* function move(){
	  alert($(this));
	  console.log($(this).html());
  }	 */

   function getposition(){
         var position = map.getCenter();
         return position;
   }
 
   var lat1 = 33.49953018214999;
   var lag1 = 126.53117057093789;//제주시청
   
   var lat2 = 33.498982285015565;
   var lng2 = 126.53052784147191;
   
   
   var xarry = new Array();
   var yarry = new Array();
   
   for(var i =0; i<3;i++){
      xarry[i] = 33.49953018214999+i;
      yarry[i] = 126.53117057093789+i;
   }
     //좌표와 좌표사이의 거리계산 
   function getDistanceFromLatLonInKm(lat1,lng1,lat2,lng2) {
       function deg2rad(deg) {
           return deg * (Math.PI/180)
       }

       var R = 6371; // Radius of the earth in km
       var dLat = deg2rad(lat2-lat1);  // deg2rad below
       var dLon = deg2rad(lng2-lng1);
       var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2);
       var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
       var d = R * c; // Distance in km
       return d;
   }
</script>
<style>
#map {
   height: 50%;
}
</style>