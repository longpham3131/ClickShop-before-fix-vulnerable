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

    <title>Trang sản phẩm
    </title>
    <!-- CusStom fonts for this template-->

    <link href="<%= request.getContextPath()%>/Views/Admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"

          type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/r/dt/jq-2.1.4,jszip-2.5.0,pdfmake-0.1.18,dt-1.10.9,af-2.0.0,b-1.0.3,b-colvis-1.0.3,b-html5-1.0.3,b-print-1.0.3,se-1.0.1/datatables.min.css"/>

    <link href="<%= request.getContextPath()%>/Views/Admin/css/sb-admin-2.min.css" rel="stylesheet">

    <jsp:useBean id="a" class="DAO.queryDAO" scope="request"></jsp:useBean>
</head>
<body>

<!-- Servlet return true if complete login authentication
You can't access this page if you use link-url and not login -->
<%-- 	<c:if test="${check != 'true'}">
		<c:redirect url="/admin" />
	</c:if> --%>


<!---- nhan thong bao phan hoi ---->


<!-- delete -->
<%
    session.setAttribute("from", "product");
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
            <!--  TABLE PRODUCT ----->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary"
                        style="display: inline; float: left; padding-top: 6px">Danh sách sản phẩm</h6>
                    <!-- Refresh Databa -->
                    <div style=" padding-left: 5%; display: inline; width: 30%; float: left">
                        <form action="${pageContext.request.contextPath}/fill-All-Product"
                              method="post">
                            <button type="submit" class="btn btn-warning"><i class="fa fa-undo"></i> Tải lại bảng
                            </button>
                        </form>
                    </div>
                    <!-- Button to Open the Modal -->
                    <button type="button" class="btn btn-success" style="width: 15%; display:inline; float: right;"
                            data-toggle="modal"
                            data-target="#addProduct" id="BtnShowModalAddProduct">

                        <i class="fa fa-plus mr-2"></i> Thêm sản phẩm
                    </button>
                    <div class="modal fade" id="addProduct">
                        <div class="modal-dialog modal-dialog-scrollable">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Thêm sản phẩm</h4>
                                    <button type="button" class="close"
                                            data-dismiss="modal">&times;
                                    </button>
                                </div>
                                <!-- Modal body -->
                                <div class="modal-body">
                                    <c:choose>
                                        <c:when test="${(thongbao == 'error') && (from=='insert')}">
                                            <form action="${pageContext.request.contextPath}/insert-product"
                                                  method="post" id="formAdd">
                                                <div class="form-group row">
                                                    <label for="nameAdd"
                                                           class="col-sm-4 col-form-label">Tên sản phẩm
                                                        :</label>
                                                    <div class="col-sm-8">
                                                        <input type="text"  value="<c:out value="${nameError}"/>"  class="form-control"  name="name">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="cateidlbAdd">Loại sản phẩm :</label>

                                                    <select  multiple class="form-control"
                                                            name="subcategory">

                                                        <c:forEach items="${listCategory}" var="cate">
                                                            <option value="${cate.getCategoryId()}" ${cate.getCategoryId() == subcategoryError ? 'selected="selected"' : ''}
                                                            >
                                                                    ${cate.getName()}
                                                            </option>

                                                        </c:forEach>

                                                    </select>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="genderAdd"
                                                           class="col-sm-4 col-form-label">Đổi tượng:</label>
                                                    <div class="col-sm-8">
                                                        <select class="form-control"  name="gender">
                                                            <option value="0" ${genderError== 0 ? 'selected="selected"' : ''}>Nam</option>
                                                            <option value="1" ${genderError== 1 ? 'selected="selected"' : ''}>Nữ</option>
                                                            <option value="2" ${genderError== 2 ? 'selected="selected"' : ''}>Cả hai</option>
                                                        </select>

                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="priceAdd"
                                                           class="col-sm-4 col-form-label">Đơn giá
                                                        :</label>
                                                    <div class="col-sm-8">
                                                        <input type="number"
                                                               class="form-control"

                                                               value="<c:out value="${unitpriceError}"/>"
                                                               min="0"
                                                               onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"
                                                               name="unitprice">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="deslb"
                                                           class="col-sm-4 col-form-label">Mô tả sản phẩm
                                                        :</label>
                                                    <div class="col-sm-8">
                                                        <input type="hidden"
                                                               class="form-control"

                                                               value=""
                                                               name="description">


                                                        <textarea class="form-control"

                                                                  rows="3" placeholder="What's up?"
                                                                  onkeyup="myFunction('addProdip','addProd')"
                                                        >${descriptionError}</textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="imgPathAdd"
                                                           class="col-sm-4 col-form-label">Link ảnh
                                                        :</label>
                                                    <div class="col-sm-8">
                                                        <input type="file" class="form-control-file"  name="img">
                                                        <input type="hidden" >
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                        <%--                                            <label for="quantityAdd"--%>
                                                        <%--                                                   class="col-sm-4 col-form-label">Số lượng kho--%>
                                                        <%--                                                :</label>--%>
                                                    <div class="col-sm-8">
                                                        <input type="hidden"
                                                               class="form-control"

                                                               value="0"
                                                               name="available">
                                                    </div>
                                                </div>


                                            </form>
                                        </c:when>

                                        <c:otherwise>
                                            <form action="${pageContext.request.contextPath}/insert-product"
                                                  method="post" id="formAdd">
                                                <div class="form-group row">
                                                    <label for="nameAdd"
                                                           class="col-sm-4 col-form-label">Tên sản phẩm
                                                        :</label>
                                                    <div class="col-sm-8">
                                                        <input type="text" class="form-control" id="nameAdd" name="name">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="cateidlbAdd">Loại sản phẩm :</label>

                                                    <select id="cateidlbAdd" multiple class="form-control"
                                                            name="subcategory">

                                                        <c:forEach items="${listCategory}" var="cate">
                                                            <option value="${cate.getCategoryId()}"
                                                            >
                                                                    ${cate.getName()}
                                                            </option>

                                                        </c:forEach>

                                                    </select>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="genderAdd"
                                                           class="col-sm-4 col-form-label">Đổi tượng:</label>
                                                    <div class="col-sm-8">
                                                        <select class="form-control" id="genderAdd" name="gender">
                                                            <option value="0">Nam</option>
                                                            <option value="1">Nữ</option>
                                                            <option value="2">Cả hai</option>
                                                        </select>

                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="priceAdd"
                                                           class="col-sm-4 col-form-label">Đơn giá
                                                        :</label>
                                                    <div class="col-sm-8">
                                                        <input type="number"
                                                               class="form-control"
                                                               id="priceAdd"
                                                               value=""
                                                               min="0"
                                                               onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"
                                                               name="unitprice">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="deslb"
                                                           class="col-sm-4 col-form-label">Mô tả sản phẩm
                                                        :</label>
                                                    <div class="col-sm-8">
                                                        <input type="hidden"
                                                               class="form-control"
                                                               id="addProdip"
                                                               value=""
                                                               name="description">


                                                        <textarea class="form-control"
                                                                  id="addProd"
                                                                  rows="3" placeholder="What's up?"
                                                                  onkeyup="myFunction('addProdip','addProd')"
                                                        > </textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="imgPathAdd"
                                                           class="col-sm-4 col-form-label">Link ảnh
                                                        :</label>
                                                    <div class="col-sm-8">
                                                        <input type="file" class="form-control-file" id="imgPath" name="img">
                                                        <input type="hidden" id="imgPathAdd">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                        <%--                                            <label for="quantityAdd"--%>
                                                        <%--                                                   class="col-sm-4 col-form-label">Số lượng kho--%>
                                                        <%--                                                :</label>--%>
                                                    <div class="col-sm-8">
                                                        <input type="hidden"
                                                               class="form-control"
                                                               id="quantityAdd"
                                                               value="0"
                                                               name="available">
                                                    </div>
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

                                    <button type="submit" class="btn btn-success" id="btnThemSP" form="formAdd">
                                        Thêm sản phẩm
                                    </button>
                                    <button type="button" class="btn btn-danger"
                                            data-dismiss="modal">Đóng
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable"
                               cellspacing="0">
                            <!-------Ten-cot------ -->
                            <thead>
                            <tr>
                                <th scope="col">ID Sản Phẩm</th>
                                <th scope="col">Ảnh Sản phẩm</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Giá</th>
                                <th scope="col">Số lượng kho</th>
                                <th scope="col">Chức năng</th>
                            </tr>
                            </thead>

                            <!----------Noi-dung-------- -->
                            <tbody>
                            <c:forEach items="${listProduct}" var="row">
                                <c:choose>
                                    <c:when test="${row.getAvailable() >= 1}">
                                        <tr>
                                            <td scope="row"><c:out value="${row.getProductId()}"/></td>
                                            <td class="w-25">
                                                <img src="<%=request.getContextPath()%>/Views/Web${row.getImgPath()}"
                                                     class="img-fluid ">
                                            </td>
                                            <td class="w-25">${row.name}</td>
                                            <td class="priceProduct">${row.getUnitPrice()}</td>
                                            <td>${row.available}</td>
                                            <td>
                                                <button type="button" class="btn btn-info" title="Detail"
                                                        data-toggle="modal" data-target="#Product${row.productId}">
                                                    <i class="fa fa-address-book"></i>
                                                </button>
                                                <div class="modal fade" id="Product${row.productId}">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">

                                                            <!-- Modal Header -->
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">Thông tin</h4>
                                                                <button type="button" class="close"
                                                                        data-dismiss="modal">&times;
                                                                </button>
                                                            </div>
                                                            <!-- Modal body -->
                                                            <div class="modal-body">

                                                                <div class="form-group row">
                                                                    <label for="prodid${row.getName()}"
                                                                           class="col-sm-4 col-form-label">ID Sản phẩm
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" readonly
                                                                               class="form-control-plaintext"
                                                                               id="prodid${row.getName()}"
                                                                               value="${row.productId}">
                                                                    </div>

                                                                    <label for="namelb"
                                                                           class="col-sm-4 col-form-label">Tên sản phẩm
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" readonly
                                                                               class="form-control-plaintext"
                                                                               id="namelb"
                                                                               value="${row.getName()}">
                                                                    </div>
                                                                    <label for="cateidlb${row.getName()}"
                                                                           class="col-sm-4 col-form-label">Loại sản
                                                                        phẩm:</label>
                                                                    <div class="col-sm-8">
                                                                        <c:forEach items="${listCategory}" var="cate">
                                                                            <c:if test="${row.getSubCategoryId() == cate.getCategoryId()}">
                                                                                <input type="text" readonly
                                                                                       class="form-control-plaintext"
                                                                                       id="cateidlb${row.getName()}"
                                                                                       value="${cate.getName()}">
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </div>
                                                                    <label for="genderlb2"
                                                                           class="col-sm-4 col-form-label">Đối tượng:
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <c:choose>
                                                                            <c:when test="${row.getGender() == '0'}">
                                                                                <input type="text" readonly
                                                                                       class="form-control-plaintext"
                                                                                       id="genderlb2"
                                                                                       value="Nam">
                                                                            </c:when>
                                                                            <c:when test="${row.getGender() == '1'}">
                                                                                <input type="text" readonly
                                                                                       class="form-control-plaintext"
                                                                                       id="genderlb2"
                                                                                       value="Nữ">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" readonly
                                                                                       class="form-control-plaintext"
                                                                                       id="genderlb2"
                                                                                       value="Cả hai">
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </div>
                                                                    <label
                                                                           class="col-sm-4 col-form-label">Đơn Giá
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <span class="priceProduct">${row.getUnitPrice()}</span>
<%--                                                                        <input type="text" readonly--%>
<%--                                                                               class="form-control-plaintext priceProduct"--%>
<%--                                                                               id="pricelb"--%>
<%--                                                                               value="${row.getUnitPrice()}">--%>
                                                                    </div>

                                                                    <label for="deslb"
                                                                           class="col-sm-4 col-form-label">Mô
                                                                        tả:</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="hidden" readonly
                                                                               class="form-control-plaintext"
                                                                               id="hidenip"
                                                                               value="${row.getDescription()}">
                                                                        <textarea class="form-control"
                                                                                  id="deslb"
                                                                                  value="${row.getDescription()}"
                                                                                  readonly>${row.getDescription()} </textarea>
                                                                    </div>
                                                                    <label for="availb"
                                                                           class="col-sm-4 col-form-label">Ảnh:</label>
                                                                    <div class="col-sm-8">
                                                                        <img src="<%=request.getContextPath()%>/Views/Web${row.getImgPath()}"
                                                                             class="img-fluid">

                                                                    </div>
                                                                    <label for="availb${row.productId}"
                                                                           class="col-sm-4 col-form-label">Số
                                                                        lượng:</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" readonly
                                                                               class="form-control-plaintext"
                                                                               id="availb${row.productId}"
                                                                               value="${row.getAvailable()}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- Modal footer -->
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-primary"
                                                                        data-toggle="modal"
                                                                        data-target="#productedit${row.productId}"
                                                                >
                                                                    Chỉnh sửa
                                                                </button>
                                                                <button type="button" class="btn btn-danger"
                                                                        data-dismiss="modal">Đóng
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button type="button" class="btn btn-primary" title="Edit"
                                                        data-toggle="modal"
                                                        data-target="#productedit${row.productId}" id="btnShow${row.productId}"><i
                                                        class="fa fa-edit"></i></button>
                                                <div class="modal fade" id="productedit${row.productId}">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">

                                                            <!-- Modal Header -->
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">Chỉnh sửa sản phẩm</h4>
                                                                <button type="button" class="close"
                                                                        data-dismiss="modal">&times;
                                                                </button>
                                                            </div>
                                                            <!-- Modal body -->
                                                            <div class="modal-body">

                                                                <form action="${pageContext.request.contextPath}/update-product"
                                                                      method="post" id="formEdit${row.productId}">
                                                                    <div class="form-group row">
                                                                        <label for="prodidEdit${row.productId}"
                                                                               class="col-sm-4 col-form-label">ID Sản
                                                                            phẩm:</label>
                                                                        <div class="col-sm-8">
                                                                            <input type="text"
                                                                                   class="form-control-plaintext"
                                                                                   id="prodidEdit${row.productId}"
                                                                                   readonly
                                                                                   value="${row.productId}"
                                                                                   name="productid">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="nameProEdit${row.productId}"
                                                                               class="col-sm-4 col-form-label">Tên sản
                                                                            phẩm :</label>
                                                                        <div class="col-sm-8">
                                                                            <input type="text"
                                                                                   class="form-control"
                                                                                   id="nameProEdit${row.productId}"
                                                                                   value="${row.getName()}"
                                                                                   name="name">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="subCateIdEdit${row.productId}"
                                                                               class="col-sm-4 col-form-label">Loại sản
                                                                            phẩm :</label>
                                                                        <div class="col-sm-8">

                                                                            <select id="subCateIdEdit${row.productId}"
                                                                                    multiple
                                                                                    class="form-control"
                                                                                    name="subcategory">
                                                                                <c:forEach items="${listCategory}"
                                                                                           var="cate">
                                                                                    <c:choose>
                                                                                        <c:when test="${row.getSubCategoryId() == cate.getCategoryId()}">
                                                                                            <option selected
                                                                                                    value="${cate.getCategoryId()}"
                                                                                            >
                                                                                                    ${cate.getName()}
                                                                                            </option>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <option value="${cate.getCategoryId()}"
                                                                                            >
                                                                                                    ${cate.getName()}
                                                                                            </option>
                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="genderEdit"
                                                                               class="col-sm-4 col-form-label"> Đối
                                                                            tượng:</label>
                                                                        <div class="col-sm-8">
                                                                            <select id="genderEdit" class="form-control"
                                                                                    name="gender">
                                                                                <c:choose>
                                                                                    <c:when test="${row.getGender() == '0' }">
                                                                                        <option value="0" selected>Nam
                                                                                        </option>
                                                                                        <option value="1">Nữ</option>
                                                                                        <option value="2">Cả hai
                                                                                        </option>
                                                                                    </c:when>
                                                                                    <c:when test="${row.getGender() == '1' }">
                                                                                        <option value="0">Nam</option>
                                                                                        <option value="1" selected>Nữ
                                                                                        </option>
                                                                                        <option value="2">Cả hai
                                                                                        </option>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <option value="0">Nam</option>
                                                                                        <option value="1">Nữ</option>
                                                                                        <option value="2" selected>Cả
                                                                                            hai
                                                                                        </option>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="priceProEdit${row.productId}"
                                                                               class="col-sm-4 col-form-label">Đơn Giá
                                                                            :</label>
                                                                        <div class="col-sm-8">
                                                                            <input type="number"
                                                                                   class="form-control"
                                                                                   id="priceProEdit${row.productId}"
                                                                                   value="${row.getUnitPrice()}"
                                                                                   min="0"
                                                                                   onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"
                                                                                   name="unitprice">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="deslb${row.productId}"
                                                                               class="col-sm-4 col-form-label">Mô
                                                                            tả:</label>
                                                                        <div class="col-sm-8">
                                                                            <input type="hidden"
                                                                                   class="form-control"
                                                                                   id="hidenip${row.productId}"
                                                                                   value="${row.getDescription()}"
                                                                                   name="description">
                                                                            <textarea class="form-control"
                                                                                      id="deslb${row.productId}"
                                                                                      onkeyup="myFunction('hidenip${row.productId}','deslb${row.productId}')"
                                                                            >${row.getDescription()} </textarea>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="imgPathEdit${row.productId}"
                                                                               class="col-sm-4 col-form-label">Link ảnh
                                                                            :</label>
                                                                        <div class="col-sm-8">
                                                                            <input type="file"
                                                                                   id="imgPathEdit${row.productId}"
                                                                                   class="form-control-file" name="img">
                                                                            <input type="hidden" name="imgPathTempt"
                                                                                   value="${row.getImgPath()}">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
