<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3 style="text-align: center; ">판매등록</h3>

<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
%>

<script>
function submit_form() {
	if (document.input_form.sale_count.value === "") {
		alert("수량을 입력해야 합니다");
		document.input_form.sale_count.focus();
		return;
	}
	if (document.input_form.sale_date.value === "") {
		alert("판매날짜를 입력해야 합니다");
		document.input_form.sale_date.focus();
		return;
	}
	alert("정상적으로 처리되었습니다!");
	document.input_form.submit();
}
function reset_form() {
	document.input_form.reset();
}
</script>
<form action="action/registry_saleshistory.jsp" method="post" name="input_form">
	<table border="1">
		<tr>
			<td>판매한 상품</td>
			<td>
				<select name="saled_product" >
					<%
						Statement stmt_product = conn.createStatement();
						ResultSet rs_product = stmt_product.executeQuery
								("SELECT product.name, product.product_id " +
								"FROM product " +
								"GROUP BY product.name, " +
								"product.product_id " +
								"ORDER BY product.product_id ASC ");
						while (rs_product.next()) {
							%>
								<option value="<%=rs_product.getInt(2) %>"> <%=rs_product.getString(1) %></option>
							<%
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>수량</td>
			<td><input type="number" name="sale_count" /></td>
		</tr>
		<tr>
			<td>판매날짜</td>
			<td><input type="date" name="sale_date" /></td>
		</tr>
		<tr>
			<td colspan="2" >
				<input type="button" value="동록하기" onclick="submit_form()" />
				<input type="button" value="다시쓰기" onclick="reset_form()" />
			</td>
		</tr>
	</table>
</form>
<%
		stmt_product.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>