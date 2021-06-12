package com.bank.dao;

import com.bank.entity.Login;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginDao {
    @Insert("INSERT INTO login (phoneNumber,loginPassword) VALUES(#{phoneNumber},#{loginPassword})")
    //注册
    public Integer insertUser(Login user);
    @Select("select * from login where phoneNumber=#{phoneNumber} and binary loginPassword=#{loginPassword}")
    //登录
    public Login login(Login user);

    @Select("select * from login where phoneNumber=#{phoneNumber}")
    public Login check(String phoneNumber);

    @Select("select loginPassword from login where phoneNumber=#{phoneNumber}")
    public String getPwByPhone(String phoneNumber);

    @Update("update login set loginPassword=#{newPw} where phoneNumber=#{phoneNumber}")
    public Integer changePw(@Param("newPw") String newPw, @Param("phoneNumber") String phoneNumber);

    @Select("select loanRate from admin where username='admin'")
    public Double getLoanRate();
}
