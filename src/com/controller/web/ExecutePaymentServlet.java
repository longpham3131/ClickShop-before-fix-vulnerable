/**
 * ExecutePaymentServlet class - execute payment via PayPal.
 * @author Nam Ha Minh
 * @copyright https://codeJava.net
 */
package com.controller.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DAO.queryDAO;
import com.paypal.api.payments.*;
import com.paypal.base.rest.PayPalRESTException;

@WebServlet("/execute_payment")
public class ExecutePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ExecutePaymentServlet() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String paymentId = request.getParameter("paymentId");
		String payerId = request.getParameter("PayerID");

		try {
			PaymentServices paymentServices = new PaymentServices();
			Payment payment = paymentServices.executePayment(paymentId, payerId);
			
			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);
			

			HttpSession session = request.getSession();
			session.setAttribute("kq", "1");
			response.sendRedirect(request.getContextPath() + "/fill-All-Display"); // thanh cong
			
		} catch (PayPalRESTException ex) {
			request.setAttribute("errorMessage", ex.getMessage());
			ex.printStackTrace();
			HttpSession session = request.getSession();
			session.setAttribute("kq", "-1");
			queryDAO qD = new queryDAO();
			qD.blockOrder((String) session.getAttribute("OrderIdPayPal"));
			response.sendRedirect(request.getContextPath() + "/fill-All-Display");
		}
	}

}
