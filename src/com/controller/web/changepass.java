package com.controller.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.LoginDAO;
import DAO.queryDAO;

/**
 * Servlet implementation class deleteAccount
 */
@WebServlet("/changepass")
public class changepass extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public changepass() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String confirmnewpasspass = request.getParameter("confirmnewpass");
        System.out.println(".."+email+newpass);
        try {
            String tb = "1";
            queryDAO qD = new queryDAO();
            LoginDAO loginDAO = new LoginDAO();
            System.out.println(email+oldpass+newpass+confirmnewpasspass);
            if(loginDAO.login(email, oldpass) != null) {
                if(newpass.equals(confirmnewpasspass)) {
                    if (qD.resetPassword(email, newpass)) {
                        request.setAttribute("kqupdate", tb);
                        myProfile a = new myProfile();
                        a.doPost(request, response);
                    } else {
                        tb = "0";
                        request.setAttribute("kq", "true");
                        request.setAttribute("kqupdate", tb);
                        myProfile a = new myProfile();
                        a.doPost(request, response);
                    }
                }
                else {
                    tb = "confirm";
                    request.setAttribute("kq", "true");
                    request.setAttribute("kqupdate", tb);
                    myProfile a = new myProfile();
                    a.doPost(request, response);
                }
            }
            else {
                tb = "old";
                request.setAttribute("kq", "true");
                request.setAttribute("kqupdate", tb);
                myProfile a = new myProfile();
                a.doPost(request, response);
            }

        } catch (Exception e) {
            System.out.print(e);
        }

    }

}
