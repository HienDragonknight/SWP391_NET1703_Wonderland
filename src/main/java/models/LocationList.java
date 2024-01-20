/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author bao.kun
 */
public class LocationList {

    private List<LocationDTO> listLocation;

    public LocationList() {
        this.listLocation = new ArrayList<LocationDTO>();
    }

    public LocationList(List<LocationDTO> listLocation) {
        this.listLocation = listLocation;
    }

    public List<LocationDTO> getListLocation() {
        return listLocation;
    }

    public void setListLocation(List<LocationDTO> listLocation) {
        this.listLocation = listLocation;
    }

}
