
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/inc/header.jsp"%>
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp"%>

form에서 입력된 값들이 파라미터로 넘어온다.
bo_title...

<jsp:useBean id="freeBoard" class="com.study.free.vo.FreeBoardVO"></jsp:useBean>
<jsp:setProperty property="*" name="freeBoard"/>
<%
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try{
		// 연결
		conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
		
		// 쿼리문
		StringBuffer sb = new StringBuffer();
		sb.append(" INSERT INTO free_board (								");
		sb.append("     bo_no												");
		sb.append("     , bo_title    , bo_category    , bo_writer		");
		sb.append("     , bo_pass     , bo_content     , bo_hit			");
		sb.append("     , bo_reg_date , bo_mod_date    , bo_del_yn		");
		sb.append(" ) VALUES (												");
		sb.append(" seq_free_board.nextval, ?	, ?							");
		sb.append(" 	,   ?   	,   ?           ,   ?					");
		sb.append(" 	,   0   	,   sysdate     ,   null					");
		sb.append(" 	,   'N')												");
		
		ps = conn.prepareStatement(sb.toString());
		// ? 세팅, 쿼리실행
		int i = 1;
		
		ps.setString(i++, freeBoard.getBoTitle());
		ps.setString(i++, freeBoard.getBoCategory());
		ps.setString(i++, freeBoard.getBoWriter());
		ps.setString(i++, freeBoard.getBoPass());
		ps.setString(i++, freeBoard.getBoContent());

		int cnt = ps.executeUpdate();
		
		
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		if (rs != null) {	try {rs.close();} catch (Exception e) {}}
		if (ps != null) {try {ps.close();} catch (Exception e) {} }
		if (conn != null) {try {	conn.close();	} catch (Exception e) {} }
	}
%>



		<div class="alert alert-success">
			정상적으로 글이 되었습니다.
		</div>		
	
		<div class="alert alert-warning">
			글 등록 실패    
		</div>	
	
<a href="freeList.jsp?" class="btn btn-default btn-sm">
		<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
		&nbsp;목록
	</a>

</body>
</html>