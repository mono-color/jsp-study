<%@page import="java.util.ArrayList"%>
<%@page import="com.study.free.vo.FreeBoardVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<%
		// 04mccj (many Connection many job) // Connection: 서버찾아가
		long startTime = System.currentTimeMillis();
		Class.forName("oracle.jdbc.driver.OracleDriver"); //Class.forName 런타임
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		List<FreeBoardVO> freeBoardList = new ArrayList<>();
		for (int i = 0; i < 1000; i++) {
			try {
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jsp", "oracle");
				//2번 연결

				//3,쿼리 수행
				stmt = conn.createStatement(); // 쿼리수행 객체
				String queryString = "     ";
				StringBuffer sb = new StringBuffer();
				sb.append(" SELECT        													");
				sb.append("     bo_no          , bo_title       , bo_category    	 	");
				sb.append("     , bo_writer    , bo_pass        , bo_content     	 	");
				sb.append("     , bo_hit              										");
				sb.append("     , TO_CHAR(bo_reg_date, 'YYYY-MM-dd') AS bo_reg_date	");
				sb.append("     , TO_CHAR(bo_mod_date, 'YYYY-MM-dd') AS bo_mod_date	");
				sb.append("     , bo_del_yn      											");
				sb.append(" FROM     														");
				sb.append("     free_board    							  	      			");

				rs = stmt.executeQuery(sb.toString());

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				// 연결종료
				if (rs != null) {
					try {
						rs.close();
					} catch (Exception e) {
					}
				}
				if (stmt != null) {
					try {
						stmt.close();
					} catch (Exception e) {
					}
				}
				if (conn != null) {
					try {
						conn.close();
					} catch (Exception e) {
					}
				}
			}
		}
		long endTime = System.currentTimeMillis();
	%>
	걸린시간 :
	<%=endTime - startTime%>





</body>
</html>