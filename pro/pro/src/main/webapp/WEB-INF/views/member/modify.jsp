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
		
		<c:if test="${empty loginMember }">
			<script>
				alert("로그인을 해주세용~");
				location.replace("/member/login");
			</script>
		</c:if>
		<c:if test="${loginMember.mmanyn == 3 || loginMember.mmanyn == 4}">
			<script>
				alert("소셜로그인 사용자는 해당 홈페이지에서 직접 정보를 수정해주세요~");
				location.replace("/member/login");
			</script>
		</c:if>
		<c:if test="${loginMember.mmanyn == 2}">
			<script>
				alert("회원 인증을 먼저 받아주세요.");
				location.replace("/member/login");
			</script>
		</c:if>
	</head>

	<body class="page">
	
		<jsp:include page="../include/header.jsp"/>
		
		<!-- MAIN -->
		<div id="main">
			

			<div id="start" class="wrapper cf">
			
			<!-- page content-->
        	<div id="page-content" class="cf">        	
	        	
	        	
	        	<!-- entry-content -->	
	        	<div class="entry-content cf">
	        	
	        		<div class="one-one last">
						<h2 class="heading">회원정보 수정</h2>
						우리 사이트에 회원가입 하실 큰 결심을 하신 것을 환영합니다. 고객님. 회원가입시 다양하지 않은 정보와 아무 의미도 없는 평점 시스템, 별 내용없는 게시판을 즐길 수 있습니다. 회원가입시 고객님의 개인정보는 저희 사이트에 귀속되며, 후일 고객님의 개인정보는 타 음식점의 정보 공제를 위해 팔려나갈 수 있다는 점을 유의해주시길 바랍니다. 가입시 고객님의  핸드폰번호를 이용해 다양한 소액결제가 이루어질 수 있으며, 이에 대해서 본 사이트는 어떠한 책임도 지지않음을 미리 알립니다. 
					</div>
					<div class="clearfix"><p></p></div>
					<form role="form" method="post" name="frm" id="inputform">
					<div class="last">
						<h4>아이디</h4>
						<input type="text" id="mid" name="mid" maxlength="10" value="${loginMember.mid }" readonly="readonly">
						<input type="hidden" id="cid" name="cid" value="${loginMember.mid }" readonly="readonly">
						<input type="hidden" id="muuid" name="muuid" value="${loginMember.muuid }" readonly="readonly">
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
						<input type="text" id="mnm" name="mnm" maxlength="5" value="${loginMember.mnm }">
						<p></p>
					</div>
					<div>
						<h4>성별</h4>
						<p></p>
						<c:choose>
							<c:when test="${memberDto.mgender == 0 }">
								<label for="mmgender" class="bigfont">남</label><input type="radio" id="mmgender" name="mgender" value="0" checked="checked">&nbsp;
								<label for="mwgender" class="bigfont">여</label><input type="radio" id="mwgender" name="mgender" value="1">
							</c:when>
							<c:otherwise>
								<label for="mmgender" class="bigfont">남</label><input type="radio" id="mmgender" name="mgender" value="0">&nbsp;
								<label for="mwgender" class="bigfont">여</label><input type="radio" id="mwgender" name="mgender" value="1" checked="checked">
							</c:otherwise>
						</c:choose>
						<p></p>
						<p></p>
					</div>
					<div>
						<h4>핸드폰 번호</h4>
						<input type="text" id="fmphone" name="mphone" maxlength="11" value=${memberDto.mphone } placeholder="-없이 입력해주세요">
						<p></p>
					</div>
					<div>
						<h4>이메일</h4>
						<input type="text" id="firstmemail" name="firstmemail" value="${memberDto.firstmemail }"><span class="bigfont"> @ </span>
						<select id="secondmemail" name="secondmemail" class="selectbox">
						<c:choose>
							<c:when test="${memberDto.secondmemail == '@gmail.com' }">
								<option value="@gmail.com" selected="selected">gmail.com</option>							
							</c:when>
							<c:otherwise>
								<option value="@gmail.com">gmail.com</option>							
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${memberDto.secondmemail == '@naver.com' }">
								<option value="@naver.com" selected="selected">naver.com</option>							
							</c:when>
							<c:otherwise>
								<option value="@naver.com">naver.com</option>							
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${memberDto.secondmemail == '@nate.com' }">
								<option value="@nate.com" selected="selected">nate.com</option>							
							</c:when>
							<c:otherwise>
								<option value="@nate.com">nate.com</option>							
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${memberDto.secondmemail == '@daum.net' }">
								<option value="@daum.net" selected="selected">daum.net</option>						
							</c:when>
							<c:otherwise>
								<option value="@daum.net">daum.net</option>						
							</c:otherwise>
						</c:choose>
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