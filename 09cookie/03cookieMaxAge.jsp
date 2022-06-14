<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		Cookie cookie = new Cookie("next", "it");
		//기본적으로 maxAge = -1, -1 : 브라우저 뜨면 사라짐
		cookie.setMaxAge(30); // 0이상으로 설정하면 브라우저가 꺼져도 남아있음
								// 단, 해당시간이 지나면 무조건 사라짐
		response.addCookie(cookie);
	%>





</body>
</html>