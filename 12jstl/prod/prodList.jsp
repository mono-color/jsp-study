<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>
<title>제품 목록</title>
<style>
.prod-list tbody td {border: 1px dashed;}
.prod-list tbody ul {padding-left: 20px;}
.prod-list tbody ul li {list-style: none; line-height: 1.4em;}

.prod-title a ,
.prod-title a:active,
.prod-title a:focus   {text-overflow:ellipsis; text-decoration: none; }

.prod-image {text-align: center;}
.prod-image img {
	 height: 150px; 
}
</style>
</head>
<body>
<div class="container">
<h3>제품 목록</h3>
<table class="prod-list">
	<caption class="hidden"><em>컴퓨터 제품 목록</em></caption>
	<colgroup>
		<col style="width: 33%;">
		<col style="width: 33%;">
		<col />
	</colgroup>
	<tbody>
		<tr>
			<td>
				<ul>
					<li class="prod-image"><a href="prodView.jsp?prodId=CPU001"><img alt="" src="/study/resources/images/prod/CPU001.jpg"></a>
					<li class="prod-title"><a href="prodView.jsp?prodId=CPU001">AMD 라이젠 5 3500 (마티스)</a>
					<li class="prod-price">140,200원
					<li class="prod-reg-date">등록월 2019.11
				</ul>
			</td>
			<td>
				<ul>
					<li class="prod-image"><a href="prodView.jsp?prodId=CPU002"><img alt="" src="/study/resources/images/prod/CPU002.jpg"></a>
					<li class="prod-title"><a href="prodView.jsp?prodId=CPU002">인텔 코어i7-9세대 9700K</a>
					<li class="prod-price">420,000원
					<li class="prod-reg-date">등록월 2018.10
				</ul>
			</td>
			<td>
				<ul>
					<li class="prod-image"><a href="prodView.jsp?prodId=CPU003"><img alt="" src="/study/resources/images/prod/CPU003.jpg"></a>
					<li class="prod-title"><a href="prodView.jsp?prodId=CPU003">인텔 코어i5-9세대 9600KF </a>
					<li class="prod-price">203,000원
					<li class="prod-reg-date">등록월 2019.03
				</ul>
			</td>
		</tr>	
		<tr>			
			<td>
				<ul>
					<li class="prod-image"><a href="prodView.jsp?prodId=CPU004"><img alt="" src="/study/resources/images/prod/CPU004.jpg"></a>
					<li class="prod-title"><a href="prodView.jsp?prodId=CPU004">AMD 라이젠5-3세대 3600XT (마티스)</a>
					<li class="prod-price">318,290원
					<li class="prod-reg-date">등록월 2020.07
				</ul>
			</td>			
		
			<td>
				<ul>
					<li class="prod-image"><a href="prodView.jsp?prodId=MEM001"><img alt="" src="/study/resources/images/prod/MEM001.jpg"></a>
					<li class="prod-title"><a href="prodView.jsp?prodId=MEM001">삼성전자 DDR4 8G PC4-21300</a>
					<li class="prod-price">40,000원
					<li class="prod-reg-date">등록월 2018.03
				</ul>
			</td>
			<td>
				<ul>
					<li class="prod-image"><a href="prodView.jsp?prodId=MEM002"><img alt="" src="/study/resources/images/prod/MEM002.jpg"></a>
					<li class="prod-title"><a href="prodView.jsp?prodId=MEM002">GeIL DDR4 8G PC4-21300 CL19 PRISTINE</a>
					<li class="prod-price">34,500원
					<li class="prod-reg-date">등록월 2018.05
				</ul>
			</td>
		</tr>	
		<tr>					
			<td>
				<ul>
					<li class="prod-image"><a href="prodView.jsp?prodId=MEM003"><img alt="" src="/study/resources/images/prod/MEM003.jpg"></a>
					<li class="prod-title"><a href="prodView.jsp?prodId=MEM003">ESSENCORE KLEVV DDR4 8G PC4-21300 CL19</a>
					<li class="prod-price">35,000원
					<li class="prod-reg-date">등록월 2019.08
				</ul>
			</td>
			<td>
				<ul>
					<li class="prod-image"><a href="prodView.jsp?prodId=MEM004"><img alt="" src="/study/images/prod/MEM004.jpg"></a>
					<li class="prod-title"><a href="prodView.jsp?prodId=MEM004">마이크론 Crucial DDR4 8G PC4-25600 CL22</a>
					<li class="prod-price">34,000원
					<li class="prod-reg-date">등록월 2020.01
				</ul>
			</td>			
			<td>
				<ul>
					<li class="prod-image"><a href="prodView.jsp?prodId=HDD001"><img alt="" src="/study/resources/images/prod/HDD001.jpg"></a>
					<li class="prod-title"><a href="prodView.jsp?prodId=HDD001">WD BLUE 7200/64M (WD10EZEX, 1TB)</a>
					<li class="prod-price">55,500원
					<li class="prod-reg-date">등록월 2012.06
				</ul>
			</td>					
		</tr>		
	</tbody>

</table>
</div>
</body>
</html>
