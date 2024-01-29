/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.io.Serializable;

/**
 *
 * @author bao.kun
 */
public class LocationDTO implements Serializable {

    private String locationID;
    private String locationDetails;

    public LocationDTO(String locationDetails) {
        this.locationDetails = locationDetails;
    }

    public String getLocationID() {
        return locationID;
    }

    public void setLocationID(String locationID) {
        this.locationID = locationID;
    }

    public String getLocationDetails() {
        return locationDetails;
    }

    public void setLocationDetails(String locationDetails) {
        this.locationDetails = locationDetails;
    }

    public LocationDTO(String locationID, String locationDetails) {
        this.locationID = locationID;
        this.locationDetails = locationDetails;
    }

    public LocationDTO() {
    }

}
