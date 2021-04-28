
package com.learn.Ecom.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int userId;
    
    @Column(length=50,name="user_name")
    private String userName;
    
    @Column(length=25,name="user_email")
    private String userEmail;
    
    @Column(length=20,name="user_password")
    private String userPassword;
    
    @Column(length=10,name="user_phone")
    private String uesrPhone;
    
    @Column(length=1500,name="user_pic")
    private String userPic;
    
    @Column(length=1500,name="user_address")
    private String userAddress;

    public User(int userId, String userName, String userEmail, String userPassword, String uesrPhone, String userPic, String userAddress) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.uesrPhone = uesrPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
    }
    
    

    public User(String userName, String userEmail, String userPassword, String uesrPhone, String userPic, String userAddress) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.uesrPhone = uesrPhone;
        this.userPic = userPic;
        this.userAddress = userAddress;
    }

    public User() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUesrPhone() {
        return uesrPhone;
    }

    public void setUesrPhone(String uesrPhone) {
        this.uesrPhone = uesrPhone;
    }

    public String getUserPic() {
        return userPic;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    @Override
    public String toString() {
        return "Category{" + "userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword=" + userPassword + ", uesrPhone=" + uesrPhone + ", userPic=" + userPic + ", userAddress=" + userAddress + '}';
    }
    
    
    
}
