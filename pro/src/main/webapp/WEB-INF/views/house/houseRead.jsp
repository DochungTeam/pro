<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="ko">
<head>
<title>네이버 지도를 달아보자 : 네이버 지도 api 키 발급 받기와 지도 생성하기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
</head>
<body>

<!-- <div style="text-align:center; margin:0 0 100px 0; background:#555; line-height:80px;">
	<a style="color:#fff; font-weight:bold; font-family:tahoma; font-size:20pt;" href="http://ktsmemo.cafe24.com/s/naver_map/1" target="_blank">http://ktsmemo.cafe24.com/s/naver_map/1</a>
</div>
 -->

<!-- 예제 시작 -->

<!-- 
키는 발급받은 것으로 변경해 주세요.
localhost 도메인으로 테스트 하신다면 cpw9RMOfkmb0qIa7Vz23 키를 사용해 보세요.
localhost 에서 동작하도록 생성해둔 키 입니다.
-->
<script src="http://openapi.map.naver.com/openapi/v2/maps.js?clientId=qloX_gYvM6K9W0RyObTM"></script>


<!-- 아래 div 에 지도를 생성합니다 -->
<div id="nmap" style="width:400px; height:300px;"></div>
<script type="text/javascript">

$(document).ready(function(){
	
	
	/* 
	 var x= $(".xxx").val();
	 var y= $(".yyy").val();
	
	 var HOME_PATH=window.HOME_PATH || '.';
	 var locations=[];
		 
	/*  alert(new naver.maps.TM128Coord.fromCoordToLatLng(new naver.maps.Point(x,y)));
	 */
	 /* var map = new naver.maps.Map('map',{
      center : new naver.maps.Point(x,y),
      location: new naver.maps.Point(x,y),
      
      mapTypes: new naver.maps.MapTypeRegistry({
          'normal': naver.maps.NaverMapTypeOption.getNormalMap({
              projection: naver.maps.TM128Coord
          }),
          'terrain': naver.maps.NaverMapTypeOption.getTerrainMap({
              projection: naver.maps.TM128Coord
          }),
          'satellite': naver.maps.NaverMapTypeOption.getSatelliteMap({
              projection: naver.maps.TM128Coord
          }),
          'hybrid': naver.maps.NaverMapTypeOption.getHybridMap({
              projection: naver.maps.TM128Coord
          })
      }),
      
      mapTypeControl: true,
      zoom : 10,
      enableWheelZoom : true, 
      enableDragPan : true, 
      enableDblClickZoom : false, 
      mapMode : 0, 
      activateTrafficMap : false, 
      activateBicycleMap : false, 
      minMaxLevel : [ 1, 14 ],  
	  });
	 
	 var bounds = map.getBounds(),
	 	southWest = bounds.getSW(),
	 	northEast = bounds.getNE(),
	 	lngSpan = northEast.lng() - southWest.lng(),
	 	latSpan = northEast.lat() - southWest.lat();
	 
	 var markers=[],
	 	infoWindows=[];

	 var contentString = 
					[
	                      '<div class="iw_inner">',
	                      '<p>',$(".modalbutton").parents("tr").find("td").eq(0).find("input").val(),'</p>',
	                     '<p><b>', $(".modalbutton").parents("tr").find("td").eq(1).find("input").val(),'</p></b>',
	                      '<p><b>',$(".modalbutton").parents("tr").find("td").eq(2).find("input").val(),'</p></b>',
	                      '<p><b>',$(".modalbutton").parents("tr").find("td").eq(3).find("input").val(),'</p></b>',
	                      '<p><b>',$(".modalbutton").parents("tr").find("td").eq(4).find("input").val(),'</p></b>',
	                      '<p><b>',$(".modalbutton").parents("tr").find("td").eq(5).find("input").val(),'</p></b>',
	                      ' <img src="/img/aaa.jpg" width="55" height="55" alt="양념치킨" class="thumb" /><br>', 
	                      '   </p>',
	                      '</div>'
	                  ].join('');
	 
	for(var key in locations){
	var marker = new naver.maps.Marker({
		 map: map, 
		 position: new naver.maps.Point(map.getCenter()),
		 title : key,
		 icon: {
			 size: new naver.maps.Size(24,37),
			 anchor: new naver.maps.Point(12,37),
		 },
		 zindex:100
	 });

		
	}
	
	var infowindow = new naver.maps.InfoWindow({
	    content: contentString,
	    
	    maxWidth: 240,
	    backgroundColor: "#eee",
	    borderColor: "#2db400",
	    anchorSkew: true,
	    anchorColor: "#eee",

	    pixelOffset: new naver.maps.Point(20, -20)
	});

	naver.maps.Event.addListener(marker, "click", function(e) {
	    if (infowindow.getMap()) {
	        infowindow.close();
	    } else {
	        infowindow.open(map, marker);
	    }
	});
	
	naver.maps.Event.addListener(map, 'click', function(e) {
	    marker.setPosition(e.coord);
	}); */
});	  */
/* 	var tmp; // 임시용 변수

	// 일반, 위성 버튼
	tmp = new nhn.api.map.MapTypeBtn();
	tmp.setPosition({left:10, top:10}); // 위치 설정
	map.addControl(tmp); // 지도에 추가
 */
