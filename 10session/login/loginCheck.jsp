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
	<!-- <a href="#" class="btn btn-default" onclick="history.go(-1)">뒤로가기</a>
아이디틀렸을때  -->


	<%
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPass");
		String rememberId = request.getParameter("rememberId");

		if (rememberId == null) {
			response.addCookie(CookieUtils.createCookie("SAVE_ID", "", 0));
		} else {
			response.addCookie(CookieUtils.createCookie("SAVE_ID", id, 60 * 60 * 24 * 7));
		}

		if ((id == null || id.isEmpty()) || (pw == null || pw.isEmpty())) {
			response.sendRedirect("login.jsp?msg=Please enter ID and PW");
		} else { // id 정상입력 받음
			UserList userList = new UserList();
			UserVO user = userList.getUser(id);
			if (user == null) { // id 없을 때
				response.sendRedirect("login.jsp?msg=Fail to login. ID or PW is not corrected.");
			} else { //id 맞았을 때 
				if (user.getUserPass().equals(pw)) {//다 맞는경우
					session.setAttribute("USER_INFO", user);
					response.sendRedirect("login.jsp");
				} else {//  비번만 틀린경우
					response.sendRedirect("login.jsp?msg=Fail to login. ID or PW is not corrected.");
				}

			}
		}
	%>





</body>
</html>