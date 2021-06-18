package com.controller.web;

import DAO.queryDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.concurrent.ThreadLocalRandom;

@WebServlet("/check-forgot")
public class checkForgot extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public checkForgot() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String resultMessage = "";
        try {
            String code = request.getParameter("inputCode");
            HttpSession session = request.getSession();
            String mycode = (String) session.getAttribute("code");
            //    String email = (String) session.getAttribute("mail" );
            int dem = Integer.parseInt((String) session.getAttribute("dem"));
            System.out.println(code + "  " + mycode + " " + dem);
            if (dem != 0) {
                if (code.equals(mycode)) {
                    resultMessage = "true";
                    request.setAttribute("kq", resultMessage);
                    RequestDispatcher rq = request.getRequestDispatcher("Views/Web/container/EnterCode.jsp");
                    rq.forward(request, response);
                } else {
                    // again
                    resultMessage = "false";
                    dem--;
                    if (dem == 0) {
                        resultMessage = "spam";
                        request.setAttribute("kq", resultMessage);
                        RequestDispatcher rq = request.getRequestDispatcher("Views/Web/container/EnterCode.jsp");
                        rq.forward(request, response);
                    } else {
                        session.setAttribute("dem", String.valueOf(dem));
                        request.setAttribute("kq", resultMessage);
                        RequestDispatcher rq = request.getRequestDispatcher("Views/Web/container/EnterCode.jsp");
                        rq.forward(request, response);
                    }
                }
            } else {
                resultMessage = "spam";
                request.setAttribute("kq", resultMessage);
                RequestDispatcher rq = request.getRequestDispatcher("Views/Web/container/EnterCode.jsp");
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
