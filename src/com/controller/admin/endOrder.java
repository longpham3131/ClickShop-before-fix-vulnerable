package com.controller.admin;

import java.io.IOException;

import com.model.*;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
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
 * Servlet implementation class fillAllAccount
 */
@WebServlet("/endOrder")
public class endOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public endOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        queryDAO dao = new queryDAO();
        HttpSession session = request.getSession();
        if (Objects.equals((String) session.getAttribute("Check_Authentic_Final_Using"), "Administrator") == true) {

            String OrtherID = (String) request.getParameter("OrtherID");
            String Status = (String) request.getParameter("Status");
            System.out.println("/// "+OrtherID + Status+ "  // ");
            String endedThisOrder = (String) session.getAttribute("endedThisOrder");
            if (OrtherID.equals(endedThisOrder) == false) {
                if (dao.endOrder(OrtherID, Status)) {
                    System.out.println("// sau end //");
                    session.setAttribute("endedThisOrder", OrtherID);
                    shipped ob = new shipped();
                    ob.doPost(request, response);
                }
            } else {
                shipped ob = new shipped();
                ob.doPost(request, response);
            }
        } else {
            request.setAttribute("error", "Bạn không có quyền truy cập vào trang.");
            RequestDispatcher rq = request.getRequestDispatcher("Views/error.jsp");
            rq.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        processRequest(request, response);

    }

}
