<%@page import="com.model.Article" %>
<%@page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Trang Voucher
    </title>
    <!-- Custom fonts for this template-->

    <link href="<%= request.getContextPath()%>/Views/Admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"

          type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->

    <link href="<%= request.getContextPath()%>/Views/Admin/css/sb-admin-2.min.css" rel="stylesheet">

    <jsp:useBean id="a" class="DAO.queryDAO" scope="request"></jsp:useBean>
</head>
<body>

<!-- end of thong bao -->
<c:if test="${(voux == 1) }">
    <script type="text/javascript">
        alert('Thêm: Thành công!!!');
    </script>
</c:if>
<c:if test="${(voux == 'trung') }">
    <script type="text/javascript">
        alert('Không thành công vì trùng  code !!!');
    </script>
</c:if>
<!-- Page Wrapper -->
<div id="wrapper">


    <c:import url="../commom/sidebar.jsp"/>


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- LEFT PAGE -->
        <div id="content">

            <c:import url="../commom/header.jsp"/>

            <!-- -------------------- MAIN CONTAIN ---------------- -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary"
                        style="display: inline; float: left; padding-top: 6px">Danh sách Voucher</h6>
                    <!-- Refresh Databa -->
                    <div style=" padding-left: 5%; display: inline; width: 30%; float: left">
                        <form action="${pageContext.request.contextPath}/voucher"
                              method="post">
                            <button type="submit" class="btn btn-warning"><i class="fa fa-undo"></i> Tải lại bảng
                            </button>
                        </form>
                    </div>

                    <!-- Button to Open the Modal -->
                    <button type="button" class="btn btn-success" style="width: 15%; display:inline; float: right;"
                            data-toggle="modal"
                            data-target="#addVoucher">
                        <i class="fa fa-plus mr-2"></i> Thêm voucher
                    </button>
                </div>
            </div>


            <!-- The Modal -->
            <div class="modal fade" id="addVoucher">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Thêm Voucher</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <form action="${pageContext.request.contextPath}/action-voucher" method="post"
                                  id="addVoucherForm">
                                <div class="form-group row">
                                    <label for="inpVoucher" class="col-sm-4 col-form-label">Mã Vouchde: </label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="inpVoucher" value="" name="newcode">

                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="inpValue" class="col-sm-4 col-form-label">Giá trị voucher: </label>
                                    <div class="col-sm-8">
                                        <input type="number" class="form-control" id="inpValue" value="100000"
                                               name="coin"
                                               min="0"
                                               onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57">

                                    </div>
                                </div>
                                <input type="hidden" class="form-control" value="new" name="type">
                            </form>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button form="addVoucherForm" type="submit" class="btn btn-success"> Thêm</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
                        </div>

                    </div>
                </div>
            </div>

            <%--            <div>--%>
            <%--                <form action="${pageContext.request.contextPath}/action-voucher" method="post">--%>
            <%--                    <h4> Kiểm tra voucher </h4>--%>
            <%--                    Nhập mã muốn kiểm tra--%>
            <%--                    <input type="text" value="" name="checkcode">--%>
            <%--                    <input type="hidden" value="check" name="type">--%>
            <%--                    <input type="submit" value="Kiểm tra">--%>
            <%--                    <p>${kqcoin} <br>${kqstatus}</p>--%>
            <%--                </form>--%>
            <%--            </div>--%>


            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%"
                           cellspacing="0">
                        <thead>
                        <tr>
                            <th>Mã Voucher</th>
                            <th>Số tiền</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listVou}" var="vou"
                                   varStatus="loop">
                            <tr>
                                <td>${vou.code}</td>
                                <td class="priceProduct">${vou.coin} </td>
                                <td>${vou.status} </td>
                                <td class="d-flex ">
                                    <form action="${pageContext.request.contextPath}/action-voucher" method="post"
                                          class="pr-3">
                                        <input type="hidden" value="${vou.code}" name="code">
                                        <input type="hidden" value="1" name="type">
                                        <button type="submit" title="Tái kích hoạt voucher" class="btn btn-success"><i
                                                class="fa fa-check"></i></button>
                                    </form>
                                    <form action="${pageContext.request.contextPath}/action-voucher" method="post"
                                          class="pr-3">
                                        <input type="hidden" value="${vou.code}" name="code">
                                        <input type="hidden" value="0" name="type">
                                        <button type="submit" title="Vô hiện hóa voucher" class="btn btn-warning"><i
                                                class="fab fa-creative-commons-nc"></i></button>
                                    </form>
                                    <form action="${pageContext.request.contextPath}/action-voucher" method="post">
                                        <input type="hidden" value="${vou.code}" name="code">
                                        <input type="hidden" value="-1" name="type">
                                        <button type="submit" title="Xóa voucher" class="btn btn-danger"><i
                                                class="fa fa-times"></i></button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

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
                            <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc sẽ muốn đăng xuất?</h5>
                            <button class="close" type="button" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">Chọn "đăng xuất" nếu bạn đã sẵn sàng</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button"
                                    data-dismiss="modal">Hủy
                            </button>
                            <a class="btn btn-primary" href="../login.jsp">Đăng xuất</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Bootstrap core JavaScript-->

            <script src="<%= request.getContextPath()%>/Views/Admin/	vendor/jquery/jquery.min.js"></script>
            <script src="<%= request.getContextPath()%>/Views/Admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Core plugin JavaScript-->
            <script src="<%= request.getContextPath()%>/Views/Admin/vendor/jquery-easing/jquery.easing.min.js"></script>

            <!-- Custom scripts for all pages-->
            <script src="<%= request.getContextPath()%>/Views/Admin/js/sb-admin-2.min.js"></script>

            <!-- Page level plugins -->
            <script src="<%= request.getContextPath()%>/Views/Admin/vendor/chart.js/Chart.min.js"></script>
            <script src="<%= request.getContextPath()%>/Views/Admin/vendor/datatables/jquery.dataTables.min.js"></script>
            <script src="<%= request.getContextPath()%>/Views/Admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

            <!-- Page level custom scripts -->
            <script src="<%= request.getContextPath()%>/Views/Admin/js/demo/chart-area-demo.js"></script>
            <script src="<%= request.getContextPath()%>/Views/Admin/js/demo/datatables-demo.js"></script>
            <script src="<%= request.getContextPath()%>/Views/Admin/js/demo/chart-pie-demo.js"></script>

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