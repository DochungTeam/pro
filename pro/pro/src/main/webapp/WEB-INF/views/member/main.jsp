<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js">
	<head>
		<title>메인화면</title>
		<jsp:include page="../include/script.jsp"/>
		<script src="/resources/js/jquery-1.7.1.min.js"></script>
	</head>
	
	<body class="home">
	
		<!-- HEADER -->
		
		<jsp:include page="../include/header.jsp"/>
		<!-- ENDS HEADER -->
		
		<!-- MAIN -->
		<div id="main">
			<div class="wrapper cf">
			
			
			
			
				
			<!-- featured -->
			<div class="home-featured">
			
				<ul id="filter-buttons">
					<li><a href="#" data-filter="*" class="selected">show all</a></li>
					<li><a href="#" data-filter=".web">${loginMember.muuid }</a></li>
					<li><a href="#" data-filter=".design">${loginMember.mid }</a></li>
					<li><a href="#" data-filter=".print">${loginMember.mmanyn }</a></li>
					<li><a href="#" data-filter=".photo">${loginMember.mnm }</a></li>
				</ul>
				
				<!-- Filter container -->
				<div id="filter-container" class="cf">
					<figure class="web">
						<a href="project.html" class="thumb"><img src="/resources/img/dummies/featured/01.jpg" alt="alt" /></a>
						<figcaption>
							<a href="project.html"><h3 class="heading">Pellentesque </h3></a>
							Tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. </figcaption>
					</figure>
					
					<figure class="print">
						<a href="project.html" class="thumb"><img src="/resources/img/dummies/featured/02.jpg" alt="alt" /></a>
						<figcaption>
							<a href="project.html"><h3 class="heading">Pellentesque habitant morbi</h3></a>
							Tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. </figcaption>
					</figure>
					
					
					<figure class="design">
						<a href="project.html" class="thumb"><img src="/resources/img/dummies/featured/03.jpg" alt="alt" /></a>
						<figcaption>
							<a href="project.html" ><h3 class="heading">Habitant morbi</h3></a>
							Tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. </figcaption>
					</figure>
					
					
					<figure class="photo">
						<a href="project.html" class="thumb"><img src="/resources/img/dummies/featured/04.jpg" alt="alt" /></a>
						<figcaption>
							<a href="project.html" ><h3 class="heading">Pellentesque habitant morbi</h3></a>
							Tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. </figcaption>
					</figure>
					
					
					<figure class="web photo">
						<a href="project.html" class="thumb"><img src="/resources/img/dummies/featured/05.jpg" alt="alt" /></a>
						<figcaption>
							<a href="project.html" ><h3 class="heading">Pellentesque habitant morbi</h3></a>
							Tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. </figcaption>
					</figure>
					
					
					<figure class="web print">
						<a href="project.html" class="thumb"><img src="/resources/img/dummies/featured/06.jpg" alt="alt" /></a>
						<figcaption>
							<a href="project.html" ><h3 class="heading">Pellentesque habitant morbi</h3></a>
							Tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. </figcaption>
					</figure>
					
					
					<figure class="photo">
						<a href="project.html" class="thumb"><img src="/resources/img/dummies/featured/04.jpg" alt="alt" /></a>
						<figcaption>
							<a href="project.html" ><h3 class="heading">Pellentesque habitant morbi</h3></a>
							Tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. </figcaption>
					</figure>
					
					
					<figure class="web photo">
						<a href="project.html" class="thumb"><img src="/resources/img/dummies/featured/05.jpg" alt="alt" /></a>
						<figcaption>
							<a href="project.html" ><h3 class="heading">Pellentesque habitant morbi</h3></a>
							Tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. </figcaption>
					</figure>
					
					
					<figure class="web print">
						<a href="project.html" class="thumb"><img src="/resources/img/dummies/featured/01.jpg" alt="alt" /></a>
						<figcaption>
							<a href="project.html" ><h3 class="heading">Pellentesque habitant morbi</h3></a>
							Tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. </figcaption>
					</figure>
					
				</div><!-- ENDS Filter container -->
				
			</div>
			<!-- ENDS featured -->
			
			
			
			
			</div><!-- ENDS WRAPPER -->
		</div>
		<!-- ENDS MAIN -->
		
		
		<!-- FOOTER -->
		<jsp:include page="../include/footer.jsp"/>
		<!-- ENDS FOOTER -->
		
	</body>
	
	
	
</html>