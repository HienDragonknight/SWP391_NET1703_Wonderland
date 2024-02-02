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

    private String pakageID;
    private String pakageName;
    private double unitPrice;
    private String image;
    private String video;
    private String description;

    public PackageDTO(String packageName, double unitPrice, String image, String video, String description) {
        this.pakageName = packageName;
        this.unitPrice = unitPrice;
        this.image = image;
        this.video = video;
        this.description = description;
    }

    public PackageDTO(String pakageID, String pakageName, double unitPrice, String image, String video, String description) {
        this.pakageID = pakageID;
        this.pakageName = pakageName;
        this.unitPrice = unitPrice;
        this.image = image;
        this.video = video;
        this.description = description;
    }

    public String getPakageID() {
        return pakageID;
    }

    public void setPakageID(String pakageID) {
        this.pakageID = pakageID;
    }

    public String getPakageName() {
        return pakageName;

    }

    public void setPackageName(String packageName) {
        this.pakageName = packageName;
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
