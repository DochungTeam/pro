<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/script.jsp"%>

<!DOCTYPE HTML>
<html lang="ko" xmlns:v="urn:schemas-microsoft-com:vml">
<head>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=qloX_gYvM6K9W0RyObTM&submodules=geocoder"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<!-- <script type='text/javascript' src='/resources/js/jquery.simplemodal.js'></script> -->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/jqueryui/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>샘플코드</title>
        
</head>

<style>
#simplemodal-overlay {background-color:#000;}
#modal_content{display:none;margin:50 auto;width:200px;height:100px;background:blue;color:#fff}
#map{
	height: 800px;
	width: auto;
	position:static;
	left:150px;
.iw_inner{
	height: auto;
	width: 400px;
}
}
</style>
<script type="text/javascript">
	
</script>

<script>

 	$(document).ready(function(){
 		var dialog;
 
 		dialog = $("#search_form").dialog({
 		
 			autoOpen : false,
 			height : 300,
 			width : 430,
 			modal : true,
 			position : { my: "right top", at: "right-1150px top+200px" }
 		 
 		});
	
			
	
 		$("#search").on("click", function(){
 			var key   = $("#dong").val()+$("#keyword").val();
 			

 			if($("#keyword").val() == ""){
 				alert("입력해 주세요");
 				$("#keyword").focus(); 
 			}else{
				searchList(key); 	
 			}
 			var x= $(".hhmapx").data("hmapx");
 			var y= $(".hhmapy").data("hmapy");
 			
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
 				
 				var locations=[];
 				var hnms=[];
 				var hcontents=[];
 				var hphones=[];
 				var hlinks=[];
 				var hkinds=[];
 				var haddrs=[];
 				$($(".hhnm")).each(function(i){
 					hnms.push($(".hhnm").eq(i).data("hnm"));
 					hcontents.push($(".hhcontent").eq(i).data("hcontent"));
 					hphones.push($(".hhphone").eq(i).data("hphone"));
 					hlinks.push($(".hhlink").eq(i).data("hlink"));
 					hkinds.push($(".hhkind").eq(i).data("hkind"));
 					haddrs.push($(".hhaddr").eq(i).data("haddr"));
 					locations.push(new naver.maps.Point($(".hhmapx").eq(i).data("hmapx"),$(".hhmapy").eq(i).data("hmapy")));
 				
 				});
 				
 				var markers=[];
 				var infoWindows=[];
 				
 				$(locations).each(function(i) {
 					var marker = new naver.maps.Marker({
 						map : map,
 						position : locations[i],
 						zindex : 100,
 						
 					});
 					markers.push(marker);
 					var infowindow = new naver.maps.InfoWindow({
 						content : '<div iw_inner>' +
 					       '<h4>'+hnms[i]+'</h4></br>'+
 					      '<p><b>'+hcontents[i]+'</p></b>'+
 					       '<p><b>'+hphones[i]+'</p></b>'+
 					       "<p><b><a target='_blank' href ='"+hlinks[i]+"'>"+((hlinks[i]=="")? "":"홈페이지로 이동")+"</a></p></b>"+
							'<p><b>'+hkinds[i]+'</p></b>'+
 					       '<p><b>'+haddrs[i]+'</p></b>'+
 					       '</p></div>',
 					       maxWidth : 240,
 							backgroundColor : "#eee",
 							borderColor : "#B7F0B1",
 							anchorSkew : true,
 							anchorColor : "#3F0099",
 							borderWidth: 5,
 							anchorSize: new naver.maps.Size(30, 30),
 							pixelOffset : new naver.maps.Point(20, -20)
 					});
 					infoWindows.push(infowindow);
 				});
 				
 				
 			/* 	naver.maps.Event.addListener(map, 'idle', function(){
 					alert("idle");
 					updateMarkers(map, markers);
 				}); */ 
 				function updateMarkers(map, markers){
 					var marker, position;
 					for(var i=0;i<markers.length;i++){
 						marker = markers[i];
 						position = marker.getPosition();
 						
 						showMarker(map, marker);
 						naver.maps.Event.addListener(markers[i],'click',getClickHander(i));
 					}
 				}
 				/* for(var i=0; i<markers.length;i++){
 					naver.maps.Event.addListener(markers[i],'click',getClickHander(i));
 				} */
 				/* for(var i=0;i<markers.length;i++){
 					var marker, position;
 					marker = markers[i];
 					position = marker.getPosition();
 					
 					showMarker(map, marker);
 				} */
 				
 				function showMarker(map, marker){
 					if(marker.setMap()){
 						return;
 					}
 					marker.setMap(map);
 				}
 				function getClickHander(seq){
 					return function(e) {
 					/* 	alert(this.getOptions(aa)); */
 					var marker = markers[seq];
 					var infowindow = infoWindows[seq];
 					if (infowindow.getMap()) {
 						infowindow.();
 						
 					} else {
 						infowindow.open(map, marker);
 					}
 				}
 				}
 				
 				
 				
 				
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
 				
 				updateMarkers(map, markers);
 		});
 		
		$('#Map area').click(function(event){
			dialog.dialog("close");
			dialog.dialog("open");
			
			$("#gu option").remove();
			$("#addrTable").html("");
			
			 var mArea = $(this).attr("title")
			   , area = $(this).attr("id")
			   , sido = null;
			   
			 $('#mapC').attr("src","/resources/img/"+mArea+".png"); 
			 
			  if(area == "A_42"){
				  sido = "강원도";
			 }else if(area == "A_47"){
					 sido = "경상북도";
			 }else if(area == "A_48"){
					 sido = "경상남도";
			 }else if(area == "A_46"){
					 sido = "전라남도";
			 }else if(area == "A_45"){
					 sido = "전라북도";
			 }else if(area == "A_44"){
					 sido = "충청남도";
			 }else if(area == "A_43"){
					 sido = "충청북도";
			 }else if(area == "A_41"){
					 sido = "경기도";
			 }else if(area == "A_28"){
					 sido = "인천";
			 }else if(area == "A_11"){
				 	sido = "서울";
			 }else if(area == "A_30"){
				 	sido = "대전";
			 }else if(area == "A_27"){
				 	sido = "대구";
			 }else if(area == "A_31"){
				 	sido = "울산";
			 }else if(area == "A_26"){
				 	sido = "부산";
			 }else if(area == "A_29"){
				 	sido = "광주";
			 }else if(area == "A_50"){
				 	sido = "제주도";
			 }
 
			 
			$("#si").val(sido);
			
			$.ajax({
				url : "/house/gunguSearch",
				type : "post",
				data : {"sido" : sido},
				contentType:"application/x-www-form-urlencoded; charset=UTF-8",
				success : function(
						responseData){
					
					var gugun = JSON.parse(responseData);
					
						$("#gu").append(
							"<option value=''>선택해주세요</option>"	
						);
					
					for(var i = 0; i<gugun.length; i++){
						$("#gu").append(
							"<option value='"+gugun[i].sigungu+"'>"+gugun[i].sigungu+"</option>"	
						);
					}
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"
							+request.responseText+"\n"+"error:"+error);
				}
			})
		});
			
			$("#gu").click(function(){
				$("#dong option").remove();
				
				var sigungu = $(this).val();
				
				if($(this).val()!="선택해주세요"){
				$.ajax({
					url : "/house/dongSearch",
					type : "post",
					data : {"sigungu" : sigungu},
					contentType:"application/x-www-form-urlencoded; charset=UTF-8",
					success : function(responseData){
						var dong = JSON.parse(responseData);
						
						$("#dong").append(
								"<option value=''>선택해주세요</option>"	
							);
						
						for(var i=0; i<dong.length; i++){
							$("#dong").append(
								"<option value='"+dong[i].dong+"'>"+dong[i].dong+"</option>"	
							);
						}
					}
				})
				};
			});
			
			
			$("#dong").click(function(){
				var key = $("#gu").val()+$(this).val()+"음식점";
			});
			
			
			function searchList(key){
				$.ajax({
	 				url : "/house/houseList",
	 				type : "post",
	 				data : { "keyword" : key},
	 				async: false,
	 				contentType:"application/x-www-form-urlencoded; charset=UTF-8",
	 				success : function(responseData){
	 					$("#addrTable").html("");
	 					var	haddr = JSON.parse(responseData),
	 						type = null;
	 					for(var i = 0 ; i<haddr.length;i++){
		 						$("#addrTable").append(
		 								"<tr><td><hr></td></tr>"
		 							+	"<tr><td><input type='hidden' class='hhnm' name='hnm' data-hnm='"+haddr[i].hnm+"'> 이름 : " + haddr[i].hnm + "</td></tr>"
		 							+	"<tr><td><input type='hidden' class='hhcontent' name='hcontent' data-hcontent='"+haddr[i].hcontent+"'>내용 : " + haddr[i].hcontent + "</td></tr>"
		 							+	"<tr><td><input type='hidden' class='hhphone' name='hphone' data-hphone='"+haddr[i].hphone+"'>번호 : " + haddr[i].hphone + "</td></tr>"
		 							+	"<tr><td><input type='hidden' class='hhlink' name='hlink' data-hlink='"+haddr[i].hlink+"'>링크 : <a target='_blank' href='"+haddr[i].hlink+"'>"
		 							+	((haddr[i].hlink=="")? "":"이동") +"</a></td></tr>"
		 							+	"<tr><td><input type='hidden' class='hhkind' name='hkind' data-hkind='"+haddr[i].hkind+"'>카테고리 : " + haddr[i].hkind + "</td></tr>"
		 							+	"<tr><td><input type='hidden' class='hhaddr' name='haddr' data-haddr='"+haddr[i].haddr+"'>주소 : " + haddr[i].haddr + "</td></tr>"
		 							+	"<tr><td><input type='hidden' class='hhmapx' name='hmapx' data-hmapx='"+haddr[i].hmapx+"'></td></tr>"
		 							+	"<tr><td><input type='hidden' class='hhmapy' name='hmapy' data-hmapy='"+haddr[i].hmapy+"'></td></tr>"
		 						/* 	+	"<tr><td><input type='hidden' id='xyxy' name='hmapx' data-hmapx='"+haddr[i].hmapx+"' data-hmapy='"+haddr[i].hmapy+"'></td></tr>" */
		 						
		 						);
	 					}
	 				}
	 			});
			}
	});
