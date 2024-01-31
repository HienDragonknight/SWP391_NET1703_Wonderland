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
public class PackageDTO implements Serializable {

    private String packageID;
    private String packageName;
    private double unitPrice;
    private String image;
    private String video;
    private String description;
    private String locationID;
    private String feedbackID;
    private String size;

    public PackageDTO(String packageID, String packageName, double unitPrice, String image, String video, String description, String locationID, String feedbackID, String size) {
        this.packageID = packageID;
        this.packageName = packageName;
        this.unitPrice = unitPrice;
        this.image = image;
        this.video = video;
        this.description = description;
        this.locationID = locationID;
        this.feedbackID = feedbackID;
        this.size = size;
    }

    public String getLocationID() {
        return locationID;
    }

    public void setLocationID(String locationID) {
        this.locationID = locationID;
    }

    public String getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(String feedbackID) {
        this.feedbackID = feedbackID;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getPakageID() {
        return packageID;
    }

    public void setPakageID(String pakageID) {
        this.packageID = pakageID;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
