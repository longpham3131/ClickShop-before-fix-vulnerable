<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>

    <c:import url="./global/linkCSS.jsp"> </c:import>

</head>

<body class="position-relative">
<c:import url="./commom/header.jsp"> </c:import>
<c:import url="./commom/sideBar.jsp"> </c:import>
<section class="carousel">
    <div class="owl-carousel owl-theme">
        <div class="item"><img src="<%=request.getContextPath()%>/Views/Web/image_product/banner__carousel_2.jpg"
                               alt=""></div>
        <div class="item"><img src="<%=request.getContextPath()%>/Views/Web/image_product/banner__carousel.jpg" alt="">
        </div>


    </div>
</section>
<section class="basicCollection text-center">
    <div class="basicCollection__title">
        <h2><a href="#">THE BASIC COLLECTION</a></h2>
    </div>
    <!-- Swiper -->
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <c:forEach items="${listSanpham}" var="row">
                <c:if test="${row.getProductId()  < 7 }">
                    <div class="swiper-slide">
                        <form action="<%=request.getContextPath()%>/chooseProduct" method="post">
                            <button type="submit" style="    background: transparent; border: none;">
                                <input type="hidden" value="${row.productId}" name="ProductId"/>
                                <input type="hidden" value="${row.name}" name="Name"/>
                                <input type="hidden" value="${row.imagePath}" name="ImagePath"/>
                                <input type="hidden" value="${row.description}" name="Description"/>
                                <input type="hidden" value="${row.getUnitPrice()}" name="UnitPrice"/>
                                <input type="hidden" value="${row.getQuannity()}" name="Quannity"/>
                                <img src="<%=request.getContextPath()%>/Views/Web${row.getImagePath()}" alt="">
                                <c:if test="${row.getQuannity() <= 0 }">
                                    <h5 style="color: #721c24; position: absolute; bottom: 55px; left: 0; right: 0;">
                                        HẾT HÀNG
                                    </h5>
                                </c:if>
                                <h4>
                                        ${row.name}
                                </h4>
                                <span class="priceProduct">
                                        ${row.getUnitPrice()}
                                </span>
                            </button>
                        </form>

                    </div>
                </c:if>
            </c:forEach>

        </div>
        <!-- Add Arrows -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
</section>
<section class="banner position-relative">
    <div class="banner__content">
        <h4>THE CLICK SHOP</h4>
        <h2>BASIC COLLECTION</h2>
        <form action="<%=request.getContextPath()%>/fill-All-Sanpham" method="post">
            <button type="submit" class="btn btn-dark">
                XEM THÊM
            </button>
        </form>
    </div>
</section>
<section class="outfit container">
    <h4 class="pb-2"><a href="#">Click Shop Founder</a></h4>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <img src="<%=request.getContextPath()%>/Views/Web/image_product/kha.jpg" alt="">
                <a href="#" data-toggle="modal" data-target="#exampleModal"><span>PHAM THUC KHA</span></a>
            </div>
            <div class="swiper-slide">
                <img src="<%=request.getContextPath()%>/Views/Web/image_product/kiet.jpg" alt="">
                <a href="#" data-toggle="modal" data-target="#exampleModal"><span>NGUYEN TUAN KIET</span></a>
            </div>
            <div class="swiper-slide">
                <img src="<%=request.getContextPath()%>/Views/Web/image_product/long.jpg" alt="">
                <a href="#" data-toggle="modal" data-target="#exampleModal"><span>PHAM HOANG LONG</span></a>
            </div>
        </div>
        <!-- Add Arrows -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>

</section>

<c:import url="./commom/footer.jsp"> </c:import>


<c:import url="./global/linkScript.jsp"> </c:import>



<script src="<%=request.getContextPath()%>/Views/Web/js/sanPham.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/DanhSachSanPham.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/checkOut.js"></script>






<c:if test="${kq == 1}">
    <%--Xóa giỏ hàng sau khi đặt hàng thành công --%>
    <script> alert("Đặt hàng thành công");</script>
    <script>
        dssp.xoaTatCaSP();
        setLocalStorage();
        getLocalStorage();
    </script>
    <%  session.setAttribute("kq", "0"); %>
</c:if>
<c:if test="${kq == -1} ">
        <%  session.setAttribute("kq", "0"); %>
<script> alert("Đặt hàng thất bại"); </script>
</c:if>




