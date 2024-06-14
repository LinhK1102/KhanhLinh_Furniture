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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class daoAdmin {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;
    private String status = "OK";

    public HashMap<String, Integer> getPopDes() {
        String sqlOrd = "SELECT ShipDestination, COUNT(OrderID)\n"
                + "FROM PAID\n"
                + "GROUP BY ShipDestination\n"
                + "HAVING COUNT(OrderID) = (\n"
                + "    SELECT MAX(CountOrder)\n"
                + "    FROM (\n"
                + "        SELECT COUNT(OrderID) AS CountOrder\n"
                + "        FROM PAID\n"
                + "        GROUP BY ShipDestination\n"
                + "    ) AS Counts\n"
                + ")";
        HashMap<String, Integer> list = new HashMap<>();
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sqlOrd);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.put(rs.getString(1), rs.getInt(2));
            }
        } catch (Exception e) {
            status = "Error at load getPopDes " + e.getMessage();
        }
        return list;
    }

    public HashMap<String, Integer> getPrfPaid() {
        String sqlOrd = "SELECT PaymentMethod, COUNT(OrderID)\n"
                + "FROM PAID\n"
                + "GROUP BY PaymentMethod\n"
                + "HAVING COUNT(OrderID) = (\n"
                + "    SELECT MAX(CountOrder)\n"
                + "    FROM (\n"
                + "        SELECT COUNT(OrderID) AS CountOrder\n"
                + "        FROM PAID\n"
                + "        GROUP BY PaymentMethod\n"
                + "    ) AS Counts\n"
                + ")";
        HashMap<String, Integer> shipDestination = new HashMap<>();
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sqlOrd);
            rs = ps.executeQuery();
            while (rs.next()) {
                shipDestination.put(rs.getString(1), rs.getInt(2));
            }
        } catch (Exception e) {
            status = "Error at load getPrfPaid " + e.getMessage();
        }
        return shipDestination;
    }

    public HashMap<Products, Integer> getMostOrdPro() {
        String sqlOrd = "select P.* ,R.MOSTORDER\n"
                + "	FROM (\n"
                + "		SELECT P.ProID ,SUM(O.Quantity) AS MOSTORDER, ROW_NUMBER() OVER (ORDER BY  SUM(O.Quantity) DESC) AS RowNum\n"
                + "		from Orders O JOIN Products P\n"
                + "			ON O.ProID=P.ProID\n"
                + "		group by P.ProID\n"
                + "	)AS R JOIN Products P \n"
                + "		ON R.ProID=P.ProID\n"
                + "WHERE RowNum = 1;";
        HashMap<Products, Integer> list = new HashMap<>();
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sqlOrd);
            rs = ps.executeQuery();
            while (rs.next()) {
                Products o = new Products(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getInt(7), rs.getString(8));
                list.put(o, rs.getInt(9));
            }
        } catch (Exception e) {
            status = "Error at load getMostOrdPro " + e.getMessage();
        }
        return list;
    }

    public HashMap<Products, Integer> getMostSellPro() {
        String sqlOrd = "select P.* ,R.BESTSOLD\n"
                + "	FROM (\n"
                + "		SELECT P.ProID ,COUNT(O.ProID) AS BESTSOLD, ROW_NUMBER() OVER (ORDER BY  COUNT(O.OrderID) DESC) AS RowNum\n"
                + "		from PAID O JOIN Products P\n"
                + "			ON O.ProID=P.ProID\n"
                + "		group by P.ProID\n"
                + "	)AS R JOIN Products P \n"
                + "		ON R.ProID=P.ProID\n"
                + "WHERE RowNum = 1;";
        HashMap<Products, Integer> list = new HashMap<>();
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sqlOrd);
            rs = ps.executeQuery();
            while (rs.next()) {
                Products o = new Products(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getInt(7), rs.getString(8));
                list.put(o, rs.getInt(9));
            }
        } catch (Exception e) {
            status = "Error at load getMostOrdPro " + e.getMessage();
        }
        return list;
    }

    public HashMap<AccountDetails, Integer> getMostSpend() {
        String sqlOrd = "SELECT A.*,MaxSpending\n"
                + "FROM (\n"
                + "    SELECT A.UserID, SUM(O.Quantity * P.Price) AS MaxSpending,\n"
                + "           ROW_NUMBER() OVER (ORDER BY SUM(O.Quantity * P.Price) DESC) AS RowNum\n"
                + "    FROM Orders O\n"
                + "    JOIN Products P ON O.ProID = P.ProID\n"
                + "    JOIN AccountDetails A ON O.CusID = A.UserID\n"
                + "    GROUP BY A.UserID\n"
                + ") AS R JOIN AccountDetails A\n"
                + "ON R.UserID=A.UserID\n"
                + "WHERE RowNum = 1;";
        HashMap<AccountDetails, Integer> list = new HashMap<>();
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sqlOrd);
            rs = ps.executeQuery();
            while (rs.next()) {
                AccountDetails o = new AccountDetails(rs.getString(1),
                        rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5));
                list.put(o, rs.getInt(6));
            }
        } catch (Exception e) {
            status = "Error at load getMostSpend " + e.getMessage();
        }
        return list;
    }

    public HashMap<Orders, Products> getOrders() {
        String sqlOrd = "SELECT * FROM Orders O JOIN Products P\n"
                + "	ON O.ProID=P.ProID";
        HashMap<Orders, Products> list = new HashMap<>();
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sqlOrd);
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

    public List<Paid> getPaid() {
        String sqlOrd = "select * from PAID";
        List<Paid> list = new ArrayList<>();
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sqlOrd);
            rs = ps.executeQuery();
            while (rs.next()) {
                Paid o = new Paid(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getInt(5), rs.getString(6));
                list.add(o);
            }
        } catch (Exception e) {
            status = "Error at load Orders " + e.getMessage();
        }
        return list;
    }

    public void insert(Products p) {
        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([ProID]\n"
                + "           ,[ProName]\n"
                + "           ,[Picture]\n"
                + "           ,[Quantity]\n"
                + "           ,[Designers]\n"
                + "           ,[LongDes]\n"
                + "           ,[Price]\n"
                + "           ,[CategoryID])\n"
                + "     VALUES (?,?,?,?,?,?,?,?)";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getProID());
            ps.setString(2, p.getProName());
            ps.setString(3, p.getPicture());
            ps.setInt(4, p.getQuantity());
            ps.setString(5, p.getDesigners());
            ps.setString(6, p.getLongDes());
            ps.setInt(7, p.getPrice());
            ps.setString(8, p.getCategoryID());

            ps.executeUpdate();
        } catch (Exception e) {
            status = "Error at insert Products " + e.getMessage();
        }
    }

    public Orders ordersByID(int orderID) {
        String sqlOrd = "select * from Orders\n"
                + "where OrderID = ?";
       Orders list;
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sqlOrd);
            ps.setInt(1, orderID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Orders o = new Orders(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getInt(4),
                        rs.getDate(5), rs.getString(6),
                        rs.getString(7), rs.getString(8));
               return o;
            }
        } catch (Exception e) {
            status = "Error at load Orders " + e.getMessage();
        }
        return null;
    }

    public int acceptOrders(Orders o) {
        String sql = "DELETE FROM [dbo].[Orders]\n"
                + "      WHERE OrderID = ?\n"
                + "INSERT INTO [dbo].[PAID]\n"
                + "           ([OrderID]\n"
                + "           ,[CusID]\n"
                + "           ,[ProID]\n"
                + "           ,[PaymentMethod]\n"
                + "           ,[Payment]\n"
                + "           ,[ShipDestination])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setInt(1, o.getOrderID());
            ps.setInt(2, o.getOrderID());
            ps.setString(3, o.getCusID());
            ps.setString(4, o.getProID());
            ps.setString(5, o.getPaymentMethod());
            ps.setInt(6, o.getQuantity());
            ps.setString(7, o.getShipDestination());
            int check = ps.executeUpdate();
            return check;
        } catch (Exception e) {
            status = "Error at load accept " + e.getMessage();
        }
        return -1;
    }

    public int delete(String id) {
        String sql = "DELETE FROM [dbo].[Products]\n"
                + "      WHERE ProID = ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            int check = ps.executeUpdate();
return check;
        } catch (Exception e) {
            status = "Error at load delete " + e.getMessage();
        }return 0;
    }

    public void update(String proID, String proName, String picture, int quantity,
            String designers, String longDes, int price, String cateID) {

        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [ProID] = ?\n"
                + "      ,[ProName] = ?\n"
                + "      ,[Picture] = ?\n"
                + "      ,[Quantity] = ?\n"
                + "      ,[Designers] = ?\n"
                + "      ,[LongDes] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[CategoryID] = ?\n"
                + " WHERE [ProID]= ?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sql);
            ps.setString(1, proID);
            ps.setString(2, proName);
            ps.setString(3, picture);
            ps.setInt(4, quantity);
            ps.setString(5, designers);
            ps.setString(6, longDes);
            ps.setInt(7, price);
            ps.setString(8, cateID);
            ps.setString(9, proID);
            ps.execute();

        } catch (Exception e) {
            status = "Error at update Product:" + e.getMessage();
        }
    }

    public Products getProByID(String pID) {
        String sqlCate = "select * from Products\n"
                + "where ProID=?";
        try {
            con = new DBContext().connection;
            ps = con.prepareStatement(sqlCate);
            ps.setString(1, pID);//xong
            rs = ps.executeQuery();
            if (rs.next()) {
                Products p = new Products(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getInt(7), rs.getString(8));
                return p;
            }
        } catch (Exception e) {
            status = "Error at load Products " + e.getMessage();
        }
        return null;
    }

    public static void main(String[] args) {
        daoAdmin a = new daoAdmin();
//        Products p = a.getProByID("CHA2");
//        System.out.println(p.getProID());
//        HashMap<Products, Integer> ol = a.getMostOrdPro();
//        for (Map.Entry<Products, Integer> entry : ol.entrySet()) {
//            Products key = entry.getKey();
//            int val = entry.getValue();
//            System.out.println(key.getProName() + " " + val);
//        }
//        List<Paid> pa = a.getPaid();
//        for (int i = 0; i < 5; i++) {
//            System.out.println(pa.get(i).getOrderID());
//        }
        Orders or = a.ordersByID(8806);
        System.out.println(or.getProID());
        int check = a.acceptOrders(or);
        System.out.println(check);
    }
}
