<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="loader-wrapper">
    <span class="loader"><span class="loader-inner"></span></span>
</div>
<div class="overlay"></div>
<header id="myHeader">
    <%--    <h1> ${email}</h1>--%>
    <%--  Check Login and Role --%>
    <%
        String email = (String) session.getAttribute("email");
        //String role = (String) session.getAttribute("role");

        if (email == null)
            email = "login";
    %>
    <div class="">
        <div class="header__top d-flex justify-content-between align-items-center">
            <c:choose>
                <c:when test="${email != null}">
                    <div class="header__logo" >
                        <a href="<%=request.getContextPath()%>/fill-All-Display">
                            <img src="<%=request.getContextPath()%>/Views/Web/image_product/logo.png" alt="">
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="header__logo" style="flex-grow: 0;" >
                        <a href="<%=request.getContextPath()%>/fill-All-Display">
                            <img src="<%=request.getContextPath()%>/Views/Web/image_product/logo.png" alt="">
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="header__nav">
                <nav class="navbar navbar-expand-lg">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse justify-content-around" id="navbarNavDropdown">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown no__relative">
                                <a class="nav-link " href="<%=request.getContextPath()%>/fill-All-Sanpham">
                                    TẤT CẢ SẢN PHẨM
                                </a>
                            </li>
                            <li class="nav-item dropdown no__relative">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown__giaynam" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    GIÀY NAM
                                </a>
                                <div class="dropdown-menu  animate__animated animate__slideInDown"
                                     aria-labelledby="dropdown__giaynam" aria-expanded="true">
                                    <div class="d-flex">
                                        <div class="dropdown__content col-2">
                                            <a class="dropdown-item" href="#">
                                                <form action="<%=request.getContextPath()%>/filter-Product"
                                                      method="post">
                                                    <button type="submit"
                                                            style=" outline: none;   background: transparent; border: none;">
                                                        CHELSEA BOOT
                                                    </button>
                                                    <input type="hidden" value="Chealsea Boots - Men" name="Name"/>
                                                </form>
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <form action="<%=request.getContextPath()%>/filter-Product"
                                                      method="post">
                                                    <button type="submit"
                                                            style=" outline: none; background: transparent; border: none;">
                                                        DERBY
                                                    </button>
                                                    <input type="hidden" value="DERBY" name="Name"/>
                                                </form>
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <form action="<%=request.getContextPath()%>/filter-Product"
                                                      method="post">
                                                    <button type="submit"
                                                            style=" outline: none; background: transparent; border: none;">
                                                        HARNESS BOOT
                                                    </button>
                                                    <input type="hidden" value="Harness Boots" name="Name"/>
                                                </form>
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <form action="<%=request.getContextPath()%>/filter-Product"
                                                      method="post">
                                                    <button type="submit"
                                                            style=" outline: none; background: transparent; border: none;">
                                                        ZIP BOOT
                                                    </button>
                                                    <input type="hidden" value="Zip Boots" name="Name"/>
                                                </form>
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <form action="<%=request.getContextPath()%>/filter-Product"
                                                      method="post">
                                                    <button type="submit"
                                                            style=" outline: none; background: transparent; border: none;">
                                                        COMBAT BOOT
                                                    </button>
                                                    <input type="hidden" value="Combat Boots - Men" name="Name"/>
                                                </form>
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <form action="<%=request.getContextPath()%>/filter-Product"
                                                      method="post">
                                                    <button type="submit"
                                                            style=" outline: none; background: transparent; border: none;">
                                                        OXFORD
                                                    </button>
                                                    <input type="hidden" value="OXFORD" name="Name"/>
                                                </form>
                                            </a>
                                        </div>
                                        <div class="dropdown__image col-10">
                                            <div class="row">
                                                <div class="col-4">
                                                    <img src="<%=request.getContextPath()%>/Views/Web/image_product/dropdown__nam_1.png"
                                                         alt="">

                                                </div>
                                                <div class="col-4">
                                                    <img src="<%=request.getContextPath()%>/Views/Web/image_product/dropdown__nam_2.png"
                                                         alt="">


                                                </div>
                                                <div class="col-4">
                                                    <img src="<%=request.getContextPath()%>/Views/Web/image_product/dropdown__nam_3.png"
                                                         alt="">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item dropdown no__relative">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown__giaynu" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    GIÀY NỮ
                                </a>
                                <div class="dropdown-menu  animate__animated animate__slideInDown"
                                     aria-labelledby="dropdown__giaynu">
                                    <div class="d-flex">
                                        <div class="dropdown__content col-2">
                                            <a class="dropdown-item" href="#">
                                                <form action="<%=request.getContextPath()%>/filter-Product"
                                                      method="post">
                                                    <button type="submit"
                                                            style=" outline: none; background: transparent; border: none;">
                                                        CHELSEA BOOT
                                                    </button>
                                                    <input type="hidden" value="Chealsea Boots - Women" name="Name"/>
                                                </form>
                                            </a>

                                            <a class="dropdown-item" href="#">
                                                <form action="<%=request.getContextPath()%>/filter-Product"
                                                      method="post">

                                                    <button type="submit"
                                                            style=" outline: none; background: transparent; border: none;">
                                                        COMBAT BOOT
                                                    </button>
                                                    <input type="hidden" value="Combat Boots - Women" name="Name"/>
                                                </form>
                                            </a>
                                        </div>
                                        <div class="dropdown__image col-10">
                                            <div class="d-flex">
                                                <div class="col-4">
                                                    <img src="<%=request.getContextPath()%>/Views/Web/image_product/dropdown__nu_1.png"
                                                         alt="Responsive image">
                                                </div>
                                                <div class="col-4">
                                                    <img src="<%=request.getContextPath()%>/Views/Web/image_product/dropdown__nu_2.png"
                                                         alt="Responsive image">
                                                </div>
                                                <div class="col-4">
                                                    <img src="<%=request.getContextPath()%>/Views/Web/image_product/dropdown__nu_3.png"
                                                         alt="Responsive image">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item dropdown no__relative">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown__Tee" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    TEE(UNISEX)
                                </a>
                                <div class="dropdown-menu   animate__animated animate__slideInDown"
                                     aria-labelledby="dropdown__Tee">
                                    <div class="d-flex">
                                        <div class="dropdown__content col-2">
                                            <a class="dropdown-item" href="#">
                                                <form action="<%=request.getContextPath()%>/filter-Product"
                                                      method="post">
                                                    <button type="submit"
                                                            style=" outline: none; background: transparent; border: none;">
                                                        T-SHIRT
                                                    </button>
                                                    <input type="hidden" value="T-SHIRT" name="Name"/>
                                                </form>
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <form action="<%=request.getContextPath()%>/filter-Product"
                                                      method="post">
                                                    <button type="submit"
                                                            style=" outline: none; background: transparent; border: none;">
                                                        SHIRT
                                                    </button>
                                                    <input type="hidden" value="SHIRT" name="Name"/>
                                                </form>
                                            </a>
                                        </div>
                                        <div class="dropdown__image col-10">
                                            <div class="d-flex">
                                                <div class="col-4">
                                                    <img src="<%=request.getContextPath()%>/Views/Web/image_product/dropdown__tee_1.jpg"
                                                         alt="Responsive image">
                                                </div>
                                                <div class="col-4">
                                                    <img src="<%=request.getContextPath()%>/Views/Web/image_product/dropdown__tee_2.jpg"
                                                         alt="Responsive image">
                                                </div>
                                                <div class="col-4">
                                                    <img src="<%=request.getContextPath()%>/Views/Web/image_product/dropdown__tee_3.jpg"
                                                         alt="Responsive image">
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </li>
                            <li class="nav-item dropdown no__relative">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown__phuKien" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    PHỤ KIỆN
                                </a>
                                <div class="dropdown-menu  animate__animated animate__slideInDown"
                                     aria-labelledby="dropdown__phuKien">
                                    <div class="d-flex">
                                        <div class="dropdown__content col-2">
                                            <a class="dropdown-item" href="#">
                                                <form action="<%=request.getContextPath()%>/filter-Product"
                                                      method="post">
                                                    <button type="submit"
                                                            style=" outline: none; background: transparent; border: none;">
                                                        BELT
                                                    </button>
                                                    <input type="hidden" value="BELT" name="Name"/>
                                                </form>
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <form action="<%=request.getContextPath()%>/filter-Product"
                                                      method="post">
                                                    <button type="submit"
                                                            style=" outline: none; background: transparent; border: none;">
                                                        BRACELET
                                                    </button>
                                                    <input type="hidden" value="BRACELET" name="Name"/>
                                                </form>
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <form action="<%=request.getContextPath()%>/filter-Product"
                                                      method="post">
                                                    <button type="submit"
                                                            style=" outline: none; background: transparent; border: none;">
                                                        CHAIN
                                                    </button>
                                                    <input type="hidden" value="CHAIN" name="Name"/>
                                                </form>
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <form action="<%=request.getContextPath()%>/filter-Product"
                                                      method="post">
                                                    <button type="submit"
                                                            style=" outline: none; background: transparent; border: none;">
                                                        BANDANA
                                                    </button>
                                                    <input type="hidden" value="BANDANA" name="Name"/>
                                                </form>
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <form action="<%=request.getContextPath()%>/filter-Product"
                                                      method="post">
                                                    <button type="submit"
                                                            style=" outline: none; background: transparent; border: none;">
                                                        NECKLACE
                                                    </button>
                                                    <input type="hidden" value="NECKLACE" name="Name"/>
                                                </form>
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <form action="<%=request.getContextPath()%>/filter-Product"
                                                      method="post">
                                                    <button type="submit"
                                                            style=" outline: none; background: transparent; border: none;">
                                                        BUCKET HAT
                                                    </button>
                                                    <input type="hidden" value="BUCKET HAT" name="Name"/>
                                                </form>
                                            </a>
                                        </div>
                                        <div class="dropdown__image col-10">
                                            <div class="d-flex">
                                                <div class="col-4">
                                                    <img src="<%=request.getContextPath()%>/Views/Web/image_product/dropdown__belt_1.jpg"
                                                         alt="Responsive image">
                                                </div>
                                                <div class="col-4">
                                                    <img src="<%=request.getContextPath()%>/Views/Web/image_product/dropdown__belt_2.jpg"
                                                         alt="Responsive image">
                                                </div>
                                                <div class="col-4">
                                                    <img src="<%=request.getContextPath()%>/Views/Web/image_product/dropdown__chain_1.jpg"
                                                         alt="Responsive image">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>

            <div class="header__icons d-flex  align-items-center">
                <c:choose>
                    <c:when test="${email != null}">
                        <div class="pr-3  text-light">
                            <a class="font-weight-bold" style="font-size: 15px;"
                               href="<%=request.getContextPath()%>/my-profile" aria-label="Tài khoản"
                               title="Tài khoản"> ${email} </a>
                            <p> Số dư: <span id="txtCoin" class="pl-1"> ${coin}</span></p>

                        </div>
                        <a href="#" aria-label="Giỏ hàng" title="Giỏ hàng" data-toggle="modal" data-target="#myModal"><i
                                class="fa fa-shopping-cart  "></i></a>

                        <a href="#" title="Tìm kiếm" id="sidebarCollapse"> <i class="fa fa-search"></i></a>

                        <form action="<%=request.getContextPath()%>/fill-All-Display" method="post" class="px-2">
                            <input type="hidden" value="1" name="logout">
                            <button type="submit" title="Dang xuat"><i class="fa fa-sign-out-alt "></i></button>
                        </form>
                        <script>
                            document.getElementById("txtCoin").innerHTML = new Intl.NumberFormat('vn-VN', { style: 'currency', currency: 'VND' }).format(document.getElementById("txtCoin").innerHTML);
                        </script>
                    </c:when>
                    <c:otherwise>
                        <a href="<%=request.getContextPath()%>/login-all" aria-label="Tài khoản"
                           title="Tài khoản"> <i></i><i class="fa fa-user"></i> </a>
                        <a href="#" aria-label="Giỏ hàng" title="Giỏ hàng" data-toggle="modal" data-target="#myModal"><i
                                class="fa fa-shopping-cart"></i></a>
                        <a href="#" title="Tìm kiếm" id="sidebarCollapse"> <i class="fa fa-search"></i></a>
                    </c:otherwise>
                </c:choose>
                <%--                <a href="#" aria-label="Tìm kiếm" title="Tìm kiếm"><i class="fa fa-search"></i></a>--%>

            </div>


        </div>


        <!-- Modal giỏ hàng -->
        <div class="modal fade" id="myModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Giỏ hàng của bạn</h4>
                        <button type="button" class="close"
                                data-dismiss="modal">&times;
                        </button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="d-sm-flex justify-content-end mb-4">

                            <h4 class="mt-sm-0 mt-3">Hiện tại có :
                                <span class="soLuongSanPham">0</span> sản phẩm
                            </h4>
                        </div>
                        <table class="timetable_sub tableOrder" >
                            <thead>
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Số lượng</th>
                                <th class="d-none">Giá</th>
                                <th>Giá</th>
                                <th>Xóa</th>
                            </tr>
                            </thead>
                            <tbody class="tbodyCart">

                            </tbody>
                        </table>
                        <div class="text-right pt-3">
                            <h3>Tổng tiền: <span class="totalPrice">0đ</span></h3>

                        </div>

                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">

                        <c:choose>
                            <c:when test="${email != null}">
                                <a href="<%=request.getContextPath()%>/check-out">

                                    <button type="summit"
                                            class="btn btn-success btnThanhToan">Thanh
                                        Toán
                                    </button>
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="<%=request.getContextPath()%>/login-all">
                                    <button type="summit"
                                            class="btn btn-success">Thanh
                                        Toán
                                    </button>
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
