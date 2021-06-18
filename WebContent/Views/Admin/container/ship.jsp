<%@page import="com.model.Article" %>
<%@page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Trang vận chuyển</title>
    <!-- Custom fonts for this template-->
    <link
            href="<%=request.getContextPath()%>/Views/Admin/vendor/fontawesome-free/css/all.min.css"
            rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />
    <!-- Custom styles for this template-->

    <link
            href="<%=request.getContextPath()%>/Views/Admin/css/sb-admin-2.min.css"
            rel="stylesheet">

    <jsp:useBean id="a" class="DAO.queryDAO" scope="request"></jsp:useBean>


</head>
<body>
<%@page import="DAO.getdataShip_inAdmin" %>
<%
    getdataShip_inAdmin b = new getdataShip_inAdmin();
    int processing = b.countInShipping();
    int init = b.countNeedShipper();
    int picking = b.countPickingUP();
    int shipper = b.countShipper();
%>
<div id="wrapper">

    <c:import url="../commom/sidebar.jsp"/>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- LEFT PAGE -->
        <div id="content">

            <c:import url="../commom/header.jsp"/>

            <!-- -------------------- MAIN CONTAIN ---------------- -->

            <div class="container-fluid">
                <!-- 3 o dau -->
                <div class="row">
                    <!-- So shipper -->

                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div
                                                class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            Số Lượng shipper
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=shipper%>
                                        </div>
                                    </div>


                                    <div class="col-auto">
                                        <%--											<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>--%>
                                        <button class="btn btn-info" onclick="chonTableHienThi(1)">Hiển thị</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- So don chua gán shipper -->

                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div
                                                class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Chưa có shipper:
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=init%>
                                            đơn
                                        </div>
                                    </div>


                                    <div class="col-auto">
<%--                                        <i class="fas fa-calendar fa-2x text-gray-300"></i>--%>
										<button class="btn btn-info" onclick="chonTableHienThi(2)">Hiển thị</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- chờ lấy hàng = shipper chưa lấy hàng -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div
                                                class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Chờ lấy hàng
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=picking%>
                                            đơn
                                        </div>
                                    </div>

                                    <div class="col-auto">
<%--                                        <i class="fas fa-calendar fa-2x text-gray-300"></i>--%>
										<button class="btn btn-info" onclick="chonTableHienThi(3)">Hiển thị</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--  đã có shpper -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div
                                                class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Đang giao:
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%=processing%>
                                            đơn
                                        </div>
                                    </div>


                                    <div class="col-auto">
<%--                                        <i class="fas fa-calendar fa-2x text-gray-300"></i>--%>
										<button class="btn btn-info" onclick="chonTableHienThi(4)">Hiển thị</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>

                <!-- End of 4 ô đầu -->
                <div id="viewTableShipper">
                    <c:import url="ship/shipper.jsp"/>
                </div>
                <div id="viewTableNoShipper">
                    <c:import url="ship/noshipper.jsp"/>
                </div>
                <div id="viewTablePickup" >
                    <c:import url="ship/pickup.jsp"/>
                </div>
                <div id="viewTableShipping">
                    <c:import url="ship/shipping.jsp"/>
                </div>

                <!-- ---- END Of TABLE -- -->

                <!-- ---- END MAIN CONTAIN -- -->
            </div>
            <!-- Footer -->
            <c:import url="../commom/footer.html"/>
            <!-- End of Footer -->

            <!-- End of Content Wrapper -->
        </div>


        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top"> <i
                class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <!-- Xac nhan Logout -->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to
                            Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are
                        ready to end your current session.
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button"
                                data-dismiss="modal">Cancel
                        </button>
                        <a class="btn btn-primary" href="../login.jsp">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script
            src="<%=request.getContextPath()%>/Views/Admin/vendor/jquery/jquery.min.js"></script>
    <script
            src="<%=request.getContextPath()%>/Views/Admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script
            src="<%=request.getContextPath()%>/Views/Admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script
            src="<%=request.getContextPath()%>/Views/Admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
<%--    <script--%>
<%--            src="<%=request.getContextPath()%>/Views/Admin/vendor/chart.js/Chart.min.js"></script>--%>
    <script
            src="<%=request.getContextPath()%>/Views/Admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script
            src="<%=request.getContextPath()%>/Views/Admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
<%--    <script--%>
<%--            src="<%=request.getContextPath()%>/Views/Admin/js/demo/chart-area-demo.js"></script>--%>
    <script
            src="<%=request.getContextPath()%>/Views/Admin/js/demo/datatables-demo.js"></script>
<%--    <script--%>
<%--            src="<%=request.getContextPath()%>/Views/Admin/js/demo/chart-pie-demo.js"></script>--%>
    <script
            src="<%=request.getContextPath()%>/Views/Admin/js/tableShipView.js"></script>

        <script>
            let listGia = document.querySelectorAll(".priceProduct");
            for (i = 0; i < listGia.length; i++) {
                listGia[i].innerHTML = new Intl.NumberFormat('vn-VN', {
                    style: 'currency',
                    currency: 'VND'
                }).format(parseInt(listGia[i].innerHTML));
            }
        </script>
</body>
</html>