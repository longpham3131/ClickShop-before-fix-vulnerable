<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="card shadow mb-4 ">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary"></h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%"
                   cellspacing="0">
                <thead>
                <tr>
                    <th>Mã đơn hàng</th>
                    <th>Mã shipper</th>
                    <th>Trạng thái đơn hàng</th>
                    <th>Thao tác</th>
                </tr>
                </thead>

                <!----------Noi-dung-------- -->
                <tbody>
                <c:forEach items="${listPicking}" var="listPkg" varStatus="loop">
                    <tr>
                        <td>${listPkg.orderID}</td>
                        <td>${listPkg.shipperID}</td>
                        <td>${listPkg.init}</td>
                        <td>
                            <button type="button" class="btn btn-info" title="Other Detail"
                                    data-toggle="modal" data-target="#mypick3${listPkg.orderID}">
                                <i class="fa fa-address-book"></i>
                            </button>
                            <button type="button" class="btn btn-primary" title="Shipper Detail"
                                    data-toggle="modal" data-target="#myShipperinTable3${listPkg.shipperID}">
                                <i class="fa fa-shipping-fast"></i>
                            </button>
                            <button type="button" class="btn btn-danger" title="Picked"
                                    data-toggle="modal" data-target="#CheckPick${listPkg.orderID}">
                                <i class="fa fa-cart-arrow-down"></i>
                            </button>

                            <div class="modal fade" id="mypick3${listPkg.orderID}">
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
                                                       class="col-sm-4 col-form-label">Mã đơn hàng:</label>
                                                <div class="col-sm-8">
                                                    <input type="text" Quantity readonly
                                                           class="form-control-plaintext"

                                                           value="${listPkg.orderID}">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="staticEmail"
                                                       class="col-sm-4 col-form-label">Email
                                                    :</label>
                                                <div class="col-sm-8">
                                                    <input type="text" readonly
                                                           class="form-control-plaintext"

                                                           value="${listPkg.email}">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="staticEmail"
                                                       class="col-sm-4 col-form-label">Địa chỉ nhận hàng
                                                    :</label>
                                                <div class="col-sm-8">
                                                    <input type="text" readonly
                                                           class="form-control-plaintext"
                                                           value="${listPkg.address}">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="staticEmail"
                                                       class="col-sm-4 col-form-label">Số điện thoại khách hàng
                                                    :</label>
                                                <div class="col-sm-8">
                                                    <input type="text" readonly
                                                           class="form-control-plaintext"
                                                           value="${listPkg.phone}">
                                                </div>
                                            </div>
                                            <table class="table table-bordered" id="orther detail" width="100%"
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
                                                <c:forEach items="${listPickDetail}" var="listPick3" varStatus="loop">
                                                    <c:if test="${listPkg.orderID == listPick3.orderID}">
                                                        <tr>
                                                            <td>${listPick3.productID}</td>
                                                            <td>${listPick3.name}</td>
                                                            <td>${listPick3.quanity}</td>
                                                            <td>${listPick3.size} </td>
                                                            <td class="priceProduct">${listPick3.subTotal}</td>
                                                            <c:set var="tien" value="${listPick3.subTotal}"/>
                                                            <c:set var="sum" value="${sum + tien}"/>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>

                                            <div class="text-right">
                                                Tổng tiền đơn hàng:  <span class="priceProduct"> ${sum} </span>
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
                            </div>

                            <div class="modal fade" id="myShipperinTable3${listPkg.shipperID}">
                                <c:forEach items="${listShipper}" var="listSp" varStatus="loop">
                                    <c:if test="${listSp.getAccountId() == listPkg.shipperID}">
                                        <div class="modal-dialog">
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

                            <div class="modal fade" id="CheckPick${listPkg.orderID}">
                                <div class="modal-dialog">
                                    <div class="modal-content">

                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">Xác nhận đã giao hàng cho shipper</h4>
                                            <button type="button" class="close"
                                                    data-dismiss="modal">&times;
                                            </button>
                                        </div>
                                        <!-- body -->
                                        <div class="modal-body">
                                            <div class="form-group row">
                                                <label for="staticID"
                                                       class="col-sm-4 col-form-label">Mã đơn hàng
                                                    :</label>
                                                <div class="col-sm-8">
                                                    <input type="text" Quantity readonly
                                                           class="form-control-plaintext"
                                                           id="staticID"
                                                           value="${listPkg.orderID}">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="staticID"
                                                       class="col-sm-4 col-form-label">Mã Shipper
                                                    :</label>
                                                <div class="col-sm-8">
                                                    <input type="text" Quantity readonly
                                                           class="form-control-plaintext"
                                                           value="${listPkg.shipperID}">
                                                </div>
                                            </div>

                                            <form action="<%=request.getContextPath()%>/shippicked" method="post" id="shippickedForm${listPkg.orderID}">
                                                <input type="hidden" value="${listPkg.orderID}" name="OrtherIDx">
                                            </form>
                                        </div>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="submit" form="shippickedForm${listPkg.orderID}"
                                                    class="btn btn-success">Đồng ý
                                            </button>
                                            <button type="button" class="btn btn-danger"
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