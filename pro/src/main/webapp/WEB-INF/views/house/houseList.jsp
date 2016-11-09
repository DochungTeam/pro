<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form >
		<input type="text" name="keyword">
		<input type="submit" value="검색">
	</form>
	
	<table>
		<tr>
			<td colspan="7" width="100%" bgcolor="pink"></td>
			
		</tr>
		<c:forEach items="${list}" var="houseDto">
		
			<tr>
				<td>${houseDto.hno }</td>
				<td rowspan="2">${houseDto.hnm}</td>
				<td>${houseDto.hcontent }</td>
				<td>${houseDto.hphone }</td>
				<td><fmt:formatDate value="${houseDto.htimie}" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${houseDto.hkind }</td>
				<td>${houseDto.haddr }</td>
		</tr>
			</tr>		
		</c:forEach>	
	</table>
</body>
</html>