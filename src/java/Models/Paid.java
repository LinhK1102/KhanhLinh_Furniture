/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class Paid {
//    1097	CUS012	DCO2	Cash	736.00	
    
    int orderID;
    String cusID,proID,paymentMethod;
    int payment;
    String shipDestination;

    public Paid() {
    }

    public Paid(int orderID, String cusID, String proID, String paymentMethod, int payment, String shipDestination) {
        this.orderID = orderID;
        this.cusID = cusID;
        this.proID = proID;
        this.paymentMethod = paymentMethod;
        this.payment = payment;
        this.shipDestination = shipDestination;
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

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public int getPayment() {
        return payment;
    }

    public void setPayment(int payment) {
        this.payment = payment;
    }

    public String getShipDestination() {
        return shipDestination;
    }

    public void setShipDestination(String shipDestination) {
        this.shipDestination = shipDestination;
    }
    
    
}
