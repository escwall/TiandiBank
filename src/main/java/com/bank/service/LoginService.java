package com.bank.service;
import com.bank.entity.Login;
import com.bank.entity.UserInformation;


public interface LoginService {

    //注册
    public void insertUser(Login user);

    //登录
    public boolean login(Login user);

    public Login check(String phoneNumber);

    public UserInformation checkAccount(String phoneNumber);

    public String getPwByPhone(String phoneNumber);

    public Integer changePw(String newPw, String phoneNumber);

    public Double getLoanRate();
}
