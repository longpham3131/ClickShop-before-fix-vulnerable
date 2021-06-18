package com.controller.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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

import javax.servlet.http.HttpSession;
import java.util.concurrent.ThreadLocalRandom;
@WebServlet("/forgot")
public class forgot extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public forgot() {
        super();
    }

    private String host;
    private String port;
    private String user;
    private String pass;
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String resultMessage = "";
        try {
            String email = request.getParameter("email");
            queryDAO dao = new queryDAO();
            if (dao.accountExists(email)) {
                int randomNum = ThreadLocalRandom.current().nextInt(1000, 9999);
                String mess = "Yout code is: <h2>"+randomNum+"</h2>";
                EmailUtility.sendEmail(host, port, user, pass, email, "ClickShop Forgot Password",
                        mess);
                resultMessage = "The e-mail was sent successfully";
                HttpSession session = request.getSession();
                session.setAttribute("code", String.valueOf(randomNum) );
                session.setAttribute("dem", "3");
                session.setAttribute("email", email );
                request.setAttribute("Message", resultMessage);
                RequestDispatcher rq = request.getRequestDispatcher("Views/Web/container/EnterCode.jsp");
                rq.forward(request, response);
            }
            else {
               // resultMessage = "Email `"+email+"` is not registered";
                resultMessage="-1";
                request.setAttribute("Message", resultMessage);
                RequestDispatcher rq = request.getRequestDispatcher("Views/loginAll.jsp");
                rq.forward(request, response);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
            request.setAttribute("Message", resultMessage);
            RequestDispatcher rq = request.getRequestDispatcher("Views/loginAll.jsp");
            rq.forward(request, response);
        }
    }
}
