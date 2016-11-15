<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<jsp:include page="../include/script.jsp"/>
<jsp:include page="../include/header.jsp"/>

<table class="">
	<tr>
		<th style="width: 10px">글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>등록일</th>
		<th style="width: 40px">조회수</th>
	</tr>

<c:forEach items="${list }" var="boardDto">

	<tr>
		<td>${boardDto.bno }</td>
		<td><a href="/board/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardDto.bno}">${boardDto.btitle } <strong>[ ${boardDto.rcount }]</strong></a></td>
		<td>${boardDto.bwriter }</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${boardDto.bwritedt }" /></td>
		<td><span>${boardDto.bcount }</span></td>
	</tr>
	
</c:forEach>

</table>

<div class="">
	<button type="submit" id="newBtn">글쓰기</button>
</div>

<div class="text-center">
	<ul class="pagination">
		
		<c:if test="${pageMaker.prev }">
			<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
			<li
				<c:out value="${pageMaker.cri.page == idx?'class =active':'' }"/>>
				<a href="list${pageMaker.makeSearch(idx) }">${idx }</a>
			</li>
		</c:forEach>
		
		<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
			<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1) }">&raquo;</a></li>
		</c:if>
		
	</ul>
</div>

<form id="jobForm">
	<input type="hidden" name="page" value="${pageMaker.cri.perPageNum }">
	<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum }">
</form>

<div class="">

	<select id="selectSearch" name="searchType">
		<option value="t"
			<c:out value="${cri.searchType eq 't'?'selected':'' }"/>>제목
		</option>
		<option value="c"
			<c:out value="${cri.searchType eq 'c'?'selected':'' }"/>>내용
		</option>
		<option value="w"
			<c:out value="${cri.searchType eq 'w'?'selected':'' }"/>>작성자
		</option>
		<option value="tc"
			<c:out value="${cri.searchType eq 'tc'?'selected':'' }"/>>제목 또는 내용
		</option>
	</select>

	<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
		<button id="searchBtn">검색</button>	
</div>

<script>
$(document).ready(function(){
	var result = '${msg}';
	
	if(result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
	
	$('#searchBtn').on("click", function(event) {
		self.location = "list"
			+ '${pageMaker.makeQuery(1)}'
			+ "&searchType="
			+ $("#selectSearch option:selected").val()
			+ "&keyword=" + $('#keywordInput').val();
	});
	
	$('#newBtn').on("click", function(event){
		self.location = "register";
	});
});
</script>

<jsp:include page="../include/footer.jsp"/>