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
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class ShoppingAction extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        PrintWriter out = response.getWriter();
        daoCustomer ac = new daoCustomer();
        dao dao = new dao();
        if (session != null && session.getAttribute("account") != null) {
            Account a = (Account) session.getAttribute("account");
            if (a.getUserID().startsWith("CUS")) {
                String cusID = a.getUserID();
                String proID = request.getParameter("proID");
                String quantity_raw = request.getParameter("quantity");
                Date orderTime = new Date();
                //shipDestination is automatically overwritten from account details
                AccountDetails acc = dao.getAccountDetails(cusID);
                String shipDestination = acc.getCusState();
                daoAdmin ad = new daoAdmin();
                int orderID = ad.getOrders().size() + 3000; //auto add orderID 
                int quantity = 0;
                try {
                    if (quantity_raw == null || quantity_raw.isEmpty()) {
                        // If quantity is null or empty, set it to 1
                        quantity = 1;
                    } else {
                        quantity = Integer.parseInt(quantity_raw);
                    }
                } catch (NumberFormatException e) {
                    out.print("ShoppingAction, NumberFormatException " + e);
                }
                Orders o = new Orders(orderID, cusID, proID, quantity, orderTime,
                        "", shipDestination, "");
                ac.insert(o);

                String btn = request.getParameter("shoppingAction");
                if (btn != null) {
                    if (btn.equalsIgnoreCase("Add to cart")) {
                        // Handle Add to cart action
                        response.sendRedirect("home");
//                        request.setAttribute("mess", "\nOrders " + check+"OrderID: "+orderID);
//                        request.getRequestDispatcher("Views/Error.jsp").forward(request, response);
                    } else if (btn.equalsIgnoreCase("Buy")) {
                        request.setAttribute("orderID", orderID);
                        request.setAttribute("mess", "from shopping");
                        request.getRequestDispatcher("payments").forward(request, response);
                    }
                }
            }
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
