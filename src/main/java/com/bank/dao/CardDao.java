package com.bank.dao;

import com.bank.entity.Card;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface CardDao {
    public Integer deposit(@Param("amount") Double amount, @Param("cn") String cardNumber, @Param("name") String un);
    public Integer withdraw(@Param("amount") Double amount, @Param("cn") String cardNumber, @Param("pw") String payPassword);
    public List<Card> showAll();
    public Double getBalance(@Param("cn") String cardNumber, @Param("pw") String payPassword);
    public String getState(String cardNumber);
}
