<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js">

<head>
<meta name="google-signin-scope" content="profile email">

<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>

<link rel="stylesheet" media="all" href="/resources/css/style.css" />
<link rel="stylesheet" media="all" href="/resources/css/skin.css" />
<script src="/resources/js/jquery-1.7.1.min.js"></script>
	
<!-- 버튼 장식용  -->
<link rel="stylesheet" href="/resources/css/elements.css" />
<!-- 로그인 from 장식용 -->
<link rel="stylesheet" href="/resources/css/formlogin.css" />

<!-- 소셜로그인 장식용 -->
<link rel="stylesheet" href="/resources/css/sociallogin.css" />


<style type="text/css">
.a {
	width: 40px;
}

.bigfont {
	font-weight: bold;
	font-size: 20px;
}
</style>
<script src="http://connect.facebook.net/ko_KR/all.js"></script>
<script type="text/javascript">
	

	//페이스북

	//페이스북 appid, 버전 입력
	window.fbAsyncInit = function() {
		FB.init({
			appId : '{1066099180183227}',
			status : true,
			cookie : true,
			xfbml : true,
			version : 'v2.8'
		});
		
	//	초기화 스크립트.
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
		
	};

	function statusChangeCallback(response) {
		console.log('statusChangeCallback');
		console.log(response);
		
		
		if (response.status === 'connected') {
			
		} else if (response.status === 'not_authorized') {
			alert("권한 못받음. ㅎ");
		} else {
			alert("로그인이 안됨 ㅎㅎ;;");
		}
	}

	//페이스북 로그인 여부 체크
	function checkLoginState() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}

	
	
	//익명 즉시실행 함수, 함수를 정의함과 동시에 실행. 이후 다시 실행되지 않음.
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.8&appId=1066099180183227";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	function testAPI() {
		console.log('Welcome!  Fetching your information.... ');
		FB.api(
			'/me',
			function(response) {
				console.log('Successful login for: '+ response.name);
				document.getElementById('status').innerHTML 
					= 'Thanks for logging in, '	+ response.name + '!';
			});
	}
	
	function faceLogin(){
		FB.login(function(response) {
		},{scope: 'email'});
		
		
		FB.getLoginStatus(function(response) {
			faceLoginSubmit(response);				
		});
	}
	
	function faceLoginSubmit(response){
		if(response.status === 'connected'){
			var frm = document.frm;
			FB.api('/me', {fields: 'name,email'}, function(result){
				alert(result.email);
				$("#mid").val("");
				$("#mpw").val("");
				$("#mnm").val(result.name);
				$("#memail").val(result.email);
				$("#muuid").val(result.id);
				$("#mmanyn").val("3");
				frm.submit();
			});
		}
	}
	
	// 구글 로그인
	
	var googleUser = {};
	  var startApp = function() {
	    gapi.load('auth2', function(){
	      // Retrieve the singleton for the GoogleAuth library and set up the client.
	      auth2 = gapi.auth2.init({
	        client_id: '516768670649-csqp0komrhs8q8iocbtf9c2hmulfeqq8.apps.googleusercontent.com',
	        cookiepolicy: 'single_host_origin',
	        // Request scopes in addition to 'profile' and 'email'
	        //scope: 'additional_scope'
	      });
	      attachSignin(document.getElementById('sns_google'));
	    });
	  };

	function attachSignin(element) {
		console.log(element.id);
		auth2.attachClickHandler(element, {},
		function(googleUser) {
			document.getElementById('name').innerText = "Signed in: " +
			googleUser.getBasicProfile().getName();
			var frm = document.frm;
			$("#mid").val("");
			$("#mpw").val("");
			$("#mnm").val(googleUser.getBasicProfile().getName());
			$("#memail").val(googleUser.getBasicProfile().getEmail());
			$("#muuid").val(googleUser.getBasicProfile().getId());
			$("#mmanyn").val("4");
			frm.submit();
		}, function(error) {
			alert(JSON.stringify(error, undefined, 2));
		});
	}
	
	
	  
	  function onSignIn(googleUser) {

		  
		    var profile = googleUser.getBasicProfile();

		    /*
		    jQuery("#id").html(profile.getId());
		    jQuery("#name").html(profile.getName());
		    jQuery("#email").html(profile.getEmail());
		    jQuery("#image_url").attr('src', profile.getImageUrl());
		    */
		}
	  
	</script>
</head>
	
	
<body class="page">

	<header> </header>

	<!-- MAIN -->
	<div id="main">
		<div class="wrapper cf">



			<!-- page content-->
			<div id="page-content" class="cf">


				<!-- entry-content -->
				<div class="entry-content cf">

					<form method="post" name="frm" id="loginform">
						<div class="last">
							<h5>아이디</h5>
							<input type="text" id="mid" name="mid" maxlength="10">
							<p></p>
						</div>
						<div class="last">
							<h5>비밀번호</h5>
							<input type="password" id="mpw" name="mpw" maxlength="20">
							<p></p>
							<input type="hidden" id="mnm" name="mnm" value="null"/>
							<input type="hidden" id="memail" name="memail" value="null"/>
							<input type="hidden" id="muuid" name="muuid" value="null"/>
							<input type="hidden" id="mmanyn" name="mmanyn" value="2"/>
						</div>
						<input type="submit" class="link-button green" value=" 로그인 " /> 
						<input type="button" id="censle" class="link-button red" value=" 취소 " />
					</form>
					<div id="sns_facebook">
						<button class="loginBtn" onclick="faceLogin();">
							<span class="icon"></span>
							<span class="buttonText">페이스북 로그인</span>	
						</button>
					</div>
					<div id="sns_google">
						<button class="loginBtn" onclick="onSignIn">
							<span class="icon"></span>
							<span class="buttonText">구글 로그인</span>	
						</button>
					</div>
					
					<div id="status"></div>
					<div id="name"></div>
					<script>startApp();</script>
				</div>

			</div>



		</div>
	</div>

</body>



</html>