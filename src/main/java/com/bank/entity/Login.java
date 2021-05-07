package com.bank.entity;
import java.io.Serializable;

public class Login implements Serializable {

  private String phoneNumber;
  private String loginPassword;


  public String getPhoneNumber() {
    return phoneNumber;
  }

  public void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }


  public String getLoginPassword() {
    return loginPassword;
  }

  public void setLoginPassword(String loginPassword) {
    this.loginPassword = loginPassword;
  }

  @Override
  public String toString() {
    return "Login{" +
            "phoneNumber='" + phoneNumber + '\'' +
            ", loginPassword='" + loginPassword + '\'' +
            '}';
  }
}
