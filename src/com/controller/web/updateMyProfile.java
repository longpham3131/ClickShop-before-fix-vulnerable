package com.controller.web;

        import java.io.IOException;

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
@WebServlet("/update-profile")
public class updateMyProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public updateMyProfile() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("myemail");
        String first = request.getParameter("myfirstname");
        String last = request.getParameter("mylastname");
        String phone = request.getParameter("myphone");
        String address = request.getParameter("myaddress");
        String gender = request.getParameter("mygender");
        String day = request.getParameter("myday");
       // System.out.println(".."+email+pass);
        try {
            String tb = "2";
            queryDAO qD = new queryDAO();
            if (qD.updateAccount(email,first,last,phone,address,gender,day)) {
                request.setAttribute("kqupdate", tb);

                myProfile a = new myProfile();
                a.doPost(request, response);
            } else {
                tb = "0";
                request.setAttribute("kq", "true");
                request.setAttribute("kqupdate", tb);
                myProfile a = new myProfile();
                a.doPost(request, response);
            }
        } catch (Exception e) {
            System.out.print(e);
        }

    }

}
