<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>Trang chủ</title>

<!-- Custom fonts for this template-->

<link href="<%= request.getContextPath()%>/Views/Admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"

	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->

<link href="<%= request.getContextPath()%>/Views/Admin/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

<%--	<!--  Check authentic -->--%>
<%--	<c:if test="${check != 'true'}">--%>
<%--		<c:redirect url="/admin" />--%>
<%--	</c:if>--%>
<%--	<!--  Check authentic -->--%>


	<%
		session.setAttribute("from", "dash");
	%>

	<!-- Page Wrapper -->
	<div id="wrapper">


		<c:import url="../commom/sidebar.jsp"></c:import>


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content - BEN PHAI -->
			<div id="content">

				<c:import url="../commom/header.jsp"></c:import>

				<!-- CONTAIN  -->

				<%@page import="DAO.getDataDashBoard"%>
				<%
				getDataDashBoard a = new getDataDashBoard();
				int emp = a.countEMP();
				int user = a.countUSER();
				int other = a.countOtherDetail();
				int subtotal = a.countSubTotal();
				System.out.print("++++");
				int pie[] = a.pieChart();
				%>
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->

					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
<%--						<a href="#"--%>
<%--							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i--%>
<%--							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>--%>
					</div>

					<!-- 4 o dau -->
					<div class="row">

						<!-- Thu NHap Thang -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												Doanh thu tháng</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800"><%=subtotal%>
												$
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- So luong nhan vien -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												Tổng số nhân viên</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800"><%=emp%></div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- So luong user -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">Tổng số tài khoản</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><%=user%></div>
												</div>
												<div class="col">
													<div class="progress progress-sm mr-2">
														<div class="progress-bar bg-info" role="progressbar"
															style="width: 50%" aria-valuenow="50" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- So don da thuc hien -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												Số đơn đã hoàn thành</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800"><%=other%></div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Bieu do -->

					<div class="row">

						<!-- Bieu do doanh thu -->
						<div class="col-xl-8 col-lg-7">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Tổng quan doanh thu</h6>
									<div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button"
											id="dropdownMenuLink2" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> <i
											class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
											aria-labelledby="dropdownMenuLink2">
											<div class="dropdown-header">Dropdown Header:</div>
											<a class="dropdown-item" href="#">Action</a> <a
												class="dropdown-item" href="#">Another action</a>
											<div class="dropdown-divider"></div>
											<a class="dropdown-item" href="#">Something else here</a>
										</div>
									</div>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="chart-area">
										<canvas id="myAreaChart"></canvas>
									</div>
								</div>
							</div>
						</div>

						<!-- Bieu do Tron-->
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Sản phẩm bán chạy</h6>
									<div class="dropdown no-arrow">
										<a class="dropdown-toggle" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> <i
											class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
										</a>

									</div>
								</div>
								<!-- data bieu do tron -->
								<div class="card-body">
									<div class="chart-pie pt-4 pb-2">
										<canvas id="myPieChart"></canvas>
									</div>
									<div class="mt-4 text-center small">
										<span class="mr-2"> <i
											class="fas fa-circle text-secondary"></i> Phụ kiện
										</span> <span class="mr-2"> <i
											class="fas fa-circle text-primary"></i> Áo
										</span>  <span class="mr-2"> <i
											class="fas fa-circle text-success"></i> Giày nữ
										</span>  <span class="mr-2"> <i
											class="fas fa-circle text-danger"></i> Giày nam
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>




				<!-- CONTAIN -->

				<c:import url="../commom/footer.html" />

			</div>
			<!-- End of Main Content -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">Ã</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="../login.jsp">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->

	<script src="<%= request.getContextPath()%>/Views/Admin/vendor/jquery/jquery.min.js"></script>
	<script src="<%= request.getContextPath()%>/Views/Admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="<%= request.getContextPath()%>/Views/Admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="<%= request.getContextPath()%>/Views/Admin/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="<%= request.getContextPath()%>/Views/Admin/vendor/chart.js/Chart.min.js"></script>
	<!-- Page level custom scripts -->
	<script src="<%= request.getContextPath()%>/Views/Admin/js/demo/chart-area-demo.js"></script>

	
	<!-- Bieu do tron -->
	<script type="text/javascript">
	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';
	var ctx = document.getElementById("myPieChart");
	var pie1 = '<%=pie[2]%>';
	var myPieChart = new Chart(ctx, {
		type: 'doughnut',
		data: {
			labels: ["Men Shoes", "Tee ", "Women Shoes", "Accessory"],
			datasets: [{
				data: ['<%=pie[0]%>', '<%=pie[1]%>', '<%=pie[2]%>', '<%=pie[3]%>'],
				backgroundColor: ['#d9534f', '#0275d8', '#5cb85c', '#686f73'],
				hoverBackgroundColor: ['#c24946', '#0059a6', '#4d994d', '#313436'],
				hoverBorderColor: "rgba(234, 236, 244, 1)",
			}],
		},
		options: {
			maintainAspectRatio: false,
			tooltips: {
				backgroundColor: "rgb(255,255,255)",
				bodyFontColor: "#858796",
				borderColor: '#dddfeb',
				borderWidth: 1,
				xPadding: 15,
				yPadding: 15,
				displayColors: false,
				caretPadding: 10,
			},
			legend: {
				display: false
			},
			cutoutPercentage: 80,
		},
	});</script>

</body>

</html>