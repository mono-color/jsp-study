<%@page import="java.net.URLEncoder"%>
<%@page import="com.study.common.util.CookieUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/inc/header.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/inc/top.jsp"%>
	<%
		Cookie cookie = new Cookie("AUTH", "");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		response.sendRedirect("login.jsp?msg=logout");
	%>

</body>
</html>
