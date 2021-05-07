package com.bank.entity;
import java.io.Serializable;

public class Admin implements Serializable {

  private String username;
  private String adminPassword;


  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }


  public String getAdminPassword() {
    return adminPassword;
  }

  public void setAdminPassword(String adminPassword) {
    this.adminPassword = adminPassword;
  }

}
