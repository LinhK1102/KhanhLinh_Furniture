/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.Customer;

import Models.Account;
import Models.Orders;
import Models.Products;
import dal.daoAdmin;
import dal.daoCustomer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class UDorders extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String btn = request.getParameter("orderAction");
        if (btn.equalsIgnoreCase("PAY")) {
            response.sendRedirect("payments");
        }else if (btn.equalsIgnoreCase("DELETE")) {
            String orderID= request.getParameter("orderID");
            request.setAttribute("orderID", orderID);
             request.getRequestDispatcher("deleteOrders").forward(request, response);
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
//        processRequest(request, response);
        HttpSession session = request.getSession(false); // Retrieve the session without creating a new one if it doesn't exist

        if (session != null && session.getAttribute("account") != null) {
            Account a = (Account) session.getAttribute("account");
            if (a.getUserID().startsWith("CUS")) {
                String action = request.getParameter("orderAction");
                if (action.equalsIgnoreCase("PAY")) {
                    request.getRequestDispatcher("payments").forward(request, response);
                }else if(action.equalsIgnoreCase("DELETE")){
                    daoCustomer dc = new daoCustomer();
                    HashMap<Orders, Products> ol = dc.getOrdByCid(a.getUserID());
                    String ord_raw= request.getParameter("orderID");
                    int orderID=Integer.parseInt(ord_raw);
                    dc.deleteOrders(orderID);
                    request.getRequestDispatcher("orders").forward(request, response);
                }
            }
        } else {
            // User is not logged in
            request.setAttribute("mess", "Please Login!!! ");
            response.sendRedirect("Views/Home/Login.jsp"); // Redirect to login page
        }
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
