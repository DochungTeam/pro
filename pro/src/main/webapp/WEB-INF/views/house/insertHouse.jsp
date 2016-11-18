<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/script.jsp"%>
<link href="/resources/jqueryui/jquery-ui.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/yumdo.css" type="text/css"/>
<script type="text/javascript" src="/resources/jqueryui/jquery-ui.min.js"></script>


<style type="text/css">
.fileDrop {
  width: 50%;
  height: 100px;
  border: 1px dotted gray;
  background-color: #B8B8B8;
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
    
<%@include file="../include/header.jsp"%>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h2 class="box-title" style=" text-align : left" >맛집 등록</h2>
				</div>
				<!-- /.box-header -->

				<form role="form" method="post" name="frm" id="insertForm">
					<div class="box-body">
						<div class="form-group" style=" text-align : center">
							<label for="exampleInputEmail1">맛집 사진 등록(사진 파일을 드래그 해서 올려주세요.)</label>
							<div class="fileDrop"></div>
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer">
					<div>
						<hr>
					</div>

					<ul class="mailbox-attachments clearfix uploadedList"></ul>
					</div>
					
					<div>
					<hr>
					(*는 필수 사항입니다.)
					<table style="width : 750px">
					<tr>
						<th style="background-color : #B8B8B8; "> 맛집이름 *</th>
						<td><input type ="text" name="hnm" size="20" ></td>
					</tr>
					<tr>
						<th style="background-color : #B8B8B8; "> 전화번호 *</th>
						<td><input type ="text" name="hphone" size="20" maxlength="11">(전화번호는 - 없이 입력해주세요.)</td>
					</tr>
					<tr>
						<th style="background-color : #B8B8B8; "> 주소 *</th>
						<td><input type ="text" name="haddr" id="hhaddr" readonly>
						<input type ="button" value="주소 검색" class="haddr" >
						<input type ="hidden" name="hmapx" id="hhmapx">
						<input type="hidden" name="hmapy" id="hhmapy">
						</td>
					</tr> 
					<tr>
						<th style="background-color : #B8B8B8; "> 맛집테마 *</th>
						<td><select class="select" name="hkind">
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
						<th style="background-color : #B8B8B8; "> 맛집메뉴 *</th>
						<td><input type ="text" name="hmenu" size="20"></td>
					</tr>
					<tr>
						<th style="background-color : #B8B8B8; "> 영업시간 </th>
						<td><input type ="text" name="htime" size="20"></td>
					</tr>
					<tr>
						<th style="background-color : #B8B8B8; "> 휴무 </th>
						<td><input type ="text" name="hholiday" size="20"></td>
					</tr>
					<tr>
						<th style="background-color : #B8B8B8; "> 맛집설명 *</th>
						<td><input type ="text" name="hcontent" size="20"></td>
					</tr>
					<tr>
						<th style="background-color : #B8B8B8; "> 블로그주소 *</th>
						<td><input type ="text" name="hurl" size="20"></td>
					</tr>
	
				</table>
			<button type="submit" class="btn btn-primary" onclick="return housecheck_ok()" >등록</button>
			<button type="submit" class="btn btn-primary" id="goListBtn">취소 </button>
			</div>
			
		</form>
	</div>
			<!-- /.box -->
	</div>
		<!--/.col (left) -->

	</div>
<!-- <input type="button" value="중복 체크" onclick="idCheck()">
 -->	
	<div class="dialogLayout" title="주소 검색">
	 <form >
			<input type="text" name="keyword" id="keyword">
			<input type="button" value="주소 검색" id="search">			
	</form>
		
	<table class="modaladdr">
		
		<%-- <c:forEach items="${list}" var="houseDto">
		<tr>
			<td><input type="hidden" value='${houseDto.haddr }' id="modaladdr">${houseDto.haddr }
			</td>
			<td><button id="choice">선택</button>
			</td>
		</tr>
		</c:forEach> --%>
	</table>
	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
<!-- /.content-wrapper -->

<script type="text/javascript" src="/resources/js/inserthouse.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
<li id="houseimg">
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"><small id="remove-btn">x</small></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
</script>    

<script>

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

$("#insertForm").submit(function(event){
	event.preventDefault();
	
	var that = $(this);
	
	var str ="";
	$(".uploadedList .delbtn").each(function(index){
		 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
	});
	
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
	
$(document).on("click","#remove-btn", function(){
	$(this).prev().remove();
	$(this).remove();
	$("#houseimg").remove();
});
});


</script>


<!-- 대일스크립트 -->
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
