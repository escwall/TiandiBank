package com.bank.dao;
import com.bank.entity.UserInformation;
import org.springframework.stereotype.Repository;

@Repository
public interface UserInformationDao {
    public UserInformation showInfo(UserInformation userInformation);
    public Integer openAccount(UserInformation userInformation);
    public UserInformation checkAccount(String phoneNumber);
    public UserInformation checkIdNum(String idNumber);
}
