<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   

<head>
	<%@include file="../include/script.jsp"%>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=qloX_gYvM6K9W0RyObTM&submodules=geocoder"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script type="text/javascript" src="/resources/jqueryui/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/resources/js/upload.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<!-- Main content -->
	    <style type="text/css">
	    .popup {position: absolute;}
	    .back { background-color: gray; opacity:0.5; width: 100%; height: 300%; overflow:hidden;  z-index:1101;}
	    .front { 
	       z-index:1110; opacity:1; boarder:1px; margin: auto; 
	      }
	     .show{
	       position:relative;
	       max-width: 1200px; 
	       max-height: 800px; 
	       overflow: auto;       
	     } 
	  	
	  	#map{
		height: 250px;
		width: 350px;
	    </style>
	
</head>
<body>
	<div id="page">
		<%@include file="../include/header.jsp"%>
		<div id="main">
			<div class="wrapper cf">
				<!-- page content-->
				<div id="page-content" class="cf">
				<div class='popup back' style="display:none;"></div>
					<div id="popup_front" class='popup front' style="display:none;">
				    	<img id="popup_img">
					</div>
					<!-- entry-content -->
					<div class="entry-content cf">
					<section class="content">
						<div class="row">
							<!-- left column -->
							<div class="col-md-12">
								<!-- general form elements -->
									<h3 class="box-title">맛집 상세보기</h3>
					
									<form role="form" action="modifyPage" method="post">
					
										<input type='hidden' id="hno" name='hno' value="${houseDto.hno}"> <input
											type='hidden' name='page' value="${cri.page}"> <input
											type='hidden' name='perPageNum' value="${cri.perPageNum}">
										<input type='hidden' name='searchType' value="${cri.searchType}">
										<input type='hidden' name='keyword' value="${cri.keyword}">
					
									</form>
					
										<table style="width : 500px">
											<tr>
												<th>맛집이름</th>
												<td>${houseDto.hnm}</td>
											</tr>
											<tr>
												<th>전화번호</th>
												<td>${houseDto.hphone}</td>
											</tr>
											<tr>
												<th>주소</th>
												<td>${houseDto.haddr}</td>
											</tr>
											<tr>
												<th>맛집테마</th>
												<td>${houseDto.hkind}</td>
											</tr>
											<tr>
												<th>맛집메뉴</th>
												<td>${houseDto.hmenu}</td>
											</tr>
											<tr>
												<th>영업시간</th>
												<td>${houseDto.htime}</td>
											</tr>
											<tr>
												<th>휴무</th>
												<td>${houseDto.hholiday}</td>
											</tr>
											<tr>
												<th>맛집설명</th>
												<td>${houseDto.hcontent}</td>
											</tr>
											<tr>
												<th>블로그주소</th>
												<td>${houseDto.hurl}</td>
											</tr>
											<tr>
											 
												<td><input type="hidden" class="xxx" name="hmapx" value='${houseDto.hmapx }'></td>
												<td><input type="hidden" class="yyy" name="hmapy" value='${houseDto.hmapy }'></td> 
											</tr>
										</table>
										<%-- <div class="form-group">
											<label for="exampleInputEmail1">맛집 이름</label> <input type="text"
												name='hnm' class="form-control" value="${houseDto.hnm}"
												readonly="readonly">
										</div>
										<div class="form-group">
											<label for="exampleInputPassword1">맛집 설명</label>
											<textarea class="form-control" name="hcontent" rows="3"
												readonly="readonly">${houseDto.hcontent}</textarea>
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">hkind</label> <input type="text"
												name="hkind" class="form-control" value="${houseDto.hkind}"
												readonly="readonly">
										</div> --%>
									<!-- /.box-body -->
									<div id="map"  style="border:1px solid #000;"></div>
					  <div class="box-footer">
					    
					    <div><hr></div>
						맛집 사진
					    <ul class="mailbox-attachments clearfix uploadedList">
					    </ul>
					 <%-- <c:if test="${login.uid == houseDto.writer}"> --%>
					    <button type="submit" class="btn btn-warning" id="modifyBtn">수정</button>
					    <button type="submit" class="btn btn-danger" id="removeBtn">삭제</button>
					 <%-- </c:if> --%>
					    <button type="submit" class="btn btn-primary" id="goListBtn">목록 </button>
					  </div>
								<!-- /.box -->
							</div>
							<!--/.col (left) -->
					
						</div>
						<!-- /.row -->
					
					
					<!-- 리플시작 -->
					<div>
									<hr/>
									<h4>댓글 목록[${houseDto.hreplycnt }]</h4>
									<hr/>
									<table id="replyTable">
										<tr>
											<td>
												댓글 번호
											</td>
											<td>
												댓글 내용
											</td>
											<td>
												댓글 작성자
											</td>
											<td>
												댓글 작성일
											</td>
											<td>
												댓글 수정일
											</td>
										</tr>
										
										<c:forEach items="${replyList }" var="replyDto">
										<tr>
											<td>
												${replyDto.hrno }
											</td>
											<td class="td${replyDto.hrno }">
												<input type="hidden" class="hidden${replyDto.hrno }" value="${replyDto.hrcontent }"/>
												<div class="d${replyDto.hrno }">${replyDto.hrcontent }</div>
											</td>
											<td>
												${replyDto.mid }
											</td>
											<td>
												<fmt:formatDate pattern="yyyy-MM-dd" value="${replyDto.hrwritedt }" />
											</td>
											<td>
												<fmt:formatDate pattern="yyyy-MM-dd" value="${replyDto.hrupdatedt }" />
											</td>
											<c:if test="${loginMember.mid == replyDto.mid }">
												<td class="modiv${replyDto.hrno }">
													<button id="replyModBtn" onclick="replyModify(${replyDto.hrno });">수정</button>
												</td>
											</c:if>
											<c:if test="${(loginMember.mid == replyDto.mid) || loginMember.mmanyn == 0}">
												<td>
													<button id="replyDelBtn" onclick="replyDelete(${replyDto.hrno});">삭제</button>
												</td>
											</c:if>
										</tr>
										</c:forEach>
									</table>
									<c:if test="${pageMaker.prev }">
										<a href="readHouse${pageMaker.makeSearch(pageMaker.startPage - 1) }&hno=${houseDto.hno}">&laquo;</a>
									</c:if>
									<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
										<a href="readHouse${pageMaker.makeSearch(idx) }&hno=${boardDto.bno}">${idx }</a>
									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
										<a href="readHouse${pageMaker.makeSearch(pageMaker.endPage + 1) }&hno=${houseDto.hno}">&raquo;</a>
									</c:if>
								</div>
								
								<div class="box-body">
									<hr/>
									<input type="hidden" name="mid" id="mid" value="${loginMember.mid}" >
									<input type="text" id="hrcontent" name="hrcontent" placeholder="댓글을 입력하세요"
									style="width: 800px;height: 40px;border: 1px solid #ccc;">
									<button id="replyAddBtn" >등록</button>
								</div>
					<!-- 리플끝 -->
					
					
						<%-- <div class="row">
							<div class="col-md-12">
					
					
					<div class="box box-success">
					  <div class="box-header">
					    <h3 class="box-title">댓글 추가</h3>
					  </div>
					  
					  
					
					
					  <c:if test="${not empty login}">  
					  <div class="box-body">
					    <label for="exampleInputEmail1">작성자</label>
					    <input class="form-control" type="text" placeholder="작성자" 
					    	id="newReplyWriter" value="${login.uid }" readonly="readonly">     
					    <label for="exampleInputEmail1">댓글 내용</label> 
					    <input class="form-control" type="text" placeholder="댓글 내용" id="newReplyText">
					    </div>
					  
							<div class="box-footer">
							  <button type="submit" class="btn btn-primary" id="replyAddBtn">등록</button>
							</div>
					  </c:if>
					  
					  <c:if test="${empty login}">
					    <div class="box-body">
					      <div><a href="javascript:goLogin();" >로그인 해주세요.</a></div>
					    </div>
					  </c:if>				                 
					</div>            
					
					
							
							<!-- The time line -->
							<ul class="timeline">
							  <!-- timeline time label -->
							<li class="time-label" id="repliesDiv">
							  <span class="bg-green">
							    댓글 목록 <small id='replycntSmall'> [ ${houseDto.replycnt} ] </small>
							    </span>
							  </li>
							</ul>
							   
								<div class='text-center'>
									<ul id="pagination" class="pagination pagination-sm no-margin ">
					
									</ul>
								</div>
					
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					
					
					          
					<!-- Modal -->
					<div id="modifyModal" class="modal modal-primary fade" role="dialog">
					  <div class="modal-dialog">
					    <!-- Modal content-->
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					        <h4 class="modal-title"></h4>
					      </div>
					      <div class="modal-body" data-rno>
					        <p><input type="text" id="replytext" class="form-control"></p>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-info" id="replyModBtn">수정</button>
					        <button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
					        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					      </div>
					    </div>
					  </div>
					</div>      
					
					 --%>	
						
					</section>
					
					
					</div>
				</div>
			</div>
		

	
