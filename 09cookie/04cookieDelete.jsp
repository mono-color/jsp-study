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
		// 쿠키는 브라우저가 저장
		// 서버는 브라우저한테 쿠키를 삭제하도록 명령(response에 쿠키관련 무언가 해야한다)
		// 쿠키 삭제 메소드는 없어.
		// 브라우저는 같은 이름의 쿠키가 response에 실려져 있으면
		// 기존에 있는 쿠키대신 새로 온걸로 교체
		// 즉, 삭제 : 쿠키를 새로 만들어서 response에 실어서 보냄. 이 때 cookie maxAge를 0으로

		// han이라는 쿠키를 삭제해보자...
		Cookie cookie = new Cookie("next", "asdasdsa");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	%>





</body>
</html>