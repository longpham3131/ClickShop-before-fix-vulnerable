<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Đăng nhập</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <!--===============================================================================================-->
    <link rel="icon" type="image/png"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/css/util.css">
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/css/main.css">


    <!--===============================================================================================-->

    <%
        String a = request.getContextPath() + "/";
        System.out.println(a);
    %>
</head>
<body>
<%
    String id = "";
    if (request.getAttribute("id") != null)
        id = (String) request.getAttribute("id");
    if (request.getAttribute("Message") == "-1") {
%>
<script> alert("Email khong tim thay");</script>
<%
    }
%>

<%-- KQ DANG KY --%>
<c:if test="${kqDangki == true}">
    <script>  alert("Đăng kí thành công"); </script>
</c:if>

<c:if test="${kqDangki == 'email'}">
    <script>  alert("Lỗi đắng kí: Email is null"); </script>
</c:if>
<c:if test="${kqDangki == 'pass'}">
    <script>  alert("Lỗi đắng kí: Pass is null"); </script>
</c:if>
<c:if test="${kqDangki == 'phone'}">
    <script>  alert("Lỗi đắng kí: Phone is null"); </script>
</c:if>
<c:if test="${kqDangki == 'conpass'}">
    <script>  alert("Lỗi đắng kí: Mật khẩu nhập lại không đúng"); </script>
</c:if>

<c:if test="${kqlogin == 'BAN'}">
    <script>  alert("Tài khoản đã bị khóa"); </script>
</c:if>
<%--<c:if test="${kqlogin == 'CHECK'}">--%>
<%--    <script>  alert("Sai thông tin đăng nhập"); </script>--%>
<%--</c:if>--%>
<%--<h1> -- <%=request.getAttribute("Message")%> ---</h1>--%>
<div class="limiter">
    <div class="container-login100"
         style="background-image: url('<%=request.getContextPath()%>/Views/Web/image_product/banner__carousel_2.jpg');">
        <div class="wrap-login100">
            <form class="login100-form validate-form" action="${pageContext.request.contextPath}/login-all"
                  method="post">
					<span class="login100-form-logo">
						<a href="<%=request.getContextPath()%>/fill-All-Display">
                            <img src="<%=request.getContextPath()%>/Views/Web/image_product/logo.png" alt="">
                        </a>
					</span>

                <span class="login100-form-title p-b-34 p-t-27">
					Đăng nhập
					</span>

                <div class="wrap-input100 validate-input" data-validate="Enter username">
                    <input class="input100" type="text" name="id" placeholder="Tài khoản" value=<%= id%>>
                    <span class="focus-input100" data-placeholder="&#xf207;"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Enter password">
                    <input class="input100" value="clickshop123aA@" type="password" name="password" placeholder="Mật khẩu">
                    <span class="focus-input100" data-placeholder="&#xf191;"></span>
                </div>


                <div class="container-login100-form-btn mt-4">
                    <button class="login100-form-btn" type="submit">
                        Đăng nhập
                    </button>
                </div>
            </form>
            <!-- Button to Open the Modal -->
            <div class="text-center">
                <button type="button" style="background-color: transparent; padding: 10px 0; color: white"
                        data-toggle="modal" data-target="#myModal" id="BtnAddUser">
                    Đăng ký
                </button>
            </div>
            <div class="text-center">
                <button type="button" style="background-color: transparent; color: white " data-toggle="modal"
                        data-target="#myForgot">
                    Quên mật khẩu
                </button>
            </div>

        </div>
    </div>

</div>