<!-- /.content -->


<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	</span>
  </div>
</li>                
</script>  


          


<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/house/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	
	$("#removeBtn").on("click", function(){
		
		var replyCnt =  $("#replycntSmall").html();
		
		if(replyCnt > 0 ){
			alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
			return;
		}	
		
		var arr = [];
		$(".uploadedList li").each(function(index){
			 arr.push($(this).attr("data-src"));
		});
		
		if(arr.length > 0){
			$.post("/deleteAllFiles",{files:arr}, function(){
				
			});
		}
		
		formObj.attr("action", "/house/removePage");
		formObj.submit();
	});	
	
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/house/list");
		formObj.submit();
	});
	
	var hno = ${houseDto.hno};
	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("/house/getAttach/"+hno,function(list){
		$(list).each(function(){
			
			var fileInfo = getFileInfo(this);
			
			var html = template(fileInfo);
			
			 $(".uploadedList").append(html);
			
		});
	});
	


	$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
		
		var fileLink = $(this).attr("href");
		
		if(checkImageType(fileLink)){
			
			event.preventDefault();
					
			var imgTag = $("#popup_img");
			imgTag.attr("src", fileLink);
			
			console.log(imgTag.attr("src"));
					
			$(".popup").show('slow');
			imgTag.addClass("show");		
		}	
	});
	
	$("#popup_img").on("click", function(){
		
		$(".popup").hide('slow');
		
	});	
	
		
	
});
</script>

