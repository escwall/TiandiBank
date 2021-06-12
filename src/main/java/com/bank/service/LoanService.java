package com.bank.service;

import com.bank.entity.Loan;

public interface LoanService {
    public Integer checkLoan(String phoneNumber);
    public Integer insertLoanRecords(Loan loan);
    public Integer repay(String phoneNumber, Double amount, String cardNumber, String payPassword);
    public Double getAmount(String phoneNumber);
    public Double getBalance(String cardNumber, String payPassword);
}
