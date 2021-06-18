<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V3</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/css/util.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/css/main.css">
<!--===============================================================================================-->

	<%
	String a = request.getContextPath() + "/";
	System.out.println(a);
	%>
</head>
<body>
<%
	String id = "";
	if (request.getAttribute("email") != null)
		id = (String) request.getAttribute("email");
	// lấy dữ liệu vào textbox email khi bấm sai
%>
	<div class="limiter">
		<div class="container-login100" style="">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="${pageContext.request.contextPath}/login-admin"
					  method="post">
					<span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						Admin Login
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" type="text" name="id" placeholder="Username" value=<%= id%>>
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>

					<div class="contact100-form-checkbox">
						<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
						<label class="label-checkbox100" for="ckb1">
							Remember me
						</label>
					</div>

					<div class="container-login100-form-btn mt-4">
						<button class="login100-form-btn" type="submit">
							Login
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/bootstrap/js/popper.js"></script>
	<script src="<%=request.getContextPath()%>/Views/Admin/temple/Template/login-form-v3/Login_v3/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/Views/Admin/temple/Template/login-form-v3/Login_v3/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/daterangepicker/moment.min.js"></script>
	<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/js/main.js"></script>

</body>
</html>