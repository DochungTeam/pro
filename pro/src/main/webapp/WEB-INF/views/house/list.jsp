<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!doctype html>
<html class="no-js">

	<head>
		<title>맛집 리스트</title>
		<jsp:include page="../include/script.jsp"/>
	</head>
	
	
	<body class="home">
	
		<!-- HEADER -->
		
		<jsp:include page="../include/header.jsp"/>
		<!-- ENDS HEADER -->
		
		<!-- MAIN -->
			<div class="wrapper cf">
			
			
			
			
				
			<!-- featured -->
			<form role="form" method="post">
			<input type='hidden' name='hno' value="${houseDto.hno}">
			
			<div class="home-featured">
			
				<ul id="filter-buttons">
					<li><a href="#" data-filter="*" class="selected">전체</a></li>
					<li><a href="#" data-filter=".korea">한식</a></li>
					<li><a href="#" data-filter=".usa">양식</a></li>
					<li><a href="#" data-filter=".china">중식</a></li>
					<li><a href="#" data-filter=".japan">일식</a></li>
				</ul>
				
				<!-- Filter container -->
				<div id="filter-container" class="cf">
					<figure class="korea">
						<a href="http://jinia_.blog.me/220844754267" class="thumb"><img src="/resources/img/house/korea1.jpg" alt="alt" /></a>
						<figcaption>
							<a href="http://jinia_.blog.me/220844754267"><h3 class="heading"> ${houseDto.hnm} </h3></a>
							주소 : 경기도 고양시 일산동구 성석동 984-145<br> TEL : 031-977-7740<br>  </figcaption>
					</figure>
					
					<figure class="usa">
						<a href="http://blog.naver.com/dbtlasid/220755101242" class="thumb"><img src="/resources/img/house/usa1.jpg" alt="alt" /></a>
						<figcaption>
							<a href="http://blog.naver.com/dbtlasid/220755101242"><h3 class="heading">쿠킹 신드롬</h3></a>
							주소 : 대구광역시 중구 동성로2길 4-3<br> TEL : 070-7817-1179</figcaption>
					</figure>
					
					
					<figure class="china">
						<a href="http://9001177.blog.me/220844882772" class="thumb"><img src="/resources/img/house/china1.jpg" alt="alt" /></a>
						<figcaption>
							<a href="http://9001177.blog.me/220844882772" ><h3 class="heading">피올리앙</h3></a>
							주소 : 인천 연수구 송도동149 롯데캐슬 204호 <br> TEL : 032-813-8259</figcaption>
					</figure>
					
					
					<figure class="japan">
						<a href="http://blog.naver.com/cvliosd/220853537788" class="thumb"><img src="/resources/img/house/japan1.jpg" alt="alt" /></a>
						<figcaption>
							<a href="http://blog.naver.com/cvliosd/220853537788" ><h3 class="heading">긴 자</h3></a>
							주소 : 서울시 강남구 도산대로 534 / 서울시 강남구 청담동 52-2<br> TEL : 02-3446-8305</figcaption>
					</figure>
					
					
					<figure class="korea">
						<a href="http://blog.naver.com/arashi_pk/220020275574" class="thumb"><img src="/resources/img/house/korea2.jpg" alt="alt" /></a>
						<figcaption>
							<a href="http://blog.naver.com/arashi_pk/220020275574" ><h3 class="heading">모 이</h3></a>
							주소 : 서울특별시 용산구 한남동 30-1 모이 2층 <br> TEL : 02-790-7784 </figcaption>
					</figure>
					
					
					<figure class="usa">
						<a href="http://blog.naver.com/kirara1974/220790557407" class="thumb"><img src="/resources/img/house/usa2.jpg" alt="alt" /></a>
						<figcaption>
							<a href="http://blog.naver.com/kirara1974/220790557407" ><h3 class="heading">양식이자카야800</h3></a>
							주소 : 서울 용산구 이태원로54길 58-5<br> TEL : 02-797-1141</figcaption>
					</figure>
					
					
					<figure class="japan">
						<a href="http://blog.naver.com/eon317/220854836800" class="thumb"><img src="/resources/img/house/japan2.jpg" alt="alt" /></a>
						<figcaption>
							<a href="http://blog.naver.com/eon317/220854836800" ><h3 class="heading">이자와</h3></a>
							주소 : 서울특별시 중구 명동10길 19-3 지하1층 <br> TEL : 02-777-1529</figcaption>
					</figure>
					
					
					<figure class="japan">
						<a href="http://blog.naver.com/tlstnr0612/220851834670" class="thumb"><img src="/resources/img/house/japan3.jpg" alt="alt" /></a>
						<figcaption>
							<a href="http://blog.naver.com/tlstnr0612/220851834670" ><h3 class="heading">란수사</h3></a>
							주소 : 서울특별시 강남구 언주로93길 14-3 <br> TEL : 02-567-2552</figcaption>
					</figure>
					
					
					<figure class="china">
						<a href="http://blog.naver.com/dbal0336/220832552784" class="thumb"><img src="/resources/img/house/china2.jpg" alt="alt" /></a>
						<figcaption>
							<a href="http://blog.naver.com/dbal0336/220832552784" ><h3 class="heading">광안리 홍유단</h3></a>
							주소 : 부산시 수영구 광안해변로 255번길 8 <br> TEL : 051-759-4001</figcaption>
					</figure>
					
				</div><!-- ENDS Filter container -->
				
			</div>
			<!-- ENDS featured -->
			
			
			</form>
			
			</div><!-- ENDS WRAPPER -->
		<!-- ENDS MAIN -->
		
		
		<!-- FOOTER -->
		<jsp:include page="../include/footer.jsp"/>
		<!-- ENDS FOOTER -->
		
	</body>
	
	
	
</html>