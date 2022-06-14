<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<%
		String age30 = "가나혜, 최윤정, 한창희, 임동성, 정찬웅";
		request.setAttribute("aa", age30);
	%>
	<c:forTokens items="${aa }" delims="," var="a">
		<h2>${a }</h2>
	</c:forTokens>





</body>
</html>