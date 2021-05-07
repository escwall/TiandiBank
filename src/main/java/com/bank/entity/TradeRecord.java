package com.bank.entity;


import java.io.Serializable;

public class TradeRecord implements Serializable {

  private String senderCardNumber;
  private String senderName;
  private String type;
  private String receiverCardNumber;
  private String receiverName;
  private java.sql.Timestamp time;
  private double amount;


  public String getSenderCardNumber() {
    return senderCardNumber;
  }

  public void setSenderCardNumber(String senderCardNumber) {
    this.senderCardNumber = senderCardNumber;
  }


  public String getSenderName() {
    return senderName;
  }

  public void setSenderName(String senderName) {
    this.senderName = senderName;
  }


  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }


  public String getReceiverCardNumber() {
    return receiverCardNumber;
  }

  public void setReceiverCardNumber(String receiverCardNumber) {
    this.receiverCardNumber = receiverCardNumber;
  }


  public String getReceiverName() {
    return receiverName;
  }

  public void setReceiverName(String receiverName) {
    this.receiverName = receiverName;
  }


  public java.sql.Timestamp getTime() {
    return time;
  }

  public void setTime(java.sql.Timestamp time) {
    this.time = time;
  }


  public double getAmount() {
    return amount;
  }

  public void setAmount(double amount) {
    this.amount = amount;
  }

}
