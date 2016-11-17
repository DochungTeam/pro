<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(document).ready(function() {
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
	});
</script>

<header>
	<div class="wrapper cf">
		<div id="logo">
			<a href="index.html"><img src="/resources/img/logo.png"
				alt="Simpler"></a>
		</div>
		<!-- nav -->
		<ul id="nav" class="sf-menu">
			<li><c:choose>
					<c:when test="${empty loginMember.mid}">
						<a href="/member/login">로그인</a>
					</c:when>
					<c:otherwise>
						<a href="" onclick="logout();">로그아웃</a>
					</c:otherwise>
				</c:choose></li>
				<li>|</li>
			<li><a href="#">회원가입</a></li>
		</ul>
		<!-- ends nav -->
	</div>
	<div id="combo-holder"></div>
	<ul>
		<li><a href="/house/list"><span>맛집 리스트</span></a></li>
		<li><a href="/house/houseList">맛집 지도</a></li>
		<li><a href="/board/list">게시판</a></li>
	</ul>
</header>