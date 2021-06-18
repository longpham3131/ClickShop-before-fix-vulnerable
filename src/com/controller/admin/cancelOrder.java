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
@WebServlet("/cancel-order")
public class cancelOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public cancelOrder() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (Objects.equals((String) session.getAttribute("Check_Authentic_Final_Using"), "Administrator") == true) {
            String id = request.getParameter("purchaseOrderId");
            String tb = "";
            if (id == "")
                tb = "input";
            else {
                try {
                    queryDAO qD = new queryDAO();
                        if (qD.blockOrder(id))
                            tb = "true";
                        else
                            tb = "error";
                } catch (Exception e) {
                    System.out.print(e);
                }
            }

            if (session == null)
                response.sendRedirect("Views/Admin/login.jsp");

            request.setAttribute("from", "block");
            request.setAttribute("thongbao", tb);
            fillAllOrder a = new fillAllOrder();
            a.doPost(request, response);

        } else {
            request.setAttribute("error", "Bạn không có quyền truy cập vào trang.");
            RequestDispatcher rq = request.getRequestDispatcher("Views/error.jsp");
            rq.forward(request, response);
        }
    }

}
