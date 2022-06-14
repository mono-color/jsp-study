<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>
<title>상품 상세보기</title>
<style>
.btn-basic-area { padding-top: 10px; border-top: 1px dashed;  text-align: center; }
.btn-basic-area span {padding: 10px 30px 10px; min-width: 100px;}
</style>
</head>
<body>
<div class="container">
<h3>상품 상세보기</h3>
<table class="prod-list">
	<caption>상품 상세보기</caption>
	<colgroup>
		<col style="width: 25%;">
		<col />
	</colgroup>
	<tbody class="prod-detail">
		<tr>
			<td>제품명</td>			
			<td>삼성전자 DDR4 8G PC4-21300</td>
		</tr>	
		<tr>
			<td>이미지</td>			
			<td><img alt="" src="/study/resources/images/prod/MEM001.jpg"></td>
		</tr>	
		<tr>
			<td>가격</td>			
			<td>40,000원</td>
		</tr>
		<tr>
			<td>등록일</td>			
			<td>2018.03</td>
		</tr>
		<tr>
			<td>상세설명</td>			
			<td>최신 인텔, AMD 프로세서 호환<br>쾌적한 영상이미지 소프트웨어 사용환경<br> 향상된 성능과 안전성</td>
		</tr>
	</tbody>
</table>

<div class="btn-basic-area" >
	<span><a href="/study/index.jsp" >Home</a> </span>
	<span><a href="prodList.jsp" >상품목록</a> </span>
</div>

</div><!-- container -->
</body>
</html>
