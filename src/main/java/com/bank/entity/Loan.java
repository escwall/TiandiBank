package com.bank.entity;

public class Loan {
    private String phoneNumber;
    private Double amount;

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "Loan{" +
                "phoneNumber='" + phoneNumber + '\'' +
                ", amount=" + amount +
                '}';
    }
}
