/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.Admin;

import Models.Products;
import dal.daoAdmin;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class UpdateControl extends HttpServlet {

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
        String proID_raw = request.getParameter("proID");
        String proName_raw = request.getParameter("proName");
        String picture_raw = request.getParameter("picture");
        String quantity_raw = request.getParameter("quantity");
        String designers_raw = request.getParameter("designers");
        String longDes_raw = request.getParameter("longDes");
        String price_raw = request.getParameter("price");
        String cateID_raw = request.getParameter("categoryID");
        int quantity, price;
        try {
            daoAdmin ad = new daoAdmin();
            quantity = Integer.parseInt(quantity_raw);
            price = Integer.parseInt(price_raw);
            Products p = ad.getProByID(proID_raw);
            if (p != null) {
                ad.update(proID_raw, proName_raw, picture_raw, quantity,
                        designers_raw, longDes_raw, price, cateID_raw);
                request.setAttribute("mess", "Update succesfull."+proID_raw);
                response.sendRedirect("management");
            } else {
                request.setAttribute("mess", proID_raw + "not existed.\nFailed Updating products");
                request.getRequestDispatcher("management").forward(request, response);//bo chinh lai tu duy voi hinh nhu cai nay chay theo insert roi
           
            }
        } catch (Exception e) {
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
