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

<%
	//현재 브라우저가 가지고 있는 쿠키들을 전부 화면에 출력하려고 합니다.
	Cookie[] cookies = request.getCookies();
	//배열을 return하는 메소드는 조심해야 될거
	// null을 return하는지, 길이가 0인 배열을 return하는지
	if(cookies !=null){
		for(Cookie cookie : cookies){
			out.print(cookie.getName() + ":" + cookie.getValue());
			out.print("<br>");
		}
	}
	out.print("<hr>");
	// 새로운 쿠키를 만들어서 브라우저한테 줄려고 한다.
	// 어떤 객체에 쿠키를 실어 보내면 될까
	
	Cookie cookie = new Cookie("next", "adsfaf");
	response.addCookie(cookie);
	
	
	
%>





</body>
</html>