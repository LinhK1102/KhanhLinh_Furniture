package Control.Admin;

import Models.*;
import dal.dao;
import dal.daoAdmin;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

public class InsertControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        daoAdmin ad = new daoAdmin();

        // Get data from the form inputs
        String proID = request.getParameter("proID");
        String proName = request.getParameter("proName");
        String picture = request.getParameter("picture");
        String quantityStr = request.getParameter("quantity");
        String designers = request.getParameter("designers");
        String longDes = request.getParameter("longDes");
        String priceStr = request.getParameter("price");
        String cateID = request.getParameter("key");

        // Parse quantity and price from string to integer
        int quantity = 0;
        int price = 0;
        try {
            quantity = Integer.parseInt(quantityStr);
            price = Integer.parseInt(priceStr);
        } catch (NumberFormatException e) {
            // Handle parsing errors gracefully
            request.setAttribute("mess", "Invalid quantity or price format");
            request.getRequestDispatcher("insert").forward(request, response);
            return; // Stop processing further
        }

        // Check if the product already exists
        Products existingProduct = ad.getProByID(proID);
        if (existingProduct != null) {
            request.setAttribute("mess", proID + " already exists. Failed to insert product.");
            request.getRequestDispatcher("management").forward(request, response);
            return; // Stop processing further
        }

        // Create a new Product object and insert it into the database
        Products newProduct = new Products(proID, proName, picture, quantity, designers, longDes, price, cateID.toUpperCase());
        ad.insert(newProduct);
        request.setAttribute("mess", proID + " inserted successfully.");
        request.getRequestDispatcher("management").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dao d = new dao();
        List<Category> cateList = d.getCategories();
        request.setAttribute("cateList", cateList);
        request.getRequestDispatcher("Views/Admin/Insert.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
