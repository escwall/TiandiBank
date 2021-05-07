package com.bank.dao;

import com.bank.entity.Card;
import com.bank.entity.CardUser;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CardUserDao {
    public List<CardUser> showAllAccounts();
    public List<CardUser> showActivatedAccounts();
    public List<CardUser> showFrozenAccounts();
    public void setState(String cardNumber);
    public void delete(String cardNumber);
    public String getStateByCardNumber(String cardNumber);
    public String showNameByCard(String cardNumber);
    public List<CardUser> showCardByPhone(String phoneNumber);
}
