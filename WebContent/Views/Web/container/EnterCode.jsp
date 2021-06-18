
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Quên mật khẩu</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên mật khẩu</title>
    <!-- BS4 CSS  -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <!-- FONT AWESOME  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
          integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
          crossorigin="anonymous"/>
    <%--    Animation --%>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</head>
<body>
<style>
    .limit {
        width: 100%;
        margin: 0 auto;
    }

    .bg__forgotPass {
        width: 100%;
        min-height: 100vh;
        display: -webkit-box;
        display: -webkit-flex;
        display: -moz-box;
        display: -ms-flexbox;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        padding: 15px;

        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
        position: relative;
        z-index: 1;
    }
    .bg__forgotPass:before{
        content: "";
        display: block;
        position: absolute;
        z-index: -1;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        background-color: rgba(255,255,255,0.8);
    }

    .wrap__out {
        width: 700px;
        border-radius: 10px;
        overflow: hidden;
        padding: 55px 55px 37px 55px;
        background: #9152f8;
        background: -webkit-linear-gradient(bottom, #f7f7f7, #e84141);
        background: -o-linear-gradient(bottom, #f7f7f7, #e84141);
        background: -moz-linear-gradient(bottom, #f7f7f7, #e84141);
        background: linear-gradient(bottom, #f7f7f7, #e84141);
        box-shadow: 5px 5px #aeaeae;

    }

    .wrap__out h4 {
        text-align: center;
        color: white;
    }
    .wrap__out label{
        font-size: 18px;
        color: white;
    }
</style>
<div class="limit">
    <div class="bg__forgotPass" style="background-image: url('<%=request.getContextPath()%>/Views/Web/image_product/banner__carousel_2.jpg');">
        <div class="wrap__out">
            <h4>Quên mật khẩu</h4>
            <c:choose>
                <c:when test="${kq == 'true'}">
                    <form action="${pageContext.request.contextPath}/reset-pass" method="post" id="formChangePass">
                        <div class="form-group">
                            <label>Xác thực thành công<br></label>
                        </div>
                        <input type="hidden" name="email" value="${email}">
                        <div class="form-group row">
                            <label for="inpPass" class="col-sm-4 col-form-label">Mật khẩu mới:</label>
                            <div class="col-sm-6">
                                <input type="password" name="newpass" class="form-control" id="inpPass">
                                <span class="animate__animated animate__fadeIn" style="display: none; color: whitesmoke !important;" id="tbMatKhau"></span>
                            </div>
                            <div class="text-right">
                                <button type="button" class="btn btn-success" id="btnChangePass">Xác nhận</button>
                            </div>
                        </div>
                    </form>
                    <c:if test="${tb == 0}">
                        <script> alert(" Co loi, password chua reset"); </script>
                    </c:if>
                </c:when>
                <c:when test="${kq == 'spam'}">
                    <form action="${pageContext.request.contextPath}/forgot" method="post" >
                        <div class="form-group text-center">
                            <label>Mã code đã được gửi lại do bạn nhập sai quá nhiều lần   <br></label>
                        </div>
                        <input type="hidden" value="${mail}" , name="email">
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-success" >Xác nhận</button>
                        </div>
                    </form>
                </c:when>
                <c:otherwise>
                    <form action="${pageContext.request.contextPath}/check-forgot" method="post">
                        <div class="form-group">
                            <label>Code đã được gửi đến email <span style="font-weight: 600">${mail}</span>   <br></label>
                        </div>
                        <div class="form-group row">
                            <label for="inpCode" class="col-sm-2 col-form-label">Code:</label>
                            <div class="col-sm-6">
                                <input type="text" name="inputCode" class="form-control" id="inpCode">
                            </div>
                            <div class="col-sm-4">
                                <button type="submit" class="btn btn-success">Xác nhận</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Số lần nhập còn lại: ${dem}<br></label>
                        </div>


                    </form>
                </c:otherwise>
            </c:choose>
            <form action="${pageContext.request.contextPath}/login-all" method="post" class="text-center">
                <button type="submit" class="btn btn-primary"> <i class="fa fa-reply pl-1"></i> Quay về trang chủ</button>
            </form>
        </div>
    </div>
</div>



<!-- Thư viện hỗ trợ Jquery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<!-- BS4 JS  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

<%--Main JS --%>
<script src="<%=request.getContextPath()%>/Views/Global/Validation.js"></script>
<script src="<%=request.getContextPath()%>/Views/Web/js/forgotPassValidation.js"></script>

</body>
</html>
