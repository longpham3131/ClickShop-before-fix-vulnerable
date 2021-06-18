package com.controller.admin;

import com.controller.error;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class chooseAccount
 */
@WebServlet("/choose-in-account")
public class chooseAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public chooseAccount() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (Objects.equals((String) session.getAttribute("Check_Authentic_Final_Using"), "Administrator") == true) {
			String a = request.getParameter("choose");
			String url = "Views/Admin/container/account/account.jsp";
			String kq = "0";
			if (a.equals("Insert"))
				//System.out.println("Let insert");
				kq = "1";
			else if (a.equals("Update"))
				//System.out.println("Let Update");
				kq = "2";
			else if (a.equals("Delete"))
				//System.out.println("Let Delete");
				kq = "3";
			request.setAttribute("kq", kq);
			RequestDispatcher rq = request.getRequestDispatcher(url);
			rq.forward(request, response);

		} else {
			request.setAttribute("error","Bạn không có quyền truy cập vào trang.");
			RequestDispatcher rq = request.getRequestDispatcher("Views/error.jsp");
			rq.forward(request, response);
		}
	}
}
