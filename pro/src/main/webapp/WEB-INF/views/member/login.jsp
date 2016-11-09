<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html> 
<html class="no-js">

<head>
	<link rel="stylesheet" media="all" href="/css/style.css"/>
	<link rel="stylesheet" media="all" href="/css/skin.css"/>
	
	<!-- 버튼 장식용  -->	
	<link rel="stylesheet" href="/css/elements.css"/>
	<!-- 로그인 from 장식용 -->
	<link rel="stylesheet" href="/css/formlogin.css"/>
	
	<style type="text/css">
		.a{
			width: 40px;
		}
		.bigfont{
			font-weight:bold;
			font-size: 20px;
		}
	</style>
</head>
	
	
<body class="page">
	
	<header>
	</header>
		
	<!-- MAIN -->
	<div id="main">
		<div class="wrapper cf">
			
			
			
		<!-- page content-->
       	<div id="page-content" class="cf">        	
	        	
	        	
        	<!-- entry-content -->	
        	<div class="entry-content cf">
	        	
				<form action="single.html" method="post" id="loginform">
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
				<input type="submit" class="link-button green" value=" 로그인 "/>
				<input type="button" id="censle" class="link-button red" value=" 취소 "/>
				</form>
				<div id="fb-root"></div>
				<script>
					(function(d, s, id) {
						var js, fjs = d.getElementsByTagName(s)[0];
						if (d.getElementById(id)) return;
						js = d.createElement(s); js.id = id;
						js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8&appId=1066099180183227";
						fjs.parentNode.insertBefore(js, fjs);
					}(document, 'script', 'facebook-jssdk'));
				</script>
				<div class="fb-login-button" data-max-rows="1" data-size="xlarge" data-show-faces="false" data-auto-logout-link="false"></div>
			</div>
				
   		</div>
			
			
			
		</div>
	</div>
		
</body>
	
	
	
</html>