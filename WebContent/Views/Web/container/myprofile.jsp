<%--
  Created by IntelliJ IDEA.
  User: Tuan Kiet
  Date: 12/22/2020
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang tài khoản</title>
<c:import url="../global/linkCSS.jsp"> </c:import>
<body class="position-relative">

<c:import url="../commom/header.jsp"> </c:import>
<c:import url="../commom/sideBar.jsp"> </c:import>

<c:if test="${kqupdate == '1'}"><script>  alert("Đổi password thành công"); </script> </c:if>
<c:if test="${kqupdate == '2'}"><script>  alert("Cập nhật thông tin thành công"); </script> </c:if>
<c:if test="${kqupdate == '0'}"><script>  alert("Opps! Đã xảy ra lỗi"); </script> </c:if>
<c:if test="${kqupdate == 'old'}"><script>  alert("Mật khẩu cũ không đúng"); </script> </c:if>
<c:if test="${kqupdate == 'confirm'}"><script>  alert("Nhập lại mật khẩu không chính xác"); </script> </c:if>



<style>
    .profilePage .nav-pills .nav-link.active {
        color: #fff;
        background-color: #120c0c;
    }

    .profilePage .nav-pills .nav-link {
        background-color: #cec5c552;
    }
</style>

<div class="row p-4 profilePage">
    <div class="col-3">
        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">

            <a class="nav-link active" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab"
               aria-controls="v-pills-profile" aria-selected="false">Thông tin cá nhân</a>

            <a class="nav-link" id="v-pills-passwd-tab" data-toggle="pill" href="#v-pills-passwd" role="tab"
               aria-controls="v-pills-passwd" aria-selected="false">Đổi mật khẩu</a>

            <a class="nav-link" id="v-pills-voucher-tab" data-toggle="pill" href="#v-pills-voucher" role="tab"
               aria-controls="v-pills-passwd" aria-selected="false">Voucher</a>

            <a class="nav-link " id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab"
               aria-controls="v-pills-home" aria-selected="true">Lịch sử đơn hàng</a>


        </div>
    </div>
    <div class="col-9">
        <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade  show active" id="v-pills-profile" role="tabpanel"
                 aria-labelledby="v-pills-profile-tab">
                <div class="text-center pb-3">
                    <h4>Thông tin cá nhân</h4>
                </div>
                <div class="profile__user container col-9">
                    ${info.size()}
                    <c:forEach items="${myinfo}" var="info">
                        <form action="<%=request.getContextPath()%>/update-profile" method="post" id="formUpdateUser">
                            <div class="form-group row">
                                <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-10">
                                    <input type="text" readonly class="form-control-plaintext" id="staticEmail"
                                           name="myemail" value="${info.email}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inpFname" class="col-sm-2 col-form-label">Họ và tên</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="inpFname" name="myfirstname"
                                           value="${info.firstName}">
                                    <span class="animate__animated animate__fadeIn" style="display: none;"  id="tbHo"></span>
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="inpLname" name="mylastname"
                                           value="${info.lastName}">
                                    <span class="animate__animated animate__fadeIn" style="display: none;"  id="tbTen"></span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inpPhone" class="col-sm-2 col-form-label">Số điện thoại</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" id="inpPhone" name="myphone"
                                           value="${info.phone}"
                                           onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57">
                                    <span class="animate__animated animate__fadeIn" style="display: none;"  id="tbSDT"></span>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inpAddress" class="col-sm-2 col-form-label">Địa chỉ</label>
                                <div class="col-sm-10">
                                    <input type="tel" class="form-control" id="inpAddress" name="myaddress"
                                           value="${info.address}">
                                    <span class="animate__animated animate__fadeIn" style="display: none;"  id="tbDiaChi"></span>
                                </div>
                            </div>
                            <input type="hidden" value="${info.gender}" name="mygender">
                            <input type="hidden" value="${info.dayofBirth}" name="myday">

                        </form>
                        <div class="text-right">
                            <button type="button" id="btnUpdateUser" class=" button dark btn-addtocart addtocart-modal" name="change"
                                    style="background-color: #5a6268; color: white";> Cập nhật thông tin
                            </button>
                        </div>



                    </c:forEach>
                </div>
            </div>
            <div class="tab-pane fade" id="v-pills-passwd" role="tabpanel"
                 aria-labelledby="v-pills-profile-tab">
                <div class="text-center pb-3">
                    <h4>Đổi mật khẩu</h4>
                </div>
                <div class="profile__user container col-9">
                    <form action="<%=request.getContextPath()%>/changepass" method="post" id="formChangePass">
                        <input type="hidden" value="${email}" name="email">
                        <div class="form-group row">
                            <label for="oldPass" class="col-sm-4 col-form-label">Mật khẩu cũ:</label>
                            <div class="col-sm-8">
                                <input type="password"  class="form-control" id="oldPass"
                                       name="oldpass">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inpPass" class="col-sm-4 col-form-label">Mật khẩu mới:</label>
                            <div class="col-sm-8">
                                <input type="password"  class="form-control" id="inpPass"
                                       name="newpass">
                                <span class="animate__animated animate__fadeIn" style="display: none; color: whitesmoke !important;" id="tbMatKhau"></span>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="confirmnewpass" class="col-sm-4 col-form-label">Nhập lại mật khẩu mới:</label>
                            <div class="col-sm-8">
                                <input type="password"  class="form-control" id="confirmnewpass"
                                       name="confirmnewpass">
                            </div>
                        </div>

                    </form>
                    <div class="text-right">
                        <button type="button"  id="btnChangePass" class=" button dark btn-addtocart addtocart-modal"
                                style="background-color: #5a6268; color: white";> Đổi mật khẩu
                        </button>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="v-pills-voucher">
                <div class="text-center pb-3">
                    <h4>Sử dụng voucher</h4>
                </div>
                <div class="container col-9">
                    <c:forEach items="${myinfo}" var="info">
                        <form action="<%=request.getContextPath()%>/use-voucher" method="post" id="formVoucher">
                            <div class="form-group row">
                                <label for="inpVoucher" class="col-sm-4 col-form-label">Mã Vouchder:  </label>
                                <div class="col-sm-8">
                                    <input type="hidden" name="myemail" value="${info.email}">
                                    <input type="text" class="form-control" id="inpVoucher" name="code">
                                    <div class="mt-2">
                                        <span >${useVou}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="text-right">
                                <button type="submit"  class=" button dark btn-addtocart addtocart-modal"
                                        style="background-color: #5a6268; color: white";> Sử dụng
                                </button>
                            </div>
                        </form>
                    </c:forEach>

                </div>

            </div>
            <div class="tab-pane fade" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                <%--TAT CA DON HANG CUA BAN--%>
                <div class="card shadow mb-4">
                    <div class="card-header py-3 text-center">
                        <h5 class="m-0 font-weight-bold text-dark">Tất cả đơn hàng</h5>
                    </div>
                    <table class="table table-bordered" width="100%"
                           cellspacing="0">
                        <thead>
                        <tr>
                            <th>Mã đơn hàng</th>
                            <th>Tổng tiền</th>
                            <th>Trạng thái</th>
                            <th>Thông tin</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listAllOrder}" var="listAO">
                            <tr>
                                <td> ${listAO.getOrderID()}</td>
                                <td class="priceProduct"> ${listAO.getSubTotal()}</td>
                                <td> ${listAO.getStatus()}</td>
                                <td>
                                    <button type="button" class="btn btn-info" title="Detail" data-toggle="modal"
                                            data-target="#detail${listAO.getOrderID()}">
                                        Chi tiết đơn hàng
                                    </button>
                                    <!-- The Modal -->
                                    <div class="modal fade" id="detail${listAO.getOrderID()}">
                                        <div class="modal-dialog modal-dialog-centered modal-xl">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Chi tiết đơn hàng</h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;
                                                    </button>
                                                </div>

                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    <table class="table table-bordered" width="100%" cellspacing="0">
                                                        <thead>
                                                        <tr>
                                                            <th>Mã đơn hàng</th>
                                                            <th>Tên sản phẩm</th>
                                                            <th>Số lượng</th>
                                                            <th>Tổng tiền</th>
                                                            <th>Trạng thái</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach items="${listAllOrderDetail}" var="listAOD">
                                                            <tr>
                                                                <c:if test="${listAO.getOrderID() == listAOD.getOrderID()}">
                                                                    <td> ${listAOD.getOrderID()}</td>
                                                                    <td> ${listAOD.getName()}</td>
                                                                    <td> ${listAOD.getQuanity()}</td>
                                                                    <td class="priceProduct"> ${listAOD.getSubTotal()}</td>

                                                                    <td> ${listAOD.getStatus()}</td>
                                                                </c:if>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                                                        Đóng
                                                    </button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <%-- DANG GIAO--%>
                <div class="card shadow mb-4">
                    <div class="card-header py-3 text-center">
                        <h5 class="m-0 font-weight-bold text-dark">Đang Thực Hiện</h5>
                    </div>
                    <table class="table table-bordered" id="dataTable" width="100%"
                           cellspacing="0">
                        <thead>
                        <tr>
                            <th>Mã đơn hàng</th>
                            <th>Tổng tiền</th>
                            <th>Trạng thái</th>
                            <th>Thông tin</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listShipOrder}" var="ListSO">
                            <tr>

                                <td> ${ListSO.getOrderID()}</td>
                                <td class="priceProduct"> ${ListSO.getSubTotal()}</td>
                                <td> ${ListSO.getStatus()} </td>
                                <td>
                                    <button type="button" class="btn btn-info" title="Detail" data-toggle="modal"
                                            data-target="#detailShip${ListSO.getOrderID()}">
                                        Chi tiết đơn hàng
                                    </button>
                                    <!-- The Modal -->
                                    <div class="modal fade" id="detailShip${ListSO.getOrderID()}">
                                        <div class="modal-dialog modal-dialog-centered modal-xl">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Chi tiết đơn hàng</h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;
                                                    </button>
                                                </div>

                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    <table class="table table-bordered" id="orther detail" width="100%"
                                                           cellspacing="0">
                                                        <thead>
                                                        <tr>
                                                            <th>Mã đơn hàng</th>
                                                            <th>Tên sản phẩm</th>
                                                            <th>Số lượng</th>
                                                            <th>Tổng tiền</th>
                                                            <th>Trạng thái</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach items="${listShipOrderDetail}" var="listSODetail">
                                                            <tr>
                                                                <c:if test="${ListSO.getOrderID() == listSODetail.getOrderID()}">
                                                                    <td> ${listSODetail.getOrderID()}</td>
                                                                    <td> ${listSODetail.getName()}</td>
                                                                    <td> ${listSODetail.getQuanity()}</td>
                                                                    <td class="priceProduct"> ${listSODetail.getSubTotal()}</td>

                                                                    <td> ${listSODetail.getStatus()}</td>
                                                                </c:if>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                            data-dismiss="modal">Đóng
                                                    </button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<c:import url="../commom/footer.jsp"> </c:import>

<c:import url="../global/linkScript.jsp"> </c:import>

<script src="<%=request.getContextPath()%>/Views/Web/js/sanPham.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/DanhSachSanPham.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/checkOut.js"></script>


<%--Main JS --%>
<script src="<%=request.getContextPath()%>/Views/Global/Validation.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/profileValid.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/forgotPassValidation.js"></script>
</body>
</html>
