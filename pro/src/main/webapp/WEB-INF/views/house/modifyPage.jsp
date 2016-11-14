<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/script.jsp"%>
<%@include file="../include/header.jsp"%>


<style>
.fileDrop {
  width: 50%;
  height: 100px;
  border: 1px dotted gray;
  background-color: #B8B8B8;
  margin: auto;
  
}
</style>


<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">맛집 수정 페이지</h3>
				</div>
				<!-- /.box-header -->

<form role="form" action="modifyPage" method="post">

	<input type='hidden' name='page' value="${cri.page}"> 
	<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">

					<div class="box-body">

						<div class="form-group">
							<label for="exampleInputEmail1">no</label> <input type="text"
								name='hno' class="form-control" value="${houseDto.hno}"
								readonly="readonly">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">맛집 이름</label> <input type="text"
								name='hnm' class="form-control" value="${houseDto.hnm}">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">맛집 설명</label>
							<textarea class="form-control" name="hcontent" rows="3">${houseDto.hcontent}</textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">맛집 테마</label> <input
								type="text" name="hkind" class="form-control"
								value="${houseDto.hkind}" readonly>
						</div>
					
						<div class="form-group">
							<label for="exampleInputEmail1">맛집 사진 올리기(마우스로 드래그 해서 올려주세요.)</label>
							<div class="fileDrop"></div>
						</div>	
						
					</div>
					<!-- /.box-body -->

	<div class="box-footer">
		<div>
			<hr>
		</div>

		<ul class="mailbox-attachments clearfix uploadedList"></ul>

    <button type="submit" class="btn btn-primary">수정</button> 
    <button type="submit" class="btn btn-primary" id="goListBtn">취소 </button>

	</div>
</form>

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
		});
		
		that.append(str);
		console.log(str);
		
		that.get(0).submit();
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
var hno = ${houseDto.hno};
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
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/house/list");
		formObj.submit();
	});
});
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
