/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Models.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Admin
 */
public class daoCustomer {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private String status = "OK";

    public int insert(Orders p) {
        String sql = "INSERT INTO [dbo].[Orders]\n"
                + "           ([OrderID]\n"
                + "           ,[CusID]\n"
                + "           ,[ProID]\n"
                + "           ,[Quantity]\n"
                + "           ,[OrderDate]\n"
                + "           ,[PaymentMethod]\n"
                + "           ,[ShipDestination]\n"
                + "           ,[Note])"
                + "     VALUES (?,?,?,?,?,?,?,?)";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, p.getOrderID());
            ps.setString(2, p.getCusID());
            ps.setString(3, p.getProID());
            ps.setInt(4, p.getQuantity());

            // Convert java.util.Date to java.sql.Date
            java.sql.Date orderDate = new java.sql.Date(p.getOrderDate().getTime());
            ps.setDate(5, orderDate);

            ps.setString(6, p.getPaymentMethod());
            ps.setString(7, p.getShipDestination());
            ps.setString(8, p.getNote());

            int check = ps.executeUpdate();
            return check;
        } catch (Exception e) {
            status = "Error at insert Products " + e.getMessage();
        }
        return 0;
    }

    public int update(Orders o) {
        String sql = "UPDATE [dbo].[Orders]\n"
                + "   SET [OrderID] = ?\n"
                + "      ,[CusID] = ?\n"
                + "      ,[ProID] = ?\n"
                + "      ,[Quantity] = ?\n"
                + "      ,[OrderDate] = ?\n"
                + "      ,[PaymentMethod] = ?\n"
                + "      ,[ShipDestination] = ?\n"
                + "      ,[Note] = ?\n"
                + " WHERE [OrderID] = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, o.getOrderID());
            ps.setString(2, o.getCusID());
            ps.setString(3, o.getProID());
            ps.setInt(4, o.getQuantity());
            ps.setDate(5, (Date) o.getOrderDate());
            ps.setString(6, o.getPaymentMethod());
            ps.setString(7, o.getShipDestination());
            ps.setString(8, o.getNote());
            ps.setInt(9, o.getOrderID());
            int check = ps.executeUpdate();
            return check;
        } catch (Exception e) {
            status = "Error at update Product:" + e.getMessage();
        }
        return 0;
    }

    public void deleteOrders(int id) {
        String sql = "DELETE FROM [dbo].[Orders]\n"
                + "      WHERE OrderID = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            status = "Error at load Products " + e.getMessage();
        }
    }

    public HashMap<Orders, Products> getOrdByCid(String cID) {
        String sql = "SELECT * FROM Orders O JOIN Products P\n"
                + "	ON O.ProID=P.ProID\n"
                + "WHERE CusID = ?";
        HashMap<Orders, Products> list = new HashMap<>();
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setString(1, cID);//xong
            rs = ps.executeQuery();
            while (rs.next()) {
                Orders o = new Orders(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getInt(4),
                        rs.getDate(5), rs.getString(6),
                        rs.getString(7), rs.getString(8));
                Products P = new Products(rs.getString(9), rs.getString(10),
                        rs.getString(11), rs.getInt(12), rs.getString(13),
                        rs.getString(14), rs.getInt(15), rs.getString(16));
                list.put(o, P);
            }
        } catch (Exception e) {
            status = "Error at load Orders " + e.getMessage();
        }
        return list;
    }

    public List<Paid> getPaidByCid(String cID) {
        String sqlCate = "SELECT * FROM PAID\n"
                + "WHERE CusID = ?";
        List<Paid> paid = new ArrayList<>();
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sqlCate);
            ps.setString(1, cID);//xong
            rs = ps.executeQuery();
            while (rs.next()) {
                Paid p = new Paid(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(1), rs.getString(5));
                paid.add(p);
            }
        } catch (Exception e) {
            status = "Error at load Products " + e.getMessage();
        }
        return paid;
    }

    public static void main(String[] args) {
        daoCustomer dc = new daoCustomer();
        daoAdmin d = new daoAdmin();
        System.out.println();
//        Date currentDate = new Date(System.currentTimeMillis());
//        Orders o = new Orders(2342, "CUS08", "CHA2",
//                5, currentDate, "Cash", "", "");
//        int check = dc.insert(o);
//        System.out.println(check);
    }
}
