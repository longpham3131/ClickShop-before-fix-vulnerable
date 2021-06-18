package com.controller.web;

import DAO.queryDAO;
import com.model.Article1;
import com.model.Display;
import DAO.queryDAO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class fillAllAccount
 */
@WebServlet("/fill-All-Sanpham")
public class fillSanpham extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public fillSanpham() {
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
		String index = request.getParameter("index");
		String name = "Tat ca san pham";
		String type = request.getParameter("Type");
		String s = null;
		System.out.println(type);
		System.out.println("-----------------1");
		System.out.println(index);
		System.out.println("-----------------2");
		System.out.println("----------------1");
		System.out.println(type);
//		System.out.println(type.equals(null));
		System.out.println(index);
		if (index ==null)
		{
			index ="1";
		}
		int	 indexPage = Integer.parseInt(index);
		queryDAO dao = new queryDAO();
		int numberPage = dao.getNumberPage();
		List<Display> listPhantrang = dao.getPaging(indexPage);
		List<Article1> listAllPro = dao.sanpham();
		System.out.println("-----------------5");
		System.out.println(type);
		System.out.println(type == null);
		if (type == null)
		{
			type = "null";
		}
		if ( ! type.equals("null"))
		{
			System.out.println("-----------------6");
			request.setAttribute("Type",type);
			List<Display> listSapxeptatca = dao.getPagingSort(indexPage,type);
			request.setAttribute("listSanpham", listSapxeptatca);
		}
		else {
			System.out.println("-----------------3");
			request.setAttribute("listSanpham", listPhantrang);
			request.setAttribute("Type",type);
			System.out.println("-----------------4");
		}
		request.setAttribute("tenCata",name);
//        request.setAttribute("listAllPro", listAllPro);
		request.setAttribute("numberPage", numberPage);
		request.setAttribute("from", request.getAttribute("from"));
		request.setAttribute("thongbao", request.getAttribute("thongbao"));
		request.setAttribute("myIndex",index);
		RequestDispatcher rq = request.getRequestDispatcher("Views/Web/container/productShop.jsp");
		rq.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		processRequest(request, response);

	}

}
