/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.io.Serializable;

/**
 *
 * @author phanv
 */
public class BonusServiceDTO implements Serializable {

    private String serviceID;
    private String serviceName;
    private double servicePrice;
    private String descriptions;
    private String image;

    public BonusServiceDTO(String serviceName, double servicePrice, String descriptions, String image) {
        this.serviceName = serviceName;
        this.servicePrice = servicePrice;
        this.descriptions = descriptions;
        this.image = image;
    }

    public BonusServiceDTO(String serviceID, String serviceName, double servicePrice, String descriptions, String image) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.servicePrice = servicePrice;
        this.descriptions = descriptions;
        this.image = image;
    }

<<<<<<< HEAD
    public String getServiceID() {
=======
    public BonusServiceDTO(String serviceName, double servicePrice, String descriptions, String image) {
        this.serviceName = serviceName;
        this.servicePrice = servicePrice;
        this.descriptions = descriptions;
        this.image = image;
    }
    
    public int getServiceID() {
>>>>>>> 77d4c3a55ac4e66368efcae21116afbd4c5ac128
        return serviceID;
    }

    public void setServiceID(String serviceID) {
        this.serviceID = serviceID;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public double getServicePrice() {
        return servicePrice;
    }

    public void setServicePrice(double servicePrice) {
        this.servicePrice = servicePrice;
    }

    public String getDescriptions() {
        return descriptions;
    }

    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}
