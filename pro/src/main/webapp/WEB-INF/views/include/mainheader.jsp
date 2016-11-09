<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
		<header>
			<div class="wrapper cf">
				
				<div id="logo">
					<a href="/index2"><img  src="/resources/img/logo.png" alt="Simpler"></a>
				</div>
				
				<!-- nav -->
				<ul id="nav" class="sf-menu">
					<li class="current-menu-item"><a href="/index2">홈</a></li>
					<li><a href="/blog">BLOG</a></li>
					<li><a href="/page">이것저것</a>
						<ul>
							<li><a href="/pe">다양한 요소들</a></li>
							<li><a href="/pi">아이콘들</a></li>
							<li><a href="/pt">폰트들</a></li>
						</ul>
					</li>
					<li><a href="/portfolio">포트폴리오</a></li>
					<li><a href="/contact">콘텍트</a></li>
				</ul>
				<div id="combo-holder"></div>
				<!-- ends nav -->
				
				
				<!-- SLIDER -->				
				<div id="home-slider" class="lof-slidecontent">
					
					<div class="preload"><div></div></div>
					
					<!-- slider content --> 
					<div class="main-slider-content" >
					<ul class="sliders-wrap-inner">
					    <li>
					          <img src="/resources/img/dummies/slides/01.jpg" title="" alt="alt" />           
					          <div class="slider-description">
					            <h4>Lorem ipsum dolor</h4>
					            <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est...
					            <a class="link" href="#">Read more </a>
					            </p>
					         </div>
					    </li>
					    
					    <li>
					          <img src="/resources/img/dummies/slides/02.jpg" title="" alt="alt" />           
					          <div class="slider-description">
					            <h4>Lorem ipsum dolor</h4>
					            <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est...
					            <a class="link" href="#">Read more </a>
					            </p>
					         </div>
					    </li>
					    
					    <li>
					          <img src="/resources/img/dummies/slides/03.jpg" title="" alt="alt" />           
					          <div class="slider-description">
					            <h4>Lorem ipsum dolor</h4>
					            <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est...
					            <a class="link" href="#">Read more </a>
					            </p>
					         </div>
					    </li>
					    
					    <li>
					          <img src="/resources/img/dummies/slides/04.jpg" title="" alt="alt" />           
					          <div class="slider-description">
					            <h4>Lorem ipsum dolor</h4>
					            <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est...
					            <a class="link" href="#">Read more </a>
					            </p>
					         </div>
					    </li>
					    
					    <li>
					          <img src="/resources/img/dummies/slides/05.jpg" title="" alt="alt" />           
					          <div class="slider-description">
					            <h4>Lorem ipsum dolor</h4>
					            <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est...
					            <a class="link" href="#">Read more </a>
					            </p>
					         </div>
					    </li>
					    
					    <li>
					          <img src="/resources/img/dummies/slides/06.jpg" title="" alt="alt" />           
					          <div class="slider-description">
					            <h4>Lorem ipsum dolor</h4>
					            <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est...
					            <a class="link" href="#">Read more </a>
					            </p>
					         </div>
					    </li>
					    
					    <li>
					          <img src="/resources/img/dummies/slides/07.jpg" title="" alt="alt" />           
					          <div class="slider-description">
					            <h4>Lorem ipsum dolor</h4>
					            <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est...
					            <a class="link" href="#">Read more </a>
					            </p>
					         </div>
					    </li>
					    
					  </ul>  	
					</div>
					<!-- ENDS slider content --> 
				           
					<!-- slider nav -->
					<div class="navigator-content">
					  <div class="navigator-wrapper">
					        <ul class="navigator-wrap-inner">
					           <li><img src="/resources/img/dummies/slides/01_thumb.jpg" alt="alt" /></li>
					           <li><img src="/resources/img/dummies/slides/02_thumb.jpg" alt="alt" /></li>
					           <li><img src="/resources/img/dummies/slides/03_thumb.jpg" alt="alt" /></li>
					           <li><img src="/resources/img/dummies/slides/04_thumb.jpg" alt="alt" /></li>
					           <li><img src="/resources/img/dummies/slides/05_thumb.jpg" alt="alt" /></li>
					           <li><img src="/resources/img/dummies/slides/06_thumb.jpg" alt="alt" /></li>
					           <li><img src="/resources/img/dummies/slides/07_thumb.jpg" alt="alt" /></li>
					        </ul>
					  </div>
					  <div class="button-next">Next</div>
					  <div  class="button-previous">Previous</div>
					  <!-- REMOVED TILL FIXED <div class="button-control"><span>STOP</span></div> -->
					</div> 
					<!-- slider nav -->
					
					
				          
				 </div> 
				<!-- ENDS SLIDER -->





			</div>
		</header>