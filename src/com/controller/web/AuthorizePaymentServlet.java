/**
 * AuthorizePaymentServlet class - requests PayPal for payment.
 * @author Nam Ha Minh
 * @copyright https://codeJava.net
 */
package com.controller.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DAO.queryDAO;
import com.paypal.base.rest.PayPalRESTException;
import javafx.util.StringConverter;

@WebServlet("/authorize-payment")
public class AuthorizePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AuthorizePaymentServlet() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = (String) request.getParameter("email");
		String address = (String) request.getParameter("address");
		String phone = (String) request.getParameter("phone");
		String name = (String) request.getParameter("name");

		String product = "Thanh Toan Click Shop";
		String shipping = "0";
		String tax = "0";
		String dem= (String) request.getParameter("dem");
		System.out.println("FIRST IN PAYPAL"+dem);
		int d = Integer.parseInt(dem);
		System.out.println("1");
		String[] giaSP = new String[d + 1];
		String[] maSP = new String[d + 1];
		System.out.println("2");
		String[] soLuong = new String[d + 1];
		String[] size = new String[d+1];
		int sub = 0;
		System.out.println("------- " +d+" ------");
		for (int i = 0; i < d; i++) {
			maSP[i] = (String) request.getParameter("maSP" + i);
			soLuong[i] = (String) request.getParameter("soLuong" + i);
			giaSP[i] = (String) request.getParameter("giaSP" + i);
			size[i] = (String) request.getParameter("sizeSP"+i);
		//	System.out.println("\n ID USER:" + id + "...");
			sub = sub + (Integer.parseInt(giaSP[i]) * Integer.parseInt(soLuong[i]));
			System.out.println("---" + maSP[i] + "--" + soLuong[i] + "--" + giaSP[i] + "-- "+size[i] + "--");
		}
		String total = String.valueOf(sub);
		String subtotal = total;
		System.out.println("-- AFFTER SET AND GET");
		OrderDetail orderDetail = new OrderDetail(product, subtotal, shipping, tax, total);

		queryDAO dao = new queryDAO();
		String id = dao.idByEmail(email);
		String orderId = dao.initOrder(id, String.valueOf(sub), address, phone, name); // add 1
		if (orderId != null) {

			for (int i = 0; i < d; i++) {
				if (dao.InsertDetailOrder(orderId, maSP[i], soLuong[i], giaSP[i], giaSP[i], size[i]) == false)
				{}
			}
			if(dao.orderExist(orderId) != null)
			{
				dao.truCoin(email, String.valueOf(sub));
			}
		}
		HttpSession session = request.getSession();
		session.setAttribute("OrderIdPayPal",orderId);
		// them trc, ne


		System.out.println("So tien ==  "+ orderDetail.getTotal());
		// bat dau thanh toan
		try {
			PaymentServices paymentServices = new PaymentServices();
			System.out.println("-- BEFFOR PAY");
			String approvalLink = paymentServices.authorizePayment(orderDetail);
			System.out.println("-- AFFTER PAY");
			response.sendRedirect(approvalLink);
		} catch (PayPalRESTException ex) {
			System.out.println("-- FUCKIT CATCHCHCHCHHCHCHCHCHCHCH");

			request.setAttribute("errorMessage", ex.getMessage());
			ex.printStackTrace();
			queryDAO qD = new queryDAO();
			qD.blockOrder((String) session.getAttribute(orderId));
			response.sendRedirect(request.getContextPath() + "/fill-All-Display");
		}
	}

}
