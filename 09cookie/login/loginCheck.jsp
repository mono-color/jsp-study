<%@page import="com.study.common.util.CookieUtils"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.study.login.vo.UserVO"%>
<%@page import="com.study.common.util.UserList"%>
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
<title></title>
</head>
<body>

	<%
		/* response.sendRedirect("login.jsp"); */
	%>
	<%
		String userId = request.getParameter("userId");
		String userPass = request.getParameter("userPass");
		String rememberId = request.getParameter("rememberId");

		if (rememberId == null) {
			response.addCookie(CookieUtils.createCookie("SAVE_ID", "", 0));
		} else {
			response.addCookie(CookieUtils.createCookie("SAVE_ID", userId, 60 * 60 * 24 * 7));
		}

		if (userId == null || userPass == null) {
			response.sendRedirect("login.jsp?msg=Please enter ID and PW");
		} else { // 정상 입력받음
			UserList userList = new UserList();
			UserVO user = userList.getUser(userId);
			if (user == null) { // id 없을 때 
				response.sendRedirect("login.jsp?msg=Fail to login. ID or PW is not corrected.");
			} else {
				if (user.getUserPass().equals(userPass)) { // 비밀번호 일치
					response.addCookie(new Cookie("AUTH", userId));
					response.sendRedirect("login.jsp?msg=Login success!!");
				} else { // 비밀번호 틀린경우
					response.sendRedirect("login.jsp?msg=Fail to login. ID or PW is not corrected.");
				}
			}
		}
	%>





</body>
</html>