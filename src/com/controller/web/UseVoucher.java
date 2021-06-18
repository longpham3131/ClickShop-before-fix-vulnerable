package com.controller.web;

import DAO.queryDAO;
import com.model.Article;
import com.model.Article1;
import com.model.TrackAllOrder;
import com.model.TrackOrder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

/**
 * Servlet implementation class fillAllAccount
 */
@WebServlet("/use-voucher")
public class UseVoucher extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UseVoucher() {
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

        String code = request.getParameter("code");
        String email = request.getParameter("myemail");
        queryDAO a = new queryDAO();
        if (a.VoucherAvai(code)) // status == 1s
            if (a.useVoucher(code, email))
                request.setAttribute("useVou", "Sử dụng thành công voucher ");
            else
                request.setAttribute("useVou", "Voucher không hợp lệ hoặc đã đươc sử dụng");
        else
            request.setAttribute("useVou", "Voucher không hợp lệ hoặc đã đươc sử dụng");

        String mycoib = a.getCoin(email);
        session.setAttribute("coin", mycoib);

        // fill lai my profile  //
        queryDAO dao = new queryDAO();
        String id= dao.idByEmail( (String) session.getAttribute("email"));
        List<Article1> listAllPro = dao.sanpham();
        request.setAttribute("listAllPro", listAllPro);
        List<TrackOrder> list1 = dao.trackOrder(id);
        List<TrackAllOrder> list1_1 = dao.trackingAllById(id);
        List<TrackOrder> list2 = dao.trackShip(id);
        List<TrackAllOrder> list2_1 = dao.trackShippingById(id);
        request.setAttribute("listAllOrder", list1);
        request.setAttribute("listAllOrderDetail", list1_1);
        request.setAttribute("listShipOrder", list2);
        request.setAttribute("listShipOrderDetail", list2_1);
        List<Article> myinfo = dao.myInfo(email);
        System.out.print(myinfo);
        request.setAttribute("myinfo",myinfo);
        RequestDispatcher rq = request.getRequestDispatcher("Views/Web/container/myprofile.jsp");
        rq.forward(request, response);
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
