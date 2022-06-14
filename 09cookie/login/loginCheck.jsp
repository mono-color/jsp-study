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
		String save_id = request.getParameter("save_id");
		if(save_id == null){
			response.addCookie(CookieUtils.createCookie("SAVE_ID", userId, 60 * 60 * 24 * 7));
		} else {
			response.addCookie(CookieUtils.createCookie("SAVE_ID", "", 0));
		}

		if (userId == null || userPass == null) {
			response.sendRedirect("login.jsp?msg=Please enter ID and PW");
		} else {
			UserList userList = new UserList();
			UserVO user = userList.getUser(userId);
			if (user != null) {
				if (user.getUserPass().equals(userPass)) {
					response.sendRedirect("login.jsp?msg=Login success!!");
					response.addCookie(CookieUtils.createCookie("SAVE_ID", userId, 60 * 60 * 24 * 7));
					response.addCookie(new Cookie("AUTH", userId));
				} else {
					response.sendRedirect("login.jsp?msg=Fail to login. ID or PW is not corrected.");
				}
			}else{
			response.sendRedirect("login.jsp?msg=Login success!!");
			}
		}
	%>





</body>
</html>