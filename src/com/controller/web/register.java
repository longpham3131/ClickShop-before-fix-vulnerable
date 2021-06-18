package com.controller.web;

import java.io.IOException;

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

import javax.servlet.http.HttpSession;

@WebServlet("/registed")
public class register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public register() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("passw");
        String conpasswpass = request.getParameter("conpassw");
        String firstname = request.getParameter("inpFname");
        String lastname = request.getParameter("Lname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String Bday = request.getParameter("Bday");
        System.out.print(email+pass+firstname+lastname+ Bday+gender);
        String er ="-1";
        String tb = "";
        String errorDescription = "";

        if(phone == null || phone=="")
            er = "phone";
        if(email == null || email=="")
            er = "email";
        if(pass == null || pass=="")
            er = "pass";
        if(pass.equals(conpasswpass) == false)
            er = "conpass";
        System.out.print(er);
        if(er == "-1") {
            queryDAO qD = new queryDAO();
            try {
                if (qD.registed(email, pass, firstname, lastname,
                        phone, address, gender, Bday))
                    tb = "true";
                else
                    tb = "loi";
                errorDescription = "Email đã tồn tại";
            } catch (Exception e) {
                System.out.print(e);
            }
        }
        else
            tb = er;

        if(tb!="true") {
            request.setAttribute("email", email);
            request.setAttribute("firstname", firstname);
            request.setAttribute("lastname", lastname);
            request.setAttribute("Bday", Bday);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("gender", gender);
            request.setAttribute("errorDescription", errorDescription);
        }
        else
            request.setAttribute("id", email);
        request.setAttribute("kqDangki", tb);
        request.setAttribute("er", er);
        RequestDispatcher rq = request.getRequestDispatcher("Views/loginAll.jsp");
        rq.forward(request, response);
    }
}
