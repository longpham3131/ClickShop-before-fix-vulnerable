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
		String error = "";
	if (request.getAttribute("hasError") != null)
		error = (String) request.getAttribute("hasError");
	%>
	<div class="update">
		<br>
		<form action="${pageContext.request.contextPath}/delete-account"
			method="post">
			<table cellspacing="5">
				<tr>
					<td align="right" style="padding-left: 44px">Email:</td>
					<td><input type="text" name="email" value=<%%>></td>
					<td class="CheckButton"><input type="submit" value="Delete"
						name="Check" /></td>
				</tr>

			</table>
		</form>
	</div>
</body>
</html>