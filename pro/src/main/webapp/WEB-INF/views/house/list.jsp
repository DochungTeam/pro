<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/script.jsp"%>
<%@include file="../include/mainheader.jsp"%>



<style>
/* img {
	cursor:pointer
} */
</style>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->


		<div class="col-md-12">
			<!-- general form elements -->

			<div class="box">
			<c:if test="${loginMember.mmanyn == 0}">
			<button><a href='/house/insertHouse'>맛집 등록</a></button>
			</c:if>
				<%-- <div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width: 20px">no</th>
							<th style="width: 100px">맛집이름</th>
							<th style="width: 70px">맛집테마</th>
							<th style="width: 100px">등록 날짜</th>
							<th style="width: 100px">조회</th>
						</tr>

						<c:forEach items="${list}" var="houseDto">

							<tr>
								<td>${houseDto.hno}</td>
								<td><a href='/house/readHouse${pageMaker.makeSearch(pageMaker.cri.page) }&hno=${houseDto.hno}'>
										${houseDto.hnm} <strong>[ ${houseDto.hreplycnt }]</strong> 
										</a></td>
								<td>${houseDto.hkind}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${houseDto.hregdate}" /></td>
								<td>${houseDto.hviewcnt }</td>
							</tr>

						</c:forEach>

					</table>
					
					
				</div> --%>
				
				<!-- MAIN -->
			<div class="wrapper cf">
			
			
			<input type='hidden' name='hno' value="${houseDto.hno}">
			
				
			<!-- featured -->
			
			<div class="home-featured">
			
				<ul id="filter-buttons">
					<li><a href="#" data-filter="*" class="selected">전체</a></li>
					<li><a href="#" data-filter=".00">한식</a></li>
					<li><a href="#" data-filter=".01">양식</a></li>
					<li><a href="#" data-filter=".02">중식</a></li>
					<li><a href="#" data-filter=".03">일식</a></li>
					<li><a href="#" data-filter=".04">퓨전</a></li>
					<li><a href="#" data-filter=".05">디저트</a></li>
				</ul>
		
			<!-- general form elements -->

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">맛집 리스트</h3>
			<button class="link-button"><a href='/house/insertHouse'>맛집 등록</a></button>
				</div>
				
				<!-- Filter container -->
				
				 
				<div id="filter-container" class="cf">
				<c:forEach items="${list}" var="houseDto">
					<figure class="${houseDto.hkind}">
						<a href='/house/readHouse${pageMaker.makeSearch(pageMaker.cri.page) }&hno=${houseDto.hno}'class="thumb">
						<img src="/resources/img/house${houseDto.fullName}" alt="alt" /></a>
						<figcaption>
							<a href='/house/readHouse${pageMaker.makeSearch(pageMaker.cri.page) }&hno=${houseDto.hno}'>
							<h3 class="heading"> ${houseDto.hnm} </h3></a>
							주소 : ${houseDto.haddr} <br> TEL : ${houseDto.hphone}<br> 
								<img onclick="jjimBtn(${houseDto.hno })" id='${houseDto.hno }' 
									 <c:choose>
									 	<c:when test="${houseDto.jjimchk == 0 }">
									 		src="/resources/img/love.png"
									 	</c:when>
									 	<c:otherwise>
									 		src="/resources/img/soso.png"
									 	</c:otherwise>
									 </c:choose> 
									 onmouseenter="jjim_mouse_enter($(this))" 
									 onmouseout="jjim_mouse_out($(this))" title="찜하기" class="${houseDto.jjimchk}" >
						</figcaption>
					</figure>
					</c:forEach>
				</div>
			</div>
			</div>
				<!-- /.box-body -->

				<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	<!-- /.row -->
</section>
<!-- /.content -->


<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>

<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "register";

				});
				
			

			});
</script>

<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment" ></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	</span>
  </div>
</li>                
</script>  

 <!-- 파일업로드 ㅡㅡ 왜 안되는거지 -->
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
</script>    

<script>
$(document).ready(function(){
		
	var formObj = $("form[role='form']");
	
	formObj.submit(function(event){
		event.preventDefault();
		
		var that = $(this);
		
		var str ="";
		$(".uploadedList .delbtn").each(function(index){
			 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
	console.log(formObj);

	var hno = "${houseDto.hno}";
	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("/house/getAttach/"+hno,function(list){
		$(list).each(function(){
			
			var fileInfo = getFileInfo(this);
			
			var html = template(fileInfo);
			
			 $(".uploadedList").append(html);
			
		});
		
		that.append(str);
		console.log(str);
		
		that.get(0).submit();
	});
	});	
});
	$(".btn-warning").on("click", function(){
	  self.location = "/house/list?page=${cri.page}&perPageNum=${cri.perPageNum}"+
			  "&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});
	
});
var template = Handlebars.compile($("#template").html());
$(".fileDrop").on("dragenter dragover", function(event){
	event.preventDefault();
});
$(".fileDrop").on("drop", function(event){
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];
	//console.log(file);
	
	var formData = new FormData();
	
	formData.append("file", file);	
	
	$.ajax({
		  url: '/uploadAjax',
		  data: formData,
		  dataType:'text',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){
			  
			  var fileInfo = getFileInfo(data);
			  
			  var html = template(fileInfo);
			  
			  $(".uploadedList").append(html);
		  }
		});	
});
$(".uploadedList").on("click", ".delbtn", function(event){
	
	event.preventDefault();
	
	var that = $(this);
	 
	$.ajax({
	   url:"/deleteFile",
	   type:"post",
	   data: {fileName:$(this).attr("href")},
	   dataType:"text",
	   success:function(result){
		   if(result == 'deleted'){
			   that.closest("li").remove();
		   }
	   }
   });
});
var hno = "${houseDto.hno}";
var template = Handlebars.compile($("#template").html());
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
</script>

<script>




function jjim_mouse_enter(img){
	
	if(img.attr("class")==1){
		img.attr("src","/resources/img/XD.png");
	}else{
		
	}
}


function jjim_mouse_out(img){
	
	if(img.attr("class")==1){
		img.attr("src","/resources/img/soso.png");
	}else{
	}
}


function jjimBtn(hno){
	
		var mid = '${loginMember.mid}';
		
		if(mid==""){
			if (confirm("로그인 시 이용가능한 서비스입니다. 로그인 페이지로 이동하시겠습니까?") == true){
				location.replace("/member/login");
			}else{
				history.go(0);
			}
		}else{
			
			$.ajax({
				url : "/member/jjim",
				type : "get",
				data : {"mid" : mid, "hno" : hno},
				success : function(responseData){
					console.log(responseData);
					
					if(responseData==0){
						console.log('success!');
						console.log($("#"+hno).attr("src"));
						$("#"+hno).attr("class",0);
						$("#"+hno).attr("src","/resources/img/love.png");
					}else{
						$("#"+hno).attr("class",1);
					 	$("#"+hno).attr("src","/resources/img/soso.png");
					 
					}
					
					console.log("class : "+$("#"+hno).attr("class"));
				}
			})
	
		}
}

</script>


			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
<!-- /.content-wrapper -->

<%@include file="../include/footer.jsp"%>
