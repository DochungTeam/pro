<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<%@include file="../include/script.jsp"%>


<link href="/resources/jqueryui/jquery-ui.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/yumdo.css" type="text/css"/>
<script type="text/javascript" src="/resources/jqueryui/jquery-ui.min.js"></script>

<style>
.fileDrop {
  width: 50%;
  height: 100px;
  border: 1px dotted gray;
  background-color: #efeee7;
  margin: auto;
  
}
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
  	
    </style>

    <div class='popup back' style="display:none;"></div>
    <div id="popup_front" class='popup front' style="display:none;">
     <img id="popup_img">
    </div>
 </head>

<!-- Main content -->
<body class="page">
<%@include file="../include/header.jsp"%>
<div id="main">
<div id="start" class="wrapper cf">
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h2 class="box-title">맛집 수정 페이지</h2><br><br>
				</div>
				<!-- /.box-header -->

<form role="form" method="post" name="frm" id="modifyForm" >

	<input type='hidden' name='page' value="${cri.page}"> 
	<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">

					<div class="box-body">
					<div class="insert_form">
						<table style="width : 750px">
						<tr>
							<th>맛집이름</th>
							<td><input type ="text" name="hnm" size="20" value="${houseDto.hnm}" ></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type ="text" name="hphone" size="20" value="${houseDto.hphone}" maxlength="11">(전화번호는 - 없이 입력해주세요.)</td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type ="text" name="haddr" id="hhaddr" size="20" value="${houseDto.haddr}" readonly="readonly" style="width : 400; ">
							<input type="button" value="주소 검색" class="haddr" style="width : 100; ">
							<input type="hidden" name="hmapx" id="hhmapx" value="${houseDto.hmapx}">
							<input type="hidden" name="hmapy" id="hhmapy"value="${houseDto.hmapy}">
							</td>
							
							
					
							
						</tr>
						<tr>
						<th> 맛집테마 *</th>
						<td><select class="select" name="hkind" value="${houseDto.hkind}" style="width : 300; ">
								<option value="">선택하세요</option>
								<option value="00">한식</option>
								<option value="01">양식</option>
								<option value="02">중식</option>
								<option value="03">일식</option>
								<option value="04">퓨전</option>
								<option value="05">디저트</option>
						</select></td>
					</tr>
						<tr>
							<th>맛집메뉴</th>
							<td><input type ="text" name="hmenu" size="20" value="${houseDto.hmenu}" ></td>
						</tr>
						<tr>
							<th>영업시간</th>
							<td><input type ="text" name="htime" size="20" value="${houseDto.htime}" ></td>
						</tr>
						<tr>
							<th>휴무</th>
							<td><input type ="text" name="hholiday" size="20" value="${houseDto.hholiday}" ></td>
						</tr>
						<tr>
							<th>맛집설명</th>
							<td><input type ="text" name="hcontent" size="20" value="${houseDto.hcontent}" ></td>
						</tr>
						<tr>
							<th>블로그주소</th>
							<td><input type ="text" name="hurl" size="20" value="${houseDto.hurl}" ></td>
						</tr>
						
					</table>
						<%-- <div class="form-group">
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
						</div> --%>
					
						<div class="form-group" style=" text-align : center">
							<label for="exampleInputEmail1">맛집 사진 등록(사진 파일을 드래그 해서 올려주세요.)</label>
							<div class="fileDrop"></div>
						</div>	
						<div class="dialogLayout" title="주소검색">
							<form>
								<input type="text" name="keyword" id="keyword">
								<input type="button" value="주소 검색" id="search" class="small button">
							</form>
							
						<table class="modaladdr">
						</table>
						</div>
						</div>
		<ul class="mailbox-attachments clearfix uploadedList"></ul>
    		<button type="submit"class="btn btn-primary" onclick="return housecheck_ok()"
    		style="background: #6799FF;
			color: #fff;
			width: 100px;
			height: 35px;
			border: 0;
			margin-top: 20px;
			cursor: pointer;">수정</button>
    		<button type="button" id="goListBtn"
    		style="background: #F15F5F;
			color: #fff;
			width: 100px;
			height: 35px;
			border: 0;
			margin-top: 20px;
			margin-left: 5px;
			cursor: pointer;">취소</button>
					</div>
					<!-- /.box-body -->

	<div class="box-footer">

	</div>
</form>

</div>
</div>


<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
<li id="houseimg">
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"><small id="remove-btn" style="cursor:pointer; font-size:25;">x</small></span>
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
	
	$(document).on("click","#remove-btn", function(){
		$(this).prev().remove();
		$(this).remove();
		$("#houseimg").remove();
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



$("#modifyForm").submit(function(event){
	event.preventDefault();
	
	var that = $(this);
	
	var str ="";
/* 	$(".uploadedList .delbtn").each(function(index){
		 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
	});<<<<<<<이것때문에 업로드 수정이 안된거임 절대 다신 쓰지말것 */
	
	that.append(str);

	that.get(0).submit();
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


<!-- 대일 스크립트 -->

<script type="text/javascript">
$(document).ready(function(){

	/*  $("#choice").on("click",function(e){
		e.preventDefault();
		$(".haddr").text($("#modaladdr").val());
	}); */
	 
	
	$(".haddr").on("click",function(e){
	 
		e.preventDefault();
	
		dialog.dialog("open");

	});
	
/* 	var addrinput = function(haddr){
	 	alert("asdsad");
		$("#hhaddr").val(haddr);
	}; */
	
	 $(document).on("click","#ddd", function(){
	      $("#hhaddr").val("");
	      $("#hhaddr").val($("#ddd1").data("haddr"));
	      $("#hhmapx").val($("#ddd1").data("hmapx"));
	      $("#hhmapy").val($("#ddd1").data("hmapy"));
	      
	      dialog.dialog("close");
	   });
	$("#search").on("click",function(e){
		e.preventDefault();
		/* alert($(this).parents("tr").find("td").eq(0).find("input").val());
		 */
		var keyword=$("#keyword").val();
		var values=[];
		
		$.ajax({
			type:'post',
			url:'/house/insertAjax',
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"POST"
			},
			
			data: JSON.stringify(keyword),
			dataType:'json',
			
			success:function(result){
					$(".modaladdr tr").remove();
					$(result).each(function(i,aaa){
					
						$(".modaladdr").append(
							"<tr id='"+aaa.hno+"'>'"+
							"<td> "+aaa.haddr+"</td>"+
							"<td><input type='hidden' id='ddd1' data-hmapx='"+aaa.hmapx+"' data-hmapy='"+aaa.hmapy+"' data-haddr='"+aaa.haddr+"'> </td>"+
							"<td><button id='ddd'>선택</button></td></tr>"
						);
						
					});	
			},
			error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText +"\n"+"error:"+error)
			}
		});
		
	});
	
	$(".dialogLayout").submit(function(event){
		event.preventDefault();
	});
	
	var dialog=$(".dialogLayout").dialog({
		
		autoOpen:false,
		open:function(a){
			
		},
		
		width:500,
	});	
	
	$(".haddr").button();	
	
});
</script>

<%@include file="../include/footer.jsp"%>
</body>
