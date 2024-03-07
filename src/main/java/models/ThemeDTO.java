package models;

import java.io.Serializable;

public class ThemeDTO implements Serializable {

    private String themeID;
    private String themeName;
    private String themeImage; // Thuộc tính ảnh

    public ThemeDTO(String themeID, String themeName, String themeImage) {
        this.themeID = themeID;
        this.themeName = themeName;
        this.themeImage = themeImage;
    }
    
        public ThemeDTO( String themeName, String themeImage) {
        this.themeID = themeID;
        this.themeName = themeName;
        this.themeImage = themeImage;
    }

    public String getThemeID() {
        return themeID;
    }

    public void setThemeID(String themeID) {
        this.themeID = themeID;
    }

    public String getThemeName() {
        return themeName;
    }

    public void setThemeName(String themeName) {
        this.themeName = themeName;
    }

    public String getThemeImage() {
        return themeImage;
    }

    public void setThemeImage(String themeImage) {
        this.themeImage = themeImage;
    }

}
