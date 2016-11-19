<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="../css/header.css">

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
			<div id="logo">
				<a href="/house/list"><img src="/resources/img/nologo.png"
					alt="Simpler"></a>
			</div>
			<!-- nav -->
			<ul id="nav" class="sf-menu">
				<li><c:choose>
						<c:when test="${empty loginMember.mid}">
							<a href="/member/login">로그인</a>
						</c:when>
						<c:otherwise>
							<li class="current-menu-item"><a>${loginMember.mnm }님
									환영합니다!</a>
								<ul>
									<li><a href="/member/myjjim">나의 찜 목록</a></li>
									<c:if
										test="${(loginMember.mmanyn == 0 || loginMember.mmanyn == 1)}">
										<li><a href="/member/modify">회원 정보 수정</a></li>
									</c:if>
								</ul></li>
						</c:otherwise>
					</c:choose></li>
				<li><a>|</a></li>
				<li><c:choose>
						<c:when test="${empty loginMember.mid}">
							<a href="/member/input">회원가입</a>
						</c:when>
						<c:otherwise>
							<a href="" onclick="logout();">로그아웃</a>
						</c:otherwise>
					</c:choose></li>
			</ul>
			<!-- ends nav -->
		</div>
		<div class="downNav">
			<ul id="navDown" class="sf-menu">
				<li><a href="/house/list"><span>맛집 리스트</span></a></li>
				<li><a href="/house/houseList">맛집 검색</a></li>
				<li><a href="/board/list">게시판</a></li>
			</ul>
		</div>
</header>
