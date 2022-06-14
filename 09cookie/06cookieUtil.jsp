<%@page import="com.study.common.util.CookieUtils"%>
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
		//브라우저에서 온 특정 쿠키를 찾으려할 때
		// for문 + if문 => 어렵다, 귀찮다.
		/* Cookie[] cookies = request.getCookies();
		if(cookies !=null){
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("han")){
					
				}
			}
		} */

		CookieUtils cookieUtils = new CookieUtils(request);
		if (cookieUtils.exists("han")) {
			Cookie cookie = cookieUtils.getCookie("han");
		}
		
		// cookie를 새로 생성하고, maxAge랑 경로를 매번 set메소드로 따로 지정.
		// 한번에 했으면 좋겠다.
		/* Cookie cookie = new Cookie("name", "value");
		   cookie.setMaxAge(30);
		   cookie.setPath("경로"); */
		CookieUtils.createCookie("name", "value", 30);
		CookieUtils.createCookie("name", "value", "경로");
		CookieUtils.createCookie("name", "value", "경로", 30);
		
		
		
		
	%>





</body>
</html>