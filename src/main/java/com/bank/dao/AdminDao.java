package com.bank.dao;
import com.bank.entity.Admin;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminDao {
    //管理员登录
    @Select("select * from admin where username=#{username} and adminPassword=#{adminPassword}")
    public Admin login(Admin admin);
    @Update("update admin set interestRate=#{interestRate}/100")
    public void changeRate(Double interestRate);
    @Select("select interestRate from admin where username='admin'")
    public Double getRate();
}