</script>
<!-- <script type="text/javascript">

$(document).ready(function(){
 	$("#open").click(function(){
  	$("#modal_content").modal(); 
 	});
 	$("#m_close").click(function(){
 	 $.modal.close();
 });
})

</script> -->

<body class="page">
<%@include file="../include/header.jsp"%>
	<div id="main">
				<div id="start">
	<div style="position: relative; float: left; ">
	
	<h5>맛집 검색~~</h5>
    <div>
		<img src="/resources/img/map.png" usemap="#Map" name="map"
			style="position:relative;  padding:0px; border:0px; z-index: 2">
		<img src="/resources/img/C_map.png" usemap="#Map" id="mapC"
			style="position:relative; left:-306px;  padding:0px; border:0px; z-index: 1">
	
	</div>
		<map name="Map" id="Map">
		
		<!-- A_42 : 강원도 
			 A_47 : 경상북도 
			 A_48 : 경상남도  
			 A_46 : 전라남도
			 A_45 : 전라북도
			 A_44 : 충청남도
			 A_43 : 충청북도
			 A_41 : 경기
			 A_28 : 인천
			 A_11 : 서울
			 A_30 : 대전
			 A_27 : 대구
			 A_31 : 울산   
			 A_26 : 부산
			 A_29 : 광주
			 A_50 : 제주도-->
		
		  <area id="A_50" shape="poly" title="C_jeju" onmouseover="if(document.images)map.src='/resources/img/jeju.png'" onmouseout="if(document.images)map.src='/resources/img/map.png'"coords="44,425,43,425,41,425,40,425,39,427,38,429,38,432,38,435,40,436,43,440,46,442,47,443,49,444,51,443,53,442,55,442,57,440,60,440,67,440,69,440,72,440,75,440,79,437,83,436,87,432,91,429,93,425,94,422,94,418,93,415,91,414,88,413,86,413,83,412,79,413,73,413,71,414,68,414,65,416,61,417,59,417,57,417,54,417,53,418,51,419,49,422,48,424" href="#">
          <area id="A_29" shape="poly" title="C_gwangJu" onmouseover="if(document.images)map.src='/resources/img/gwangJu.png'" onmouseout="if(document.images)map.src='/resources/img/map.png'"coords="80,307,78,307,77,309,74,311,74,315,76,317,78,317,81,319,82,322,85,323,89,323,91,322,93,320,96,318,98,316,98,314,98,312,96,310,94,308,94,307,92,306,90,305,88,306,85,307,84,307">
          <area id="A_26" shape="poly" title="C_buSan" onmouseover="if(document.images)map.src='/resources/img/buSan.png'" onmouseout="if(document.images)map.src='/resources/img/map.png'"coords="254,293,252,295,251,295,248,297,246,299,243,301,242,304,240,305,236,307,234,308,233,310,231,313,230,316,229,318,225,319,221,317,219,317,216,317,210,318,207,320,206,322,205,323,205,325,205,327,206,329,208,331,211,331,212,330,212,328,214,325,215,323,219,322,221,322,224,322,227,323,227,325,231,325,233,323,235,322,235,322,238,322,240,322,243,320,246,318,248,316,250,315,252,314,255,313,259,313,259,310,259,306,259,304,260,301,260,299,257,295" href="#">
          <area id="A_31" shape="poly" title="C_ulSan" onmouseover="if(document.images)map.src='/resources/img/ulSan.png'" onmouseout="if(document.images)map.src='/resources/img/map.png'"coords="253,264,257,265,258,268,261,269,263,270,265,270,267,269,269,269,270,271,273,271,274,272,274,274,274,276,274,279,273,283,270,285,269,289,269,290,269,293,268,295,265,297,263,298,261,298,260,295,258,294,257,293,257,291,256,289,255,289,252,287,251,286,248,285,245,283,244,283,242,280,242,277,245,275,245,272,245,271,247,268,249,266,251,265" href="#">
          <area id="A_27" shape="poly" title="C_daeGu" onmouseover="if(document.images)map.src='/resources/img/daeGu.png'" onmouseout="if(document.images)map.src='/resources/img/map.png'" coords="213,239,217,240,219,240,220,241,221,243,223,244,224,246,225,249,224,250,223,252,220,254,219,255,217,258,217,260,215,263,214,265,212,265,210,264,208,263,208,265,206,268,205,269,202,270,200,271,197,270,196,268,196,266,198,264,200,262,200,259,199,257,198,254,198,251,198,249,200,248,202,247,206,245,207,244,208,242,209,239" href="#">
          <area id="A_30" shape="poly" title="C_daeJ" onmouseover="if(document.images)map.src='/resources/img/daeJ.png'" onmouseout="if(document.images)map.src='/resources/img/map.png'" coords="127,199,125,199,123,201,122,202,121,203,118,206,118,209,118,212,118,213,119,216,121,219,124,220,127,220,129,222,132,221,132,219,132,217,132,214,133,211,134,209,135,205,135,204,134,203,133,202,131,200,129,199" href="#">
          <area id="A_11" shape="poly" title="C_seoul" onmouseover="if(document.images)map.src='/resources/img/seoul.png'" onmouseout="if(document.images)map.src='/resources/img/map.png'" coords="85,103,87,104,89,104,90,103,92,101,91,99,93,97,96,97,97,97,98,94,98,92,99,91,102,91,104,93,106,94,106,97,107,99,108,101,109,102,110,104,111,108,109,109,108,111,106,114,104,116,102,115,101,113,99,113,97,113,95,114,93,114,91,113,90,111,88,110,87,108,85,105" href="#">
          <area id="A_28" shape="poly" title="C_incheon" onmouseover="if(document.images)map.src='/resources/img/incheon.png'" onmouseout="if(document.images)map.src='/resources/img/map.png'" coords="68,85,66,84,63,82,60,81,56,80,55,81,53,82,51,84,51,84,46,84,45,85,45,88,45,90,45,90,42,91,42,92,42,94,42,97,45,98,46,99,49,100,51,101,51,103,52,105,53,108,53,111,55,113,57,116,59,117,61,115,62,115,63,114,66,115,68,115,68,113,71,113,73,114,74,116,76,117,78,118,79,118,82,117,82,115,83,112,86,111,85,109,84,106,82,104,79,102,79,101,76,99,73,100,72,101,71,103,69,103,68,101,68,99,67,97,64,95,64,93,64,91,67,89" href="#">
          <area id="A_41" shape="poly" title="C_kido" onmouseover="if(document.images)map.src='/resources/img/kido.png'" onmouseout="if(document.images)map.src='/resources/img/map.png'" coords="86,112,89,113,90,115,94,117,94,116,97,116,98,115,100,116,101,117,104,118,106,117,108,114,109,112,112,110,112,107,112,103,110,101,109,99,108,96,108,93,105,91,103,90,101,89,99,89,97,91,95,93,95,96,94,96,90,97,90,98,90,101,87,102,82,101,81,100,79,98,76,97,74,98,71,100,69,100,68,97,68,95,66,93,66,92,68,89,69,86,72,88,76,86,77,84,77,82,78,80,81,79,82,76,80,75,78,73,78,71,79,70,80,70,84,69,86,68,90,65,91,61,90,58,86,57,84,57,84,55,86,55,89,55,90,53,90,50,92,49,95,50,98,49,100,47,104,46,108,46,108,46,109,49,112,51,114,55,118,56,120,58,124,59,126,61,129,64,133,68,136,71,137,74,137,76,136,79,135,81,135,83,134,85,133,87,133,89,135,92,136,94,136,96,137,98,138,100,142,101,146,102,149,102,153,104,153,106,152,109,151,111,151,113,152,115,153,116,152,118,151,120,150,123,150,125,151,128,151,131,151,134,151,136,151,139,147,140,146,142,142,144,141,146,138,147,134,149,132,150,130,151,128,152,127,154,124,157,122,161,118,159,116,158,112,157,109,156,106,155,104,157,102,157,99,157,94,160,91,160,87,159,85,157,83,154,79,152,79,148,79,145,76,143,74,142,71,141,71,137,74,135,75,133,75,131,76,128,78,128,78,126,78,122,79,120,80,119,84,117,84,115,84,113" href="#">
          <area id="A_43" shape="poly" title="C_chungB" onmouseover="if(document.images)map.src='/resources/img/chungB.png'" onmouseout="if(document.images)map.src='/resources/img/map.png'" coords="126,175,124,175,122,175,120,177,120,179,120,181,120,183,121,186,123,187,125,189,126,192,126,194,126,196,129,197,132,199,134,199,135,201,137,203,137,205,137,207,136,209,135,211,135,213,134,215,134,217,137,218,139,219,141,222,143,225,143,228,143,230,143,232,145,234,147,234,149,236,151,238,153,238,156,238,159,238,163,237,165,235,166,230,166,232,167,227,168,225,170,222,172,220,171,218,169,217,167,216,166,215,162,214,159,213,158,211,159,209,160,205,162,203,162,201,163,198,162,195,162,193,159,190,158,188,158,186,160,184,162,181,171,173,182,165,185,164,188,165,192,167,196,169,198,169,200,166,200,163,200,159,201,157,202,154,204,153,205,152,208,150,209,147,205,146,202,144,197,142,191,141,189,138,187,135,184,133,180,133,178,134,174,137,172,137,170,136,169,134,168,132,166,133,165,135,164,136,164,139,162,141,157,142,154,142,152,140,150,141,148,143,146,144,144,146,141,147,137,149,135,150,133,152,130,153,128,155,125,158,123,160,124,162,128,166,129,168,130,169,130,169,130,172,130,174,129,175" href="#">
          <area id="A_44" shape="poly" title="C_chungNam" onmouseover="if(document.images)map.src='/resources/img/chungNam.png'" onmouseout="if(document.images)map.src='/resources/img/map.png'" coords="75,241,79,241,82,239,85,238,87,237,87,235,90,233,90,230,93,225,94,224,97,224,100,225,102,227,102,230,102,233,103,236,105,237,107,237,110,235,112,232,115,230,119,229,123,229,124,230,126,233,127,236,128,238,131,241,134,242,138,242,142,239,142,238,143,235,142,233,141,230,141,227,140,224,139,222,137,220,136,219,135,219,133,220,134,221,132,223,127,223,125,222,121,221,118,219,116,215,115,212,116,205,118,203,119,202,121,200,124,198,124,194,124,192,123,190,119,187,118,183,118,180,118,177,120,174,124,173,127,174,127,170,127,168,124,165,122,163,119,162,117,160,113,159,112,159,109,158,105,158,103,158,101,159,98,160,95,162,94,162,90,162,87,161,86,160,84,158,82,155,79,154,78,155,75,157,72,155,71,153,70,152,68,150,67,149,64,148,60,147,58,148,56,149,55,151,53,152,51,153,49,155,47,157,44,160,42,164,40,166,38,170,38,173,38,175,38,178,37,180,38,182,40,183,42,183,44,182,45,182,47,183,48,185,49,186,51,188,51,191,51,193,51,195,49,196,49,199,50,201,51,203,52,204,53,205,57,206,61,207,64,209,67,212,68,215,68,217,68,218,67,219,64,221,64,224,65,226,67,228,68,229,71,231,72,233,73,236,75,238" href="#">
          <area id="A_45" shape="poly" title="C_jb" onmouseover="if(document.images)map.src='/resources/img/jb.png'" onmouseout="if(document.images)map.src='/resources/img/map.png'" coords="66,243,69,246,72,249,74,252,74,255,74,256,74,259,72,262,71,265,68,267,67,268,64,269,63,270,61,272,63,275,63,277,62,279,60,282,57,284,59,287,59,289,61,289,64,291,64,294,66,296,67,298,72,298,74,296,77,294,79,291,81,288,83,286,85,285,89,285,91,287,94,290,96,291,98,291,101,292,103,293,103,296,103,298,105,300,108,300,113,299,115,298,118,298,123,300,126,300,127,297,130,295,133,295,138,298,142,298,142,293,145,291,145,289,143,286,141,281,140,275,141,272,143,269,145,264,146,258,147,256,151,255,153,254,157,251,160,249,161,246,161,243,160,240,157,240,154,241,152,240,150,238,149,237,145,237,145,239,142,241,140,243,135,244,127,241,125,237,124,234,123,231,120,230,118,231,115,232,112,234,111,237,109,238,107,239,104,238,101,237,101,234,101,231,101,229,101,228,99,226,95,226,94,227,93,229,91,234,87,238,84,240,82,241,77,243,72,242,70,242,66,241" href="#">
          <area id="A_46" shape="poly" title="C_jn" onmouseover="if(document.images)map.src='/resources/img/jn.png'" onmouseout="if(document.images)map.src='/resources/img/map.png'" coords="80,306,78,295,80,293,82,291,83,289,85,287,86,287,89,287,90,289,91,290,94,292,96,293,98,293,101,293,101,294,102,296,102,298,103,300,106,302,109,302,112,300,114,300,116,300,117,299,121,301,124,302,127,302,128,300,129,298,132,297,134,298,136,299,139,301,141,304,143,306,144,309,143,313,146,317,148,320,151,322,153,324,154,327,155,331,155,335,156,340,157,343,156,346,158,350,158,352,156,353,156,355,155,359,154,360,152,361,149,361,145,359,141,359,138,359,136,361,136,365,137,368,138,371,138,373,138,376,135,378,131,377,130,374,127,373,124,373,121,377,118,379,115,380,113,379,110,380,109,383,108,384,108,388,106,388,104,390,101,390,99,389,97,387,94,387,90,387,87,387,86,389,84,390,82,390,79,389,76,388,74,387,72,388,65,388,62,384,60,382,58,380,56,379,52,380,51,381,47,383,44,384,42,384,39,384,38,388,40,390,41,392,40,393,36,394,34,395,32,396,27,399,23,401,20,400,19,397,17,395,15,394,18,389,21,381,23,379,26,375,28,371,31,367,30,365,28,364,23,364,22,361,23,358,23,356,22,351,20,347,20,344,23,343,25,342,27,340,26,335,27,333,33,332,34,330,35,327,34,325,33,323,29,321,28,319,28,315,30,314,32,315,35,315,36,313,37,312,40,312,44,314,47,314,51,312,51,312,51,309,49,307,52,304,53,301,57,294,58,291,61,292,63,295,64,298,67,300,70,300,74,298,78,295,79,305,77,306,74,308,73,310,72,313,73,316,76,318,78,319,80,321,82,323,84,325,87,325,92,323,97,320,100,316,101,312,99,310,97,309,95,307,94,304,92,303,90,304,88,305" href="#">
          <area id="A_48" shape="poly" title="C_kyeongN" onmouseover="if(document.images)map.src='/resources/img/kyeongN.png'" onmouseout="if(document.images)map.src='/resources/img/map.png'" coords="161,250,157,253,155,254,153,255,151,256,147,258,146,260,147,262,147,264,146,266,145,268,143,272,142,274,142,276,143,280,144,283,145,286,146,289,146,291,145,293,144,294,143,296,143,298,142,299,141,301,143,303,145,305,146,307,146,309,145,312,148,316,150,318,152,320,155,323,156,327,157,330,158,333,157,336,158,340,159,343,159,345,160,347,160,351,161,350,163,350,164,350,166,350,169,351,171,352,174,354,176,353,176,350,176,348,177,345,179,343,183,343,186,343,189,342,191,341,193,341,196,340,198,343,198,345,200,347,204,350,206,351,209,352,211,353,213,353,217,352,219,350,221,348,223,344,224,342,225,339,224,337,223,334,224,332,225,328,226,327,225,325,223,323,220,324,219,324,216,325,215,327,214,331,212,333,209,333,206,331,204,328,203,325,205,320,207,318,209,316,213,315,217,315,221,315,224,316,227,316,228,315,229,312,232,308,233,307,236,305,238,304,240,302,243,300,245,298,246,296,250,293,252,293,255,291,254,288,251,289,249,287,246,287,244,285,242,284,240,281,240,279,240,276,242,275,243,272,241,272,237,272,235,273,233,275,231,277,229,279,225,279,223,279,220,276,217,277,214,276,212,274,211,272,208,271,204,271,201,272,194,273,189,273,186,273,184,272,182,270,183,266,183,263,181,260,179,258,175,256,171,254,167,253,164,250" href="#">
          <area id="A_47" shape="poly" title="C_kyeongB" onmouseover="if(document.images)map.src='/resources/img/kyeongB.png'" onmouseout="if(document.images)map.src='/resources/img/map.png'" coords="212,149,208,152,205,153,202,157,202,161,201,164,201,169,200,171,197,171,194,171,191,169,188,168,184,166,180,169,176,172,166,180,160,187,160,189,163,191,164,195,164,198,164,202,162,205,161,208,160,210,160,212,161,213,164,214,168,214,171,216,173,218,174,219,173,222,171,224,168,228,168,231,167,235,165,237,161,239,162,241,163,244,163,246,162,249,167,251,171,254,176,254,179,257,183,260,184,262,185,265,185,269,185,272,189,272,193,272,196,272,194,271,194,269,194,266,196,264,198,262,197,257,196,256,196,252,196,248,198,246,201,245,202,243,205,243,207,242,208,239,210,238,213,238,217,238,219,238,222,239,224,243,225,246,227,249,227,251,225,252,223,254,220,256,219,258,217,262,217,265,214,268,213,266,209,266,209,269,212,271,213,272,216,275,219,275,223,276,225,278,228,277,231,275,233,272,235,271,237,270,241,270,243,270,245,268,247,266,249,264,252,262,254,263,258,265,261,268,263,268,267,268,268,266,269,269,272,270,274,270,275,267,276,265,277,261,277,257,277,254,279,254,280,252,280,249,281,246,280,243,282,239,282,237,281,235,280,231,278,231,276,233,275,235,273,237,272,237,269,235,269,233,269,231,269,228,268,224,267,222,267,219,267,214,266,210,266,205,267,203,269,202,269,201,269,197,269,193,269,189,269,186,269,183,272,180,272,176,272,172,272,170,273,168,271,165,269,162,269,161,269,157,269,155,269,153,269,149,269,147,268,146,265,142,263,138,261,140,259,141,257,143,254,146,252,147,247,147,243,146,240,145,238,146,236,148,235,149,233,149,228,149,227,147,223,147,220,147,217,149" href="#">
          <area id="A_42" shape="poly" title="C_kang" onmouseover="if(document.images)map.src='/resources/img/kang.png'" onmouseout="if(document.images)map.src='/resources/img/map.png'" coords="194,21,192,22,192,28,191,32,189,36,186,36,184,33,182,32,180,32,176,33,175,33,175,38,175,42,173,44,168,44,143,44,140,42,139,40,136,40,134,40,133,41,130,43,127,45,125,45,122,43,120,42,118,40,117,40,115,40,112,42,111,43,109,44,110,45,111,49,113,51,117,54,121,55,124,56,127,59,131,63,135,67,137,70,139,74,139,78,137,81,136,84,135,88,135,90,136,91,138,93,138,97,140,98,142,99,146,100,149,101,151,101,154,102,156,104,156,106,154,109,153,111,154,114,155,116,154,119,152,122,152,126,152,129,153,132,153,135,152,139,156,139,158,139,159,139,161,139,163,137,163,135,163,133,165,131,166,130,168,130,170,132,171,134,172,135,175,133,179,131,184,132,186,133,189,135,190,137,192,139,196,140,199,140,202,141,206,145,209,145,212,147,217,147,219,146,223,145,225,145,228,145,231,147,234,147,238,144,241,143,246,145,249,145,252,145,255,143,257,141,259,138,262,135,261,131,261,127,260,122,258,120,255,119,250,115,248,110,246,105,244,102,242,100,241,98,242,94,240,91,238,90,235,88,232,85,229,83,226,78,223,73,221,67,218,65,217,63,214,59,212,58,211,55,210,51,210,49,208,44,206,42,203,38,202,34,201,32,201,28,199,24,196,22" href="#">

		</map>    
        
    <!-- <div id="modal_content">  팝업내용<input type="button" value="닫기" id="m_close"> -->
	<div id="search_form">
	
		<div id="content">
		
		<input type="text" id="si" name="si" disabled="disabled">
		
		구
		<select id="gu">
		</select>
		
		동 
		<select id="dong">
			<option>선택해주세요</option>
		</select>
		
		
				
        <input type="text" name="keyword" id="keyword">
        <input type="button" value="검색" id="search" class="small button">
        
		<table id="addrTable" >
		
		</table>
		
		</div>
		
			<c:forEach items="${dto}" var="houseDto">
		<tr>
			<td><input type="hidden" class="hnm" value="${houseDto.hnm}"><p><a href="#" class="modalbutton">${houseDto.hnm}</a></p></td>
			<td><input type="hidden" class="hcontent" value='${houseDto.hcontent }'/>${houseDto.hcontent }</td>
			<td><input type="hidden" class="hphone" value="${houseDto.hphone }"></td>
			<td><input type="hidden" class="hlink" value='${houseDto.hlink}'/></td>
			<td><input type="hidden" class="hkind" value='${houseDto.hkind }'/></td>
			<td><input type="hidden" class="haddr" value='${houseDto.haddr }'/></td>
			<td><fmt:formatDate value="${houseDto.htime}"/>${houseDto.htime}</td>		
			<td><input type="hidden" name="hmapx" class="hhmapx" value='${houseDto.hmapx }'></td>
			<td><input type="hidden" name="hmapy" class="hhmapy" value='${houseDto.hmapy }'></td> 
		</tr>
   		</c:forEach >	
		
		
<%--     <table>
 		<tr>
			<td colspan="9" width="100%" bgcolor="pink"></td>
			
		</tr>
		
		<c:forEach items="${list}" var="houseDto">

				<fmt:formatDate value="${houseDto.htime}" pattern="yyyy-MM-dd HH:mm"/>		
			<tr>
				<td>${houseDto.hno }</td>
			<div id="open"><td ><a href='${houseDto.hnm}'>${houseDto.hnm}</a></td></div>	
			
				<td rowspan="1">${houseDto.hnm}</td>
				<td>${houseDto.hcontent }</td>
				<td>${houseDto.hphone }</td>
				<td><a href='${houseDto.hlink}'>${houseDto.hlink}</a></td>
				<td>${houseDto.hkind }</td>
				<td>${houseDto.haddr }</td>
				<td id="hidden" 'x : ${houseDto.hmapx }'></td>
				<td id="hidden" 'y : ${houseDto.hmapy }'></td> 
		</tr>
					
		</c:forEach>
	</table>  --%>
         		
    </div>
	</div>
       <div id="map"style="border:1px solid #000; "></div>
       </div>
       </div>
<%@include file="../include/footer.jsp"%>
</body>
</html>