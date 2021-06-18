<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang mua hàng</title>
    <c:import url="../global/linkCSS.jsp"> </c:import>
</head>

<body class="position-relative">
<c:import url="../commom/header.jsp"> </c:import>
<c:import url="../commom/sideBar.jsp"> </c:import>

<div class="row product-detail-wrapper pt-4" >
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="row product-detail-main pr_style_01">
            <div class="col-md-8 col-sm-12 col-xs-12">

                <div class="product--description text-center">
                    <img id="pro-image" src="<%=request.getContextPath()%>/Views/Web${imagepath}" alt=""
                         style="width: 80%;">
                </div>
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12 product-content-desc" id="detail-product">
                <div class="product-title">
                    <h1 id="pro-name">${name}</h1>
                    <p class="pb-2">Mã sản phẩm: <span id="pro_sku">${productId}</span></p>
                    <p>Còn lại: <span id="pro_quan" class="idproduct">Chưa chọn size</span></p>
                    <c:forEach items="${listsize}" var="size">
                        <input type="hidden"  id="${size.getSize()}" value=${size.getAvailable()}>
                    </c:forEach>
                </div>
                <div class="product-price" id="price-preview">
                    <span class="pro-price" id="price-view"></span>
                    <input type="number" value="${unitprice}" id="price-value">
                </div>


                <form id="add-item-form" method="post" class="variants clearfix">

                    <a style="display:block;margin:10px 0" href="javascript:void(0)" class="" data-toggle="modal"
                       data-target="#myModal">
                    </a>


                    <div class="selector-actions">
                        <div class="size-area clearfix">
                            <input type="hidden" id="pro_size" >
                            <c:forEach items="${listsize}" var="size">
                                <label class="labelsize" onclick="getAvailable('${size.getSize()}')" style="width: 100px; text-align: center; border: 1px solid; transition: all,0.5s;" >${size.getSize()}</label>
                            </c:forEach>
                        </div>
                        <div class="quantity-area clearfix">
                            <input type="button" value="-" id="btnMinus" class="qty-btn">
                            <input type="text" id="quantity" name="quantity" value="1" min="1"
                                   class="quantity-selector"
                                   onkeypress="return (event.charCode == 8 || event.charCode == 0) ? null : event.charCode >= 48 && event.charCode <= 57">
                            <input type="button" value="+" id="btnPlus" class="qty-btn">
                        </div>
                        <p id="textThongBao" class="text-danger py-1"></p>
                        <div class="wrap-addcart clearfix">
                            <button type="button" id="add-to-cart"
                                    class="add-to-cartProduct button dark btn-addtocart addtocart-modal" name="add"
                                 > Hãy chọn size cho sản phẩm
                            </button>
                        </div>
                        <div id="divIp"></div>
                    </div>
                </form>
                <hr class="hrcs">
                <div class="xdqhotline">
                    <span>Tư vấn: 0888 543 919</span>
                </div>
                <hr class="hrcs">
                <div class="product-description">
                    <div class="title-bl" href="#thongTinSP" data-toggle="collapse">
                        <h2>
                            THÔNG TIN SẢN PHẨM
                            <i class="fa fa-plus"></i>
                        </h2>
                    </div>
                    <div class="collapse list-unstyled" id="thongTinSP">
                        <div class="main_details">
                            <ul>
                                <li><span style="font-size:12px">${description}</span></li>
                            </ul>
                        </div>

                    </div>
                </div>

                <div class="product-description">
                    <div class="title-bl" href="#baoHanh" data-toggle="collapse">
                        <h2>
                            CHÍNH SÁCH BẢO HÀNH
                            <i class="fa fa-plus"></i>
                        </h2>
                    </div>
                    <div class="collapse list-unstyled" id="baoHanh">
                        <div class="description-productdetail">
                            <div class="hrvproduct-tabs">
                                <ul>
                                    <li>Bảo hành trọn đời về các vấn đề bong tróc keo đế</li>
                                    <li>Miễn phí 3 lần vệ sinh đánh bóng giày (mang theo thẻ vệ sinh)</li>
                                    <li>Đổi trả trong vòng 1 tuần nếu xảy ra vấn đề do nhà sản xuất
                                        <ul style="padding-left: 20px;">
                                            <li>Đổi trả trong vòng 1 tuần nếu xảy ra vấn đề do nhà sản xuất</li>
                                            <li>Trong trường hợp chưa mang lần nào, nhưng bị vấn đề về đế</li>
                                        </ul>
                                    </li>
                                    <li>Mua tại store hỗ trợ đổi trả trong vòng 24h</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="product-description">
                    <div class="title-bl" href="#doiTra" data-toggle="collapse">
                        <h2>
                            CHÍNH SÁCH ĐỔI TRẢ
                            <i class="fa fa-plus"></i>
                        </h2>
                    </div>
                    <div class="collapse list-unstyled" id="doiTra">
                        <div class="description-productdetail">
                            <div class="hrvproduct-tabs">
                                <ul>
                                    <li>Hàng phải còn nguyên vẹn không có bất kì sự thay đổi nào</li>
                                    <li>Hàng khi đóng gói lại phải kèm túi hộp vẫn còn nguyên vẹn</li>
                                    <li>Phải điền đầy đủ thông tin để tránh thất lạc</li>
                                    <li>Mọi chi phí vận chuyển đổi size sẽ do bên mua chịu toàn bộ chi phí</li>
                                </ul>
                                <div>&nbsp;LƯU Ý: Nếu lỗi nhà cung cấp chúng tôi sẽ chịu hoàn toàn chi phí</div>
                                <div>&nbsp;* Liên hệ trực tiếp với chúng tôi để việc trao đổi trở nên dễ dàng hơn
                                </div>

                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<c:import url="../commom/footer.jsp"> </c:import>

<c:import url="../global/linkScript.jsp"> </c:import>

<script src="<%=request.getContextPath()%>/Views/Web/js/sanPham.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/DanhSachSanPham.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/addToCart.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/checkOut.js"></script>

<%--<script src="<%=request.getContextPath()%>/Views/Web/js/SizeAvailable.js"></script>--%>


</body>

</html>