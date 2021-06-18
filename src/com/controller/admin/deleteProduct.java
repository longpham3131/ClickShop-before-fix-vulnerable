package com.controller.admin;

import java.io.IOException;
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
 * Servlet implementation class deleteAccount
 */
@WebServlet("/delete-product")
public class deleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public deleteProduct() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (Objects.equals((String) session.getAttribute("Check_Authentic_Final_Using"), "Administrator") == true) {
			String productid = request.getParameter("productid");
			String tb = "";
			String url = "Views/Admin/container/product/product.jsp";
			String kq = "3";
			if (productid == "")
				tb = "input";
			else {
				try {
					queryDAO qD = new queryDAO();
					if (qD.productExists(productid)) {
						if (qD.deleteProduct(productid))
							tb = "true";
						else
							tb = "error";
					} else
						tb = "notFound";
				} catch (Exception e) {
					System.out.print(e);
				}
			}

			if (session == null)
				response.sendRedirect("Views/Admin/login.jsp");
			session.setAttribute("thongbao", tb);
			session.setAttribute("from", "delete");
			response.sendRedirect("Views/Admin/container/product.jsp");
		} else {
			request.setAttribute("error", "Bạn không có quyền truy cập vào trang.");
			RequestDispatcher rq = request.getRequestDispatcher("Views/error.jsp");
			rq.forward(request, response);
		}
	}
}