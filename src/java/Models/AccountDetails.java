/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Admin
 */
public class AccountDetails {
    String userID, userName;
    String cusAdd,cusCIty,cusState;

    public AccountDetails() {
    }

    public AccountDetails(String userID, String userName, String cusAdd, String cusCIty, String cusState) {
        this.userID = userID;
        this.userName = userName;
        this.cusAdd = cusAdd;
        this.cusCIty = cusCIty;
        this.cusState = cusState;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCusAdd() {
        return cusAdd;
    }

    public void setCusAdd(String cusAdd) {
        this.cusAdd = cusAdd;
    }

    public String getCusCIty() {
        return cusCIty;
    }

    public void setCusCIty(String cusCIty) {
        this.cusCIty = cusCIty;
    }

    public String getCusState() {
        return cusState;
    }

    public void setCusState(String cusState) {
        this.cusState = cusState;
    }
    
    
}
