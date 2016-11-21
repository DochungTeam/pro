<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<head>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<jsp:include page="../include/script.jsp"/>
<style type="text/css">

</style>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>

/* $(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".btn-save").on("click", function(){
		formObj.submit();
	});
	
	$(".btn-cancel").on("click", function(){
		self.location = "/board/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
				+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});
}); */
$(document).ready(
		function() {
			var obj = [];
			var ctx = getContextPath();

			nhn.husky.EZCreator.createInIFrame({
				oAppRef : obj,
				elPlaceHolder : "bcontent",
				sSkinURI : "/resources/editor/SmartEditor2Skin.html",
				htParams : {
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseToolbar : true,
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true,
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true,
				}
			});
			$(".savebutton").click(function() {
				obj.getById["bcontent"].exec("UPDATE_CONTENTS_FIELD", []);
				$("#frm").submit();
			})

			function getContextPath() {
				return window.location.pathname.substring(0,
						window.location.pathname.indexOf("/", 2));
			}
			$(".btn-cancel").on("click", function(){
				history.go(-1);
			});
			

		});
</script>
</head>
<body class="page">

	<jsp:include page="../include/header.jsp"/>
	
	<!-- MAIN -->
	<div id="main">
		<div id="start" class="wrapper cf">
		<form role="form" id="frm" method="post">
	
		<input type="hidden" name="page" value="${cri.page }">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
		<input type="hidden" name="searchType" value="${cri.searchType }">
		<input type="hidden" name="keyword" value="${cri.keyword }">
	
		<div class="box-body">
			<div class="form-group">
				<input type="text" name="bno" class="form-control" value="${boardDto.bno }" disabled="disabled">
				<input type="text" name="btitle" class="form-control" value="${boardDto.btitle }">
				<input type="text" name="bwriter" class="form-control" value="${boardDto.bwriter }" disabled="disabled">
				<c:if test="${loginMember.mmanyn == 0}">
					<c:choose>
						<c:when test="${boardDto.bboard == 1}">
							<input type="checkbox" name="bboard" id="bboard" value="1" checked="checked"/>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="bboard" id="bboard" value="1"/>
						</c:otherwise>
					</c:choose>
					<label for="bboard">공지사항</label>
				</c:if>
			</div>
			<div class="form-group">
				<textarea id="bcontent" class="form-control" rows="3" name="bcontent">${boardDto.bcontent }</textarea>
			</div>
		</div>
		
	</form>
	<br>	
	<div>
		<button type="submit" class="btn btn-save small button">저장</button>
		<button type="submit" class="btn btn-cancel small button">취소</button>
		
	<div class="box-footer">
		<button type="submit" class="savebutton">저장</button>
		<button type="submit" class="btn-cancel">취소</button>
	</div>

		</div>
	</div>
</div>
<jsp:include page="../include/footer.jsp"/>
</body>