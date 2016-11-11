<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html> 
<html class="no-js">

	<head>
		<meta charset="utf-8"/>
		<title>인증~</title>
		<script src="/resources/js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
					if('${msg}' == 'SUCCESS'){
						alert("회원 인증에 성공하셨습니다.");
					}else if('${msg}' == 'FALL'){
						alert("회원 인증 정보가 올바르지 않습니다.");
					}else{
						alert("비 정상적인 접근입니다.");
					}
					location.replace("/member/main");
			});
		</script>
		
	</head>
	
	
	<body class="page">
	</body>
	
	
	
</html>