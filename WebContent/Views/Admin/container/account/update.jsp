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
		String email = "";
	if (request.getAttribute("email") != null)
		email = (String) request.getAttribute("email");
	%>
	<div class="update">
		<br>
		<form action="${pageContext.request.contextPath}/update-account"
			method="post">
			<table cellspacing="5">
				<tr>
					<td align="right">Email:</td>
					<td><input type="text" name="email" value=<%=email%>></td>
				</tr>
				<tr>
					<td align="right">Password</td>
					<td><input type="text" name="pass"></td>
				</tr>
				<tr>
					<td align="right">First name:</td>
					<td><input type="text" name="firstname"></td>
				</tr>
				<tr>
					<td align="right">Last name:</td>
					<td><input type="text" name="lastname"></td>
				</tr>
				<tr>
					<td align="right">Phone:</td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td align="right">Address</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td align="right">Gender:</td>
					<td><select name="gender">
					<%
								String[] sex= {"M", "F"};
								for (int s = 0; s < 2; s++) {
							%>
							<option value="<%=sex[s]%>">
								<%
									if (s == 0) {
								%>Male<%
									}
								%>
								<%
									if (s == 1) {
								%>Female<%
									}
								%>
							</option>
							<%
								}
							%>

					</select></td>
				<tr>
					<td>Date of birth:</td>
					<td>Time Picker Here</td>
				</tr>
				<tr>
					<td align="right">Role:</td>
					<td><select name="role">
							<%
								String[] Role= {"USER", "SALEPERSON", "ADMINISTRATOR", "SHIPPER"};
								for (int role = 0; role < 4; role++) {
							%>
							<option value="<%=Role[role]%>">
								<%=Role[role]%>
							</option>
							<%
								}
							%>
					</select></td>
				<tr>

					<td><input type="submit" value="update"></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>