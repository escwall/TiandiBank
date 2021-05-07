package com.bank.service.impl;

import com.bank.dao.CardDao;
import com.bank.dao.TradeRecordDao;
import com.bank.entity.TradeRecord;
import com.bank.service.TransferService;
import org.apache.ibatis.executor.ExecutorException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("transferService")
public class TransferServiceImpl implements TransferService {
    @Autowired
    private CardDao cardDao;
    @Autowired
    private TradeRecordDao tradeRecordDao;

    @Override
    @Transactional
    public String Transfer(String sender, String pw, String receiver, String rname, Double amount) throws RuntimeException {
        if(cardDao.getState(sender).equals("frozen")) return "sender";
        if(cardDao.getState(receiver).equals("frozen")) return "receiver";
        if(cardDao.withdraw(amount,sender,pw) == 1) {
            if(cardDao.deposit(amount, receiver, rname) == 1)
            return "1";
            else throw new ExecutorException();
        }
        return "";
    }

    @Override
    public String getState(String cardNumber) {
        return cardDao.getState(cardNumber)!=null ? cardDao.getState(cardNumber):"null";
    }

    @Override
    public Integer insertRecord(TradeRecord tradeRecord) {
        return tradeRecordDao.insertRecord(tradeRecord);
    }
}
