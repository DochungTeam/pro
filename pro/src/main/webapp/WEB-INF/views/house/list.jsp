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
				
				<%-- <c:forEach items="${list}" var="houseDto"> --%>
				
					<figure class="${houseDto.hkind}">
						<a href="${houseDto.hurl}" class="thumb"><img src="/resources/img/house/korea1.jpg" alt="alt" /></a>
						<figcaption>
							<a href="${houseDto.hurl}"><h3 class="heading"> ${houseDto.hnm} </h3></a>
							주소 : ${houseDto.hzipcode}<br> TEL : ${houseDto.hphone}<br>  </figcaption>
					</figure>
				
				<%-- </c:forEach> --%>	
					
				</div><!-- ENDS Filter container -->
				
			</div>
			<!-- ENDS featured -->
			
			
			
			</div><!-- ENDS WRAPPER -->
		<!-- ENDS MAIN -->
		
		
		<!-- FOOTER -->
		<jsp:include page="../include/footer.jsp"/>
		<!-- ENDS FOOTER -->
		
	</body>
	
	
	
</html>