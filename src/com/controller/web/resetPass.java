package com.controller.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.queryDAO;

/**
 * Servlet implementation class deleteAccount
 */
@WebServlet("/reset-pass")
public class resetPass extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public resetPass() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("newpass");
        try {
            String tb = "1";
            queryDAO qD = new queryDAO();
            if (qD.resetPassword(email, pass)) {
                RequestDispatcher rq = request.getRequestDispatcher("Views/loginAll.jsp");
                rq.forward(request, response);
            } else {
                tb = "0";
                request.setAttribute("kq", "true");
                request.setAttribute("tb", tb);
                RequestDispatcher rq = request.getRequestDispatcher("Views/Web/container/EnterCode.jsp");
                rq.forward(request, response);
            }
        } catch (Exception e) {
            System.out.print(e);
        }

    }

}
