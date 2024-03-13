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

    private String fullName;
    private String packageName;
    private String dateStart;
    private String timeStart;
    private String dateOrder;
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
    private String localtionDetails;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(String fullName, String packageName, String dateStart, String dateOrder, double totalPrice, String status, String email, String phone, String serviceName, int amountOfPeople, String themeName, String location, String notes, String payment) {
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

    public String getLocaltionDetails() {
        return localtionDetails;
    }

    public void setLocaltionDetails(String localtionDetails) {
        this.localtionDetails = localtionDetails;
    }

    public OrderDetailDTO(String packageName, String dateStart, String timeStart, String dateOrder, String localtionDetails, double totalPrice, String status) {
        this.packageName = packageName;
        this.dateStart = dateStart;
        this.dateOrder = dateOrder;
        this.totalPrice = totalPrice;
        this.status = status;
        this.localtionDetails = localtionDetails;
        this.timeStart = timeStart;
    }

    public String getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(String timeStart) {
        this.timeStart = timeStart;
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
