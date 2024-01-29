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

<<<<<<< HEAD
    private String pakageID;
    private String pakageName;
=======
    private String packageName;
>>>>>>> 77d4c3a55ac4e66368efcae21116afbd4c5ac128
    private double unitPrice;
    private String image;
    private String video;
    private String description;

<<<<<<< HEAD
    public PackageDTO(String pakageName, double unitPrice, String image, String video, String description) {
        this.pakageName = pakageName;
=======
    public PackageDTO(String packageName, double unitPrice, String image, String video, String description) {
        this.packageName = packageName;
>>>>>>> 77d4c3a55ac4e66368efcae21116afbd4c5ac128
        this.unitPrice = unitPrice;
        this.image = image;
        this.video = video;
        this.description = description;
    }

<<<<<<< HEAD
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
=======
    public String getPackageName() {
        return packageName;
>>>>>>> 77d4c3a55ac4e66368efcae21116afbd4c5ac128
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
