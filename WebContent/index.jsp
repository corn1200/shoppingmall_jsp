<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<link rel="stylesheet" href="css/css.css">
</head>
<%
String section = request.getParameter("section") != null ? request.getParameter("section") : "";
%>
<body>
	<%@ include file="static/header.jsp" %>
	<%@ include file="static/nav.jsp" %>
	
	<%
	switch(section){
		case "insert_sales":
			%><%@ include file="page/insert_sales.jsp" %><%
			break;
		case "lookup_totalpurchase":
			%><%@ include file="page/lookup_totalpurchase.jsp" %><%
			break;
		case "products_status":
			%><%@ include file="page/products_status.jsp" %><%
			break;
		case "lookup_category_status":
			%><%@ include file="page/lookup_category_status.jsp" %><%
			break;
		default:
			%><%@ include file="static/index.jsp" %><%
		}
	%>
	
	<%@ include file="static/footer.jsp" %>
</body>
</html>