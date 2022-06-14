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
EL은 기본적으로 출력이 돼요.
EL도 언어라서 변수선언이 돼요.
??? 변수선언했는데 화면에 출력이돼요.
변수선언만하고 화면에 출력은 안하고 싶어요...
; 앞에는 출력안함
기본적으로 EL은 빈값이 있으면 안됨
<br>
${a="나는 임동성"; }




</body>
</html>