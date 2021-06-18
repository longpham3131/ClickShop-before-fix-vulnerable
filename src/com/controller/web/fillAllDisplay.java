package com.controller.web;

import DAO.queryDAO;
import com.model.Article1;
import com.model.Display;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class fillAllAccount
 */
@WebServlet("/fill-All-Display")
public class fillAllDisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public fillAllDisplay() {
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
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String txt = request.getParameter("index");

		HttpSession session = request.getSession();
		if(request.getParameter("logout") != null) {
			session.setAttribute("email", null);
			session.setAttribute("authentic", null);
		}
		int index = 0;
		if (txt == null) {
			index = 1;
		} else {
			index = Integer.parseInt(txt);
		}
		queryDAO dao = new queryDAO();
		List<Display> listSanpham = dao.getPaging(index);
		List<Article1> listAllPro = dao.sanpham();
		request.setAttribute("listSanpham", listSanpham);
		request.setAttribute("listAllPro", listAllPro);
		request.setAttribute("from", request.getAttribute("from"));
		request.setAttribute("thongbao", request.getAttribute("thongbao"));

		RequestDispatcher rq = request.getRequestDispatcher("Views/Web/index.jsp");
		rq.forward(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		processRequest(request, response);

	}

}