/* 	// 줌 슬라이더 컨트롤
	tmp = new nhn.api.map.ZoomControl();
	tmp.setPosition({left:10, bottom:10}); // 위치 설정
	map.addControl(tmp); // 지도에 추가
 */
/* 	// 지도 생성
	var nmap = new nhn.api.map.Map('nmap', { // nmap 은 지도가 생성될 요소의 id값 입니다 (원하시는 데로 네이밍!)
		point : new nhn.api.map.LatLng(37.5788434, 126.9770207), // 위도, 경도 설정 (이 값을 가운데로 하여 지도 생성)
		zoom : 11 // 줌 설정
	});
 	var tmp; // 임시용 변수


	// 마커로 사용할 이미지 정의
	var marker_icon = new nhn.api.map.Icon('http://superkts.com/img/marker_arrive.png', new nhn.api.map.Size(32, 46), new nhn.api.map.Size(16, 46));

	// 마커 정의
	var marker = new nhn.api.map.Marker(marker_icon, {point:new nhn.api.map.LatLng(37.5788434, 126.9770207)});

	// 지도에 마커 추가하기
	nmap.addOverlay(marker);
 */
</script>
<script type="text/javascript">
/* $(document).ready(function(){
	
	 
	 var HOME_PATH = window.HOME_PATH || '.';
	 var MARKER_SPRITE_X_OFFSET = 29,
	     MARKER_SPRITE_Y_OFFSET = 50,
	     MARKER_SPRITE_POSITION = {
	         "A0": [0, 0],
	         "B0": [MARKER_SPRITE_X_OFFSET, 0],
	         "C0": [MARKER_SPRITE_X_OFFSET*2, 0],
	         "D0": [MARKER_SPRITE_X_OFFSET*3, 0],
	         "E0": [MARKER_SPRITE_X_OFFSET*4, 0],
	         "F0": [MARKER_SPRITE_X_OFFSET*5, 0],
	         "G0": [MARKER_SPRITE_X_OFFSET*6, 0],
	         "H0": [MARKER_SPRITE_X_OFFSET*7, 0],
	         "I0": [MARKER_SPRITE_X_OFFSET*8, 0],

	         "A1": [0, MARKER_SPRITE_Y_OFFSET],
	         "B1": [MARKER_SPRITE_X_OFFSET, MARKER_SPRITE_Y_OFFSET],
	         "C1": [MARKER_SPRITE_X_OFFSET*2, MARKER_SPRITE_Y_OFFSET],
	         "D1": [MARKER_SPRITE_X_OFFSET*3, MARKER_SPRITE_Y_OFFSET],
	         "E1": [MARKER_SPRITE_X_OFFSET*4, MARKER_SPRITE_Y_OFFSET],
	         "F1": [MARKER_SPRITE_X_OFFSET*5, MARKER_SPRITE_Y_OFFSET],
	         "G1": [MARKER_SPRITE_X_OFFSET*6, MARKER_SPRITE_Y_OFFSET],
	         "H1": [MARKER_SPRITE_X_OFFSET*7, MARKER_SPRITE_Y_OFFSET],
	         "I1": [MARKER_SPRITE_X_OFFSET*8, MARKER_SPRITE_Y_OFFSET],

	         "A2": [0, MARKER_SPRITE_Y_OFFSET*2],
	         "B2": [MARKER_SPRITE_X_OFFSET, MARKER_SPRITE_Y_OFFSET*2],
	         "C2": [MARKER_SPRITE_X_OFFSET*2, MARKER_SPRITE_Y_OFFSET*2],
	         "D2": [MARKER_SPRITE_X_OFFSET*3, MARKER_SPRITE_Y_OFFSET*2],
	         "E2": [MARKER_SPRITE_X_OFFSET*4, MARKER_SPRITE_Y_OFFSET*2],
	         "F2": [MARKER_SPRITE_X_OFFSET*5, MARKER_SPRITE_Y_OFFSET*2],
	         "G2": [MARKER_SPRITE_X_OFFSET*6, MARKER_SPRITE_Y_OFFSET*2],
	         "H2": [MARKER_SPRITE_X_OFFSET*7, MARKER_SPRITE_Y_OFFSET*2],
	         "I2": [MARKER_SPRITE_X_OFFSET*8, MARKER_SPRITE_Y_OFFSET*2]
	     };
	   
	 var x= $(".xxx").val();
	 var y= $(".yyy").val();
	 
	/*  alert(new naver.maps.TM128Coord.fromCoordToLatLng(new naver.maps.Point(x,y)));
	 */
	 var map = new naver.maps.Map('map',{
      center : new naver.maps.Point(x,y),
      location: new naver.maps.Point(x,y),
      
      mapTypes: new naver.maps.MapTypeRegistry({
          'normal': naver.maps.NaverMapTypeOption.getNormalMap({
              projection: naver.maps.TM128Coord
          }),
          'terrain': naver.maps.NaverMapTypeOption.getTerrainMap({
              projection: naver.maps.TM128Coord
          }),
          'satellite': naver.maps.NaverMapTypeOption.getSatelliteMap({
              projection: naver.maps.TM128Coord
          }),
          'hybrid': naver.maps.NaverMapTypeOption.getHybridMap({
              projection: naver.maps.TM128Coord
          })
      }),
      
      mapTypeControl: true,
      zoom : 10,
      enableWheelZoom : true, 
      enableDragPan : true, 
      enableDblClickZoom : false, 
      mapMode : 0, 
      activateTrafficMap : false, 
      activateBicycleMap : false, 
      minMaxLevel : [ 1, 14 ],  
	  });
	
	  var bounds = map.getBounds(),
	    southWest = bounds.getSW(),
	    northEast = bounds.getNE(),
	    lngSpan = northEast.lng() - southWest.lng(),
	    latSpan = northEast.lat() - southWest.lat();

	var markers = [];
	 
	  for(var key in MARKER_STRITE_POSITION){
		 
	var position = new naver.maps.LatLng(
		        southWest.lat() + latSpan * Math.random(),
		        southWest.lng() + lngSpan * Math.random());
	 
	var marker = new naver.maps.Marker({
		 map: map, 
		 position: new naver.maps.Point(map.getCenter()),
		 title :key,
		  icon: {
	            url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
	            size: new naver.maps.Size(24, 37),
	            anchor: new naver.maps.Point(12, 37),
	            origin: new naver.maps.Point(MARKER_SPRITE_POSITION[key][0], MARKER_SPRITE_POSITION[key][1])
	        }, 
	        zIndex: 100
	 });
	  var infoWindow = new naver.maps.InfoWindow({
		 content: '<div style="width:150px;text-align:center;padding:10px;">The Letter is <b>"'+ key.substr(0, 1) +'"</b>.</div>'
	 });
	 
	  markers.push(marker);
	}; 

	 naver.maps.Event.addListener(map, 'idle', function() {
	    updateMarkers(map, markers);
	});

	function updateMarkers(map, markers) {

	    var mapBounds = map.getBounds();
	    var marker, position;

	    for (var i = 0; i < markers.length; i++) {

	        marker = markers[i]
	        position = marker.getPosition();

	        if (mapBounds.hasLatLng(position)) {
	            showMarker(map, marker);
	        } else {
	            hideMarker(map, marker);
	        }
	    }
	}

	function showMarker(map, marker) {

	    if (marker.setMap()) return;
	    marker.setMap(map);
	}

	function hideMarker(map, marker) {

	    if (!marker.setMap()) return;
	    marker.setMap(null);
	} 
});	 */
	var nmap = new nhn.api.map.Map('nmap', {
		point : new nhn.api.map.LatLng(37.4236619, 127.0218764),
		zoom : 12,                                                                       
	    enableWheelZoom : true,                                                  
	    enableDragPan : true,                                                      
	    enableDblClickZoom : false,                                            
	    mapMode : 0,                                                               
	    activateTrafficMap : false,                                              
	    activateBicycleMap : false,                                            
	    minMaxLevel : [ 5, 13 ],                                                  
	      size : new nhn.api.map.Size(600, 500)  
	});


	var tmp;

	// 일반, 위성 버튼
	tmp = new nhn.api.map.MapTypeBtn();
	tmp.setPosition({top:10, right:10}); // 위치 설정
	nmap.addControl(tmp); // 지도에 추가

	// 줌 슬라이더 컨트롤
	tmp = new nhn.api.map.ZoomControl();
	tmp.setPosition({top:60, right:10}); // 위치 설정
	nmap.addControl(tmp); // 지도에 추가


	// 마커 넣기
	var animal1 = new nhn.api.map.Icon('http://superkts.com/img/css/bird34.gif', new nhn.api.map.Size(26, 30), new nhn.api.map.Size(13, 30));
	nmap.addOverlay(new nhn.api.map.Marker(animal1, { point:new nhn.api.map.LatLng(37.422613, 127.0203686) }));

	var animal2 = new nhn.api.map.Icon('http://superkts.com/img/css/dog054.gif', new nhn.api.map.Size(32, 32), new nhn.api.map.Size(0, 32));
	nmap.addOverlay(new nhn.api.map.Marker(animal2, { point:new nhn.api.map.LatLng(37.4238427, 127.0230992) }));

	var animal3 = new nhn.api.map.Icon('http://superkts.com/img/css/bird17.gif', new nhn.api.map.Size(112, 100), new nhn.api.map.Size(56, 100));
	nmap.addOverlay(new nhn.api.map.Marker(animal3, { point:new nhn.api.map.LatLng(37.4249346, 127.0194214) }));

	var animal4 = new nhn.api.map.Icon('http://superkts.com/img/css/rabbit018.gif', new nhn.api.map.Size(74, 40), new nhn.api.map.Size(37, 40));
	nmap.addOverlay(new nhn.api.map.Marker(animal4, { point:new nhn.api.map.LatLng(37.4223152, 127.0247499) }));

	var animal5 = new nhn.api.map.Icon('http://superkts.com/img/css/fish0046.gif', new nhn.api.map.Size(24, 11), new nhn.api.map.Size(12, 0));
	nmap.addOverlay(new nhn.api.map.Marker(animal5, { point:new nhn.api.map.LatLng(37.4218458, 127.0223434) }));

</script>

<!-- 예제 종료 -->


</body>
</html>