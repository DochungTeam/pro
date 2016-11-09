<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<jsp:include page="../include/header.jsp"/>

<form role="from" action="modifyPage" method="post">

	<input type="hidden" name="page" value="${cri.page }">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	<input type="hidden" name="searchType" value="${cri.searchType }">
	<input type="hidden" name="keyword" value="${cri.keyword }">

	<div>
		<div>
			<input type="text" name="bno" value="${boardDto.bno }" readonly="readonly">
			<input type="text" name="btitle" value="${boardDto.btitle }">
			<input type="text" name="bwriter" value="${boardDto.bwriter }" readonly="readonly">
			<input type="text" name="bwritedt" value="${boardDto.bwritedt }" readonly="readonly">
		</div>
		<div>
			<textarea rows="3" name="bcontent">${boardDto.bcontent }</textarea>
		</div>
	</div>
	
</form>
	
<div>
	<button type="submit">저장</button>
	<button type="submit">취소</button>
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