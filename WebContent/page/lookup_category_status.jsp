<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<h3 style="text-align: center;">카테고리별 매출현황 조회</h3>
<body>
<table border="1">
	<tr>
		<td>상품명</td>
		<td>총 판매 금액</td>
		<td>판매 개수</td>
	</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		Statement stmt = conn.createStatement();
		String query = "SELECT category.name, " +
				"SUM(sale.sale_price), SUM(sale.amount) " +
				"FROM category, sale, product " +
				"WHERE product.product_id = sale.product_id " +
				"AND product.category_id = category.category_id " +
				"GROUP BY category.category_id, category.name " +
				"ORDER BY category.category_id ASC ";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			%>
			<tr>
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getInt(2) %></td>
				<td><%= rs.getInt(3) %></td>
			</tr>
			<%
		}
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>
</body>
</html>