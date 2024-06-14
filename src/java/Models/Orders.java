/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Orders {
    int orderID;
    String cusID,proID;
    int quantity;
    Date orderDate;
    String paymentMethod,shipDestination,note;

    public Orders() {
    }

    public Orders(int orderID, String cusID, String proID, int quantity, Date orderDate, String paymentMethod, String shipDestination, String note) {
        this.orderID = orderID;
        this.cusID = cusID;
        this.proID = proID;
        this.quantity = quantity;
        this.orderDate = orderDate;
        this.paymentMethod = paymentMethod;
        this.shipDestination = shipDestination;
        this.note = note;
    }

    public String getShipDestination() {
        return shipDestination;
    }

    public void setShipDestination(String shipDestination) {
        this.shipDestination = shipDestination;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getCusID() {
        return cusID;
    }

    public void setCusID(String cusID) {
        this.cusID = cusID;
    }

    public String getProID() {
        return proID;
    }

    public void setProID(String proID) {
        this.proID = proID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
    
    
}