<%--                                                                        <label for="availEdit${row.productId}"--%>
<%--                                                                               class="col-sm-4 col-form-label">Số--%>
<%--                                                                            lượng:</label>--%>
                                                                        <div class="col-sm-8">
                                                                            <input type="hidden"
                                                                                   class="form-control d-none"
                                                                                   id="availEdit${row.productId}"
                                                                                   value="${row.getAvailable()}"
                                                                                   name="available">
                                                                        </div>
                                                                    </div>
                                                                    <div class="text-center p-3">
                                                                        <c:if test="${(thongbao == 'error') && (from=='update') && (row.productId == productid)}">
                                                                            <p style="color: red;">${errorDescription}</p>
                                                                        </c:if>
                                                                    </div>
                                                                </form>


                                                            </div>
                                                            <!-- Modal footer -->
                                                            <div class="modal-footer">
                                                                <button type="submit" form="formEdit${row.productId}"
                                                                        class="btn btn-success">
                                                                    Cập nhật
                                                                </button>
                                                                <button type="button" class="btn btn-danger"
                                                                        data-dismiss="modal">Đóng
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button type="button" class="btn btn-success btnclick opentable"
                                                        title="Size"
                                                        id="${row.productId}"
                                                        data-toggle="modal"
                                                        data-target="#Size${row.productId}"><i class="fas fa-boxes"></i>
                                                </button>


                                                <div class="modal fade" id="Size${row.productId}">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">Chỉnh sửa size và số lượng</h4>
                                                                <button type="button" class="close"
                                                                        data-dismiss="modal">&times;
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <table class="table table-bordered"
                                                                       width="100%" cellspacing="0"
                                                                       id="Mytable${row.productId}">
                                                                    <thead>
                                                                    <tr>

                                                                        <th>Size</th>
                                                                        <th>Số lượng</th>
                                                                        <td>Thao tác</td>
                                                                    </tr>
                                                                    <thead>
                                                                    <tbody>
                                                                    <c:forEach items="${row.getSize()}" var="eachsize">
                                                                        <tr>
                                                                            <td>
                                                                                <input maxlength="4" size="4"
                                                                                       value="${eachsize.getSizeId()}"
                                                                                       type="hidden"
                                                                                       class="form-control check"

                                                                                       name="fname"
                                                                                >
                                                                                <input maxlength="4" size="4"
                                                                                       value="${eachsize.getSize()}"
                                                                                       type="text"
                                                                                       class="form-control check"

                                                                                       name="fname"
                                                                                >
                                                                            </td>
                                                                            <td>
                                                                                <input maxlength="4" size="4"
                                                                                       value="${eachsize.getAvailable()}"
                                                                                       type="number"
                                                                                       class="form-control check"
                                                                                       name="fname"
                                                                                       min="0"
                                                                                       onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57"
                                                                                >
                                                                            </td>
                                                                            <td>
                                                                                <button type="button"
                                                                                        class="btn btn-danger deletesize"
                                                                                >
                                                                                    <i class="fas fa-trash delete"></i>
                                                                                </button>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button"
                                                                        class="saveandsubmit btn btn-success"
                                                                        value="Submit">
                                                                    Cập nhật
                                                                </button>
                                                                <button type="button"
                                                                        class="addsize btn btn-warning"
                                                                        id="${row.productId}"
                                                                        value="Submit">
                                                                    Thêm Size
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
                                            <td scope="row"><c:out value="${row.getProductId()}"/></td>
                                            <td class="w-25">
                                                <img src="<%=request.getContextPath()%>/Views/Web${row.getImgPath()}"
                                                     class="img-fluid ">
                                            </td>
                                            <td class="w-25">${row.name}</td>
                                            <td>${row.getUnitPrice()}</td>
                                            <td>${row.available}</td>
                                            <td>
                                                <button type="button" class="btn btn-info" title="Detail"
                                                        data-toggle="modal" data-target="#Product${row.productId}">
                                                    <i class="fa fa-address-book"></i>
                                                </button>
                                                <div class="modal fade" id="Product${row.productId}">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">

                                                            <!-- Modal Header -->
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">Thông tin</h4>
                                                                <button type="button" class="close"
                                                                        data-dismiss="modal">&times;
                                                                </button>
                                                            </div>
                                                            <!-- Modal body -->
                                                            <div class="modal-body">

                                                                <div class="form-group row">
                                                                    <label for="prodid${row.productId}"
                                                                           class="col-sm-4 col-form-label">ID Sản phẩm
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" readonly
                                                                               class="form-control-plaintext"
                                                                               id="prodid${row.productId}"
                                                                               value="${row.productId}">
                                                                    </div>

                                                                    <label for="namelb${row.productId}"
                                                                           class="col-sm-4 col-form-label">Tên sản phẩm
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" readonly
                                                                               class="form-control-plaintext"
                                                                               id="namelb${row.productId}"
                                                                               value="${row.getName()}">
                                                                    </div>
                                                                    <label for="cateidlb${row.productId}"
                                                                           class="col-sm-4 col-form-label">Loại sản
                                                                        phẩm:</label>
                                                                    <div class="col-sm-8">
                                                                        <c:forEach items="${listCategory}" var="cate">
                                                                            <c:if test="${row.getSubCategoryId() == cate.getCategoryId()}">
                                                                                <input type="text" readonly
                                                                                       class="form-control-plaintext"
                                                                                       id="cateidlb${row.productId}"
                                                                                       value="${cate.getName()}">
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </div>
                                                                    <label for="genderlb2"
                                                                           class="col-sm-4 col-form-label">Đối tượng:
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <c:choose>
                                                                            <c:when test="${row.getGender() == '0'}">
                                                                                <input type="text" readonly
                                                                                       class="form-control-plaintext"
                                                                                       id="genderlb2"
                                                                                       value="Nam">
                                                                            </c:when>
                                                                            <c:when test="${row.getGender() == '1'}">
                                                                                <input type="text" readonly
                                                                                       class="form-control-plaintext"
                                                                                       id="genderlb2"
                                                                                       value="Nữ">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" readonly
                                                                                       class="form-control-plaintext"
                                                                                       id="genderlb2"
                                                                                       value="Cả hai">
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </div>
                                                                    <label for="pricelb${row.productId}"
                                                                           class="col-sm-4 col-form-label">Đơn Giá
                                                                        :</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" readonly
                                                                               class="form-control-plaintext"
                                                                               id="pricelb${row.productId}"
                                                                               value="${row.getUnitPrice()}">
                                                                    </div>

                                                                    <label for="deslb"
                                                                           class="col-sm-4 col-form-label">Mô
                                                                        tả:</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="hidden" readonly
                                                                               class="form-control-plaintext"

                                                                               value="${row.getDescription()}">
                                                                        <textarea class="form-control"

                                                                                  value="${row.getDescription()}"
                                                                                  readonly>${row.getDescription()} </textarea>
                                                                    </div>
                                                                    <label for="availb"
                                                                           class="col-sm-4 col-form-label">Ảnh:</label>
                                                                    <div class="col-sm-8">
                                                                        <img src="<%=request.getContextPath()%>/Views/Web${row.getImgPath()}"
                                                                             class="img-fluid">

                                                                    </div>
                                                                    <label for="availb"
                                                                           class="col-sm-4 col-form-label">Số
                                                                        lượng:</label>
                                                                    <div class="col-sm-8">
                                                                        <input type="text" readonly
                                                                               class="form-control-plaintext"
                                                                               id="availb"
                                                                               value="${row.getAvailable()}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- Modal footer -->
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-primary"
                                                                        data-toggle="modal"
                                                                        data-target="#productedit${row.productId}"
                                                                >
                                                                    Chỉnh sửa
                                                                </button>
                                                                <button type="button" class="btn btn-danger"
                                                                        data-dismiss="modal">Đóng
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button type="button" class="btn btn-primary" title="Chỉnh sửa"
                                                        data-toggle="modal"
                                                        data-target="#productedit${row.productId}" "><i
                                                        class="fa fa-edit"></i></button>
                                                <div class="modal fade" id="productedit${row.productId}">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">

                                                            <!-- Modal Header -->
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">Chỉnh sửa sản phẩm</h4>
                                                                <button type="button" class="close"
                                                                        data-dismiss="modal">&times;
                                                                </button>
                                                            </div>
                                                            <!-- Modal body -->
                                                            <div class="modal-body">

                                                                <form action="${pageContext.request.contextPath}/update-product"
                                                                      method="post" id="formEdit${row.productId}">
                                                                    <div class="form-group row">
                                                                        <label for="prodidEdit"
                                                                               class="col-sm-4 col-form-label">ID Sản
                                                                            phẩm:</label>
                                                                        <div class="col-sm-8">
                                                                            <input type="text"
                                                                                   class="form-control-plaintext"
                                                                                   id="prodidEdit" readonly
                                                                                   value="${row.productId}"
                                                                                   name="productid">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="nameProEdit"
                                                                               class="col-sm-4 col-form-label">Tên sản
                                                                            phẩm :</label>
                                                                        <div class="col-sm-8">
                                                                            <input type="text"
                                                                                   class="form-control"
                                                                                   id="nameProEdit"
                                                                                   value="${row.getName()}"
                                                                                   name="name">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="subCateIdEdit"
                                                                               class="col-sm-4 col-form-label">Loại sản
                                                                            phẩm :</label>
                                                                        <div class="col-sm-8">

                                                                            <select id="subCateIdEdit" multiple
                                                                                    class="form-control"
                                                                                    name="subcategory">
                                                                                <c:forEach items="${listCategory}"
                                                                                           var="cate">
                                                                                    <c:choose>
                                                                                        <c:when test="${row.getSubCategoryId() == cate.getCategoryId()}">
                                                                                            <option selected
                                                                                                    value="${cate.getCategoryId()}"
                                                                                            >
                                                                                                    ${cate.getName()}
                                                                                            </option>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <option value="${cate.getCategoryId()}"
                                                                                            >
                                                                                                    ${cate.getName()}
                                                                                            </option>
                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="genderEdit${row.productId}"
                                                                               class="col-sm-4 col-form-label"> Đối
                                                                            tượng:</label>
                                                                        <div class="col-sm-8">
                                                                            <select id="genderEdit${row.productId}"
                                                                                    class="form-control"
                                                                                    name="gender">
                                                                                <c:choose>
                                                                                    <c:when test="${row.getGender() == '0' }">
                                                                                        <option value="0" selected>Nam
                                                                                        </option>
                                                                                        <option value="1">Nữ</option>
                                                                                        <option value="2">Cả hai
                                                                                        </option>
                                                                                    </c:when>
                                                                                    <c:when test="${row.getGender() == '1' }">
                                                                                        <option value="0">Nam</option>
                                                                                        <option value="1" selected>Nữ
                                                                                        </option>
                                                                                        <option value="2">Cả hai
                                                                                        </option>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <option value="0">Nam</option>
                                                                                        <option value="1">Nữ</option>
                                                                                        <option value="2" selected>Cả
                                                                                            hai
                                                                                        </option>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="priceProEdit"
                                                                               class="col-sm-4 col-form-label">Đơn Giá
                                                                            :</label>
                                                                        <div class="col-sm-8">
                                                                            <input type="text"
                                                                                   class="form-control"
                                                                                   id="priceProEdit"
                                                                                   value="${row.getUnitPrice()}"
                                                                                   name="unitprice">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="deslb"
                                                                               class="col-sm-4 col-form-label">Mô
                                                                            tả:</label>
                                                                        <div class="col-sm-8">
                                                                            <input type="hidden"
                                                                                   class="form-control"
                                                                                   id="hidenip${row.productId}"
                                                                                   value="${row.getDescription()}"
                                                                                   name="description">
                                                                            <textarea class="form-control"
                                                                                      id="deslb${row.productId}"
                                                                                      onkeyup="myFunction('hidenip${row.productId}','deslb${row.productId}')"
                                                                            >${row.getDescription()} </textarea>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label for="imgPathEdit"
                                                                               class="col-sm-4 col-form-label">Link ảnh
                                                                            :</label>
                                                                        <div class="col-sm-8">
                                                                            <input type="file" id="imgPathEdit"
                                                                                   class="form-control-file" name="img">
                                                                            <input type="hidden" name="imgPathTempt"
                                                                                   value="${row.getImgPath()}">
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
<%--                                                                        <label for="availEdit"--%>
<%--                                                                               class="col-sm-4 col-form-label">Số--%>
<%--                                                                            lượng:</label>--%>
                                                                        <div class="col-sm-8">
                                                                            <input type="hidden"
                                                                                   class="form-control"
                                                                                   id="availEdit"
                                                                                   value="${row.getAvailable()}"
                                                                                   name="available">
                                                                        </div>
                                                                    </div>

                                                                </form>


                                                            </div>
                                                            <!-- Modal footer -->
                                                            <div class="modal-footer">
                                                                <button type="submit" form="formEdit${row.productId}"
                                                                        class="btn btn-success">
                                                                    Cập nhật
                                                                </button>
                                                                <button type="button" class="btn btn-danger"
                                                                        data-dismiss="modal">Đóng
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <button type="button" class="btn btn-success btnclick opentable"
                                                        title="Size"
                                                        id="${row.productId}"
                                                        data-toggle="modal"
                                                        data-target="#Size${row.productId}"><i class="fas fa-boxes"></i>
                                                </button>


                                                <div class="modal fade" id="Size${row.productId}">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">Chỉnh sửa size và số lượng</h4>
                                                                <button type="button" class="close"
                                                                        data-dismiss="modal">&times;
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <table class="table table-bordered"
                                                                       width="100%" cellspacing="0"
                                                                       id="Mytable${row.productId}">
                                                                    <thead>
                                                                    <tr>

                                                                        <th>Size</th>
                                                                        <th>Số lượng</th>
                                                                        <td>Thao tác</td>
                                                                    </tr>
                                                                    <thead>
                                                                    <tbody>
                                                                    <c:forEach items="${row.getSize()}" var="eachsize">
                                                                        <tr>
                                                                            <td>
                                                                                <input maxlength="4" size="4"
                                                                                       value="${eachsize.getSizeId()}"
                                                                                       type="hidden"
                                                                                       class="form-control check"

                                                                                       name="fname"
                                                                                >
                                                                                <input maxlength="4" size="4"
                                                                                       value="${eachsize.getSize()}"
                                                                                       type="text"
                                                                                       class="form-control check"

                                                                                       name="fname"
                                                                                >
                                                                            </td>
                                                                            <td>
                                                                                <input maxlength="4" size="4"
                                                                                       value="${eachsize.getAvailable()}"
                                                                                       type="text"
                                                                                       class="form-control check"
                                                                                       name="fname"
                                                                                >
                                                                            </td>
                                                                            <td>
                                                                                <button type="button"
                                                                                        class="btn btn-danger deletesize"
                                                                                >
                                                                                    <i class="fas fa-trash delete"></i>
                                                                                </button>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button"
                                                                        class="saveandsubmit btn btn-success"
                                                                        value="Submit">
                                                                    Cập nhật
                                                                </button>
                                                                <button type="button"
                                                                        class="addsize btn btn-warning"
                                                                        id="${row.productId}"
                                                                        value="Submit">
                                                                    Thêm Size
                                                                </button>

                                                            </div>

                                                        </div>

                                                    </div>

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
            <!-- ---- END Of TABLE -- -->

            <!-- End of Content Wrapper -->
        </div>
        <c:import url="../commom/footer.html"/>
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
                        <span aria-hidden="true">ï¿½</span>
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
    <!-- Bootstrap core JavaScript-->
    <script>
        function myFunction(a, b) {
            document.getElementById(a).value = document.getElementById(b).value;
            console.log(document.getElementById(a).value);
        }

        // chuyển tập tin ảnh
        // document.getElementById("btnThemSP").addEventListener("click", function(){
        // 	console.log("yeye");
        // 	document.getElementById("imgPathAdd").value = document.getElementById("imgPath").files[0].name;
        // })
    </script>
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
    <script
            src="<%=request.getContextPath()%>/Views/Admin/js/demo/datatables-demo.js"></script>

    <script
            src="<%=request.getContextPath()%>/Views/Admin/js/admin-product.js"></script>
