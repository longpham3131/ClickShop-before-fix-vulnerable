package com.controller.shipper;

import DAO.LoginDAO;
import DAO.queryDAO;
import com.model.DetailOrder;
import com.model.PickingUp;
import com.model.Shipping;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/shipper")
public class goShipper extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   
    public goShipper() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "Views/Shipper/container/home.jsp";
		String Email = request.getParameter("id");

		queryDAO dao = new queryDAO();

        String endStatus = request.getParameter("end");
		String orderId = request.getParameter("orderId");
		String error=null;
        if(endStatus!=null) {
			if(dao.shipperAction(orderId,endStatus) == false)
				error="1";
			request.setAttribute("end", null);
        }
		List<PickingUp> list4 = dao.pickupList();
		request.setAttribute("listPicking", list4);
		List<DetailOrder> list4_1 = dao.OrtherDetailPicking();
		request.setAttribute("listPickDetail", list4_1);

        List<Shipping> list3 = dao.shippingList();
        List<DetailOrder> list3_1 = dao.OrtherDetailShipping();
        request.setAttribute("listShipping", list3);
        request.setAttribute("listShippingDetail", list3_1);

        request.setAttribute("demPicking",dao.countPicking(Email));
		request.setAttribute("demShipping",dao.countShipping(Email));

     //   System.out.print(">>"+);
		request.setAttribute("shipid", dao.idByEmail(Email));

		request.setAttribute("error", error);
		RequestDispatcher rq= request.getRequestDispatcher(url);
		rq.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
