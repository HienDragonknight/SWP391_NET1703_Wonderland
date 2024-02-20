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

    String orderDetailID;
    String orderID;
    String serviceID;
    String packageID;
    Date dateStart;
    Date dateOrder;
    String numberOfPeople;
    String themeID;
    String locationID;
    String note;
    String paymentMethod;

    public OrderDetailDTO() {
        this.orderDetailID = "";
        this.serviceID = "";
        this.packageID = "";
        this.dateStart = null;
        this.dateOrder = null;
        this.numberOfPeople = "";
        this.themeID = "";
        this.locationID = "";
        this.note = "";
        this.paymentMethod = "";
    }

    public OrderDetailDTO(String orderDetailID, String serviceID, String packageID, Date dateStart, Date dateOrder, String numberOfPeople, String themeID, String locationID, String note, String paymentMethod) {
        this.orderDetailID = orderDetailID;
        this.serviceID = serviceID;
        this.packageID = packageID;
        this.dateStart = dateStart;
        this.dateOrder = dateOrder;
        this.numberOfPeople = numberOfPeople;
        this.themeID = themeID;
        this.locationID = locationID;
        this.note = note;
        this.paymentMethod = paymentMethod;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getServiceID() {
        return serviceID;
    }

    public void setServiceID(String serviceID) {
        this.serviceID = serviceID;
    }

    public String getPackageID() {
        return packageID;
    }

    public void setPackageID(String packageID) {
        this.packageID = packageID;
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

    public String getNumberOfPeople() {
        return numberOfPeople;
    }

    public void setNumberOfPeople(String numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
    }

    public String getThemeID() {
        return themeID;
    }

    public void setThemeID(String themeID) {
        this.themeID = themeID;
    }

    public String getLocationID() {
        return locationID;
    }

    public void setLocationID(String locationID) {
        this.locationID = locationID;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

}
