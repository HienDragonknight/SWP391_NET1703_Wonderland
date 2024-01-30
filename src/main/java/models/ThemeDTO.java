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
public class ThemeDTO implements Serializable {

    private String themeID;
    private String themeName;

    public ThemeDTO(String themeID, String themeName) {
        this.themeID = themeID;
        this.themeName = themeName;
    }

    public String getThemeID() {
        return themeID;
    }

    public void setThemeID(String themeID) {
        this.themeID = themeID;
    }

    public ThemeDTO(String themeName) {
        this.themeName = themeName;
    }

    public String getThemeName() {
        return themeName;
    }

    public void setThemeName(String themeName) {
        this.themeName = themeName;
    }

}
