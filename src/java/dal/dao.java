/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Models.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class dao {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private String status = "OK";

    public static void main(String[] args) {
        dao d = new dao();
//        AccountDetails  p = d.getAccountDetails("CUS033");
//        System.out.println("\nProducts");
//        System.out.println(p.getUserID());
//        List<Category> ca = d.getCategories();
//        System.out.println("Category");
//        for (Category c : ca) {
//            System.out.println(c.getCateName());
//        }
//        List<AccountDetails> a = d.getAccountDetails();
//        System.out.println("Account Details");
//        for (AccountDetails ac : a) {
//            System.out.println(ac.getUserID());
//        }
        List<Products> od = d.getProducts();
        for (Products products : od) {
            System.out.println(products.getProName());
        }
    }

    public List<Products> getProducts() {
        String sqlPro = "SELECT * FROM Products";
        List<Products> pro = new ArrayList<>();
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sqlPro);
            rs = ps.executeQuery();
            while (rs.next()) {
                Products p = new Products(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getInt(7), rs.getString(8));
                pro.add(p);
            }
        } catch (Exception e) {
            status = "Error at load Products " + e.getMessage();
        }
        return pro;
    }

    public AccountDetails getAccountDetails(String userID) {
        String sqlCus = "SELECT * FROM AccountDetails\n"
                + "WHERE UserID = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sqlCus);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                AccountDetails a = new AccountDetails(rs.getString(1),
                        rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5));
                return a;
            }
        } catch (Exception e) {
            status = "Error at load Customers " + e.getMessage();
        }
        return null;
    }

    public List<Category> getCategories() {
        String sqlCate = "SELECT * FROM Categories";
        List<Category> cate = new ArrayList<>();
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sqlCate);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getString(1), rs.getString(2));
                cate.add(c);
            }
        } catch (Exception e) {
            status = "Error at load Products " + e.getMessage();
        }
        return cate;
    }

    public List<Products> getbestSeller() {
        String sql = "SELECT P1.* FROM Products  P1 INNER JOIN (\n"
                + "SELECT TOP 5 ProID from PAID "
                + "GROUP BY ProID ORDER BY COUNT(OrderID) DESC) P2\n"
                + "ON P1.ProID = P2.ProID";
        List<Products> list = new ArrayList<>();
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Products p = new Products(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getInt(7), rs.getString(8));
                list.add(p);
            }
        } catch (Exception e) {
            status = "Error at load Products " + e.getMessage();
        }
        return list;
    }

    public List<Products> getProductByCate(String cateID) {
        String sql = "SELECT * FROM Products\n"
                + "WHERE CategoryID LIKE ?";
        List<Products> pr = new ArrayList<>();
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setString(1, cateID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Products p = new Products(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getInt(7), rs.getString(8));
                pr.add(p);
            }
        } catch (Exception e) {
            status = "Error at load Products " + e.getMessage();
        }
        return pr;
    }

    public Account verifyLogin(String username, String password) {
        String sql = "select * from Account\n"
                + "where UserID=? and Password=?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1),
                        rs.getString(2), rs.getString(3));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
