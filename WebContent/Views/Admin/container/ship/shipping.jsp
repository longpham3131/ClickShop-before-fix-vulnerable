<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="card shadow mb-4 ">
    <div class="card-header py-3">
        <h4 class="m-0 font-weight-bold text-primary">Những đơn hàng đang giao</h4>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%"
                   cellspacing="0">
                <thead>
                <tr>
                    <th>Mã đơn hàng</th>
                    <th>Mã Shipper</th>
                    <th>Trạng thái giao hàng</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <!----------Noi-dung-------- -->
                <tbody>
                <c:forEach items="${listShipping}" var="listSpg" varStatus="loop">
                    <c:choose>
                        <c:when test="${listSpg.status == 'Cancel'}">
                            <tr style="background-color: #fededf">
                                <td>${listSpg.orderID}</td>
                                <td>${listSpg.shipperID}</td>
                                <td>${listSpg.status}</td>
                                <td>
                                    <button type="button" class="btn btn-info" title="Chi tiết đơn hàng"
                                            data-toggle="modal" data-target="#myCancekOrder1${listSpg.orderID}">
                                        <i class="fa fa-address-book"></i>
                                    </button>
                                    <button type="button" class="btn btn-primary" title="Thông tin Shipper"
                                            data-toggle="modal" data-target="#myship12${listSpg.shipperID}">
                                        <i class="fa fa-shipping-fast"></i>
                                    </button>
                                    <button type="button" class="btn btn-danger" title="Đơn hoàn thành"
                                            data-toggle="modal" data-target="#endOrder123${listSpg.orderID}">
                                        <i class="fa fa-check-square"></i>
                                    </button>

                                    <div class="modal fade" id="myCancekOrder1${listSpg.orderID}">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Chi tiết đơn hàng</h4>
                                                    <button type="button" class="close"
                                                            data-dismiss="modal">&times;
                                                    </button>
                                                </div>
                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    <div class="form-group row">
                                                        <label for="staticID"
                                                               class="col-sm-4 col-form-label">Mã đơn hàng
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" Quantity readonly
                                                                   class="form-control-plaintext"

                                                                   value="${listSpg.orderID}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="staticEmail"
                                                               class="col-sm-4 col-form-label">Email
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" readonly
                                                                   class="form-control-plaintext"

                                                                   value="${listSpg.email}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="staticEmail"
                                                               class="col-sm-4 col-form-label">Địa chỉ nhận hàng
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" readonly
                                                                   class="form-control-plaintext"
                                                                   value="${listSpg.address}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="staticEmail"
                                                               class="col-sm-4 col-form-label">Số điện thoại khách hàng
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" readonly
                                                                   class="form-control-plaintext"
                                                                   value="${listSpg.phone}.">
                                                        </div>
                                                    </div>
                                                    <table class="table table-bordered" width="100%"
                                                           cellspacing="0">
                                                        <thead>
                                                        <tr>
                                                            <th>Mã sản phẩm</th>
                                                            <th>Tên sản phẩm</th>
                                                            <th>Số lượng</th>
                                                            <th>Size</th>
                                                            <th>Đơn giá</th>
                                                        </tr>
                                                        </thead>
                                                        <!----------Noi-dung-------- -->
                                                        <tbody>
                                                        <c:set var="sum" value="0"/>
                                                        <c:forEach items="${listShippingDetail}" var="listShiping"
                                                                   varStatus="loop">
                                                            <c:if test="${listSpg.orderID == listShiping.orderID}">
                                                                <tr>
                                                                    <td>${listShiping.productID}</td>
                                                                    <td>${listShiping.name}</td>
                                                                    <td>${listShiping.quanity}</td>
                                                                    <td>${listShiping.size} </td>
                                                                    <td class="priceProduct">${listShiping.subTotal}</td>
                                                                    <c:set var="tien" value="${listShiping.subTotal}"/>
                                                                    <c:set var="sum" value="${sum + tien}"/>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <div class="text-right">Tổng tiền: <span class="priceProduct">${sum}</span> </div>
                                                </div>


                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger"
                                                            data-dismiss="modal">Close
                                                    </button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal fade" id="myship12${listSpg.shipperID}">
                                        <c:forEach items="${listShipper}" var="listSp" varStatus="loop">
                                            <c:if test="${listSp.getAccountId() == listSpg.shipperID}">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">

                                                        <!-- Modal Header -->
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">Thông tin Shipper</h4>
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

                                                                           value="${listSp.accountId}">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="staticEmail"
                                                                       class="col-sm-4 col-form-label">Email
                                                                    :</label>
                                                                <div class="col-sm-8">
                                                                    <input type="text" readonly
                                                                           class="form-control-plaintext"

                                                                           value="${listSp.email}">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="staticName"
                                                                       class="col-sm-4 col-form-label">Họ và tên
                                                                    :</label>
                                                                <div class="col-sm-8">
                                                                    <input type="text" readonly
                                                                           class="form-control-plaintext"

                                                                           value="${listSp.firstName} ${listSp.lastName}">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="staticPhone"
                                                                       class="col-sm-4 col-form-label">Số điện thoại
                                                                    :</label>
                                                                <div class="col-sm-8">
                                                                    <input type="text" readonly
                                                                           class="form-control-plaintext"

                                                                           value="${listSp.phone}">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="staticAddress"
                                                                       class="col-sm-4 col-form-label">Địa chỉ
                                                                    :</label>
                                                                <div class="col-sm-8">
                                                                    <input type="text" readonly
                                                                           class="form-control-plaintext"

                                                                           value="${listSp.address}">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="staticGender"
                                                                       class="col-sm-4 col-form-label">Giới tính
                                                                    :</label>
                                                                <div class="col-sm-8">
                                                                    <input type="text" readonly
                                                                           class="form-control-plaintext"

                                                                           value="${listSp.gender}">
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <!-- Modal footer -->
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-danger"
                                                                    data-dismiss="modal">Đóng
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>

                                            </c:if>
                                        </c:forEach>
                                    </div>

                                    <div class="modal fade" id="endOrder123${listSpg.orderID}">
                                        <div class="modal-dialog">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Kết thúc đơn hàng</h4>
                                                    <button type="button" class="close"
                                                            data-dismiss="modal">&times;
                                                    </button>
                                                </div>
                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    <div class="form-group row">
                                                        <label for="staticName"
                                                               class="col-sm-5 col-form-label">Mã đơn hàng
                                                            :</label>
                                                        <div class="col-sm-7">
                                                            <input type="text" readonly
                                                                   class="form-control-plaintext"
                                                                   value="${listSpg.orderID}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        Diagram             <label for="staticName"
                                                               class="col-sm-5 col-form-label">Trạng thái đơn hàng
                                                            :</label>
                                                        <div class="col-sm-7">
                                                            <input type="text" readonly
                                                                   class="form-control-plaintext"
                                                                   value="${listSpg.status}">
                                                        </div>
                                                    </div>
                                                    <form action="<%=request.getContextPath()%>/endOrder" method="post" id="endOrderForm">
                                                        <input type="hidden" value="${listSpg.orderID}" name="OrtherID"/>
                                                        <input type="hidden" value="${listSpg.status}" name="Status"/>
                                                    </form>
                                                </div>


                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <button type="submit" form="endOrderForm" class="btn btn-success">Xác nhận</button>
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
                        <c:when test="${listSpg.status == 'Completed'}">
                            <tr style="background-color: #cccdff">
                                <td>${listSpg.orderID}</td>
                                <td>${listSpg.shipperID}</td>
                                <td>${listSpg.status}</td>
                                <td>
                                    <button type="button" class="btn btn-info" title="Chi tiết đơn hàng"
                                            data-toggle="modal" data-target="#myShippingOrder${listSpg.orderID}">
                                        <i class="fa fa-address-book"></i>
                                    </button>
                                    <button type="button" class="btn btn-primary" title="Thông tin shipper"
                                            data-toggle="modal" data-target="#myship2${listSpg.shipperID}">
                                        <i class="fa fa-shipping-fast"></i>
                                    </button>
                                    <button type="button" class="btn btn-danger" title="Đơn hàng hoàn thành"
                                            data-toggle="modal" data-target="#endOrder${listSpg.orderID}">
                                        <i class="fa fa-check-square"></i>
                                    </button>

                                    <div class="modal fade" id="myShippingOrder${listSpg.orderID}">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Chi tiết đơn hàng</h4>
                                                    <button type="button" class="close"
                                                            data-dismiss="modal">&times;
                                                    </button>
                                                </div>
                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    <div class="form-group row">
                                                        <label for="staticID"
                                                               class="col-sm-4 col-form-label">Mã đơn hàng
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" Quantity readonly
                                                                   class="form-control-plaintext"

                                                                   value="${listSpg.orderID}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="staticEmail"
                                                               class="col-sm-4 col-form-label">Email
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" readonly
                                                                   class="form-control-plaintext"

                                                                   value="${listSpg.email}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="staticEmail"
                                                               class="col-sm-4 col-form-label">Địa chỉ nhận hàng
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" readonly
                                                                   class="form-control-plaintext"
                                                                   value="${listSpg.address}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="staticEmail"
                                                               class="col-sm-4 col-form-label">Số điện thoại khách hàng
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" readonly
                                                                   class="form-control-plaintext"
                                                                   value="${listSpg.phone}.">
                                                        </div>
                                                    </div>
                                                    <table class="table table-bordered"  width="100%"
                                                           cellspacing="0">
                                                        <thead>
                                                        <tr>
                                                            <th>Mã sản phẩm</th>
                                                            <th>Tên sản phẩm</th>
                                                            <th>Số lượng</th>
                                                            <th>Đơn giá</th>
                                                        </tr>
                                                        </thead>
                                                        <!----------Noi-dung-------- -->
                                                        <tbody>
                                                        <c:set var="sum" value="0"/>
                                                        <c:forEach items="${listShippingDetail}" var="listShiping"
                                                                   varStatus="loop">
                                                            <c:if test="${listSpg.orderID == listShiping.orderID}">
                                                                <tr>
                                                                    <td>${listShiping.productID}</td>
                                                                    <td>${listShiping.name}</td>
                                                                    <td>${listShiping.quanity}</td>
                                                                    <td class="priceProduct">${listShiping.subTotal}</td>
                                                                    <c:set var="tien" value="${listShiping.subTotal}"/>
                                                                    <c:set var="sum" value="${sum + tien}"/>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <div class="text-right">Tổng tiền: <span class="priceProduct">${sum}</span> </div>
                                                </div>
                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger"
                                                            data-dismiss="modal">Đóng
                                                    </button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal fade" id="myship2${listSpg.shipperID}">
                                        <c:forEach items="${listShipper}" var="listSp" varStatus="loop">
                                            <c:if test="${listSp.getAccountId() == listSpg.shipperID}">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">

                                                        <!-- Modal Header -->
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">Thông tin Shipper</h4>
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

                                                                           value="${listSp.accountId}">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="staticEmail"
                                                                       class="col-sm-4 col-form-label">Email
                                                                    :</label>
                                                                <div class="col-sm-8">
                                                                    <input type="text" readonly
                                                                           class="form-control-plaintext"

                                                                           value="${listSp.email}">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="staticName"
                                                                       class="col-sm-4 col-form-label">Họ và tên
                                                                    :</label>
                                                                <div class="col-sm-8">
                                                                    <input type="text" readonly
                                                                           class="form-control-plaintext"

                                                                           value="${listSp.firstName} ${listSp.lastName}">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="staticPhone"
                                                                       class="col-sm-4 col-form-label">Số điện thoại
                                                                    :</label>
                                                                <div class="col-sm-8">
                                                                    <input type="text" readonly
                                                                           class="form-control-plaintext"

                                                                           value="${listSp.phone}">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="staticAddress"
                                                                       class="col-sm-4 col-form-label">Địa chỉ
                                                                    :</label>
                                                                <div class="col-sm-8">
                                                                    <input type="text" readonly
                                                                           class="form-control-plaintext"

                                                                           value="${listSp.address}">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label for="staticGender"
                                                                       class="col-sm-4 col-form-label">Giới tính
                                                                    :</label>
                                                                <div class="col-sm-8">
                                                                    <input type="text" readonly
                                                                           class="form-control-plaintext"

                                                                           value="${listSp.gender}">
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <!-- Modal footer -->
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-danger"
                                                                    data-dismiss="modal">Đóng
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>

                                            </c:if>
                                        </c:forEach>
                                    </div>

                                    <div class="modal fade" id="endOrder${listSpg.orderID}">
                                        <div class="modal-dialog">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Kết thúc đơn hàng</h4>
                                                    <button type="button" class="close"
                                                            data-dismiss="modal">&times;
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-group row">
                                                        <label for="staticName"
                                                               class="col-sm-4 col-form-label">Mã đơn hàng
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" readonly
                                                                   class="form-control-plaintext"
                                                                   value="${listSpg.orderID}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="staticName"
                                                               class="col-sm-4 col-form-label">Trạng thái đơn hàng
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" readonly
                                                                   class="form-control-plaintext"
                                                                   value="${listSpg.status}">
                                                        </div>
                                                    </div>
                                                    <form action="<%=request.getContextPath()%>/endOrder" method="post" id="endOrderForm2">
                                                        <input type="hidden" value="${listSpg.orderID}" name="OrtherID"/>
                                                        <input type="hidden" value="${listSpg.status}" name="Status"/>

                                                    </form>
                                                </div>
                                                <!-- Modal body -->


                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <button type="submit" form="endOrderForm2" class="btn btn-success">Xác nhận</button>
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
                            <tr>
                                <td>${listSpg.orderID}</td>
                                <td>${listSpg.shipperID}</td>
                                <td>${listSpg.status}</td>
                                <td>
                                    <button type="button" class="btn btn-info" title="Chi tiết đơn hàng"
                                            data-toggle="modal" data-target="#myShippingOrder${listSpg.orderID}">
                                        <i class="fa fa-address-book"></i>
                                    </button>
                                    <button type="button" class="btn btn-primary" title="Thông tin Shipper"
                                            data-toggle="modal" data-target="#myship3${listSpg.shipperID}">
                                        <i class="fa fa-shipping-fast"></i></button>

                                    <div class="modal fade" id="myShippingOrder${listSpg.orderID}">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Chi tiết đơn hàng</h4>
                                                    <button type="button" class="close"
                                                            data-dismiss="modal">&times;
                                                    </button>
                                                </div>
                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    <div class="form-group row">
                                                        <label for="staticID"
                                                               class="col-sm-4 col-form-label">Mã đơn hàng
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" Quantity readonly
                                                                   class="form-control-plaintext"

                                                                   value="${listSpg.orderID}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="staticEmail"
                                                               class="col-sm-4 col-form-label">Email
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" readonly
                                                                   class="form-control-plaintext"

                                                                   value="${listSpg.email}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="staticEmail"
                                                               class="col-sm-4 col-form-label">Địa chỉ giao hàng
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" readonly
                                                                   class="form-control-plaintext"
                                                                   value="${listSpg.address}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label for="staticEmail"
                                                               class="col-sm-4 col-form-label">Số điện thoại khách hàng
                                                            :</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" readonly
                                                                   class="form-control-plaintext"
                                                                   value="${listSpg.phone}.">
                                                        </div>
                                                    </div>
                                                    <table class="table table-bordered" id="orther detail" width="100%"
                                                           cellspacing="0">
                                                        <thead>
                                                        <tr>
                                                            <th>Mã sản phẩm</th>
                                                            <th>Tên sản phẩm</th>
                                                            <th>Số lượng</th>
                                                            <th>Đơn giá</th>
                                                        </tr>
                                                        </thead>
                                                        <!----------Noi-dung-------- -->
                                                        <tbody>
                                                        <c:set var="sum" value="0"/>
                                                        <c:forEach items="${listShippingDetail}" var="listShiping"
                                                                   varStatus="loop">
                                                            <c:if test="${listSpg.orderID == listShiping.orderID}">
                                                                <tr>
                                                                    <td>${listShiping.productID}</td>
                                                                    <td>${listShiping.name}</td>
                                                                    <td>${listShiping.quanity}</td>
                                                                    <td class="priceProduct">${listShiping.subTotal}</td>
                                                                    <c:set var="tien" value="${listShiping.subTotal}"/>
                                                                    <c:set var="sum" value="${sum + tien}"/>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <div class="text-right">Tổng tiền: <span class="priceProduct"> ${sum}</span></div>
                                                </div>


                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger"
                                                            data-dismiss="modal">Đóng
                                                    </button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal fade" id="myship3${listSpg.shipperID}">
                                        <c:forEach items="${listShipper}" var="listSp" varStatus="loop">
                                            <c:if test="${listSp.getAccountId() == listSpg.shipperID}">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">

                                                        <!-- Modal Header -->
                                                        <div class="modal-header">
                                                            <h4 class="modal-title">Thông tin Shipper</h4>
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
                                                                           value="${listSp.accountId}">
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
                                                                           value="${listSp.email}">
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
                                                                           value="${listSp.firstName} ${listSp.lastName}">
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
                                                                           value="${listSp.phone}">
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
                                                                           value="${listSp.address}">
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
                                                                           value="${listSp.gender}">
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <!-- Modal footer -->
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-danger"
                                                                    data-dismiss="modal">Đóng
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>

                                            </c:if>
                                        </c:forEach>
                                    </div>

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