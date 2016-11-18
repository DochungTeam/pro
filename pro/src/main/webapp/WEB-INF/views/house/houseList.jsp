<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<%@include file="../include/header.jsp"%>
<%@include file="../include/script.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" xmlns:v="urn:schemas-microsoft-com:vml">
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>샘플코드</title>
        
</head>
<style>
#simplemodal-overlay {background-color:#000;}
#modal_content{display:none;margin:50 auto;width:200px;height:100px;background:blue;color:#fff}
#map{
	height: 500px;
	width: auto;

}
.iw_inner{
	height: auto;
	width: 400px;
} 
</style>

<link href="/resources/jqueryui/jquery-ui.min.css" rel="stylesheet">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=qloX_gYvM6K9W0RyObTM&submodules=geocoder"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="/resources/jqueryui/jquery.js"></script>
<script type="text/javascript" src="/resources/jqueryui/jquery-ui.min.js"></script>
<!--  <script type='text/javascript' src='js/jquery.simplemodal.js'></script> 
 -->
<script type="text/javascript">
$(document).ready(function(){
/* 
	$('#myModal').on('show.bs.modal', function (event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
		  var button = $(event.relatedTarget) // 모달 윈도우를 오픈하는 버튼
		  var titleTxt = button.data('title') // 버튼에서 data-title 값을 titleTxt 변수에 저장
		  var modal = $(this)
		  modal.find('.modal-title').text('Title : ' + titleTxt) 
		   */

	$(".modalbutton").on("click",function(e){
		e.preventDefault();
		alert($(this).parents("tr").find("td").eq(0).find("input").val());
		var name =$(this).parents("tr").find("td").eq(0).find("input").val();
		var content =$(this).parents("tr").find("td").eq(1).find("input").val();
		var tel = $(this).parents("tr").find("td").eq(2).find("input").val();
		var link=$(this).parents("tr").find("td").eq(3).find("input").val();
		var kind=$(this).parents("tr").find("td").eq(4).find("input").val();
		var addr=$(this).parents("tr").find("td").eq(5).find("input").val();
		$("#modalhnm").text(name);
		$("#modalcontent").text(content);
		$("#modaltel").text(tel);
		$("#modallink").text('<a href=link>'+link+'</a>');
		$("#modalkind").text(kind);
		$("#modaladdr").text(addr);
		
		dialog.dialog("open");
		
	});
	
	var dialog=$(".dialogLayout").dialog({
		autoOpen:false,
		open:function(a){
             
		/* 	 var name=$(".modalbutton").parents("tr").find("td").eq(0).find("input").val(); 
			alert(name);
			$("#modalhnm").text($(".modalbutton").parents("tr").find("td").eq(0).find("input").val()); 
			$("#modalcontent").text($(".hcontent").val());
			$("#modaltel").text($(".hphone").val());
			$("#modallink").text('<a href=' +$(".hlink").val()+'></a>');
			$("#modalkind").text($(".hkind").val());
			$("#modaladdr").text($(".haddr").val()); 
				 */
		},
		width:500,
	});	

$(".modalbutton").button();	



});
</script>

