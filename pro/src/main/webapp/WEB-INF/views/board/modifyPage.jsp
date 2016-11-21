<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<jsp:include page="../include/script.jsp"/>
<jsp:include page="../include/header.jsp"/>

<form role="form" action="modifyPage" method="post">

	<input type="hidden" name="page" value="${cri.page }">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	<input type="hidden" name="searchType" value="${cri.searchType }">
	<input type="hidden" name="keyword" value="${cri.keyword }">

	<div class="box-body">
		<div class="form-group">
			<input type="text" name="bno" class="form-control" value="${boardDto.bno }" readonly="readonly">
			<input type="text" name="btitle" class="form-control" value="${boardDto.btitle }">
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
			<textarea class="form-control" rows="3" name="bcontent">${boardDto.bcontent }</textarea>
		</div>
	</div>
	
</form>
	
<div class="box-footer">
	<button type="submit" class="btn btn-save">저장</button>
	<button type="submit" class="btn btn-cancel">취소</button>
</div>

<script>

$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".btn-save").on("click", function(){
		formObj.submit();
	});
	
	$(".btn-cancel").on("click", function(){
		self.location = "/board/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
				+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});
});
</script>

<jsp:include page="../include/footer.jsp"/>