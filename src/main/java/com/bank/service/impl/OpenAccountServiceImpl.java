package com.bank.service.impl;

import com.bank.dao.UserInformationDao;
import com.bank.entity.UserInformation;
import com.bank.service.OpenAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("openAccountService")
public class OpenAccountServiceImpl implements OpenAccountService {
    @Autowired
    private UserInformationDao userInformationDao;

    @Override
    public Boolean openAccount(UserInformation userInformation) {
        return userInformationDao.openAccount(userInformation) != 0;
    }

    @Override
    public UserInformation checkIdNum(String idNumber) {
        return userInformationDao.checkIdNum(idNumber);
    }

    @Override
    public UserInformation getInfo(String phoneNumber) {
        return userInformationDao.getInfo(phoneNumber);
    }

    @Override
    public Integer updateInfo(UserInformation userInformation) {
        return userInformationDao.updateInfo(userInformation);
    }
}
