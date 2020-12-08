<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");

int saled_product = Integer.parseInt(request.getParameter("saled_product"));
int sale_count = Integer.parseInt(request.getParameter("sale_count"));
String sale_date = request.getParameter("sale_date");

try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection
	("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	Statement stmt = conn.createStatement();
	
	String query = "INSERT INTO sale(sale_id, product_id, " +
				   "purchase_date, sale_price, amount) " +
				   "VALUES(SALES_SEQ.nextval, '%d', " + 
				   "'%s', '%d' * (SELECT product.price " +
				   "FROM product WHERE product.product_id = '%d'), '%d') ";
	
	ResultSet rs = stmt.executeQuery(String.format(query, saled_product, sale_date, sale_count, saled_product, sale_count));
	
	conn.commit();
	
	stmt.close();
	conn.close();
}
catch (Exception e) {
	e.printStackTrace();
}

response.sendRedirect("../index.jsp");
%>