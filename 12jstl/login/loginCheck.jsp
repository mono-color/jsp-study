<%@page import="com.study.common.util.CookieUtils"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.study.login.vo.UserVO"%>
<%@page import="com.study.common.util.UserList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		String save_id = request.getParameter("rememberMe");
	%>

	<c:if test="${save_id not empty }">
		<%
			CookieUtils cookieUtils = new CookieUtils(request);
				if (cookieUtils.exists("SAVE_ID")) {
					Cookie cookie = CookieUtils.createCookie("SAVE_ID", id, "/", 0);
					response.addCookie(cookie);
				}
				save_id = "";
		%>
	</c:if>
	<c:choose>
		<c:when test="${id empty and pw empty}">
			<%
				response.sendRedirect("login.jsp?msg=" + URLEncoder.encode("입력안했어요", "utf-8"));
			%>
		</c:when>
		<c:otherwise>
			<%
				UserList userList = new UserList();
						UserVO user = userList.getUser(id);
			%>
			<c:choose>
				<c:when test="${user empty }">
					<%
						response.sendRedirect("login.jsp?msg=" + URLEncoder.encode("아이디 또는 비번확인", "utf-8"));
					%>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${user.userPass eq pw }">
							<c:if test="${save_id eq Y }">
								<%
									response.addCookie(CookieUtils.createCookie("SAVE_ID", id, "/", 3600 * 24 * 7));
								%>
							</c:if>
							<%
								session.setAttribute("USER_INFO", user);
														response.sendRedirect("login.jsp");
							%>
						</c:when>
						<c:otherwise>
							<%
								response.sendRedirect("login.jsp?msg=" + URLEncoder.encode("아이디 또는 비번확인", "utf-8"));
							%>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
	<%
		if ((id == null || id.isEmpty()) || (pw == null || pw.isEmpty())) {

			UserList userList = new UserList();
			UserVO user = userList.getUser(id);

		} else {

			if (user == null) {
				response.sendRedirect("login.jsp?msg=" + URLEncoder.encode("아이디 또는 비번확인", "utf-8"));
			} else { //id맞았을때 
				if (user.getUserPass().equals(pw)) {//다 맞는경우
					if (save_id.equals("Y")) {
						response.addCookie(CookieUtils.createCookie("SAVE_ID", id, "/", 3600 * 24 * 7));
					}

					session.setAttribute("USER_INFO", user);
					/* response.addCookie(CookieUtils.createCookie("AUTH", id)); */
					response.sendRedirect("login.jsp");
				} else {//  비번만 틀린경우
					response.sendRedirect("login.jsp?msg=" + URLEncoder.encode("아이디 또는 비번확인", "utf-8"));
				}

			}
		}
	%>





</body>
</html>