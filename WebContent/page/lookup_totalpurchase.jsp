<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<h3 style="text-align: center;">통합 매출 내역 조회</h3>
<body>
<table border="1">
	<tr>
		<td>판매 ID</td>
		<td>상품명</td>
		<td>구매 일자</td>
		<td>총 구매 금액</td>
		<td>구매 개수</td>
	</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "sdh_6", "1234");
		Statement stmt = conn.createStatement();
		String query = "SELECT SALE.SALE_ID SALE_ID, " +
				"PRODUCT.NAME PRODUCT_NAME, " +
				"SALE.PURCHASE_DATE PURCHASE_DATE, " +
				"sale.sale_price TOTAL_SALES, " +
				"sale.amount SALE_AMOUNT " +
				"FROM SALE, PRODUCT " +
				"WHERE SALE.PRODUCT_ID = product.product_id " +
				"ORDER BY sale.sale_id ASC ";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			%>
			<tr>
				<td><%= rs.getInt(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getInt(4) %></td>
				<td><%= rs.getInt(5) %></td>
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
