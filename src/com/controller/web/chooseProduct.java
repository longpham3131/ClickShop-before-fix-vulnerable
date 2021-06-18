package com.controller.web;

import DAO.queryDAO;
import com.controller.admin.shipped;
import com.model.Article1;
import com.model.ProductSize;

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
@WebServlet("/chooseProduct")
public class chooseProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public chooseProduct() {
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
        List<Article1> listAllPro = dao.sanpham();
        request.setAttribute("listAllPro", listAllPro);

        String productId  = request.getParameter("ProductId");

        List<ProductSize> listprodsize = dao.getAllSizeById(productId);

        String name  =  request.getParameter("Name");
        String unitprice  = request.getParameter("UnitPrice");
        String imagePath  =request.getParameter("ImagePath");
        String description  =  request.getParameter("Description");
        request.setAttribute("productId", productId);
        request.setAttribute("listsize", listprodsize);
        request.setAttribute("name", name);
        request.setAttribute("unitprice", unitprice);
        request.setAttribute("imagepath", imagePath);
        request.setAttribute("description", description);
        RequestDispatcher rq = request.getRequestDispatcher("Views/Web/container/productDetail.jsp");
        rq.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);

    }

}
