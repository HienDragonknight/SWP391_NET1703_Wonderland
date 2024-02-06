/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.io.Serializable;

/**
 *
 * @author Le Huu Huy
 */
public class OrderDetailDTO implements Serializable {

    String orderDetailID;
    String userName;
    String service;
    String packages;
    String dateStart;
    String dateOrder;
    String amountPeople;
    String theme;
    String location;
    double price;
    String note;
    String status;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(String orderDetailID, String userName, String service, String packages, String dateStart, String dateOrder, String amountPeople, String theme, String location, double price, String note, String status) {
        this.orderDetailID = orderDetailID;
        this.userName = userName;
        this.service = service;
        this.packages = packages;
        this.dateStart = dateStart;
        this.dateOrder = dateOrder;
        this.amountPeople = amountPeople;
        this.theme = theme;
        this.location = location;
        this.price = price;
        this.note = note;
        this.status = status;
    }

    public String getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(String orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public String getPackages() {
        return packages;
    }

    public void setPackages(String packages) {
        this.packages = packages;
    }

    public String getDateStart() {
        return dateStart;
    }

    public void setDateStart(String dateStart) {
        this.dateStart = dateStart;
    }

    public String getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(String dateOrder) {
        this.dateOrder = dateOrder;
    }

    public String getAmountPeople() {
        return amountPeople;
    }

    public void setAmountPeople(String amountPeople) {
        this.amountPeople = amountPeople;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
