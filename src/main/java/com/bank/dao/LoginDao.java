package com.bank.dao;

import com.bank.entity.Login;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginDao {
    @Insert("INSERT INTO login (phoneNumber,loginPassword) VALUES(#{phoneNumber},#{loginPassword})")
    //注册
    public Integer insertUser(Login user);
    @Select("select * from login where phoneNumber=#{phoneNumber} and loginPassword=#{loginPassword}")
    //登录
    public Login login(Login user);

    @Select("select * from login where phoneNumber=#{phoneNumber}")
    public Login check(String phoneNumber);
}
