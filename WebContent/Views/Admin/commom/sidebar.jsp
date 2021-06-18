<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
<ul
        class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
        id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <div
            class="sidebar-brand d-flex align-items-center justify-content-center"
            href="../container/home.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">
            Quản Lý
        </div>
    </div>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">
    <!-- Nav Item - Dashboard -->
    <li class="nav-item active"><a class="nav-link" href="<%= request.getContextPath()%>/dashboard">
        <i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
    </a></li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">Interface</div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item"><a class="nav-link collapsed" href="#"
                            data-toggle="collapse" data-target="#collapseTwo"
                            aria-expanded="true" aria-controls="collapseTwo"> <i
            class="fas fa-fw fa-cog"></i> <span>Quản lý</span>
    </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
             data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Custom Components:</h6>
                <a class="collapse-item" href="<%= request.getContextPath()%>/fill-All-Account">Tài khoản</a>
                <a class="collapse-item" href="<%= request.getContextPath()%>/fill-All-Product">Hàng hóa</a>
                <a class="collapse-item" href="<%= request.getContextPath()%>/fill-All-Order">Đơn hàng</a>
                <a class="collapse-item" href="<%= request.getContextPath()%>/ship">Vận chuyển</a>
                <a class="collapse-item" href="<%= request.getContextPath()%>/voucher">Voucher</a>
            </div>
        </div>
    </li>



    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->



    <!-- Divider -->


    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

    <!-- Sidebar Message -->

</ul>


</body>
</html>