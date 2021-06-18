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
		String purchaseorderid = "";
	if (request.getAttribute("purchaseorderid") != null)
		purchaseorderid = (String) request.getAttribute("purchaseorderid");
	%>
	<div class="update">
		<br>
		<form action="${pageContext.request.contextPath}/update-order"
			method="post">
			<table cellspacing="5">
				<tr>
					<td align="right">Purchase Order ID:</td>
					<td><input type="text" name="purchaseorderid"></td>
				</tr>
				<tr>
					<td align="right">Address:</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td align="right">Phone:</td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>

					<td><input type="submit" value="update"></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>