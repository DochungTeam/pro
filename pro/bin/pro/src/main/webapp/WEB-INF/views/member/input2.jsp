<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html> 
<html class="no-js">

	<head>
		<meta charset="utf-8"/>
		<title>FOLDER TEMPLATE</title>
		
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link rel="stylesheet" media="all" href="/css/style.css"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<!-- Adding "maximum-scale=1" fixes the Mobile Safari auto-zoom bug: http://filamentgroup.com/examples/iosScaleBug/ -->		
				
		<!-- JS -->
		<script src="/js/jquery-1.7.1.min.js"></script>
		<script src="/js/custom.js"></script>
		<script src="/js/tabs.js"></script>
		<script src="/js/css3-mediaqueries.js"></script>
		<script src="/js/jquery.columnizer.min.js"></script>
		
		<!-- Isotope -->
		<script src="/js/jquery.isotope.min.js"></script>
		
		<!-- Tweet -->
		<link rel="stylesheet" href="/css/jquery.tweet.css" media="all"  /> 
		<script src="/js/tweet/jquery.tweet.js" ></script> 
		<!-- ENDS Tweet -->
		
		<!-- superfish -->
		<link rel="stylesheet" media="screen" href="/css/superfish.css" /> 
		<script  src="/js/superfish-1.4.8/js/hoverIntent.js"></script>
		<script  src="/js/superfish-1.4.8/js/superfish.js"></script>
		<script  src="/js/superfish-1.4.8/js/supersubs.js"></script>
		<!-- ENDS superfish -->
		
		<!-- prettyPhoto -->
		<script  src="/js/prettyPhoto/js/jquery.prettyPhoto.js"></script>
		<link rel="stylesheet" href="/js/prettyPhoto/css/prettyPhoto.css"  media="screen" />
		<!-- ENDS prettyPhoto -->
		
		<!-- poshytip -->
		<link rel="stylesheet" href="/js/poshytip-1.1/src/tip-twitter/tip-twitter.css"  />
		<link rel="stylesheet" href="/js/poshytip-1.1/src/tip-yellowsimple/tip-yellowsimple.css"  />
		<script  src="/js/poshytip-1.1/src/jquery.poshytip.min.js"></script>
		<!-- ENDS poshytip -->
		
		<!-- JCarousel -->
		<script type="text/javascript" src="/js/jquery.jcarousel.min.js"></script>
		<link rel="stylesheet" media="screen" href="/css/carousel.css" /> 
		<!-- ENDS JCarousel -->
		
		<!-- GOOGLE FONTS -->
		<link href='http://fonts.googleapis.com/css?family=Voltaire' rel='stylesheet' type='text/css'>

		<!-- modernizr -->
		<script src="/js/modernizr.js"></script>
		
		<!-- SKIN -->
		<link rel="stylesheet" media="all" href="/css/skin.css"/>
		
		<!-- Less framework -->
		<link rel="stylesheet" media="all" href="/css/lessframework.css"/>
		
		<!-- jplayer -->
		<link href="/css/player-skin/jplayer-black-and-yellow.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="/js/jquery.jplayer.min.js"></script>
		
		<!-- flexslider -->
		<link rel="stylesheet" href="/css/flexslider.css" >
		<script src="/js/jquery.flexslider.js"></script>
		
		<!-- reply move form -->
		<script src="/js/moveform.js"></script>
		
		<!-- 회원가입 from 장식용 -->
		<link rel="stylesheet" href="/css/forminput.css"/>
		
		<style type="text/css">
			.phonetext{
				width: 40px;
			}
			.bigfont{
				font-weight:bold;
				font-size: 20px;
			}
		</style>
		
		
	</head>
	
	
	<body class="page">
	
		<!-- HEADER -->
		<header>
			<div class="wrapper cf">
				
				<div id="logo">
					<a href="index.html"><img  src="/img/logo.png" alt="Simpler"></a>
				</div>
				
				<!-- nav -->
				<ul id="nav" class="sf-menu">
					<li><a href="index.html"><span>HOME</span></a></li>
					<li><a href="blog.html">BLOG</a></li>
					<li class="current-menu-item"><a href="page.html">ABOUT</a>
						<ul>
							<li><a href="page-elements.html">Elements</a></li>
							<li><a href="page-icons.html">Icons</a></li>
							<li><a href="page-typography.html">Typography</a></li>
						</ul>
					</li>
					<li><a href="portfolio.html">WORK</a></li>
					<li><a href="contact.html">CONTACT</a></li>
				</ul>
				<div id="combo-holder"></div>
				<!-- ends nav -->

			</div>
		</header>
		<!-- ENDS HEADER -->
		
		<!-- MAIN -->
		<div id="main">
			<div class="wrapper cf">
			
			
			
			<!-- page content-->
        	<div id="page-content" class="cf">        	
	        	
	        	
	        	<!-- entry-content -->	
	        	<div class="entry-content cf">
	        	
	        		<div class="one-one last">
						<h2 class="heading">회원가입</h2>
						우리 사이트에 회원가입 하실 큰 결심을 하신 것을 환영합니다. 고객님. 회원가입시 다양하지 않은 정보와 아무 의미도 없는 평점 시스템, 별 내용없는 게시판을 즐길 수 있습니다. 회원가입시 고객님의 개인정보는 저희 사이트에 귀속되며, 후일 고객님의 개인정보는 타 음식점의 정보 공제를 위해 팔려나갈 수 있다는 점을 유의해주시길 바랍니다. 가입시 고객님의  핸드폰번호를 이용해 다양한 소액결제가 이루어질 수 있으며, 이에 대해서 본 사이트는 어떠한 책임도 지지않음을 미리 알립니다. 
					</div>
					<div class="clearfix"><p></p></div>
					<form action="single.html" method="post" id="inputform">
					<div class="last">
						<h5>아이디</h5>
						<input type="text" id="mid" name="mid" maxlength="10">
						<p></p>
					</div>
					<div class="last">
						<h5>비밀번호</h5>
						<input type="password" id="mpw" name="mpw" maxlength="20">
						<p></p>
					</div>
					<div class="last">
						<h5>비밀번호 확인</h5>
						<input type="password" id="rempw" name="rempw" maxlength="20">
						<p></p>
					</div>
					<div class="last">
						<h5>성명</h5>
						<input type="password" id="mnm" name="mnm" maxlength="5">
						<p></p>
					</div>
					<div>
						<h5>성별</h5>
						남<input type="radio" size="100px" id="mgender" name="mgender">&nbsp;
						여<input type="radio" id="mgender" name="mgender">
						<p></p>
					</div>
					<div>
						<h5>핸드폰 번호</h5>
						<input type="text" id="fmphone" name="fmphone" class="phonetext"> <span class="bigfont">─</span> 
						<input type="text" id="smphone" name="smphone" class="phonetext"> <span class="bigfont">─</span> 
						<input type="text" id="tmphone" name="tmphone" class="phonetext">
					</div>
					<div>
						<h5>우편번호</h5>
						<input type="text" id="maddrcd" name="maddrcd" readonly="readonly">
						<p></p>
					</div>
					<div>
						<h5>주소 &nbsp; <input type="button" id="addrbtn" value="주소찾기"></h5>
						<input type="text" id="maddr" name="maddr" readonly="readonly">
						<p></p>
					</div>
					<div>
						<h5>이메일</h5>
						<input type="text" id="firstmemail" name="firstmemail">
						<select id="secondmemail" name="secondmemail">
							<option value="@gmail.com">gmail.com</option>							
							<option value="@naver.com">naver.com</option>							
							<option value="@nate.com">naver.com</option>							
							<option value="@daum.net">naver.com</option>							
						</select>
					</div>
					</form>
					<button id="subbtn" class="link-button green">&nbsp;등록&nbsp;</button>
					<button id="cencle" class="link-button red">&nbsp;취소&nbsp;</button>
	        		
	        		
										
				</div>
				<!-- ENDS entry-content -->	
				
    		</div>
    		<!-- ENDS page content-->
			
			
			
			</div><!-- ENDS WRAPPER -->
		</div>
		<!-- ENDS MAIN -->
		
		
		<!-- FOOTER -->
		<footer>
			<div class="wrapper cf">
			
				<!-- widgets -->
				<ul  class="widget-cols cf">
					<li class="first-col">
						
						<div class="widget-block">
							<h4>RECENT POSTS</h4>
							<div class="recent-post cf">
								<a href="#" class="thumb"><img src="/img/dummies/54x54.gif" alt="Post" /></a>
								<div class="post-head">
									<a href="#">Pellentesque habitant morbi senectus</a><span> March 12, 2011</span>
								</div>
							</div>
							<div class="recent-post cf">
								<a href="#" class="thumb"><img src="/img/dummies/54x54.gif" alt="Post" /></a>
								<div class="post-head">
									<a href="#">Pellentesque habitant morbi senectus</a><span> March 12, 2011</span>
								</div>
							</div>
							<div class="recent-post cf">
								<a href="#" class="thumb"><img src="/img/dummies/54x54.gif" alt="Post" /></a>
								<div class="post-head">
									<a href="#">Pellentesque habitant morbi senectus</a><span> March 12, 2011</span>
								</div>
							</div>
						</div>
					</li>
					
					<li class="second-col">
						
						<div class="widget-block">
							<h4>ABOUT</h4>
							<p>Folder it's completely free this means you don't have to pay anything <a href="http://luiszuno.com/blog/license" tar >read license</a>.</p> 
							<p>Visit <a href="http://templatecreme.com/" >Template Creme</a> and find the most beautiful free templates up to date.</p>
						</div>
						
					</li>
					
					<li class="third-col">
						
						<div class="widget-block">
							<div id="tweets" class="footer-col tweet">
		         				<h4>TWITTER WIDGET</h4>
		         			</div>
		         		</div>
		         		
					</li>
					
					<li class="fourth-col">
						
						<div class="widget-block">
							<h4>CATEGORIES</h4>
							<ul>
								<li class="cat-item"><a href="#" >Design</a></li>
								<li class="cat-item"><a href="#" >Photo</a></li>
								<li class="cat-item"><a href="#" >Art</a></li>
								<li class="cat-item"><a href="#" >Game</a></li>
								<li class="cat-item"><a href="#" >Film</a></li>
								<li class="cat-item"><a href="#" >TV</a></li>
							</ul>
						</div>
		         		
					</li>	
				</ul>
				<!-- ENDS widgets -->	
				
				
				<!-- bottom -->
				<div class="footer-bottom">
					<div class="left">by <a href="http://luiszuno.com" >luiszuno.com</a></div>
						<ul id="social-bar" class="cf sb">
							<li><a href="http://www.facebook.com"  title="Become a fan" class="facebook">Facebbok</a></li>
							<li><a href="http://www.twitter.com" title="Follow my tweets" class="twitter"></a></li>
							<li><a href="http://plus.google.com" title="Enter my circles" class="plus"></a></li>
						</ul>
				</div>	
				<!-- ENDS bottom -->
			
			</div>
		</footer>
		<!-- ENDS FOOTER -->
		
	</body>
	
	
	
</html>