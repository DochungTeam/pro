<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html> 
<html class="no-js">

	<head>
		<meta charset="utf-8"/>
		<title>FOLDER TEMPLATE</title>
		
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		
		<jsp:include page="../include/script.jsp"/>
		<script src="/resources/js/insertmember.js"></script>
		
		<!-- 회원가입 from 장식용 -->
		<link rel="stylesheet" href="/resources/css/forminput.css"/>
		
		<script src="http://connect.facebook.net/ko_KR/all.js"></script>
		<script>
		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);
			
			if (response.status === 'connected') {
			} else if (response.status === 'not_authorized') {
			} else {
			}
		}

		//로그인 여부 체크
		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}

		window.fbAsyncInit = function() {
			FB.init({
				appId : '{1066099180183227}',
				cookie : true,
				xfbml : true,
				version : 'v2.8'
			});

//			초기화 스크립트.
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});

		};

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
		
		
		</script>
		
		<script type="text/javascript">
		$(document).ready(function(){
			$(".checkId").on("click", function(){
				
				
				var mid = $("#mid").val();
				
				$.ajax({
					type : 'post',
					url : '/member/idcheck/',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "PUT"
					},
					data : JSON.stringify({mid:mid}),
					dataType : "text",
					success : function(result){
						alert(result);
						console.log("result : " + result);
						if(result == "SUCCESS"){
							alert("사용 가능한 아이디입니다!");
							$("#cid").val(mid);
							
						}else if(result == "FALL"){
							alert("사용 못합니당~");
							$("#mid").val("");
						}
						
					}
					
				});
			});
			
		});
		
		</script>
		
		<style type="text/css">
			.phonetext{
				width: 40px;
			}
			.bigfont{
				font-weight:bold;
				font-size: 20px;
			}
			
			.addrinput{
				width: 700px;
			}
		</style>
	</head>

	<body class="page">
		<jsp:include page="../include/header.jsp"/>
		<!-- MAIN -->
		<div id="main">
			<div id="start" class="wrapper cf">
			
			<jsp:include page="../include/mainheader.jsp"/>
			<!-- page content-->
        	<div id="page-content" class="cf">        	
	        	
	        	
	        	<!-- entry-content -->	
	        	<div class="entry-content cf">
	        	
	        		<div class="one-one last">
						<h2 class="heading">회원가입</h2>
						우리 사이트에 회원가입 하실 큰 결심을 하신 것을 환영합니다. 고객님. 회원가입시 다양하지 않은 정보와 아무 의미도 없는 평점 시스템, 별 내용없는 게시판을 즐길 수 있습니다. 회원가입시 고객님의 개인정보는 저희 사이트에 귀속되며, 후일 고객님의 개인정보는 타 음식점의 정보 공제를 위해 팔려나갈 수 있다는 점을 유의해주시길 바랍니다. 가입시 고객님의  핸드폰번호를 이용해 다양한 소액결제가 이루어질 수 있으며, 이에 대해서 본 사이트는 어떠한 책임도 지지않음을 미리 알립니다. 
					</div>
					<div class="clearfix"><p></p></div>
					<form role="form" method="post" name="frm" id="inputform">
					<div class="last">
						<h4>아이디</h4>
						<input type="text" id="mid" name="mid" maxlength="10">
						<input type="hidden" id="cid" name="cid" value="">
						<input type="button" class="checkId" value="중복검사">
						<p></p>
					</div>
					<div class="last">
						<h4>비밀번호</h4>
						<input type="password" id="mpw" name="mpw" maxlength="20">
						<p></p>
					</div>
					<div class="last">
						<h4>비밀번호 확인</h4>
						<input type="password" id="rempw" name="rempw" maxlength="20">
						<p></p>
					</div>
					<div class="last">
						<h4>성명</h4>
						<input type="text" id="mnm" name="mnm" maxlength="5">
						<p></p>
					</div>
					<div>
						<h4>성별</h4>
						<p></p>
						<label for="mmgender" class="bigfont">남</label><input type="radio" id="mmgender" name="mgender" value="0" checked="checked">&nbsp;
						<label for="mwgender" class="bigfont">여</label><input type="radio" id="mwgender" name="mgender" value="1">
						<p></p>
						<p></p>
					</div>
					<div>
						<h4>핸드폰 번호</h4>
						<input type="text" id="fmphone" name="mphone" maxlength="11" placeholder="-없이 입력해주세요">
						<p></p>
					</div>
					<div>
						<h4>이메일</h4>
						<input type="text" id="firstmemail" name="firstmemail"><span class="bigfont"> @ </span>
						<select id="secondmemail" name="secondmemail" class="selectbox">
							<option value="@gmail.com">gmail.com</option>							
							<option value="@naver.com">naver.com</option>							
							<option value="@nate.com">nate.com</option>							
							<option value="@daum.net">daum.net</option>							
						</select>
					</div>
					<input type="submit" class="link-button green" onclick="return membercheck_ok();" value="&nbsp;등록&nbsp;"/>
					<input type="button" id="cencle" class="link-button red" value="&nbsp;취소&nbsp;"/>
					</form>
	        		
	        		
										
				</div>
				<!-- ENDS entry-content -->	
				
    		</div>
    		<!-- ENDS page content-->
			
			
			
			</div><!-- ENDS WRAPPER -->
		</div>
		<!-- ENDS MAIN -->
		
		<jsp:include page="../include/footer.jsp"/>
		
		
	</body>
	
	
	
</html>