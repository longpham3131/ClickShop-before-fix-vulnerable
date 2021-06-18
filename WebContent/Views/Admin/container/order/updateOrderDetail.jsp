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
		String purchaseorderdetailid = "";
	if (request.getAttribute("purchaseorderdetailid") != null)
        purchaseorderdetailid = (String) request.getAttribute("purchaseorderdetailid");
	%>
	<div class="update">
		<br>
		<form action="${pageContext.request.contextPath}/update-orderdetail"
			method="post">
			<table cellspacing="5">
				<tr>
					<td align="right">Purchase Order ID:</td>
					<td><input type="text" name="purchaseorderid"></td>
				</tr>
				<tr>
					<td align="right">Purchase Order Detail ID:</td>
					<td><input type="text" name="purchaseorderdetailid"></td>
				</tr>
				<tr>
					<td align="right">Product Id:</td>
					<td><input type="text" name="productid"></td>
				</tr>
				<tr>
					<td align="right">Quantity:</td>
					<td><input type="text" name="quantity"></td>
				</tr>
				<tr>
					<td align="right">Unit price:</td>
					<td><input type="text" name="unitprice"></td>
				</tr>
				<tr>
					<td align="right">Subtotal:</td>
					<td><input type="text" name="subtotal"></td>
				</tr>
				<tr>
					<td><input type="submit" value="update"></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>