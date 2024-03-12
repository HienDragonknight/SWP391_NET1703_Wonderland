/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author phanv
 */
public class OrderDTO  {

    @Override
    public String toString() {
        return "OrderDTO{" + "orderID=" + orderID + ", userID=" + userID + ", createDate=" + createDate + ", totalPrice=" + totalPrice + ", status=" + status + ", email=" + email + ", phoneNumber=" + phoneNumber + ", fullName=" + fullName + ", orderDetailID=" + orderDetailID + ", userName=" + userName + '}';
    }

    private String orderID;
    private String userID;
    private Date createDate;
    private double totalPrice;
    private String status;
    private String email;
    private String phoneNumber;
    private String fullName;
    private String orderDetailID;
    private String userName;

    public OrderDTO(String orderID, String userID, Date createDate, double totalPrice, String status, String email, String phoneNumber, String fullName, String orderDetailID) {
        this.orderID = orderID;
        this.userID = userID;
        this.createDate = createDate;
        this.totalPrice = totalPrice;
        this.status = status;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.fullName = fullName;
        this.orderDetailID = orderDetailID;
    }

    public OrderDTO(String orderID, String userID, Date createDate, double totalPrice, String status, String email, String phoneNumber, String fullName, String orderDetailID, String userName) {
        this.orderID = orderID;
        this.userID = userID;
        this.createDate = createDate;
        this.totalPrice = totalPrice;
        this.status = status;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.fullName = fullName;
        this.orderDetailID = orderDetailID;
        this.userName = userName;
    }

    public OrderDTO() {
        this.orderID = "";
        this.userID = "";
        this.createDate = null;
        this.totalPrice = 0;
        this.status = "";
        this.email = "";
        this.phoneNumber = "";
        this.fullName = "";
        this.orderDetailID = "";
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(String orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

}
