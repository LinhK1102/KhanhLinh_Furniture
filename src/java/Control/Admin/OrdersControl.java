/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Control.Admin;

import Models.*;
import dal.dao;
import dal.daoAdmin;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class OrdersControl extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        daoAdmin ad= new daoAdmin();
        HashMap<Products, Integer> mostSellPro=ad.getMostSellPro();
        HashMap<Products, Integer> mostOrdPro=ad.getMostOrdPro();
        HashMap<Orders,Products> ordList = ad.getOrders();
        HashMap<String, Integer> popDes= ad.getPopDes();
        HashMap<String, Integer> prePaid=ad.getPrfPaid();
        HashMap<AccountDetails, Integer> accList= ad.getMostSpend();
        List<Paid> paid=ad.getPaid();
        int revenue=0;
        for (Paid p : paid) {
            revenue+=p.getPayment();
        }
        request.setAttribute("mostSellPro", mostSellPro);
        request.setAttribute("mostOrdPro", mostOrdPro);
        request.setAttribute("ordList", ordList);
        request.setAttribute("popDes", popDes);
        request.setAttribute("prePaid", prePaid);
        request.setAttribute("accList", accList);
        request.setAttribute("revenue", revenue);
         request.getRequestDispatcher("Views/Admin/AdminOrders.jsp").forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
