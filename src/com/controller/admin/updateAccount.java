package com.controller.admin;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
 * Servlet implementation class updateAccount
 */
@WebServlet("/update-account")
public class updateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public updateAccount() {
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
		String email = request.getParameter("email");
		HttpSession session = request.getSession();
		if (Objects.equals((String) session.getAttribute("Check_Authentic_Final_Using"), "Administrator") == true) {

			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String gender = request.getParameter("gender");
			String Bday = request.getParameter("Bday");

			System.out.print("---------------- Vao2 roi62 ----- "+gender+" --------------------------------");

			String tb = "";  // thong bao
			if (email == "" || firstname == "" || lastname == "" || phone == "" || address == "")
				tb = "input";
			String url = "Views/Admin/container/account.jsp";
			String kq = "1";
			if (tb == "") {
				queryDAO qD = new queryDAO();
				try {
					if (qD.updateAccount(email, firstname, lastname, phone, address, gender,
							Bday))
						tb = "true";
					else
						tb = "error";
				} catch (Exception e) {
					System.out.print(e);
				}
			}

			if (session == null)
				response.sendRedirect("Views/Admin/login.jsp");

			request.setAttribute("from", "update");
			//request.setAttribute("thongbao", tb);
			fillAllAccount a = new fillAllAccount();
			a.doPost(request, response);
		} else {
			request.setAttribute("error", "Bạn không có quyền truy cập vào trang.");
			RequestDispatcher rq = request.getRequestDispatcher("Views/error.jsp");
			rq.forward(request, response);
		}
	}
}