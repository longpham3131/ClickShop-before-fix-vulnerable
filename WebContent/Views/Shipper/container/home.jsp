<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <title>Dashboard</title>

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

<!-- Page Wrapper -->
<div id="wrapper">


    <%--    <c:import url="../commom/sidebar.jsp"></c:import>--%>


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content - BEN PHAI -->
        <div id="content">
            <%-------------------HEADERRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR--%>
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop"
                        class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>


                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->

                    <li class="nav-item dropdown no-arrow d-sm-none"><a
                            class="nav-link dropdown-toggle" href="#" id="searchDropdown"
                            role="button" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
                    </a> <!-- Dropdown - Messages -->
                        <div
                                class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small"
                                           placeholder="Search for..." aria-label="Search"
                                           aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>


                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow"><a
                            class="nav-link dropdown-toggle" href="#" id="userDropdown"
                            role="button" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false"> <span
                            class="mr-2 d-none d-lg-inline text-gray-600 small"> <!-- Email Name -->
						<c:out value="${email}"/>
				</span> <img class="img-profile rounded-circle"
                             src="img/undraw_profile.svg">
                    </a>
                        <div
                                class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#"> <i
                                    class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/login-all">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </li>


                </ul>

            </nav>
            <%--------------END HEADERRRRRRRRRRRRRRRRRRRRRRR--%>
            <!-- CONTAIN  -->
            <!-- Begin Page Content -->
            <!-- --------------TABLE -------------------- -->
            <%--TABLE 1 : PICKING UP--%>
            <div class="card shadow mb-4">
                <div class="card-header py-3 text-center">
                    <h6 class="m-0 font-weight-bold text-primary">????n h??ng ???? kh???i t???o
                    </h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%"
                               cellspacing="0">
                            <thead>
                            <tr>
                                <th>M?? ????n h??ng</th>
                                <th>T???ng ti???n</th>
                                <th>?????a ch??? giao h??ng</th>
                                <th> Chi ti???t</th>
                            </tr>
                            </thead>

                            <!----------Noi-dung-------- -->
                            <tbody>
                            <c:forEach items="${listPicking}" var="listPkg" varStatus="loop">
                                <c:if test="${shipid==listPkg.shipperID}">
                                    <tr>
                                        <td>${listPkg.orderID}</td>
                                        <td class="priceProduct">${listPkg.subTotal}</td>
                                        <td>${listPkg.address}</td>
                                        <td>
                                            <button type="button" class="btn btn-info" title="Other Detail"
                                                    data-toggle="modal" data-target="#mypick${listPkg.orderID}">
                                                <i class="fa fa-address-book"></i>
                                            </button>

                                            <div class="modal fade" id="mypick${listPkg.orderID}">
                                                <div class="modal-dialog modal-xl">
                                                    <div class="modal-content">

                                                        <!-- Modal Header -->
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">Chi ti???t ????n h??ng</h4>
                                                            <button type="button" class="close"
                                                                    data-dismiss="modal">&times;
                                                            </button>
                                                        </div>
                                                        <!-- Modal body -->
                                                        <div class="modal-body">
                                                            <div class="form-group row">
                                                                <label for="staticID"
                                                                       class="col-sm-4 col-form-label">M?? ????n h??ng
                                                                    :</label>
                                                                <div class="col-sm-8">
                                                                    <input type="text" Quantity readonly
                                                                           class="form-control-plaintext"
                                                                           id="staticID"
                                                                           value="${listPkg.orderID}">
                                                                </div>
                                                            </div>

                                                            <div class="form-group row">
                                                                <label
                                                                        class="col-sm-4 col-form-label">?????a ch??? giao
                                                                    h??ng
                                                                    :</label>
                                                                <div class="col-sm-8">
                                                                    <input type="text" readonly
                                                                           class="form-control-plaintext"
                                                                           value="${listPkg.address}">
                                                                </div>
                                                            </div>

                                                            <div class="form-group row">
                                                                <label
                                                                        class="col-sm-4 col-form-label">S??? ??i???n tho???i
                                                                    kh??ch
                                                                    h??ng
                                                                    :</label>
                                                                <div class="col-sm-8">
                                                                    <input type="text" readonly
                                                                           class="form-control-plaintext"
                                                                           value="${listPkg.phone}">
                                                                </div>
                                                            </div>
                                                            <table class="table table-bordered" id="orther detail"
                                                                   width="100%"
                                                                   cellspacing="0">
                                                                <thead>
                                                                <tr>
                                                                    <th>M?? s???n ph???m</th>
                                                                    <th>T??n s???n ph???m</th>
                                                                    <th>S??? l?????ng</th>
                                                                    <th>Gi?? s???n ph???m</th>
                                                                </tr>
                                                                </thead>
                                                                <!----------Noi-dung-------- -->
                                                                <tbody>

                                                                <c:set var="sum" value="0"/>
                                                                <c:forEach items="${listPickDetail}" var="listPick"
                                                                           varStatus="loop">
                                                                    <%--                                                                <h2>${listPkg.orderID}</h2>--%>
                                                                    <%--                                                                <h2>---${listPick.orderID}</h2>--%>
                                                                    <c:if test="${listPkg.orderID == listPick.orderID}">
                                                                        <tr>
                                                                            <td>${listPick.productID}</td>
                                                                            <td>${listPick.name}</td>
                                                                            <td>${listPick.quanity}</td>
                                                                            <td class="priceProduct">${listPick.subTotal}</td>
                                                                            <c:set var="tien"
                                                                                   value="${listPick.subTotal}"/>
                                                                            <c:set var="sum" value="${sum + tien}"/>
                                                                        </tr>
                                                                    </c:if>
                                                                </c:forEach>
                                                                </tbody>
                                                            </table>
                                                            <div class="text-right">
                                                                T???ng ti???n ????n h??ng: <span class="priceProduct">${sum}</span>
                                                            </div>

                                                        </div>

                                                        <!-- Modal footer -->
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-danger"
                                                                    data-dismiss="modal">????ng
                                                            </button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>

            </div>

            <%-- end TABLE 1--%>
            <%-- Table 2: SHipping --%>
            <div class="card shadow mb-4">
                <div class="card-header py-3 text-center">
                    <h6 class="m-0 font-weight-bold text-primary">Danh s??ch ????n h??ng ??ang giao</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable2" width="100%"
                               cellspacing="0">
                            <thead>
                            <tr>
                                <th>M?? ????n h??ng</th>
                                <th>?????a ch??? giao h??ng</th>
                                <th>S??? ??i???n tho???i</th>
                                <th>T???ng ti???n</th>
                                <th>Thao t??c</th>
                            </tr>
                            </thead>
                            <!----------Noi-dung---------->
                            <tbody>
                            <c:set var="a" value="0"/>
                            <c:forEach items="${listShipping}" var="listSpg" varStatus="loop">
                                <%--                                    ${listSpg.status} = ${listSpg.shipperID} /= ${AccId}--%>
                                <c:choose>
                                    <c:when test="${listSpg.status == 'Cancel' && listSpg.shipperID == AccId}">
                                        <c:set var="a" value="1"/>
                                        <tr style="background-color: #fededf">
                                            <td>${listSpg.orderID}</td>
                                            <td>${listSpg.address}</td>
                                            <td>${listSpg.phone}</td>
                                            <td class="priceProduct">${listSpg.subTotal}</td>
                                            <td> ????n h??ng ???? h???y</td>
                                        </tr>
                                    </c:when>
                                    <c:when test="${listSpg.status == 'Completed' && listSpg.shipperID == AccId}">
                                        <c:set var="a" value="1"/>
                                        <tr style="background-color: #cccdff">
                                            <td>${listSpg.orderID}</td>
                                            <td>${listSpg.address}</td>
                                            <td>${listSpg.phone}</td>
                                            <td>${listSpg.subTotal}</td>
                                            <td> Giao th??nh c??ng</td>
                                        </tr>
                                    </c:when>
                                    <c:when test="${listSpg.status == 'Shipping' && listSpg.shipperID == AccId}">
                                        <c:set var="a" value="1"/>
                                        <tr>
                                            <td>${listSpg.orderID}</td>
                                            <td>${listSpg.address}</td>
                                            <td>${listSpg.phone}</td>
                                            <td class="priceProduct">${listSpg.subTotal}</td>
                                            <td>
                                                <button type="button" class="btn btn-info" title="Xem chi ti???t"
                                                        data-toggle="modal"
                                                        data-target="#myShippingOrder${listSpg.orderID}">
                                                    <i class="fa fa-address-book"></i>
                                                </button>

                                                <button type="button" class="btn btn-primary" title="X??c nh???n ???? giao"
                                                        data-toggle="modal" data-target="#comple${listSpg.orderID}">
                                                    <i class="fa fa-check"></i>
                                                </button>
                                                <button type="button" class="btn btn-danger" title="H???y ????n h??ng"
                                                        data-toggle="modal" data-target="#cancel${listSpg.orderID}">
                                                    <i class="fa fa-times-circle"></i>
                                                </button>

                                                <div class="modal fade" id="myShippingOrder${listSpg.orderID}">
                                                    <div class="modal-dialog modal-xl">
                                                        <div class="modal-content">

                                                            <!-- Modal Header -->
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">Chi ti???t ????n h??ng</h4>
                                                                <button type="button" class="close"
                                                                        data-dismiss="modal">&times;
                                                                </button>
                                                            </div>
                                                            <!-- Modal body -->
                                                            <div class="modal-body">
                                                                <div class="form-group row">
                                                                    <label for="staticID"
                                                                           class="col-sm-4 col-form-label">M?? ????n h??ng
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" Quantity readonly
                                                                               class="form-control-plaintext"
                                                                               value="${listSpg.orderID}">
                                                                    </div>
                                                                </div>

                                                                <div class="form-group row">
                                                                    <label
                                                                            class="col-sm-4 col-form-label">Email
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" readonly
                                                                               class="form-control-plaintext"
                                                                               value="${listSpg.email}">
                                                                    </div>
                                                                </div>

                                                                <div class="form-group row">
                                                                    <label
                                                                            class="col-sm-4 col-form-label">?????a ch??? giao
                                                                        h??ng
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" readonly
                                                                               class="form-control-plaintext"
                                                                               value="${listSpg.address}">
                                                                    </div>
                                                                </div>

                                                                <div class="form-group row">
                                                                    <label
                                                                            class="col-sm-4 col-form-label">S??? ??i???n
                                                                        tho???i kh??ch h??ng
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" readonly
                                                                               class="form-control-plaintext"
                                                                               value="${listSpg.phone}.">
                                                                    </div>
                                                                </div>

                                                                <table class="table table-bordered" id="orther detail"
                                                                       width="100%"
                                                                       cellspacing="0">
                                                                    <thead>
                                                                    <tr>
                                                                        <th>M?? s???n ph???m</th>
                                                                        <th>T??n s???n ph???m</th>
                                                                        <th>S??? l?????ng</th>
                                                                        <th>T???ng ti???n</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <!----------Noi-dung-------- -->
                                                                    <tbody>
                                                                    <c:set var="sum" value="0"/>
                                                                    <c:forEach items="${listShippingDetail}"
                                                                               var="listShiping"
                                                                               varStatus="loop">
                                                                        <c:if test="${listSpg.orderID == listShiping.orderID}">
                                                                            <tr>
                                                                                <td>${listShiping.productID}</td>
                                                                                <td>${listShiping.name}</td>
                                                                                <td>${listShiping.quanity}</td>
                                                                                <td class="priceProduct">${listShiping.subTotal}</td>
                                                                                <c:set var="tien"
                                                                                       value="${listShiping.subTotal}"/>
                                                                                <c:set var="sum" value="${sum + tien}"/>
                                                                            </tr>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                                <div class="text-right">
                                                                    T???ng ti???n ????n h??ng: <span  class="priceProduct">${sum}</span>
                                                                </div>

                                                            </div>

                                                            <!-- Modal footer -->
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-danger"
                                                                        data-dismiss="modal">????ng
                                                                </button>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="modal fade" id="comple${listSpg.orderID}">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">

                                                            <!-- Modal Header -->
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">X??c nh???n kh??ch ???? nh???n h??ng</h4>
                                                                <br>
                                                                <button type="button" class="close"
                                                                        data-dismiss="modal">&times;
                                                                </button>
                                                            </div>

                                                            <!-- Modal body -->
                                                            <div class="modal-body">
                                                                M?? ????n h??ng: ${listSpg.orderID}<br>
                                                                S??? ??i???n tho???i kh??ch h??ng: ${listSpg.phone}<br>
                                                                <form action="<%=request.getContextPath()%>/shipper"
                                                                      method="post" id="formAcceptOrder${listSpg.orderID}">
                                                                    <input type="hidden" value="Completed" name="end"/>
                                                                    <input type="hidden" value="${listSpg.orderID}"
                                                                           name="orderId"/>
                                                                </form>
                                                            </div>
                                                            <!-- Modal footer -->
                                                            <div class="modal-footer">
                                                                <button type="submit" form="formAcceptOrder${listSpg.orderID}"
                                                                        class="btn btn-success">X??c nh???n
                                                                </button>
                                                                <button type="button" class="btn btn-danger"
                                                                        data-dismiss="modal">????ng
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="modal fade" id="cancel${listSpg.orderID}">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">

                                                            <!-- Modal Header -->
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">H???y ????n h??ng</h4>
                                                                <button type="button" class="close"
                                                                        data-dismiss="modal">&times;
                                                                </button>
                                                            </div>
                                                            <!-- Modal body -->
                                                            <div class="modal-body">
                                                                M?? ????n h??ng: ${listSpg.orderID}<br>
                                                                S??? ??i???n tho???i kh??ch h??ng: ${listSpg.phone}<br>
                                                                Kh??ng th??? giao ?????n kh??ch h??ng
                                                                <form action="<%=request.getContextPath()%>/shipper"
                                                                      method="post" id="formCancel${listSpg.orderID}">
                                                                    <input type="hidden" value="Cancel" name="end"/>
                                                                    <input type="hidden" value="${listSpg.orderID}"
                                                                           name="orderId"/>
                                                                </form>
                                                            </div>

                                                            <!-- Modal footer -->
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-success"
                                                                        form="formCancel${listSpg.orderID}">X??c nh???n
                                                                </button>
                                                                <button type="button" class="btn btn-danger"
                                                                        data-dismiss="modal">????ng
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${a==0}">
                                <tr>
                                    <td colspan="5" style="text-align: center">Danh s??ch tr???ng</td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <%-- End table 2--%>


            <%--            <c:import url="../commom/footer.html"/>--%>

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
                    <span aria-hidden="true">????</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready
                to end your current session.
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button"
                        data-dismiss="modal">Cancel
                </button>
                <a class="dropdown-item" href="<%=request.getContextPath()%>/login-all">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    Logout
                </a>
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