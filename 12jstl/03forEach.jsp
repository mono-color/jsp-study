<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/inc/header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>

c:forEach var변수는 c:forEach안에서 EL로 사용
<br>
<c:forEach begin="1" end="10" var="i" step="2" varStatus="status">
	<c:if test="${status.first }">나는 처음에만 실행되</c:if>
	<pre>
		begin : ${status.begin }
		end : ${status.end }
		step : ${status.step }
		current : ${status.current }
		index : ${status.index }
		count : ${status.count }
		first : ${status.first }
		last : ${status.last }
		i값 : ${i }
	</pre>
	<c:if test="${status.last }">나는 마지막에만 실행되</c:if>
</c:forEach>





</body>
</html>