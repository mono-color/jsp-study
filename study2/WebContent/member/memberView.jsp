
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.study.member.vo.MemberVO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/inc/header.jsp"%>
</head>
<body>
	<%@include file="/WEB-INF/inc/top.jsp"%>

	<%
		String memId = request.getParameter("memId");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		//DB 조회해서 화면에 뿌려
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			// 연결
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			// 쿼리문 만들기 Stringbuffer
			StringBuffer sb = new StringBuffer();
			sb.append(" SELECT																");
			sb.append("	 mem_id			  												");
			sb.append("	 ,mem_pass 		     											");
			sb.append("	 ,mem_name 		      											");
			sb.append("	 ,TO_CHAR(mem_bir, 'YYYY-MM-DD') as mem_bir					");
			sb.append("	 ,mem_zip 		         											");
			sb.append("	 ,mem_add1 		         										");
			sb.append("	 ,mem_add2 		         										");
			sb.append("	 ,mem_hp 		         											");
			sb.append("	 ,mem_mail 		         										");
			sb.append("	 ,DECODE(MEM_JOB, 'JB01', '주부', 'JB02', '은행원', 'JB03', '공무원', 'JB04', '축산업', 'JB05', '회사원', 'JB06', '농업', 'JB07', '자영업', 'JB08', '학생', 'JB09', '교사', '알 수 없음') AS MEM_JOB 		         											");
			sb.append("	 ,DECODE(MEM_HOBBY, 'HB01', '서예', 'HB02', '장기', 'HB03', '수영', 'HB04', '독서', 'HB05', '당구', 'HB06', '바둑', 'HB07', '볼링', 'HB08', '스키', 'HB09', '만화', 'HB10', '낚시', 'HB11', '영화감상', 'HB12', '등산', 'HB13', '개그', 'HB14', '카레이싱', '알 수 없음') AS MEM_HOBBY 	             										");
			sb.append("	 ,mem_mileage 	     											");
			sb.append("	 ,mem_del_yn 	         											");
			sb.append(" FROM																	");
			sb.append(" member																");
			sb.append("  WHERE mem_id = ?													");

			// ps 셋팅
			ps = conn.prepareStatement(sb.toString());

			// ? 셋팅
			ps.setString(1, memId);

			// rs=ps 실행
			rs = ps.executeQuery();

			// rs 가지고 있는 객체 만들어서 req.setAttr

			while (rs.next()) {
				MemberVO member = new MemberVO();

				member.setMemId(rs.getString("mem_id"));
				member.setMemPass(rs.getString("mem_pass"));
				member.setMemName(rs.getString("mem_name"));
				member.setMemBir(rs.getString("mem_bir"));
				member.setMemZip(rs.getString("mem_zip"));
				member.setMemAdd1(rs.getString("mem_add1"));
				member.setMemAdd2(rs.getString("mem_add2"));
				member.setMemHp(rs.getString("mem_hp"));
				member.setMemMail(rs.getString("mem_mail"));
				member.setMemJob(rs.getString("mem_job"));
				member.setMemHobby(rs.getString("mem_hobby"));
				member.setMemMileage(rs.getInt("mem_mileage"));
				member.setMemDelYn(rs.getString("mem_del_yn"));

				request.setAttribute("member", member);
				System.out.print(member);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 종료
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
				}
			}
			if (ps != null) {
				try {
					ps.close();
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
	%>



	<div class="alert alert-warning">해당 멤버를 찾을 수 없습니다</div>
	<a href="memberList.jsp" class="btn btn-default btn-sm"> <span
		class="glyphicon glyphicon-list" aria-hidden="true"></span> &nbsp;목록
	</a>



	<div class="container">
		<h3>상세보기</h3>
		<table class="table table-striped table-bordered">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>${member.memId }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>${member.memPass }</td>
				</tr>
				<tr>
					<th>회원명</th>
					<td>${member.memName }</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>${member.memZip }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${member.memAdd1 }${member.memAdd2 }</td>
				</tr>
				<tr>
					<th>생일</th>
					<td><input type="date" name="memBir"
						class="form-control input-sm" value="${member.memBir }"
						readonly="readonly"></td>
					<!-- 'YYYY-MM-DD'형태만 value값으로 들어갈수있어요 -->
				</tr>
				<tr>
					<th>핸드폰</th>
					<td>${member.memHp }</td>
				</tr>
				<tr>
					<th>직업</th>
					<td>${member.memJob }</td>
				</tr>
				<tr>
					<th>취미</th>
					<td>${member.memHobby }</td>
				</tr>
				<tr>
					<th>마일리지</th>
					<td>${member.memMileage }</td>
				</tr>
				<tr>
					<th>탈퇴여부</th>
					<td>${member.memDelYn }</td>
				</tr>
				<tr>
					<td colspan="2"><a href="memberList.jsp"
						class="btn btn-default btn-sm"> <span
							class="glyphicon glyphicon-list" aria-hidden="true"></span>
							&nbsp;목록
					</a> <a href='memberEdit.jsp?memId=${member.memId }'
						class="btn btn-info btn-sm"> <span
							class="glyphicon glyphicon-king" aria-hidden="true"></span>
							&nbsp;수정
					</a></td>
				</tr>
			</tbody>
		</table>
	</div>


</body>
</html>