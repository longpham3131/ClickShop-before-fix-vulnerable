<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav id="sidebar">
    <div id="dismiss">
        <i class="fas fa-arrow-right"></i>
    </div>
    <div class="sidebar-header">
        <h3>Tìm kiếm</h3>
    </div>
    <!-- Search form -->
    <form class="form-inline d-flex justify-content-center md-form form-sm active-cyan-2 mt-2" action="<%=request.getContextPath()%>">
        <input class="form-control form-control-sm mr-3 w-75" type="text" placeholder="Chelseaboost..."
               aria-label="Search" name="searchPro" id="searchPro">
    </form>

    <div id="storedProduct">
        <c:forEach items="${listAllPro}" var="row">
            <form action="<%=request.getContextPath()%>/chooseProduct" method="post" class="pt-5" style="display: none">
                <button type="submit" style="background: transparent; border: none;">
                    <input type="hidden" value="${row.getProductId()}" name="ProductId"/>
                    <input type="hidden" value="${row.getName()}" name="Name"/>
                    <input type="hidden" value="${row.getImgPath()}" name="ImagePath"/>
                    <input type="hidden" value="${row.getDescription()}" name="Description"/>
                    <input type="hidden" value="${row.getUnitPrice()}" name="UnitPrice"/>
                    <input type="hidden" value="${row.getAvailable()}" name="Quannity"/>
                    <div class="d-flex align-items-center " >
                        <div class="col-8">
                            <p class="pb-4 nameProduct">
                                    ${row.getName()}
                            </p>
                            <span class="priceProduct">
                                    ${row.getUnitPrice()}
                            </span>
                        </div>
                        <img src="<%=request.getContextPath()%>/Views/Web${row.getImgPath()}" class="w-25">
                    </div>
                </button>
            </form>
        </c:forEach>
    </div>
</nav>