<!-- The Modal -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">

            <form action="${pageContext.request.contextPath}/registed" method="post" id="formRegister">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Đăng ký</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="form-row">
                        <div class="form-group col-6">
                            <label for="inpEmail">Email:</label>
                            <input type="email" class="form-control" id="inpEmail" name="email" value="${email}">
                            <span class="animate__animated animate__fadeIn" style="display: none;" id="tbEmail"></span>
                        </div>
                        <div class="form-group col-6">
                            <label for="inpPhone">Số điện thoại:</label>
                            <input type="tel" class="form-control" id="inpPhone" name="phone" value="${phone}">
                            <span class="animate__animated animate__fadeIn" style="display: none;"  id="tbSDT"></span>
                        </div>
                    </div>
                    <div class="form-row">

                        <div class="form-group col-6">
                            <label for="inpPass">Mật khẩu:</label>
                            <input type="password" class="form-control" id="inpPass" name="passw">
                            <span class="animate__animated animate__fadeIn" style="display: none;"  class="animate__animated animate__bounce" id="tbMatKhau"></span>
                        </div>

                        <div class="form-group col-6">
                            <label for="inpPass">Nhập lại mật khẩu:</label>
                            <input  type="password" class="form-control" id="inpConfirmPass" name="conpassw">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-6">
                            <label>Họ:</label>
                            <input type="text" class="form-control" name="inpFname" id="inpFname" value="${firstname}">
                            <span class="animate__animated animate__fadeIn" style="display: none;"  id="tbHo"></span>
                        </div>
                        <div class="form-group col-6">
                            <label for="inpLname">Tên:</label>
                            <input type="text" class="form-control" name="Lname" id="inpLname" value="${lastname}">
                            <span class="animate__animated animate__fadeIn" style="display: none;"  id="tbTen"></span>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-6">
                            <label for="DOfB">Ngày sinh</label>
                            <input type="date" class="form-control" id="DOfB" name="Bday" value="${Bday}">
                            <span class="animate__animated animate__fadeIn" style="display: none;"  id="tbNgaySinh"></span>
                        </div>
                        <div class="form-group col-6">
                            <label for="Gender">Giới tính</label>
                            <select name="gender" id="Gender" class="form-control" name="gender">
                                <option value="M" ${gender == M ? 'selected="selected"' : ''}>Nam</option>
                                <option value="F" ${gender == F ? 'selected="selected"' : ''}>Nữ</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-12">
                            <label for="inpAddress">Địa chỉ:</label>
                            <textarea  class="form-control" name="address" id="inpAddress" rows="4" cols="50" value="${address}">${address}</textarea>
                            <span class="animate__animated animate__fadeIn" style="display: none;"  id="tbDiaChi"></span>
                        </div>
                    </div>
                </div>
                <hr class="w-100"/>
                <div class="text-center p-3">
                    <c:if test="${kqDangki == 'loi'}">
                        <h5 style="color: red;">${errorDescription}</h5>
                    </c:if>
                </div>
            </form>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" id="btnSubmitRegister" class="btn btn-success">Đăng ký</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myForgot">
    <div class="modal-dialog ">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/forgot" method="post">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Quên mật khẩu</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="form-row">
                        <div class="form-group col-6">
                            <label for="DOfB">Email đã đăng ký:</label>
                            <input type="text" class="form-control" id="mail" name="email">
                        </div>
                    </div>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Gửi mã</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div id="dropDownSelect1"></div>

<!-- Thư viện hỗ trợ Jquery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<!-- BS4 JS  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
<!--===============================================================================================-->
<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/bootstrap/js/popper.js"></script>
<script src="<%=request.getContextPath()%>/Views/Admin/temple/Template/login-form-v3/Login_v3/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="<%=request.getContextPath()%>/Views/Admin/temple/Template/login-form-v3/Login_v3/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/daterangepicker/moment.min.js"></script>
<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="<%=request.getContextPath()%>/Views/Admin/temple/login-form-v3/Login_v3/js/main.js"></script>

<%--Main JS --%>
<script src="<%=request.getContextPath()%>/Views/Global/Validation.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/InfoValid.js"></script>

<c:if test="${kqDangki == 'loi'}">
    <script>   document.getElementById("BtnAddUser").click(); </script>
</c:if>
</body>
</html>