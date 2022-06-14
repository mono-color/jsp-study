<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tbody>
			<c:forEach begin="2" end="9" var="i">
				<tr>
					<c:forEach begin="1" end="9" var="j">
						<td>${i}x${j}=${i*j }</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<table border="1">
		<tbody>
			<tr>
				<td>2X1=2</td>
				<td>2X2=4</td>
				<td>2X3=6</td>
				<td>2X4=8</td>
				<td>2X5=10</td>
				<td>2X6=12</td>
				<td>2X7=14</td>
				<td>2X8=16</td>
				<td>2X9=18</td>
			</tr>
			<tr>
				<td>3X1=3</td>
				<td>3X2=6</td>
				<td>3X3=9</td>
				<td>3X4=12</td>
				<td>3X5=15</td>
				<td>3X6=18</td>
				<td>3X7=21</td>
				<td>3X8=24</td>
				<td>3X9=27</td>
			</tr>
			<tr>
				<td>4X1=4</td>
				<td>4X2=8</td>
				<td>4X3=12</td>
				<td>4X4=16</td>
				<td>4X5=20</td>
				<td>4X6=24</td>
				<td>4X7=28</td>
				<td>4X8=32</td>
				<td>4X9=36</td>
			</tr>
			<tr>
				<td>5X1=5</td>
				<td>5X2=10</td>
				<td>5X3=15</td>
				<td>5X4=20</td>
				<td>5X5=25</td>
				<td>5X6=30</td>
				<td>5X7=35</td>
				<td>5X8=40</td>
				<td>5X9=45</td>
			</tr>
			<tr>
				<td>6X1=6</td>
				<td>6X2=12</td>
				<td>6X3=18</td>
				<td>6X4=24</td>
				<td>6X5=30</td>
				<td>6X6=36</td>
				<td>6X7=42</td>
				<td>6X8=48</td>
				<td>6X9=54</td>
			</tr>
			<tr>
				<td>7X1=7</td>
				<td>7X2=14</td>
				<td>7X3=21</td>
				<td>7X4=28</td>
				<td>7X5=35</td>
				<td>7X6=42</td>
				<td>7X7=49</td>
				<td>7X8=56</td>
				<td>7X9=63</td>
			</tr>
			<tr>
				<td>8X1=8</td>
				<td>8X2=16</td>
				<td>8X3=24</td>
				<td>8X4=32</td>
				<td>8X5=40</td>
				<td>8X6=48</td>
				<td>8X7=56</td>
				<td>8X8=64</td>
				<td>8X9=72</td>
			</tr>
			<tr>
				<td>9X1=9</td>
				<td>9X2=18</td>
				<td>9X3=27</td>
				<td>9X4=36</td>
				<td>9X5=45</td>
				<td>9X6=54</td>
				<td>9X7=63</td>
				<td>9X8=72</td>
				<td>9X9=81</td>
			</tr>
		</tbody>
	</table>


</body>
</html>