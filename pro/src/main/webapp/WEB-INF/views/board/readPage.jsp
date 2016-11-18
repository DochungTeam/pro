<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<head>

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<jsp:include page="../include/script.jsp"/>

<script type="text/javascript">
$(document).ready(function(){
	var bno = ${boardDto.bno};
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
		getPage("/reply/" + bno + "/1");
		
	});
	
	$(".pagination").on("click", "li a", function(event) {
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPage("/reply/" + bno + "/" + replyPage);
		
	});
	
	$("#replyAddBtn").on("click", function() {
		
		var mid = $("#mid").val();
		var rcontent = $("#rcontent").val();
		var bno = $("#bno").val();
		
		if(mid==""){
			if (confirm("로그인 시 이용가능한 서비스입니다. 로그인 페이지로 이동하시겠습니까?") == true){
				location.replace("/member/login");
			}else{
				history.go(0);
			}
		}else{
			
		$.ajax({
			type : 'post',
			url : '/reply/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({mid:mid, bno:bno, rcontent:rcontent}),
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
		$(".modal-title").html(reply.atter("data-rno"));
		
	});
	
	
});
</script>
<script type="text/javascript">
	var replyModify = function(rno) {
		
		var rcontent = $(".hidden"+rno).val();
		
		$(".d"+rno).remove();
		$(".modiv"+rno+" button").remove();

		$(".td"+rno).append(
			"<span class='span"+rno+"'><input type='text' class='text"+rno+"' value='"+rcontent+"'/></span>"		
		);
		$(".modiv"+rno).append(
			"<button onclick='replyModifyOk("+rno+");'>확인</button>"+	
			"<button onclick='replyModifyCancel("+rno+");'>취소</button>"	
		);
		
	}
	
	var replyModifyOk = function(rno){
		
		var mid = $("#mid").val();
		var rcontent = $(".text"+rno).val();
		
		$.ajax({
			type:'put',
			url:'/reply/' + rno,
			headers: {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "PUT" },
			data: JSON.stringify({mid:mid,rcontent:rcontent}),
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
	var replyModifyCancel = function(rno){
		
		var rid = "."+rno;
		var rcontent = $(".hidden"+rno).val();
		
		
		$(".span"+rno).remove();
		$(".modiv"+rno+" button").remove();

		$(".td"+rno).append(
			"<div class='d"+rno+"'>"+rcontent+"</div>"
		);
		$(".modiv"+rno).append(
			"<button class='ok"+rno+"' onclick='replyModify("+rno+");'>수정</button>"
		);
		
	}
	
	var replyDelete = function(rno) {
		
		$.ajax({
			type:'delete',
			url:'/reply/'+rno,
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

<style type="text/css">
	.boardTd{
		padding: 10px;
	}
</style>

</head>


<body>
	<div id="page">
		<jsp:include page="../include/header.jsp" />
		<div id="main">
			<div class="wrapper cf">
<form role="form" action="modifyPage" method="post">
	
	<input type="hidden" name="bno" id="bno" value="${boardDto.bno }">
	<input type="hidden" name="page" value="1">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	<input type="hidden" name="searchType" value="${cri.searchType }">
	<input type="hidden" name="keyword" value="${cri.keyword }">
	
</form>

<div class="box-body">
	<table>
		<tr>
			<td class="boardTd">
				${boardDto.bno }
			</td>
			<td class="boardTd">
				${boardDto.btitle }
			</td>
			<td class="boardTd">
				${boardDto.bwriter }
			</td>
			<td class="boardTd">
				<fmt:formatDate pattern="yyyy-MM-dd" value="${boardDto.bwritedt }" />
			</td>
		</tr>
	</table>
		<div>${boardDto.bcontent }</div>
</div>

<div class="box-footer">
	<c:if test="${loginMember.mid == boardDto.bwriter }">
		<button type="submit" class="btn btn-modify">수정</button>
	</c:if>
	<c:if test="${(loginMember.mid == boardDto.bwriter) || loginMember.mmanyn == 0 }">
		<button type="submit" class="btn btn-remove">삭제</button>
	</c:if>
	<button type="submit" class="btn btn-list">목록</button>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="box box-success">
			<div>
				<hr/>
				<h4>댓글 목록[${boardDto.rcount }]</h4>
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
							${replyDto.rno }
						</td>
						<td class="td${replyDto.rno }">
							<input type="hidden" class="hidden${replyDto.rno }" value="${replyDto.rcontent }"/>
							<div class="d${replyDto.rno }">${replyDto.rcontent }</div>
						</td>
						<td>
							${replyDto.mid }
						</td>
						<td>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${replyDto.rwritedt }" />
						</td>
						<td>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${replyDto.rupdatedt }" />
						</td>
						<c:if test="${loginMember.mid == replyDto.mid }">
							<td class="modiv${replyDto.rno }">
								<button id="replyModBtn" onclick="replyModify(${replyDto.rno });">수정</button>
							</td>
						</c:if>
						<c:if test="${(loginMember.mid == replyDto.mid) || loginMember.mmanyn == 0}">
							<td>
								<button id="replyDelBtn" onclick="replyDelete(${replyDto.rno});">삭제</button>
							</td>
						</c:if>
					</tr>
					</c:forEach>
				</table>
				<c:if test="${pageMaker.prev }">
					<a href="readPage${pageMaker.makeSearch(pageMaker.startPage - 1) }&bno=${boardDto.bno}">&laquo;</a>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<a href="readPage${pageMaker.makeSearch(idx) }&bno=${boardDto.bno}">${idx }</a>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<a href="readPage${pageMaker.makeSearch(pageMaker.endPage + 1) }&bno=${boardDto.bno}">&raquo;</a>
				</c:if>
			</div>
			
			<div class="box-body">
				<hr/>
				<input type="hidden" name="mid" id="mid" value="${loginMember.mid}" >
				<input type="text" id="rcontent" name="rcontent" placeholder="댓글을 입력하세요">
				<button id="replyAddBtn">등록</button>
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
			</div>
		</div>
	</div>
<jsp:include page="../include/footer.jsp"/>
</body>