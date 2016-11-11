<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<jsp:include page="../include/script.jsp"/>
<jsp:include page="../include/header.jsp"/>

<form role="form" method="post">
	<div class="">
		<div class="form-group">
			<label>제목</label>
			<input type="text" name="btitle" placeholder="제목을 입력하세요...">
			<input type="hidden" name="bwriter" value="${boardDto.bwriter }" readonly="readonly">
		</div>
		<div class="form-group">
			<label>내용</label>
			<textarea rows="3" name="bcontent" placeholder="내용을 입력하세요..."></textarea>
		</div>
	</div>
	
	<div>
		<button type="submit">등록</button>
		<button type="submit" >취소</button>
	</div>
</form>

<jsp:include page="../include/footer.jsp"/>