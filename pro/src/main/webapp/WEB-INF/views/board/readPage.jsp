<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<jsp:include page="../include/script.jsp"/>
<jsp:include page="../include/header.jsp"/>

<form role="form" action="modifyPage" method="post">
	
	<input type="hidden" name="bno" value="${boardDto.bno }">
	<input type="hidden" name="page" value="${cri.page }">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	<input type="hidden" name="searchType" value="${cri.searchType }">
	<input type="hidden" name="keyword" value="${cri.keyword }">
	
</form>

<div class="">
	<div class="">
		<input type="text" name="bno" value="${boardDto.bno }" readonly="readonly">
		<input type="text" name="btitle" value="${boardDto.btitle }" readonly="readonly">
		<input type="text" name="bwriter" value="${boardDto.bwriter }" readonly="readonly">
		<input type="text" name="bwritedt" value="${boardDto.bwritedt }" readonly="readonly">
	</div>
	<div class="">
		<textarea rows="3" name="bcontent" readonly="readonly">${boardDto.bcontent }</textarea>
	</div>
</div>

<div class="">
	<button type="submit" class="btn btn-modify">수정</button>
	<button type="submit" class="btn btn-remove">삭제</button>
	<button type="submit" class="btn btn-list">목록</button>
</div>

<div class="row">
	<div class="">
		<div class="">
			<div class="">
				<h4 class="box-title">댓글</h4>
			</div>
			<div class="">
				<input type="text" placeholder="${boardDto.bwriter }">
				<input type="text" class="" id="newReplyText" placeholder="댓글을 입력하세요">
			</div>
			
			<div class="">
				<button type="submit" class="btn btn-insert" id="replyAddBtn">등록</button>
			</div>
		</div>
		
		<ul class="timeline">
			<li class="time-label" id="repliesDiv"><span class="">댓글 목록</span></li>
		</ul>
		
		<div class="text-center">
			<ul id="pagination" class="pagination pagination-sm no-margin"></ul>
		</div>
	</div>
</div>
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body" data-rno>
				<p><input type="text" id="replytext" class="form-control"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-rewrite" id="replyMoBtn">수정</button>
				<button type="button" class="btn btn-exterminate" id="replyDelBtn">삭제</button>
				<button type="button" class="btn btn-close" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".btn-modify").on("click", function(){
		formObj.attr("action", "/board/modifyPage");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
	$(".btn-remove").on("click", function(){
		formObj.attr("action", "/board/removePage");
		formObj.submit();
	});
	
	$(".btn-list").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/board/list");
		formObj.submit();
	});
	
});

</script>
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="relplyLi" data-rno={{rno}}>
<i class="fa fa-comments"></i>
	<div class="timeline-item">
		<span class="time">
			<i class="fa fa-clock-o"></i>{{prettifyDate rwritedt}}
		</span>
`		<h3 class="timeline-header"><strong>{{rno}}</strong> -{{rwriter}}<h3>
		<div class="timeline-body">{{rcontent}} </div>
			<div class="timeline-footer">
				<a class="btn btn-insert btn-xs" data-toggle="modal" data-target="#modifyModal">수정</a>
			</div>
	</div>
</li>
{{/each}}
</script>
<script>
$(document).ready(function(){
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dataObj.getFullYear();
		var month = dataObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	
	var printData = function (replyArr, target, templateObject) {
		
		var template = Handlebars.compile(templateObject.html());
		
		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);
	}
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	var bno = ${boardDto.bno};
	var replyPage = 1;
	
	function getPage(pageInfo){
		$.getJSON(pageInfo,function(data){
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));
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
		getPage("/replies/" + bno + "/1");
		
	});
	
	$(".pagination").on("click", "li a", function(event) {
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPage("/replies/" + bno + "/" + replyPage);
		
	});
	
	$("#replyAddBtn").on("click", function() {
		
		var replyerObj = $("#newReplyWriter");
		var replytextObj = $("#newReplyText");
		var replyer = replyerObj.val();
		var replytext = replytextObj.val();
		
			$.ajax({
				type:'post',
				url:'/replies/',
				header: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "POST" },
				dataType: 'text',
				data: JSON.stringify({bno:bno, replyer:replyer, replytext:replytext}),
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						replyPage = 1;
						getPage("/replies/" + bno + "/" + replyPage);
						replyerObj.val("");
						replytextObj.val("");
					}
				}
				});
	});
	
	$(".timeline").on("click", ".replyLi", function(event) {
		
		var reply = $(this);
		
		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.atter("data-rno"));
		
	});
	
	$("#replyModBtn").on("click", function() {
		
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();
		
		$.ajax({
			type:'put',
			url:'/replies/' + rno,
			headers: {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "PUT" },
			data: JSON.stringify({replytext:replytext}),
			dataType:'text',
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("수정 되었습니다.");
					getPage("/replies/" + bno + "/" + replyPage);
				}
			}
		});
	});
	
	$("#replyDelBtn").on("click", function() {
		
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();
		
		$.ajax({
			type:'delete',
			url:'/replies/' +rno,
			headers: {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "DELETE"},
			dataType:'text',
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("삭제 되었습니다.");
					getPage("/replies/" + bno + "/" +replyPage);
				}
			}
		});
	});
});
</script>
<jsp:include page="../include/footer.jsp"/>