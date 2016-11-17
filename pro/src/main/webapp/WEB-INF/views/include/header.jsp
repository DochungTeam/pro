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
			<li><a href="#">회원가입</a></li>
		</ul>
		<!-- ends nav -->
	</div>
	<!-- SLIDER -->
	<div id="home-slider" class="lof-slidecontent">
		<div class="preload">
			<!-- slider content -->
			<div class="main-slider-content">
				<div class="sliders-wrapper" style="width: 940px;">
					<ul class="sliders-wrap-inner"
						style="left: -1880px; width: 6580px;">
						<li style="width: 940px;"><img
							src="/resources/img/dummies/slides/01.jpg" title="" alt="alt" />
							<div class="slider-description"></div></li>

						<li><img src="/resources/img/dummies/slides/02.jpg" title=""
							alt="alt" />
						<li><img src="/resources/img/dummies/slides/03.jpg" title=""
							alt="alt" />
						<li><img src="/resources/img/dummies/slides/04.jpg" title=""
							alt="alt" />
						<li><img src="/resources/img/dummies/slides/05.jpg" title=""
							alt="alt" />
						<li><img src="/resources/img/dummies/slides/06.jpg" title=""
							alt="alt" />
						<li><img src="/resources/img/dummies/slides/07.jpg" title=""
							alt="alt" />
					</ul>
				</div>
			</div>
			<!-- ENDS slider content -->
		</div>
	</div>
	<ul>
		<li><a href="/house/list"><span>맛집 리스트</span></a></li>
		<li><a href="/house/houseList">맛집 지도</a></li>
		<li><a href="/board/list">게시판</a></li>
	</ul>
</header>