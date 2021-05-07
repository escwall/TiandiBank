package com.bank.service;
import com.bank.entity.Admin;
import com.bank.entity.Card;
import com.bank.entity.CardUser;

import java.util.List;


public interface AdminService {
    //管理员登录
    public boolean login(Admin admin);
    public List<CardUser> showAllAccounts();
    public List<CardUser> showActivatedAccounts();
    public List<CardUser> showFrozenAccounts();
    public String setState(String cardNumber);
    public void delete(String cardNumber);
    public void changeRate(Double interestRate);
    public Double getRate();
    public List<CardUser> showCard(String phoneNumber);
    public String getNameByCard(String cardNumber);
}
