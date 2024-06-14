/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.Admin;

import Models.Account;
import Models.Category;
import Models.Products;
import dal.dao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class Management extends HttpServlet {

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
        dao d = new dao();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        if (acc == null) {
            response.sendRedirect(request.getContextPath()+"/home");
        } else {
            List<Category> ca = d.getCategories();
            request.setAttribute("category", ca);

            //Khi mới load trang, request sẽ không lấy được "Key", trường hợp này cid_raw==null
            //nên jsp hiện thị option "ALL"
            String cid_raw = request.getParameter("key");

            try {
                String cid = (cid_raw == null) ? "all" : cid_raw;

                if (cid.equalsIgnoreCase("all")) {
                    List<Products> lp = d.getProducts();
                    request.setAttribute("lp", lp);
                } else {
                    List<Products> lp = d.getProductByCate(cid);
                    request.setAttribute("lp", lp);
                    request.setAttribute("cid", cid);
                }

                // Forward to the JSP page
                request.getRequestDispatcher("Views/Admin/AdminManagement.jsp").forward(request, response);
            } catch (Exception e) {
                // Handle exceptions here (e.g., log them)
                System.out.println(e);
            }
        }

//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Management</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet Management at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }

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
        dao d = new dao();
        List<Category> ca = d.getCategories();
        request.setAttribute("category", ca);

        //Khi mới load trang, request sẽ không lấy được "Key", trường hợp này cid_raw==null
        //nên jsp hiện thị option "ALL"
        String cid_raw = request.getParameter("key");

        try {
            String cid = (cid_raw == null) ? "all" : cid_raw;

            if (cid.equalsIgnoreCase("all")) {
                List<Products> lp = d.getProducts();
                request.setAttribute("lp", lp);
            } else {
                List<Products> lp = d.getProductByCate(cid);
                request.setAttribute("lp", lp);
                request.setAttribute("cid", cid);
            }

            // Forward to the JSP page
            request.getRequestDispatcher("Views/Admin/AdminManagement.jsp").forward(request, response);
        } catch (Exception e) {
            // Handle exceptions here (e.g., log them)
            System.out.println(e);
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
