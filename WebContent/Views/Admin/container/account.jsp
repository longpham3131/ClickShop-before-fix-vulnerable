<%@page import="com.model.Article" %>
<%@page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Tài khoản</title>
    <!-- Custom fonts for this template-->
    <link
            href="<%=request.getContextPath()%>/Views/Admin/vendor/fontawesome-free/css/all.min.css"
            rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/r/dt/jq-2.1.4,jszip-2.5.0,pdfmake-0.1.18,dt-1.10.9,af-2.0.0,b-1.0.3,b-colvis-1.0.3,b-html5-1.0.3,b-print-1.0.3,se-1.0.1/datatables.min.css"/>

    <!-- Custom styles Sfor this template-->

    <link
            href="<%=request.getContextPath()%>/Views/Admin/css/sb-admin-2.min.css"
            rel="stylesheet">

    <jsp:useBean id="a" class="DAO.queryDAO" scope="request"></jsp:useBean>
</head>
<body>



<%
    session.setAttribute("from", "acc");
%>
<!-- end of thong bao -->

<!-- Page Wrapper -->
<div id="wrapper">

    <c:import url="../commom/sidebar.jsp"/>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- LEFT PAGE -->
        <div id="content">
            <c:import url="../commom/header.jsp"/>

            <!-- -------------------- MAIN CONTAIN ---------------- -->
            <!--  TABLEE ----->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary"
                        style="display: inline; float: left; padding-top: 6px">Danh sách tài khoản</h6>
                    <!-- Refresh Databa -->
                    <div style=" padding-left: 5%; display: inline; width: 30%; float: left">
                        <form action="${pageContext.request.contextPath}/fill-All-Account"
                              method="post">
                            <button type="submit" class="btn btn-warning"><i class="fa fa-undo"></i> Tải lại bảng
                            </button>
                        </form>
                    </div>

                    <!-- Button to Open the Modal -->
                    <button type="button" class="btn btn-success" style="width: 15%; display:inline; float: right;"
                            data-toggle="modal"
                            data-target="#addUser" id="BtnShowModalAddUser">
                        <i class="fa fa-plus mr-2"></i> Thêm tài khoản
                    </button>
                </div>

                <!-- The Modal -->
                <div class="modal fade" id="addUser">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Thêm tài khoản</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                <c:choose>
                                    <c:when test="${(thongbao == 'error') && (from=='insert')}">
                                        <form action="${pageContext.request.contextPath}/insert-account" id="formAdd"
                                              method="post">
                                            <div class="form-group">
                                                <label for="addEmail">Email :</label>
                                                <input type="email" value="<c:out value="${emailError}"/>"  class="form-control" name="email">
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-6">
                                                    <label for="addFname">Họ :</label>
                                                    <input type="text" value="<c:out value="${firstnameError}"/>" class="form-control" name="firstname">
                                                </div>
                                                <div class="form-group col-6">
                                                    <label for="addLname">Tên :</label>
                                                    <input type="text" value="<c:out value="${lastnameError}"/>" class="form-control" name="lastname">
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-6">
                                                    <label for="addGender">Giới tính :</label>
                                                    <select name="gender"  class="form-control" name="gender">
                                                        <%
                                                            String[] sex = {"M", "F"};
                                                            for (int s = 0; s < 2; s++) {
                                                        %>
                                                        <option value="<%=sex[s]%>" ${genderError== sex[s] ? 'selected="selected"' : ''}>
                                                            <%
                                                                if (s == 0) {
                                                            %>Nam<%
                                                            }
                                                        %>
                                                            <%
                                                                if (s == 1) {
                                                            %>Nữ<%
                                                            }
                                                        %>
                                                        </option>
                                                        <%
                                                            }
                                                        %>

                                                    </select>
                                                </div>
                                                <div class="form-group col-6">
                                                    <label for="addDOfB">Ngày sinh :</label>
                                                    <input type="date" value="<c:out value="${BdayError}"/>" class="form-control"  name="Bday">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="addPhone">Số điện thoại :</label>
                                                <input type="number"  value="<c:out value="${phoneError}"/>" class="form-control" class="form-control" name="phone">
                                            </div>
                                            <div class="form-group">
                                                <label for="addAddress">Địa chỉ :</label>
                                                <input type="text" value="<c:out value="${addressError}"/>" class="form-control"  class="form-control" name="address">
                                            </div>


                                            <div class="form-group">
                                                <label for="addRole">Loại tài khoản :</label>
                                                <select name="role"  class="form-control" name="role">
                                                    <%
                                                        String[] Role = {"USER", "SALER", "ADMINISTRATOR", "SHIPPER"};
                                                        for (int role = 0; role < 4; role++) {
                                                    %>
                                                    <option value="<%=Role[role]%>" ${roleError== Role[role] ? 'selected="selected"' : ''}>
                                                        <%=Role[role]%>
                                                    </option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>



                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                        <form action="${pageContext.request.contextPath}/insert-account" id="formAdd"
                                              method="post">
                                            <div class="form-group">
                                                <label for="addEmail">Email :</label>
                                                <input type="email" id="addEmail" class="form-control" name="email">
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-6">
                                                    <label for="addFname">Họ :</label>
                                                    <input type="text" id="addFname" class="form-control" name="firstname">
                                                </div>
                                                <div class="form-group col-6">
                                                    <label for="addLname">Tên :</label>
                                                    <input type="text" id="addLname" class="form-control" name="lastname">
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col-6">
                                                    <label for="addGender">Giới tính :</label>
                                                    <select name="gender" id="addGender" class="form-control" name="gender">
                                                        <%
                                                            String[] sex = {"M", "F"};
                                                            for (int s = 0; s < 2; s++) {
                                                        %>
                                                        <option value="<%=sex[s]%>">
                                                            <%
                                                                if (s == 0) {
                                                            %>Nam<%
                                                            }
                                                        %>
                                                            <%
                                                                if (s == 1) {
                                                            %>Nữ<%
                                                            }
                                                        %>
                                                        </option>
                                                        <%
                                                            }
                                                        %>

                                                    </select>
                                                </div>
                                                <div class="form-group col-6">
                                                    <label for="addDOfB">Ngày sinh :</label>
                                                    <input type="date" class="form-control" id="addDOfB" name="Bday">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="addPhone">Số điện thoại :</label>
                                                <input type="number" id="addPhone" class="form-control" name="phone">
                                            </div>
                                            <div class="form-group">
                                                <label for="addAddress">Địa chỉ :</label>
                                                <input type="text" id="addAddress" class="form-control" name="address">
                                            </div>


                                            <div class="form-group">
                                                <label for="addRole">Loại tài khoản :</label>
                                                <select name="role" id="addRole" class="form-control" name="role">
                                                    <%
                                                        String[] Role = {"USER", "SALER", "ADMINISTRATOR", "SHIPPER"};
                                                        for (int role = 0; role < 4; role++) {
                                                    %>
                                                    <option value="<%=Role[role]%>">
                                                        <%=Role[role]%>
                                                    </option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>



                                        </form>
                                    </c:otherwise>


                                </c:choose>
                                <div class="text-center">
                                    <c:if test="${(thongbao == 'error') && (from=='insert')}">
                                        <p style="color: red;">${errorDescription}</p>
                                    </c:if>
                                </div>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="submit" form="formAdd" class="btn btn-success">Thêm tài khoản</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%"
                               cellspacing="0">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Email</th>
                                <th>Họ</th>
                                <th>Tên</th>
                                <th>Số điện thoại</th>
                                <th>Trạng thái</th>
                                <th>Loại tài khoản</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>

                            <!----------Noi-dung-------- -->
                            <tbody>

                            <c:forEach items="${listAccount}" var="listAcc"
                                       varStatus="loop">
                                <c:choose>
                                    <c:when test="${listAcc.isAvailable ==1}">
                                        <tr>
                                            <td>${listAcc.accountId}</td>
                                            <td>${listAcc.email}</td>
                                            <td>${listAcc.firstName}</td>
                                            <td>${listAcc.lastName}</td>
                                            <td>${listAcc.phone}</td>
                                            <td>${listAcc.isAvailable}</td>
                                            <td>${listAcc.role}</td>
                                            <td>
                                                <!-- POPUP Detail -->
                                                <button type="button" class="btn btn-info" title="Thông tin chi tiết"
                                                        data-toggle="modal" data-target="#myModal${listAcc.accountId}">
                                                    <i class="fa fa-address-book"></i>
                                                </button>
                                                <div class="modal fade" id="myModal${listAcc.accountId}">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">

                                                            <!-- Modal Header -->
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">Thông tin chi tiết</h4>
                                                                <button type="button" class="close"
                                                                        data-dismiss="modal">&times;
                                                                </button>
                                                            </div>
                                                            <!-- Modal body -->
                                                            <div class="modal-body">


                                                                <div class="form-group row">
                                                                    <label for="staticID"
                                                                           class="col-sm-4 col-form-label">Mã tài khoản
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" readonly
                                                                               class="form-control-plaintext"
                                                                               id="staticID"
                                                                               value="${listAcc.accountId}">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label for="staticEmail"
                                                                           class="col-sm-4 col-form-label">Email
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" readonly
                                                                               class="form-control-plaintext"
                                                                               id="staticEmail"
                                                                               value="${listAcc.email}">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label for="staticName"
                                                                           class="col-sm-4 col-form-label">Họ và tên
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" readonly
                                                                               class="form-control-plaintext"
                                                                               id="staticName"
                                                                               value="${listAcc.firstName} ${listAcc.lastName}">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label for="staticPhone"
                                                                           class="col-sm-4 col-form-label">Số điện thoại
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" readonly
                                                                               class="form-control-plaintext"
                                                                               id="staticPhone"
                                                                               value="${listAcc.phone}">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label for="staticAddress"
                                                                           class="col-sm-4 col-form-label">Địa chỉ
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" readonly
                                                                               class="form-control-plaintext"
                                                                               id="staticAddress"
                                                                               value="${listAcc.address}">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label for="staticGender"
                                                                           class="col-sm-4 col-form-label">Giới tính
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" readonly
                                                                               class="form-control-plaintext"
                                                                               id="staticGender"
                                                                               value="${listAcc.gender}">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label for="staticDOfB"
                                                                           class="col-sm-4 col-form-label">Ngày sinh
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" readonly
                                                                               class="form-control-plaintext"
                                                                               id="staticDOfB"
                                                                               value="${listAcc.dayofBirth}">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label for="staticCreated"
                                                                           class="col-sm-4 col-form-label">Ngày tạo
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" readonly
                                                                               class="form-control-plaintext"
                                                                               id="staticCreated"
                                                                               value="${listAcc.createdDay}">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label for="staticStatus"
                                                                           class="col-sm-4 col-form-label">Trạng thái
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" readonly
                                                                               class="form-control-plaintext"
                                                                               id="staticStatus"
                                                                               value="${listAcc.isAvailable}">
                                                                    </div>
                                                                </div>


                                                            </div>
                                                            <!-- Modal footer -->
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-primary"
                                                                        data-toggle="modal"
                                                                        data-target="#editAccount${listAcc.accountId}">
                                                                    Chỉnh sửa
                                                                </button>
                                                                <button type="button" class="btn btn-danger"
                                                                        data-dismiss="modal">Đóng
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- POPUP Edit -->
                                                <button type="button" class="btn btn-primary" title="Sửa thông tin"
                                                        data-toggle="modal"
                                                        data-target="#editAccount${listAcc.accountId}"><i
                                                        class="fa fa-edit"></i>
                                                </button>
                                                <!-- The Modal -->
                                                <div class="modal fade" id="editAccount${listAcc.accountId}">
                                                    <div class="modal-dialog modal-dialog-centered">
                                                        <div class="modal-content">

                                                            <!-- Modal Header -->
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">Cập nhật thông tin</h4>
                                                                <button type="button" class="close"
                                                                        data-dismiss="modal">&times;
                                                                </button>
                                                            </div>

                                                            <!-- Modal body -->
                                                            <div class="modal-body">
                                                                <form action="${pageContext.request.contextPath}/update-account"
                                                                      method="post" id="formEdit${listAcc.accountId}">

                                                                    <div class="form-group">
                                                                        <label for="inpEmail">Email :</label>
                                                                        <input type="text" id="inpEmail" class="form-control" value="${listAcc.email}"name="email" readonly>
                                                                    </div>
                                                                    <div class="form-row">
                                                                        <div class="form-group col-6">
                                                                            <label for="inpFName">Họ :</label>
                                                                            <input
                                                                                    type="text" id="inpFName"
                                                                                    class="form-control"
                                                                                    value="${listAcc.firstName}"
                                                                                    name="firstname">
                                                                        </div>
                                                                        <div class="form-group col-6">
                                                                            <label for="inpLName">Tên :</label> <input
                                                                                type="text" id="inpLName"
                                                                                class="form-control"
                                                                                value=" ${listAcc.lastName}"
                                                                                name="lastname">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-row">
                                                                        <div class="form-group col-6">
                                                                            <label for="editGender">Gender :</label>
                                                                            <select id="editGender" class="form-control"
                                                                                    name="gender">
                                                                                <c:choose>
                                                                                    <c:when test="${listAcc.gender eq 'F'}">
                                                                                        <option value="F"
                                                                                                selected>
                                                                                            Nữ
                                                                                        </option>
                                                                                        <option value="M">
                                                                                            Nam
                                                                                        </option>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <option value="F">
                                                                                            Nữ
                                                                                        </option>
                                                                                        <option value="M" selected>
                                                                                            Nam
                                                                                        </option>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </select>
                                                                        </div>

                                                                        <div class="form-group col-6">
                                                                            <label for="inpDOfB">Ngày sinh :</label>
                                                                            <input
                                                                                    type="date" class="form-control"
                                                                                    id="inpDOfB"
                                                                                    value="${listAcc.dayofBirth}"
                                                                                    name="Bday">
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label for="inpPhone">Số điện thoại :</label> <input
                                                                            type="number" id="inpPhone"
                                                                            class="form-control"
                                                                            value="${listAcc.phone}" name="phone">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="inpAddress">Địa chỉ :</label> <input
                                                                            type="text" id="inpAddress"
                                                                            class="form-control"
                                                                            value="${listAcc.address}" name="address">
                                                                    </div>
                                                                </form>

                                                            </div>

                                                            <!-- Modal footer -->
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-success" form="formEdit${listAcc.accountId}">
                                                                    Cập nhật
                                                                </button>
                                                                <button type="button" class="btn btn-danger"
                                                                        data-dismiss="modal">Đóng
                                                                </button>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>

                                                <form action="${pageContext.request.contextPath}/reset-password"
                                                      method="post" style="display: inline">
                                                    <input type="hidden" value="${listAcc.email}" name="email">
                                                    <button type="submit" title="Tạo lại mật khẩu"
                                                            class="btn btn-warning"><i class="fa fa-redo-alt"></i>
                                                    </button>
                                                </form>


                                                <button type="button" class="btn btn-dark" title="Khóa tài khoản"
                                                        data-toggle="modal"
                                                        data-target="#blockAccount${listAcc.accountId}"><i
                                                        class="fa fa-lock"></i>
                                                </button>
                                                <!-- The Modal -->

                                                <div class="modal fade" id="blockAccount${listAcc.accountId}">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-body">
                                                                <form action="${pageContext.request.contextPath}/delete-account"
                                                                      method="post" id = "blockform${listAcc.email}">
                                                                    <h4 class="modal-title">Bạn có chắc muốn khóa tài khoản: ${listAcc.email} </h4>
                                                                    <input type="hidden" name="email"
                                                                           value="${listAcc.email}"/>

                                                                </form>
                                                            </div>

                                                            <div class="modal-footer">
                                                                <input type="submit" value="Block!"
                                                                       class="btn btn-warning" form="blockform${listAcc.email}"/>
                                                                <button type="button" class="btn btn-danger"
                                                                        data-dismiss="modal">Đóng
                                                                </button>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <tr style="background-color: #5a6268; ">
                                            <td>${listAcc.accountId}</td>
                                            <td>${listAcc.email}</td>
                                            <td>${listAcc.firstName}</td>
                                            <td>${listAcc.lastName}</td>
                                            <td>${listAcc.phone}</td>
                                            <td>${listAcc.isAvailable}</td>
                                            <td>${listAcc.role}</td>
                                            <td>
                                                <form action="${pageContext.request.contextPath}/unblock-account"
                                                      method="post">
                                                    <input type="hidden" value="${listAcc.email}" name="email">
                                                    <button type="submit" title="Mở khóa" class="btn btn-success">
                                                        <i class="fa fa-key "></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>


                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>

            <!-- ---- END Of TABLE -- -->
            <!-- Footer -->
            <c:import url="../commom/footer.html"/>
            <!-- End of Footer -->
        </div>
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
                    <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc sẽ muốn đăng xuất?</h5>
                    <button class="close" type="button" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Chọn "đăng xuất" nếu bạn đã sẵn sàng
                </div>
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
    <script
            src="<%=request.getContextPath()%>/Views/Admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script
            src="<%=request.getContextPath()%>/Views/Admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
<%--    Exoport File --%>
    <script
            src="<%=request.getContextPath()%>/Views/Admin/js/demo/datatables-demo.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/r/dt/jq-2.1.4,jszip-2.5.0,pdfmake-0.1.18,dt-1.10.9,af-2.0.0,b-1.0.3,b-colvis-1.0.3,b-html5-1.0.3,b-print-1.0.3,se-1.0.1/datatables.min.js"></script>
        <script type="text/javascript" >
            $(document).ready(function() {
                $('#dataTable').DataTable( {
                    dom: 'lBfrtip',
                    buttons: [
                        'excel',
                    ],
                } );
            } );
        </script>
        <!---- nhan thong bao phan hoi ---->
        <c:if test="${from == 'insert'}">
        <c:if test="${(thongbao == 'true') && (from=='insert')}">
        <script type="text/javascript">
            alert('Thêm: Thành công!!!');
        </script>
        </c:if>
        <c:if test="${(thongbao == 'error') && (from=='insert')}">
        <script type="text/javascript">
            document.getElementById("BtnShowModalAddUser").click();

        </script>
        </c:if>
        <c:if test="${(thongbao == 'input') && (from=='insert')}">
        <script type="text/javascript">
            alert('Thêm: lỗi nhập liệu!!!');
        </script>
        </c:if>
        </c:if>
        <c:if test="${from == 'update'}">
        <c:if test="${(thongbao == 'true')}">
        <script type="text/javascript">
            alert('Cập nhật: Thành công!!!');
        </script>
        </c:if>
        <c:if test="${(thongbao == 'error') }">
        <script type="text/javascript">
            alert('Cập nhật: Tuổi nhân viên phải lớn hơn 18');
        </script>
        </c:if>
        <c:if test="${(thongbao == 'input')}">
        <script type="text/javascript">
            alert('Cập nhật: input not true');
        </script>
        </c:if>
        </c:if>
        <!-- delete -->
        <c:if test="${from == 'delete'}">
        <c:if test="${(thongbao == 'true') && (from=='delete')}">
        <script type="text/javascript">
            alert('Block/Unblock Thành công !!!');
        </script>
        </c:if>
        <c:if test="${(thongbao == 'error') && (from=='delete')}">
        <script type="text/javascript">
            alert('Block/Unblock: Thất bại');
        </script>
        </c:if>
        <c:if test="${(thongbao == 'input') && (from=='delete')}">
        <script type="text/javascript">
            alert('Block/Unblock: Hãy nhập đầy đủ dữ liệu');
        </script>
        </c:if>
        <c:if test="${(thongbao == 'notFound') && (from=='delete')}">
        <script type="text/javascript">
            alert('Block/Unblock: Không tìm thấy email này');
        </script>
        </c:if>
        </c:if>
        <c:if test="${from == 'reset'}">
        <c:if test="${(thongbao == 'true')}">
        <script type="text/javascript">
            alert('Reset : thành công!!!');
        </script>
        </c:if>
        <c:if test="${(thongbao == 'error')}">
        <script type="text/javascript">
            alert('Reset : lỗi!!!');
        </script>
        </c:if>
        <c:if test="${(thongbao == 'input')}">
        <script type="text/javascript">
            alert('Reset : Hãy nhập đầy đủ dữ liệu');
        </script>
        </c:if>
        <c:if test="${(thongbao == 'notFound') && (from=='delete')}">
        <script type="text/javascript">
            alert('Reset: Không tìm thấy email này');
        </script>
        </c:if>
        </c:if>
</body>
</html>