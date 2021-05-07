package com.bank.service;

import com.bank.entity.TradeRecord;

public interface TransferService {
    public String Transfer(String sender, String pw, String receiver, String rname, Double amount);
    public String getState(String cardNumber);
    public Integer insertRecord(TradeRecord tradeRecord);
}
