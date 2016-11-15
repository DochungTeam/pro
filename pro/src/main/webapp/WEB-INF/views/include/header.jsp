<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
	<div class="wrapper cf">
		<div id="logo">
			<a href="index.html"><img  src="/resources/img/logo.png" alt="Simpler"></a>
		</div>
					
		<!-- nav -->
		<ul id="nav" class="sf-menu">
			<li><a href="/house/list"><span>맛집 리스트</span></a></li>
			<li><a href="/house/houseList">맛집 지도</a></li>
			<li><a href="/board/list">게시판</a></li>
			<!--  
				<li class="current-menu-item"><a href="page.html">ABOUT</a>
					<ul>
						<li><a href="page-elements.html">Elements</a></li>
						<li><a href="page-icons.html">Icons</a></li>
						<li><a href="page-typography.html">Typography</a></li>
					</ul>
				</li>
			-->
			<li>
				<c:choose>
					<c:when test="${empty loginMember.mid}">
						<a href="/member/login">로그인</a>
					</c:when>
					<c:otherwise>
						<a href="/member/logout">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</li>
		</ul>
		<div id="combo-holder"></div>
		<!-- ends nav -->
	</div>
</header>