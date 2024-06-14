/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.Customer;

import Models.*;
import dal.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class OrdersCustomers extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        kiểm tra login account
        HttpSession session = request.getSession(false); // Retrieve the session without creating a new one if it doesn't exist
        if (session != null && session.getAttribute("account") != null) {
            Account a = (Account) session.getAttribute("account");
            if (a.getUserID().startsWith("CUS")) {
                daoCustomer dc = new daoCustomer();
                dao dao = new dao();
                HashMap<Orders, Products> ol = dc.getOrdByCid(a.getUserID());
                AccountDetails ac = dao.getAccountDetails(a.getUserID());
                request.setAttribute("a", ac);
                request.setAttribute("ordList", ol);
                
            }
            request.getRequestDispatcher("Views/Users/UserOrders.jsp").forward(request, response); // Redirect to UserOrders page
        } else {
            // User is not logged in
            request.setAttribute("mess", "Please Login!!! ");
            request.getRequestDispatcher("Views/Home/Login.jsp").forward(request, response); // Redirect to login page
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
