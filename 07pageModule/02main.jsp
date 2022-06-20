<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Map<String, String[]> paramMap = request.getParameterMap();
		Set<Map.Entry<String, String[]>> entrySet = paramMap.entrySet();
		String mbti = "";
		for (Map.Entry<String, String[]> entry : entrySet) {
			mbti += entry.getValue()[0];
		}
		switch (mbti) {
		case "intj":
			request.setAttribute("mbti", mbti);
			request.setAttribute("type", "용의주도한 전략가");
			break;
		case "ensp":
			request.setAttribute("mbti", mbti);
			request.setAttribute("type", "아오");
			break;
		case "enfp":
			request.setAttribute("mbti", mbti);
			request.setAttribute("type", "항");
			break;
		case "entj":
			request.setAttribute("mbti", mbti);
			request.setAttribute("type", "기모띠");
			break;
		default:
		}
	%>
	<jsp:include page="02sub.jsp"></jsp:include>
	<br>
	sub 후
</body>
</html>