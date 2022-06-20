<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
04junc
<%
	String idol= request.getParameter("idol");
	String viewPage="";
	List<String> memberList = new ArrayList<>();
	if("aoa".equals(idol)){
		viewPage="04aoa.jsp";
		memberList.add("설현");
		memberList.add(" 기타 등등 ");
	}else if(idol.equals("bts")){
		viewPage="04bts.jsp";
		memberList.add("뷔");
		memberList.add("정국");
		memberList.add("랩몬스터");
		memberList.add("기타 등등 ");
	}
	request.setAttribute("memberList", memberList);
%>
	여기다가는 역시 아무거나 막 써도 상관없어요
	중요한건 aoa랑 bts화면 보여줄 때 화면ㅇ 양식이 다르면 
	aoa.jsp랑 bts.jsp를 따로 만들 수 밖에 없습니다.
	(화면양식이 같으면 굳이 jsp를 2개 안만들고 1개만 만들어도 되요.)
	
	form.jsp에서 뭘 선택했냐에 따라 aoa.jsp 또는 bts.jsp로 이동하도록 해야합니다.
	forward 되도 역시 같은 request를 공유합니다.
	
	<jsp:forward page="<%=viewPage%>"></jsp:forward>
	
	
	
</body>
</html>