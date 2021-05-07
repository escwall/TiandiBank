package com.bank.entity;
import java.io.Serializable;
import java.sql.Date;


public class UserInformation implements Serializable {

  private String name;
  private String sex;
  private java.sql.Date birthday;
  private String phoneNumber;
  private String idNumber;
  private String payPassword;

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }


  public java.sql.Date getBirthday() {
    return birthday;
  }

  public void setBirthday(java.sql.Date birthday) {
    this.birthday = birthday;
  }


  public String getPhoneNumber() {
    return phoneNumber;
  }

  public void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }


  public String getIdNumber() {
    return idNumber;
  }

  public void setIdNumber(String idNumber) {
    this.idNumber = idNumber;
  }


  public String getPayPassword() {
    return payPassword;
  }

  public void setPayPassword(String payPassword) {
    this.payPassword = payPassword;
  }

  @Override
  public String toString() {
    return "UserInformation{" +
            "name='" + name + '\'' +
            ", sex='" + sex + '\'' +
            ", birthday=" + birthday +
            ", phoneNumber='" + phoneNumber + '\'' +
            ", idNumber='" + idNumber + '\'' +
            ", payPassword='" + payPassword + '\'' +
            '}';
  }
}
