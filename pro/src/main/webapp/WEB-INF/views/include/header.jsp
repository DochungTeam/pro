<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript">
		var logout = function() {
			$.ajax({
				type : 'get',
				url : '/member/logout/',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				dataType : "text",
				success : function() {
					history.go(0);
				}

			});
		}
		
</script>

<header>
	<div class="wrapper cf">
	<%@include file="../include/headerCommon.jsp"%>
	</div>
	<div>
		<ul>
			<li><a href="/house/list"><span>맛집 리스트</span></a></li>
			<li><a href="/house/houseList">맛집 지도</a></li>
			<li><a href="/board/list">게시판</a></li>
		</ul>
	</div>
</header>