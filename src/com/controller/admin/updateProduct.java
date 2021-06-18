package com.controller.admin;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.queryDAO;

/**
 * Servlet implementation class updateAccount
 */
@WebServlet("/update-product")
public class updateProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (Objects.equals((String) session.getAttribute("Check_Authentic_Final_Using"), "Administrator") == true) {
            String productid = request.getParameter("productid");
            String subcategory = request.getParameter("subcategory");
            String name = request.getParameter("name").trim();
            String imgPath = "";
            if (request.getParameter("img") == "") {
                imgPath = request.getParameter("imgPathTempt");
            } else {
                imgPath = "/image_product/" + request.getParameter("img");
            }
            int unitprice = Integer.parseInt(request.getParameter("unitprice"));
            String gender = request.getParameter("gender");
            String description = request.getParameter("description");
            String available = request.getParameter("available");
            String tb = "";  // thong bao
            if (productid == "" || subcategory == "" || name == "" || unitprice < 0 || description == "" || gender == "" || available == "")
                tb = "input";
            String url = "Views/Admin/container/product.jsp";
            String kq = "1";
            String errorDescription = "";
            if (tb == "") {
                queryDAO qD = new queryDAO();
                try {
                    if (qD.updateProduct(productid, subcategory, name, imgPath, unitprice, gender, description, available))
                        tb = "true";
                    else
                        tb = "error";
                        errorDescription = "Tên sản phẩm đã tồn tại";
                } catch (Exception e) {
                    System.out.print(e);
                }
            }
            if (session == null)
                response.sendRedirect("Views/Admin/login.jsp");


            request.setAttribute("from", "update");
            request.setAttribute("thongbao", tb);
            request.setAttribute("errorDescription", errorDescription);
            request.setAttribute("productid", productid);
            fillAllProduct a = new fillAllProduct();
            a.doPost(request, response);
        } else {
            request.setAttribute("error", "Bạn không có quyền truy cập vào trang.");
            RequestDispatcher rq = request.getRequestDispatcher("Views/error.jsp");
            ((RequestDispatcher) rq).forward(request, response);
        }
    }
}
