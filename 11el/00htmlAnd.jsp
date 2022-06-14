<%@page import="com.study.common.util.ProductList"%>
<%@page import="com.study.common.vo.ProdVO"%>
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
htmlAndJSP
html은 html태그+JS,CSS
<hr>
<%
	List<ProdVO>prodList=ProductList.getProductList();
	ProdVO prod=prodList.get(0);
%>
<input type ="text" name = "prodId" value="<%=prod.getProdId() %>">
<button type="button" onclick="button()">button</button>

</body>

<script type="text/javascript">
function button(){
	// var prodId= <%=prod.getProdId()%>;
	// var prodId= "<%=prod.getProdId()%>";
	//var proId = HDD001;
	//var proId = "HDD001";
	var prodId = ${prod.prodId};
	var prodId = "${prod.prodId}";
	alert(prodId);
}
</script>




</html>