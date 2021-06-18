<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String productid = "";
	if (request.getAttribute("productid") != null)
		productid = (String) request.getAttribute("productid");
	%>
	<div class="update">
		<br>
		<form action="${pageContext.request.contextPath}/update-product"
			method="post">
			<table cellspacing="5">
				<tr>
					<td align="right">Product ID:</td>
					<td><input type="text" name="productid"></td>
				</tr>
				<tr>
					<td align="right">Subcategory:</td>
					<td><select name="subcategory">
							<%
								for (int subcategory = 1; subcategory < 12; subcategory++) {
							%>
							<option value="<%=subcategory%>">
								<%
									if (subcategory == 1) {
								%>T-Shirt<%
									}
								%>
								<%
									if (subcategory== 2) {
								%>Chemise<%
									}
								%>
								<%
									if (subcategory == 3) {
								%>Kaki<%
									}
								%>
								<%
									if (subcategory == 4) {
								%>Jeans<%
									}
								%>
								<%
									if (subcategory== 5) {
								%>Dress<%
									}
								%>
								<%
									if (subcategory == 6) {
								%>Skirt<%
									}
								%>
								<%
									if (subcategory == 7) {
								%>SunGlass<%
									}
								%>
								<%
									if (subcategory== 8) {
								%>Bag<%
									}
								%>
								<%
									if (subcategory == 9) {
								%>Belt<%
									}
								%>
								<%
									if (subcategory == 10) {
								%>Tie<%
									}
								%>
								<%
									if (subcategory== 11) {
								%>Shoes<%
									}
								%>
							</option>
							<%
								}
							%>
					</select></td>
				<tr>
				<tr>
					<td align="right">Name</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td align="right">Unit price:</td>
					<td><input type="text" name="unitprice"></td>
				</tr>
				<tr>
					<td align="right">Gender:</td>
					<td><select name="gender">
							<%
								for (int sex = 0; sex < 2; sex++) {
							%>
							<option value="<%=sex%>">
								<%
									if (sex == 0) {
								%>Male<%
									}
								%>
								<%
									if (sex == 1) {
								%>Female<%
									}
								%>
							</option>
							<%
								}
							%>
					</select></td>
				<tr>
					<td align="right">Description:</td>
					<td><input type="text" name="description"></td>
				</tr>
				<tr>
					<td align="right">Available</td>
					<td><input type="text" name="available"></td>
				</tr>
				<tr>

					<td><input type="submit" value="update"></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>