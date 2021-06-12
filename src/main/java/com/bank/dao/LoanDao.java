package com.bank.dao;

import com.bank.entity.Loan;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface LoanDao {
    @Select("select count(*) from loan where phoneNumber=#{phoneNumber}")
    public Integer checkLoan(String phoneNumber);
    @Insert("insert into loan(phoneNumber,amount) values(#{phoneNumber},#{amount})")
    public Integer insertLoanRecords(Loan loan);
    @Delete("delete from loan where phoneNumber=#{phoneNumber}")
    public Integer deleteLoanRecords(String phoneNumber);
    @Select("select amount from loan where phoneNumber=#{phoneNumber}")
    public Double getAmount(String phoneNumber);
}
