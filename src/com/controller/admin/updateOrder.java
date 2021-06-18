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
 * Servlet implementation class updateAccount
 */
@WebServlet("/update-order")
public class updateOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (Objects.equals((String) session.getAttribute("Check_Authentic_Final_Using"), "Administrator") == true) {
			String purchaseorderid = request.getParameter("purorderid");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			// System.out.println(DateTimeNow);
			String tb = "";  // thong bao
			if (purchaseorderid == "" || address == "" || phone == "")
				tb = "input";
			String url = "Views/Admin/container/order.jsp";
			String kq = "1";
			if (tb == "") {
				queryDAO qD = new queryDAO();
				try {
					if (qD.updateOrder(purchaseorderid, address, phone))
						tb = "true";
					else
						tb = "error";
				} catch (Exception e) {
					System.out.print(e);
				}
			}
			request.setAttribute("from", "update");
			request.setAttribute("thongbao", tb);
			fillAllOrder a = new fillAllOrder();
			a.doPost(request, response);
		} else {
			request.setAttribute("error", "Bạn không có quyền truy cập vào trang.");
			RequestDispatcher rq = request.getRequestDispatcher("Views/error.jsp");
			rq.forward(request, response);
		}
	}
}
