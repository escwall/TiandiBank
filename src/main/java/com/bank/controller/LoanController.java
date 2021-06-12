package com.bank.controller;


import com.bank.dao.CardDao;
import com.bank.entity.Loan;
import com.bank.service.LoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/loan")
public class LoanController {
    @Autowired
    LoanService loanService;

    @RequestMapping("check")
    @ResponseBody
    public String check(String phoneNumber) {
        Integer cnt = loanService.checkLoan(phoneNumber);
        return "{\"cnt\":" + cnt.toString() + "}";
    }

    @RequestMapping("insert")
    @ResponseBody
    public String insert(Loan loan) {
        Integer cnt = loanService.insertLoanRecords(loan);
        return "{\"cnt\":" + cnt.toString() + "}";
    }

    @RequestMapping("repay")
    @ResponseBody
    public String repay(String phoneNumber, Double amount, String cardNumber, String payPassword) {
        Integer cnt = loanService.repay(phoneNumber, amount, cardNumber, payPassword);
        return "{\"cnt\":" + cnt.toString() + "}";
    }

    @RequestMapping("getAmount")
    @ResponseBody
    public String getAmount(String phoneNumber) {
        Double amount = loanService.getAmount(phoneNumber);
        return "{\"amount\":" + amount.toString() + "}";
    }

    @RequestMapping("getBalance")
    @ResponseBody
    public String getBalance(String cardNumber, String payPassword) {
        Double balance = loanService.getBalance(cardNumber, payPassword);
        if(balance != null) {
            return "{\"balance\":" + balance.toString() + "}";
        }
        else return "{\"balance\": \"null\"}";
    }
}
