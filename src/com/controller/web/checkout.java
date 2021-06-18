package com.controller.web;

import java.io.IOException;
import java.util.List;

import javax.management.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import DAO.LoginDAO;
import DAO.queryDAO;
import DAO.queryDAO;
import com.controller.admin.fillAllAccount;
import com.model.Article;

import javax.servlet.http.HttpSession;

@WebServlet("/check-out")
public class checkout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public checkout() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        if (email == null)
            response.sendRedirect("Views/loginAll.jsp");
        else {
            queryDAO dao = new queryDAO();
            List<Article> fill = dao.myInfo(email);
            request.setAttribute("fillTextBox",fill);
            RequestDispatcher rq = request.getRequestDispatcher("Views/Web/container/checkOut.jsp");
            rq.forward(request, response);
        }
    }
}
