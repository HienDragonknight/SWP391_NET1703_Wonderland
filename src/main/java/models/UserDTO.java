/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.io.Serializable;

/**
 *
 * @author Hp
 */
public class UserDTO implements Serializable {


    private String userID;
<<<<<<< HEAD

=======
>>>>>>> bc8d51679b055e973291653f90686fccb32bb8f5
    private String fullName;
    private String email;
    private String password;
    private String phoneNumber;
    private String avatar;
    private String roleID;

    public UserDTO() {
    }

<<<<<<< HEAD
    public UserDTO(String userID, String fullName, String email, String password, String phoneNumber, String avatar, String role) {
=======
    public UserDTO(String userID, String fullName, String email, String password, String phoneNumber, String avatar, String roleID) {
>>>>>>> bc8d51679b055e973291653f90686fccb32bb8f5
        this.userID = userID;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.avatar = avatar;
        this.roleID = roleID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getRoleID() {
        return roleID;
    }

<<<<<<< HEAD
    public void setRole(String role) {
        this.role = role;
    }


=======
    public void setRole(String roleID) {
        this.roleID = roleID;
    }
>>>>>>> bc8d51679b055e973291653f90686fccb32bb8f5

}
