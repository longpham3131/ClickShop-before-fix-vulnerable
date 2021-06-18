<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="card shadow mb-4 ">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Những đơn hàng chưa giao cho Shipper</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%"
                   cellspacing="0">
                <thead>
                <tr>
                    <th>Mã đơn hàng</th>
                    <th>Tiền đơn hàng</th>
                    <th>Địa chỉ giao hàng</th>
                    <th>Thao tác</th>
                </tr>
                </thead>

                <!----------Noi-dung-------- -->

                <tbody>
                <c:forEach items="${listInitOrder}" var="listIO" varStatus="loop">
                    <c:set var="sum" value="0"/>

                    <tr>
                        <td>${listIO.orderID}</td>
                        <td class="priceProduct">${listIO.subTotal}</td>
                        <td>${listIO.address}</td>
                        <td>
                            <button type="button" class="btn btn-info" title="Xem chi tiết"
                                    data-toggle="modal" data-target="#myNoShipDetail${listIO.orderID}">
                                <i class="fa fa-address-book"></i>
                            </button>

                            <button type="button" class="btn btn-primary" title="Chọn shipper"
                                    data-toggle="modal" data-target="#myShipper${listIO.orderID}">
                                <i class="fa fa-shipping-fast"></i>
                            </button>

                            <div class="modal fade" id="myNoShipDetail${listIO.orderID}">
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
                                                           id="staticID"
                                                           value="${listIO.orderID}">
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
                                                           value="${listIO.email}">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="staticEmail"
                                                       class="col-sm-4 col-form-label">Địa chỉ nhận hàng
                                                    :</label>
                                                <div class="col-sm-8">
                                                    <input type="text" readonly
                                                           class="form-control-plaintext"
                                                           value="${listIO.address}">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="staticEmail"
                                                       class="col-sm-4 col-form-label">Số điện thoại khách hàng
                                                    :</label>
                                                <div class="col-sm-8">
                                                    <input type="text" readonly
                                                           class="form-control-plaintext"
                                                           value="${listIO.phone}">
                                                </div>
                                            </div>
                                            <table class="table table-bordered"  width="100%"
                                                   cellspacing="0">
                                                <thead>
                                                <tr>
                                                    <th>Mã sản phẩm </th>
                                                    <th>Tên sản phẩm</th>
                                                    <th>Số lượng</th>
                                                    <th>Size</th>
                                                    <th>Đơn giá</th>
                                                </tr>
                                                </thead>
                                                <!----------Noi-dung-------- -->
                                                <tbody>
                                                <c:set var="sum" value="0"/>
                                                <c:forEach items="${listNoShipDetail}" var="listSpg" varStatus="loop">
                                                    <c:if test="${listSpg.orderID == listIO.orderID}">
                                                        <tr>
                                                            <td>${listSpg.productID}</td>
                                                            <td>${listSpg.name}</td>
                                                            <td>${listSpg.quanity}</td>
                                                            <td>${listSpg.size} </td>
                                                            <td class="priceProduct">${listSpg.subTotal}</td>
                                                            <c:set var="tien" value="${listSpg.subTotal}"/>
                                                            <c:set var="sum" value="${sum + tien}"/>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <div class="text-right " > Tổng tiền: <span class="priceProduct">${sum}</span> </div>
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

                            <div class="modal fade" id="myShipper${listIO.orderID}">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Chọn Shipper</h4>
                                            <button type="button" class="close"
                                                    data-dismiss="modal">&times;
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <table class="table table-bordered" id="orther detal" width="100%"
                                                   cellspacing="0">
                                                <thead>
                                                <tr>
                                                    <th>Mã Shipper</th>
                                                    <th>Họ và tên</th>
                                                    <th>Số điện thoại</th>
                                                    <th>Đơn hàng đang giao</th>
                                                    <th>Thao tác</th>
                                                </tr>
                                                </thead>
                                                <!----------Noi-dung-------- -->
                                                <tbody>

                                                <c:forEach items="${listShipper}" var="listSp" varStatus="loop">
                                                    <tr>
                                                        <td>${listSp.getAccountId()}</td>
                                                        <td>${listSp.firstName }</td>
                                                        <td>${listSp.phone}</td>
                                                        <td>${listSp.ortherCarring}</td>
                                                        <td>
                                                            <form action="<%=request.getContextPath()%>/chooseShipper" method="post">
                                                                <input type="hidden" value="chonShipper" name="chooseShipper"/>
                                                                <input type="hidden" value="${listSp.getAccountId()}" name="shipperID"/>
                                                                <input type="hidden" value="${listIO.orderID}" name="OrtherID"/>
                                                                <input type="submit" class="btn btn-success" value="Chọn" style="background-color: #357ebd; color: white">
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>


                                        <div class="modal-footer">
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


