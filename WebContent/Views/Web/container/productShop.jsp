<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Sản phẩm</title>

    <c:import url="../global/linkCSS.jsp"> </c:import>
</head>

<body class="position-relative">

<!---- nhan thong bao phan hoi ---->
<c:if test="${from == 'sort'}">
<c:if test="${(thongbao == 'true')}">
    <script type="text/javascript">
        alert('Sắp xếp thành công');
    </script>
</c:if>
</c:if>



<c:import url="../commom/header.jsp"> </c:import>
<c:import url="../commom/sideBar.jsp"> </c:import>
<section class="product">
    <div class="product__head d-flex bg-light p-3">
        <p>Trang chủ /</p>
        <form action="<%=request.getContextPath()%>/fill-All-Sanpham" method="post" class="pl-2">
            <button type="submit" class="btnDanhMuc">
                Tất cả sản phẩm /
            </button>
        </form>
        <c:choose>
            <c:when test="${ tenCata == 'Tat ca san pham' }">
                <p class="pl-2"></p>
            </c:when>
            <c:otherwise>
                <p class="pl-2"><%=request.getAttribute("tenCata") %> </p>
            </c:otherwise>
        </c:choose>

    </div>
    <div class="p-3 ">

        <form action="<%=request.getContextPath()%>/sort-Product" method="POST" >
            <input type="hidden" value="<%=request.getAttribute("tenCata") %>" name="Name"/>
            <select name="Type" class="form-control ml-auto col-2" id="myselect" onchange="this.form.submit()">
                <c:choose>
                    <c:when test="${sortType == 'ASC'}">
                        <option value="ASS">Sản phẩm nổi bật</option>
                        <option value="ASC" selected>Giá tăng dần</option>
                        <option value="DESC">Giá giảm dần</option>
                    </c:when>
                    <c:when test="${sortType == 'DESC'}">
                        <option value="ASS">Sản phẩm nổi bật</option>
                        <option value="ASC">Giá tăng dần</option>
                        <option value="DESC"selected>Giá giảm dần</option>
                    </c:when>
                    <c:otherwise>
                        <option value="ASS" selected>Sản phẩm nổi bật</option>
                        <option value="ASC">Giá tăng dần</option>
                        <option value="DESC">Giá giảm dần</option>
                    </c:otherwise>
                </c:choose>
            </select>
        </form>
    </div>
    <div class="product__main pt-2">
        <div class="row">
            <div class="d-none d-lg-block d-xl-block col-lg-2 pl-4">
                <div class="wrapper">
                    <!-- Sidebar -->
                    <nav>
                        <ul class="list-unstyled components">

                            <li>
                                <a href="#allXL" aria-expanded="false">

                                </a>
                            </li>
                            <li class="active">

                                <a href="#maleXL" data-toggle="collapse" aria-expanded="false"
                                   class="dropdown-toggle product__catagory">GIÀY NAM</a>
                                <ul class="collapse list-unstyled" id="maleXL">
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                CHELSEA BOOT
                                            </button>
                                            <input type="hidden" value="Chealsea Boots - Men" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                DERBY
                                            </button>
                                            <input type="hidden" value="DERBY" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                HARNESS BOOT
                                            </button>
                                            <input type="hidden" value="Harness Boots" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                ZIP BOOT
                                            </button>
                                            <input type="hidden" value="Zip Boots" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                COMBAT BOOT
                                            </button>
                                            <input type="hidden" value="Combat Boots - Men" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                OXFORD
                                            </button>
                                            <input type="hidden" value="OXFORD" name="Name"/>
                                        </form>
                                    </li>

                                </ul>
                            </li>
                            <li>
                                <a href="#femaleXL" data-toggle="collapse" aria-expanded="false"
                                   class="dropdown-toggle product__catagory">GIÀY NỮ</a>
                                <ul class="collapse list-unstyled" id="femaleXL">
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                CHELSEA BOOT
                                            </button>
                                            <input type="hidden" value="Chealsea Boots - Women" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                COMBAT BOOT
                                            </button>
                                            <input type="hidden" value="Combat Boots - Women" name="Name"/>
                                        </form>
                                    </li>

                                </ul>
                            </li>
                            <li>
                                <a href="#teeXL" data-toggle="collapse" aria-expanded="false"
                                   class="dropdown-toggle product__catagory">TEE (UNISEX)</a>
                                <ul class="collapse list-unstyled" id="teeXL">
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                T-SHIRT
                                            </button>
                                            <input type="hidden" value="T-SHIRT" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                SHIRT
                                            </button>
                                            <input type="hidden" value="SHIRT" name="Name"/>
                                        </form>
                                    </li>

                                </ul>
                            </li>
                            <li>
                                <a href="#accessoryXL" data-toggle="collapse" aria-expanded="false"
                                   class="dropdown-toggle product__catagory">PHỤ KIỆN</a>
                                <ul class="collapse list-unstyled" id="accessoryXL">
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                BELT
                                            </button>
                                            <input type="hidden" value="BELT" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                BRACELET
                                            </button>
                                            <input type="hidden" value="BRACELET" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                CHAIN
                                            </button>
                                            <input type="hidden" value="CHAIN" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                BANDANA
                                            </button>
                                            <input type="hidden" value="BANDANA" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                NECKLACE
                                            </button>
                                            <input type="hidden" value="NECKLACE" name="Name"/>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="<%=request.getContextPath()%>/filter-Product" method="post">
                                            <button type="submit" style="    background: transparent; border: none;">
                                                BUCKET HAT
                                            </button>
                                            <input type="hidden" value="BUCKET HAT" name="Name"/>
                                        </form>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </nav>

                </div>
            </div>
            <div class="col-12 col-lg-10">
                <div class="product__type text-center">
                    <div class="product__catagories d-md-block d-lg-none d-xl-none">
                        <div class="title-bl" href="#thongTinSP" data-toggle="collapse">
                            <h2>
                                Danh mục sản phẩm

                            </h2>
                            <i class="fa fa-plus"></i>
                        </div>
                        <div class="collapse list-unstyled" id="thongTinSP">
                            <div class="main_details">
                                <ul class="list-unstyled components">
                                    <li class="active">
                                        <a href="#male" data-toggle="collapse" aria-expanded="false"
                                           class="dropdown-toggle product__catagory">GIÀY NAM</a>
                                        <ul class="collapse list-unstyled" id="male">
                                            <li>
                                                <a href="#">CHELSEA BOOT</a>
                                            </li>
                                            <li>
                                                <a href="#">DERBY</a>
                                            </li>
                                            <li>
                                                <a href="#">HARNESS BOOT</a>
                                            </li>
                                            <li>
                                                <a href="#">ZIP BOOT</a>
                                            </li>
                                            <li>
                                                <a href="#">COMBAT BOOT</a>
                                            </li>
                                            <li>
                                                <a href="#">OXFORD</a>
                                            </li>
                                            <li>
                                                <a href="#">MONKSTRAP</a>
                                            </li>
                                        </ul>
                                    </li>

                                    <li>
                                        <a href="#female" data-toggle="collapse" aria-expanded="false"
                                           class="dropdown-toggle product__catagory">GIÀY NỮ</a>
                                        <ul class="collapse list-unstyled" id="female">
                                            <li>
                                                <a href="#">CHELSEA BOOT</a>
                                            </li>
                                            <li>
                                                <a href="#">COMBAT BOOT</a>
                                            </li>
                                            <li>
                                                <a href="#">DERBY</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#tee" data-toggle="collapse" aria-expanded="false"
                                           class="dropdown-toggle product__catagory">TEE (UNISEX)</a>
                                        <ul class="collapse list-unstyled" id="tee">
                                            <li>
                                                <a href="#">T-SHIRT</a>
                                            </li>
                                            <li>
                                                <a href="#">SHIRT</a>
                                            </li>

                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#accessory" data-toggle="collapse" aria-expanded="false"
                                           class="dropdown-toggle product__catagory">PHỤ KIỆN</a>
                                        <ul class="collapse list-unstyled" id="accessory">
                                            <li>
                                                <a href="#">BELT</a>
                                            </li>
                                            <li>
                                                <a href="#">BRACELET</a>
                                            </li>
                                            <li>
                                                <a href="#">CHAIN</a>
                                            </li>
                                            <li>
                                                <a href="#">BANDANA</a>
                                            </li>
                                            <li>
                                                <a href="#">NECKLAGE</a>
                                            </li>
                                            <li>
                                                <a href="#">BUCKET HAT</a>
                                            </li>

                                        </ul>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </div>


                    <div class="row">
                        <c:forEach items="${listSanpham}" var="row">
                            <div class="col- 12 col-md-6 col-lg-4 col-xl-3 product__item">
                                <form action="<%=request.getContextPath()%>/chooseProduct" method="post">
                                    <button type="submit" style="    background: transparent; border: none;">
                                        <input type="hidden" value="${row.productId}" name="ProductId"/>
                                        <input type="hidden" value="${row.name}" name="Name"/>
                                        <input type="hidden" value="${row.imagePath}" name="ImagePath"/>
                                        <input type="hidden" value="${row.description}" name="Description"/>
                                        <input type="hidden" value="${row.getUnitPrice()}" name="UnitPrice"/>
                                        <input type="hidden" value="${row.getQuannity()}" name="Quannity"/>
                                        <img src="<%=request.getContextPath()%>/Views/Web${row.getImagePath()}"
                                             alt="">
                                        <c:if test="${row.getQuannity() <= 0 }">
                                            <h5 style="color: #721c24; position: absolute; bottom: 55px; left: 0; right: 0;">
                                                HẾT HÀNG
                                            </h5>
                                        </c:if>
                                        <h4>
                                                ${row.name}
                                        </h4>
                                        <span class="priceProduct">${row.getUnitPrice()}</span>
                                    </button>
                                </form>
                            </div>
                        </c:forEach>
                    </div>
                    <nav aria-label="Page navigation example pt-4">
                        <ul class="pagination pt-3 justify-content-center">
                            <c:forEach begin="1" end="${numberPage}" var="i">
                                <c:choose>
                                    <c:when test="${myIndex ==  i}">
                                        <form class="page-link" style=" border: none;  border-bottom: 2px solid black; margin: 15px; font-size: 20px;
                                " action="<%=request.getContextPath()%>/fill-All-Sanpham">
                                            <button type="submit" value="${i}" name="index"
                                                    style="    background: transparent; border: #ca2819; ">
                                                <li class="page-item">
                                                    <input type="hidden" value="${i}" name="index"/>
                                                    <input type="hidden" value="<%=request.getAttribute("Type") %>" name="Type"/>
                                                        ${i}
                                                </li>
                                            </button>
                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                        <form class="page-link" style=" border: none;  margin: 15px; font-size: 20px; opacity: 0.6;
                                            " action="<%=request.getContextPath()%>/fill-All-Sanpham">
                                            <button type="submit" value="${i}" name="index"
                                                    style="    background: transparent; border: #ca2819;">
                                                <li class="page-item">
                                                    <input type="hidden" value="${i}" name="index"/>
                                                    <input type="hidden" value="<%=request.getAttribute("Type") %>" name="Type"/>
                                                        ${i}
                                                </li>
                                            </button>
                                        </form>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>

    </div>
</section>



<c:import url="../commom/footer.jsp"> </c:import>

<c:import url="../global/linkScript.jsp"> </c:import>

<script src="<%=request.getContextPath()%>/Views/Web/js/sanPham.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/DanhSachSanPham.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/checkOut.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/searchNameProduct.js"></script>

<%--Định dạng tiền tệ --%>
<script>
    let listGia = document.querySelectorAll(".priceProduct");
    for (i = 0; i < listGia.length; i++) {
        listGia[i].innerHTML = new Intl.NumberFormat('vn-VN', { style: 'currency', currency: 'VND' }).format(parseInt(listGia[i].innerHTML));
    }
</script>

</body>

</html>