/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.Customer;

import Models.*;
import dal.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class Payments extends HttpServlet {

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
        HttpSession session = request.getSession(false); // Retrieve the session without creating a new one if it doesn't exist

        if (session != null && session.getAttribute("account") != null) {
            Account a = (Account) session.getAttribute("account");
            daoAdmin da = new daoAdmin();
            dao d = new dao();
//lấy thông tin orders đc gửi đến
            String orderID_raw = request.getParameter("orderID");
            int orderID = 0;
            int sum;
            if (orderID_raw != null) {
                try {
                    orderID = Integer.parseInt(orderID_raw);
                } catch (NumberFormatException e) {
                }
            } else {
                // orderID_raw null
                orderID = (int) request.getAttribute("orderID");
            }
            AccountDetails acd = d.getAccountDetails(a.getUserID());
            HashMap<Orders, Products> ol = da.getOrders();
            for (Map.Entry<Orders, Products> entry : ol.entrySet()) {
                Orders order = entry.getKey();
                Products pro = entry.getValue();
                if (orderID == order.getOrderID()) {
                    HashMap<Orders, Products> cusOrd = new HashMap<>();
                    cusOrd.put(order, entry.getValue());
                    sum = order.getQuantity() * pro.getPrice();
                    request.setAttribute("order", cusOrd);
                    request.setAttribute("sum", sum);
                }
            }

            List<String> paid = getPaidMethod();
            request.setAttribute("paid", paid);
            request.setAttribute("a", acd);
            request.setAttribute("orderID", orderID);
            request.getRequestDispatcher("Views/Users/Payment.jsp").forward(request, response);
        } else {
            // User is not logged in
            request.setAttribute("mess", "Please Login!!! ");
            response.sendRedirect("Views/Home/Login.jsp"); // Redirect to login page
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

    public List<String> getPaidMethod() {
        List<String> e = new ArrayList<>();
        e.add("Cash");
        e.add("Bank transfer");
        return e;
    }
}
