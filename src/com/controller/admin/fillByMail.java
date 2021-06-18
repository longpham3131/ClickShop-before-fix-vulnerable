package com.controller.admin;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class fillByMail
 */
@WebServlet("/fill-By-Email")
public class fillByMail extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public fillByMail() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (Objects.equals((String) session.getAttribute("Check_Authentic_Final_Using"), "Administrator") == true) {
            String email = request.getParameter("email");
            String url = "Views/Admin/container/account/account.jsp";
            //get all data from email and return them. if email wrong, return a error.

            request.setAttribute("email", email);
            request.setAttribute("kq", "2");
            RequestDispatcher rq = request.getRequestDispatcher(url);
            rq.forward(request, response);
        } else {
            request.setAttribute("error", "Bạn không có quyền truy cập vào trang.");
            RequestDispatcher rq = request.getRequestDispatcher("Views/error.jsp");
            rq.forward(request, response);
        }
    }

}
