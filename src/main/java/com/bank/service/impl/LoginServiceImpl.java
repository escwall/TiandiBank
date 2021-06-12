package com.bank.service.impl;

import com.bank.dao.LoginDao;
import com.bank.dao.UserInformationDao;
import com.bank.entity.Login;
import com.bank.entity.UserInformation;
import com.bank.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import java.security.AccessControlException;

/**
 * 实现类
 */
@Service("LoginService")
public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginDao loginDao;
    @Autowired
    private UserInformationDao userInformationDao;

    @Override
    public void insertUser(Login user) {
        if(loginDao.insertUser(user) != 1)
            throw new DuplicateKeyException("Fail to register");

    }

    @Override
    public boolean login(Login user) {
        Login login = loginDao.login(user);
//        System.out.println(login);
        return login != null;
    }

    @Override
    public Login check(String phoneNumber) {
        return loginDao.check(phoneNumber);
    }

    @Override
    public UserInformation checkAccount(String phoneNumber) {
        return userInformationDao.checkAccount(phoneNumber);
    }

    @Override
    public String getPwByPhone(String phoneNumber) {
        return loginDao.getPwByPhone(phoneNumber);
    }

    @Override
    public Integer changePw(String newPw, String phoneNUmber) {
        return loginDao.changePw(newPw, phoneNUmber);
    }

    @Override
    public Double getLoanRate() {
        return loginDao.getLoanRate();
    }
}
