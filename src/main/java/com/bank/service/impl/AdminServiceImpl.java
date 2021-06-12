package com.bank.service.impl;
import com.bank.dao.AdminDao;
import com.bank.dao.CardUserDao;
import com.bank.entity.Admin;
import com.bank.entity.CardUser;
import com.bank.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;
    @Autowired
    private CardUserDao cardUserDao;

    @Override
    public boolean login(Admin admin) {
        System.out.println("业务层：管理员登录");
        return adminDao.login(admin) != null;
    }

    @Override
    public List<CardUser> showAllAccounts() {
        System.out.println(cardUserDao.showAllAccounts());
        return cardUserDao.showAllAccounts();
    }

    @Override
    public List<CardUser> showActivatedAccounts() {
        System.out.println(cardUserDao.showActivatedAccounts());
        return cardUserDao.showActivatedAccounts();
    }
    @Override
    public List<CardUser> showFrozenAccounts() {
        System.out.println(cardUserDao.showFrozenAccounts());
        return cardUserDao.showFrozenAccounts();
    }

    @Override
    public String setState(String cardNumber) {
        cardUserDao.setState(cardNumber);
        return cardUserDao.getStateByCardNumber(cardNumber);
    }

    @Override
    public void delete(String cardNumber) {
        cardUserDao.delete(cardNumber);
    }

    @Override
    public void changeRate(Double interestRate) {
        adminDao.changeRate(interestRate);
    }

    @Override
    public Double getRate() {
        return adminDao.getRate();
    }

    @Override
    public List<CardUser> showCard(String phoneNumber) {
        return cardUserDao.showCardByPhone(phoneNumber);
    }

    @Override
    public String getNameByCard(String cardNumber) {
        return cardUserDao.showNameByCard(cardNumber);
    }
}
