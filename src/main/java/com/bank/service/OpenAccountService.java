package com.bank.service;

import com.bank.entity.UserInformation;
import org.springframework.ui.Model;

public interface OpenAccountService {
    public Boolean openAccount(UserInformation userInformation);
    public UserInformation checkIdNum(String idNumber);
}
