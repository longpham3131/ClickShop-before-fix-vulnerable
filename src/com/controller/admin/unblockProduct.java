package com.controller.admin;

import DAO.queryDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

/**
 * Servlet implementation class deleteAccount
 */
@WebServlet("/unblock-product")
public class unblockProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public unblockProduct() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (Objects.equals((String) session.getAttribute("Check_Authentic_Final_Using"), "Administrator") == true) {

            String id = request.getParameter("id");
            String tb = "";
            if (id == "")
                tb = "input";
            else {
                try {
                    queryDAO qD = new queryDAO();
                    if (qD.productIDExists(id)) {
                        if (qD.unBlockProduct(id))
                            tb = "true";
                        else
                            tb = "error";
                    } else
                        tb = "notFound";
                } catch (Exception e) {
                    System.out.print(e);
                }
            }
            if (session == null)
                response.sendRedirect("Views/Admin/login.jsp");

            request.setAttribute("from", "unblock");
            request.setAttribute("thongbao", tb);
            fillAllProduct a = new fillAllProduct();
            a.doPost(request, response);
            // response.sendRedirect("Views/Admin/container/account.jsp");
        } else {
            request.setAttribute("error", "Bạn không có quyền truy cập vào trang.");
            RequestDispatcher rq = request.getRequestDispatcher("Views/error.jsp");
            rq.forward(request, response);
        }

    }
}