<script type="text/javascript">

 $(document).ready(function(){
	
	 var x= $(".xxx").val();
	 var y= $(".yyy").val();
	   
	/*  alert(new naver.maps.TM128Coord.fromCoordToLatLng(new naver.maps.Point(x,y)));
	 */
	  var map = new naver.maps.Map('map',{
      center : new naver.maps.Point(x,y),
      mapTypeControl: true,
      mapTypeControlOptions:{
    	  style: naver.maps.MapTypeControlStyle.DROPDOWN
      },
      
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
	
	
	 /* alert($("#modalhnm").text($("modalbutton").parents("tr").find("td").eq(0).find("input").val())); */
	 alert($(".modalbutton").parents("tr").find("td").eq(0).find("input").val());
	// alert($(".modalbutton").on.$(this).parents("tr").find("td").eq(0).find("input").val());
	 
	
	
	 var locations=[];
//	 alert($("#table_loc").find("td").length);
		/* alert($("#table_loc").find("td input[class='xxx']").eq(0).val()); */
	
 	var markers=[];
	var infoWindows=[];
	
	$("#table_loc").find("td input[class='xxx']").each(function(i){
		locations.push(new naver.maps.Point($("#table_loc").find("td input[class='xxx']").eq(i).val(),$("#table_loc").find("td input[class='yyy']").eq(i).val()));
		
	});
		
	
	
	$(locations).each(function(i) {
	var marker = new naver.maps.Marker({
		map : map,
		position : locations[i],
		zindex : 100,
		
	});
	
	
	var contentString = 
		[
       '<div iw_inner>',
      
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
	
	var infowindow = new naver.maps.InfoWindow({
		content : contentString,

		maxWidth : 240,
	backgroundColor : "#eee",
		borderColor : "#2db400",
		anchorSkew : true,
	anchorColor : "#eee",

			pixelOffset : new naver.maps.Point(20, -20)
	});
/* 	infoWindows.push(infoWindow); 
	 markers.push(marker); */
	
		naver.maps.Event.addListener(marker, "click", function(e) {
		/* 	alert(this.getOptions(aa)); */
			if (infowindow.getMap()) {
					infowindow.close();
			} else {
					infowindow.open(map, marker);
					}
				});
		 infowindow.open(map, marker); 
		
	});
	
	var trafficLayer = new naver.maps.TrafficLayer({
	    interval: 2000 // 2초마다 새로고침
	});
	
	var btn=$("#traffic");
	
	naver.maps.Event.addListener(map, 'trafficLayer_changed', function(trafficLayer) {
	    if (trafficLayer) {
	        btn.addClass('control-on');
	        $("#autorefresh").parent().show();
	        $("#autorefresh")[0].checked = true;
	    } else {
	        btn.removeClass('control-on');
	        $("#autorefresh").parent().hide();
	    }
	});
	
	trafficLayer.setMap(map);
	
	btn.on("click", function(e) {
	    e.preventDefault();

	    if (trafficLayer.getMap()) {
	        trafficLayer.setMap(null);
	    } else {
	        trafficLayer.setMap(map);
	    }
	});
	
	$("#autorefresh").on("click", function(e) {
	    var btn = $(this),
	        checked = btn.is(":checked");

	    if (checked) {
	        trafficLayer.startAutoRefresh();
	    } else {
	        trafficLayer.endAutoRefresh();
	    }
	});
 });	
</script>
<body>
    
 	<form >
		<input type="text" name="keyword">
		<input type="submit" value="맛집 검색">
		
	</form>
       
    <table id="table_loc">
		<tr>
			<td colspan="9" width="100%" bgcolor="pink"></td>
			
		</tr>	
		<c:forEach items="${list}" var="houseDto">
		<tr>
			<td><input type="hidden" class="hnm" value="${houseDto.hnm}"><p><a href="#" class="modalbutton">${houseDto.hnm}</a></p></td>
			<td><input type="hidden" class="hcontent" value='${houseDto.hcontent }'/></td>
			<td><input type="hidden" class="hphone" value="${houseDto.hphone }">${houseDto.hphone }</td>
			<td><input type="hidden" class="hlink" value='${houseDto.hlink}'/><a href="${houseDto.hlink}"></a></td>
			<td><input type="hidden" class="hkind" value='${houseDto.hkind }'/>${houseDto.hkind }</td>
			<td><input type="hidden" class="haddr" value='${houseDto.haddr }'/>${houseDto.haddr }</td>
			<td><fmt:formatDate value="${houseDto.htime}"/>${houseDto.htime}</td>		
			<td><input type="hidden" class="xxx" value='${houseDto.hmapx }'></td>
			<td><input type="hidden" class="yyy" value='${houseDto.hmapy }'></td> 
		</tr>
   				
		</c:forEach >	
		
		<%-- <c:forEach items="${list1}" var="houseDto">
			<tr>
					<td>${houseDto.thumbnail }</td>
			</tr>
		</c:forEach> --%>
		</table>
	 
		<table>
		<c:forEach items="${list1}" var="houseDto">
			<tr>
				<%-- <td><a href='${houseDto.thumbnail }'>${houseDto.thumbnail }</a></td>
		 --%>
			</tr>
		</c:forEach>
		</table>
         		
				<div id="map"  style="border:1px solid #000;"></div>
				<div id="traffic">교통상황</div>
         	
		<div class="dialogLayout" title="상세 정보">
				이름 :<p  id = "modalhnm" value="${houseDto.hnm}"></p>
				상세 : <p id ="modalcontent"></p>
				Tel: <p id="modaltel"></p>	
				링크 : <p id="modallink"></p>
				음식 종류 : <p id="modalkind"></p>
				주소 : <p id="modaladdr"></p>
				<%-- 시감 : <p>${houseDto.htime }</p> --%>
				<p><a href="${houseDto.hlink }">${houseDto.hlink }</a></p>
			</div>	
</body>
</html>
<%@include file="../include/footer.jsp"%>