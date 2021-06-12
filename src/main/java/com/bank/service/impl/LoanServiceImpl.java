package com.bank.service.impl;

import com.bank.dao.CardDao;
import com.bank.dao.LoanDao;
import com.bank.entity.Loan;
import com.bank.service.LoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("loanService")
public class LoanServiceImpl implements LoanService {
    @Autowired
    LoanDao loanDao;
    @Autowired
    CardDao cardDao;

    public Integer checkLoan(String phoneNumber) {
        return loanDao.checkLoan(phoneNumber);
    }
    public Integer insertLoanRecords(Loan loan) {
        return loanDao.insertLoanRecords(loan);
    }

    @Transactional
    public Integer repay(String phoneNumber, Double amount, String cardNumber, String payPassword) {
        if(cardDao.withdraw(amount, cardNumber, payPassword) == 1)
            return loanDao.deleteLoanRecords(phoneNumber);
        else return -1;
    }

    public Double getAmount(String phoneNumber) {
        return loanDao.getAmount(phoneNumber);
    }

    public Double getBalance(String cardNumber, String payPassword) {
        return cardDao.getBalance(cardNumber, payPassword);
    }
}
