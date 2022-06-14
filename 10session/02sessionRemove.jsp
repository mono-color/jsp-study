<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/inc/header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>
02sessionRemove

<%
	session.removeAttribute("user");  //session에서 해당 데이터만 삭제
	// session.invalidate(); //session 자체를 삭제
%>





</body>
</html>