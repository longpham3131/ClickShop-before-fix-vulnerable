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
 * Servlet implementation class fillAllAccount
 */
@WebServlet("/action-voucher")
public class ActionVoucher extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionVoucher() {
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
        HttpSession session = request.getSession();
        if (Objects.equals((String) session.getAttribute("Check_Authentic_Final_Using"), "Administrator") == true) {

            String type = request.getParameter("type");
            if(type.equals("1"))
            {
                String code = request.getParameter("code");
                queryDAO a = new queryDAO();
                a.avaiVoucher(code);
                request.setAttribute("listVou", a.voucherList());
            }
            else if(type.equals("0"))
            {
                String code = request.getParameter("code");
                queryDAO a = new queryDAO();
                a.blockVoucher(code);
                request.setAttribute("listVou", a.voucherList());
            }
            else if(type.equals("-1"))
            {
                String code = request.getParameter("code");
                queryDAO a = new queryDAO();
                a.deleteVoucher(code);
                request.setAttribute("listVou", a.voucherList());
            }
            else if (type.equals("new")) {
                String code = request.getParameter("newcode");
                String coin = request.getParameter("coin");
                queryDAO a = new queryDAO();
                if (!a.trueVoucher(code)) {
                    if (a.insertVoucher(code, coin))
                        request.setAttribute("voux", "1");
                    else
                        request.setAttribute("voux", "-1");
                }
                else
                    request.setAttribute("voux", "trung");
                request.setAttribute("listVou", a.voucherList());
                request.setAttribute("coded", code);
            } else {
                queryDAO a = new queryDAO();
                String code = request.getParameter("checkcode");
                System.out.println(code);
                if (a.trueVoucher(code)) {
                    request.setAttribute("kqcoin", "Voucher trị giá: " + a.coinVoucher(code));
                    if (a.statusVoucher(code) == 1)
                        request.setAttribute("kqstatus", "Có hiệu lực");
                    else
                        request.setAttribute("kqstatus", "Đã sử dụng hoặc không có hiệu lực");
                } else
                    request.setAttribute("kqcoin", "Voucher không tồn tại");
                request.setAttribute("listVou", a.voucherList());
                request.setAttribute("coded", code);
            }

            RequestDispatcher rq = request.getRequestDispatcher("Views/Admin/container/voucher.jsp");
            rq.forward(request, response);
        } else {
            request.setAttribute("error", "Bạn không có quyền truy cập vào trang.");
            RequestDispatcher rq = request.getRequestDispatcher("Views/error.jsp");
            rq.forward(request, response);
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);

    }

}