<%--        Export file--%>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
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
    <!-- Page level custom scripts -->

        <script>
            let listGia = document.querySelectorAll(".priceProduct");
            for (i = 0; i < listGia.length; i++) {
                listGia[i].innerHTML = new Intl.NumberFormat('vn-VN', {
                    style: 'currency',
                    currency: 'VND'
                }).format(parseInt(listGia[i].innerHTML));
            }
        </script>

        <c:if test="${from == 'insert'}">
        <c:if test="${(thongbao == 'true') && (from=='insert')}">
        <script type="text/javascript">
            alert('Thêm: Thành công!!!');
        </script>
        </c:if>
        <c:if test="${(thongbao == 'error') && (from=='insert')}">
        <script type="text/javascript">
            document.getElementById("BtnShowModalAddProduct").click();

        </script>
        </c:if>

        <c:if test="${(thongbao == 'input') && (from=='insert')}">
        <script type="text/javascript">
            alert('Thêm thất bại : Lỗi nhập liệu!!!');
        </script>
        </c:if>
        </c:if>
        <c:if test="${from == 'update'}">
        <c:if test="${(thongbao == 'true')}">
        <script type="text/javascript">
            alert('Cập nhật: Thành Công!!!');
        </script>
        </c:if>
        <c:if test="${(thongbao == 'error') }">
        <script type="text/javascript">
            alert('Cập nhật: Thất Bại');
        </script>
        </c:if>
        <c:if test="${(thongbao == 'input')}">
        <script type="text/javascript">
            alert('Cập nhật: input not true');
        </script>
        </c:if>
        </c:if>
</body>
</html>