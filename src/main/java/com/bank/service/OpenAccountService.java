package com.bank.service;

import com.bank.entity.UserInformation;
import org.springframework.ui.Model;

import java.util.List;

public interface OpenAccountService {
    public Boolean openAccount(UserInformation userInformation);
    public UserInformation checkIdNum(String idNumber);
    public UserInformation getInfo(String phoneNumber);
    public Integer updateInfo(UserInformation userInformation);
}