<!-- 대일 스크립트 -->

<script type="text/javascript">

$(document).ready(function(){
	var x= $(".xxx").val();
	var y= $(".yyy").val();
	
	/* alert($(".xxx").val());
	alert($(".yyy").val()); */
	
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
	 
		 var marker = new naver.maps.Marker({
			 map: map, 
			 position: new naver.maps.Point(map.getCenter()),
	 });
})
</script>


<!-- 성모 댓글처리 코딩 -->

<script type="text/javascript">
$(document).ready(function(){
	var hno = ${houseDto.hno};
	var replyPage = 1;
	
	function getPage(pageInfo){
		$.getJSON(pageInfo,function(data){
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));
			
			$("#modifyModal").modal('hide');
			$("#replycntSmall").html("[ " + data.pageMaker.totalCount + " ]");
		});
	}
	
	var printPaging = function(pageMaker, target){
		
		var str = "";
		
		if(pageMaker.prev){
			str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
		}
		
		for(var i=pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
			var strClass = pageMaker.cri.page == i?'class=active':'';
			str += "<li " + strClass +"><a href='"+ i + "'>"+ i +"</a></li>";
		}
		
		if(pageMaker.next){
			str += "<li><a href='"+(pageMaker.endPage + 1)+"'> >> </a></li>";
		}
		
		target.html(str);
	};
	
	$("#repliesDiv").on("click", function() {
		
		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/hreply/" + hno + "/1");
		
	});
	
	$(".pagination").on("click", "li a", function(event) {
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPage("/hreply/" + hno + "/" + replyPage);
		
	});
	
	$("#replyAddBtn").on("click", function() {
		
		var mid = $("#mid").val();
		var hrcontent = $("#hrcontent").val();
		var hno = $("#hno").val();
		
		if(mid==""){
			if (confirm("로그인 시 이용가능한 서비스입니다. 로그인 페이지로 이동하시겠습니까?") == true){
				location.replace("/member/login");
			}else{
				history.go(0);
			}
		}else{
			
		$.ajax({
			type : 'post',
			url : '/hreply/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({mid:mid, hno:hno, hrcontent:hrcontent}),
			dataType : "text",
			success : function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("등록 되었습니다.");
					history.go(0);
				}
				
			}
			
		});
		}
		
		
	});
	
	$(".timeline").on("click", ".replyLi", function(event) {
		
		var reply = $(this);
		
		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.atter("data-hrno"));
		
	});
	
	
});
</script>
<script type="text/javascript">
	var replyModify = function(hrno) {
		
		var hrcontent = $(".hidden"+hrno).val();
		
		$(".d"+hrno).remove();
		$(".modiv"+hrno+" button").remove();

		$(".td"+hrno).append(
			"<span class='span"+hrno+"'><input type='text' class='text"+hrno+"' value='"+hrcontent+"'/></span>"		
		);
		$(".modiv"+hrno).append(
			"<button onclick='replyModifyOk("+hrno+");'>확인</button>"+	
			"<button onclick='replyModifyCancel("+hrno+");'>취소</button>"	
		);
		
	}
	
	var replyModifyOk = function(hrno){
		
		var mid = $("#mid").val();
		var hrcontent = $(".text"+hrno).val();
		
		$.ajax({
			type:'put',
			url:'/hreply/' + hrno,
			headers: {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "PUT" },
			data: JSON.stringify({mid:mid,hrcontent:hrcontent}),
			dataType:'text',
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("수정 되었습니다.");
					history.go(0);
				}
			}
		});
	}
	var replyModifyCancel = function(hrno){
		
		var hrcontent = $(".hidden"+hrno).val();
		
		
		$(".span"+hrno).remove();
		$(".modiv"+hrno+" button").remove();

		$(".td"+hrno).append(
			"<div class='d"+hrno+"'>"+hrcontent+"</div>"
		);
		$(".modiv"+hrno).append(
			"<button class='ok"+hrno+"' onclick='replyModify("+hrno+");'>수정</button>"
		);
		
	}
	
	var replyDelete = function(hrno) {
		
		$.ajax({
			type:'delete',
			url:'/hreply/'+hrno,
			headers: {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "DELETE"},
			dataType:'text',
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("삭제 되었습니다.");
					history.go(0);
				}
			}
		});
	}
</script>

		</div>
	</div>
<%@include file="../include/footer.jsp"%>
</body>
