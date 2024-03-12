/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Le Huu Huy
 */
public class OrderDetailDTO implements Serializable {
    private  int  orderDetailID;
    private String fullName;
    private String packageName;

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }
    private Date dateStart;
    private Date dateOrder;
    private double totalPrice;
    private String status;
    private String email;
    private String phone;
    private String serviceName;
    private int amountOfPeople;
    private String themeName;
    private String location;
    private String notes;
    private String payment;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(String fullName, String packageName, Date dateStart, Date dateOrder, double totalPrice, String status, String email, String phone, String serviceName, int amountOfPeople, String themeName, String location, String notes, String payment) {
        this.fullName = fullName;
        this.packageName = packageName;
        this.dateStart = dateStart;
        this.dateOrder = dateOrder;
        this.totalPrice = totalPrice;
        this.status = status;
        this.email = email;
        this.phone = phone;
        this.serviceName = serviceName;
        this.amountOfPeople = amountOfPeople;
        this.themeName = themeName;
        this.location = location;
        this.notes = notes;
        this.payment = payment;
    }

    public OrderDetailDTO(int orderDetailID, String fullName, String packageName, Date dateStart, Date dateOrder, double totalPrice, String status, String email, String phone, String serviceName, int amountOfPeople, String themeName, String location, String notes, String payment) {
        this.orderDetailID = orderDetailID;
        this.fullName = fullName;
        this.packageName = packageName;
        this.dateStart = dateStart;
        this.dateOrder = dateOrder;
        this.totalPrice = totalPrice;
        this.status = status;
        this.email = email;
        this.phone = phone;
        this.serviceName = serviceName;
        this.amountOfPeople = amountOfPeople;
        this.themeName = themeName;
        this.location = location;
        this.notes = notes;
        this.payment = payment;
    }

    @Override
    public String toString() {
        return "OrderDetailDTO{" + "orderDetailID=" + orderDetailID + ", fullName=" + fullName + ", packageName=" + packageName + ", dateStart=" + dateStart + ", dateOrder=" + dateOrder + ", totalPrice=" + totalPrice + ", status=" + status + ", email=" + email + ", phone=" + phone + ", serviceName=" + serviceName + ", amountOfPeople=" + amountOfPeople + ", themeName=" + themeName + ", location=" + location + ", notes=" + notes + ", payment=" + payment + '}';
    }

    
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(Date dateOrder) {
        this.dateOrder = dateOrder;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public int getAmountOfPeople() {
        return amountOfPeople;
    }

    public void setAmountOfPeople(int amountOfPeople) {
        this.amountOfPeople = amountOfPeople;
    }

    public String getThemeName() {
        return themeName;
    }

    public void setThemeName(String themeName) {
        this.themeName = themeName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }
    
    
    
}
