
<%@page import="com.study.exception.BizNotFoundException"%>
<%@page import="com.study.free.service.IFreeBoardService"%>
<%@page import="com.study.free.service.FreeBoardServiceImpl"%>
<%@page import="com.study.free.vo.FreeBoardVO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/header.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>
	<%
		int boNo = Integer.parseInt(request.getParameter("boNo"));

		IFreeBoardService freeBoardService = new FreeBoardServiceImpl();

		try {
			FreeBoardVO freeBoard = freeBoardService.getBoard(boNo);
			request.setAttribute("freeBoard", freeBoard);
		} catch (BizNotFoundException bne) {
			request.setAttribute("bne", bne);
		}

		
	%>

	<c:if test="${bne ne null }">
		<div class="alert alert-warning">해당 글이 존재하지 않습니다.</div>
		<a href="freeList.jsp" class="btn btn-default btn-sm"> <span
			class="glyphicon glyphicon-list" aria-hidden="true"> </span> &nbsp;목록
		</a>
	</c:if>

	<c:if test="${bne eq null }">
		<div class="container">
			<div class="page-header">
				<h3>
					자유게시판 - <small>글 수정</small>
				</h3>
			</div>
			<form action="freeModify.jsp" method="post">
				<table class="table table-striped table-bordered">
					<colgroup>
						<col width="20%" />
						<col />
					</colgroup>
					<tr>
						<th>글번호</th>
						<td>${freeBoard.boNo }<input type="hidden" name="boNo"
							value="${freeBoard.boNo }"> 
						</td>

					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="boTitle"
							value="${freeBoard.boTitle }" class="form-control input-sm"
							required="required"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${freeBoard.boWriter }<input type="hidden"
							name="boWriter" value="${freeBoard.boWriter }">
						</td>
					</tr>
					<tr>
						<th>비밀번호(사용자가 입력)</th>
						<td><input type="password" name="boPass" value=""
							class="form-control input-sm" required="required"
							pattern="\w{4,}" title="알파벳과 숫자로 4글자 이상 입력"> <span
							class="text-danger"> <span
								class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
								글 등록시에 입력한 비밀번호를 입력하세요.
						</span></td>
					</tr>
					<tr>
						<th>분류</th>
						<td><select name="boCategory" class="form-control input-sm"
							required="required">
								<option value="">-- 선택하세요--</option>
								<option value="BC01"
									${freeBoard.boCategory eq "BC01" ? "selected='selected'" : ""}>프로그램</option>
								<option value="BC02"
									${freeBoard.boCategory eq "BC02" ? "selected='selected'" : ""}>웹</option>
								<option value="BC03"
									${freeBoard.boCategory eq "BC03" ? "selected='selected'" : ""}>사는
									이야기</option>
								<option value="BC04"
									${freeBoard.boCategory eq "BC04" ? "selected='selected'" : ""}>취업</option>
						</select></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" name="boContent"
								class="form-control input-sm">${freeBoard.boContent }</textarea></td>
					</tr>
					<!-- 					<tr> -->
					<!-- 						<th>글썻었을 때 IP</th> -->
					<%-- 						<td>ip는 사용자가 직접 입력하지 않아.   <input type="text" name="boIp" value="<%=request.getRemoteAddr()%>">  </td> --%>
					<!-- 					</tr> -->
					<tr>
						<th>조회수</th>
						<td>${freeBoard.boHit }</td>
					</tr>
					<tr>
						<th>최근등록일자</th>
						<td>${freeBoard.boModDate ne null ? freeBoard.boModDate : freeBoard.boRegDate }</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="pull-left">
								<a href="freeList.jsp" class="btn btn-default btn-sm"> <span
									class="glyphicon glyphicon-list" aria-hidden="true"></span>
									&nbsp;&nbsp;목록
								</a>
							</div>
							<div class="pull-right">

								<button type="submit" class="btn btn-sm btn-primary">
									<span class="glyphicon glyphicon-save" aria-hidden="true"></span>
									&nbsp;&nbsp;저장
								</button>

								<button type="submit" formaction="freeDelete.jsp"
									class="btn btn-sm btn-danger">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									&nbsp;&nbsp;삭제
								</button>


							</div>
						</td>
					</tr>
				</table>
			</form>

		</div>
	</c:if>
	<!-- container -->

</body>
</html>


