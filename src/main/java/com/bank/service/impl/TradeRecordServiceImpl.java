package com.bank.service.impl;

import com.bank.dao.TradeRecordDao;
import com.bank.entity.TradeRecord;
import com.bank.service.TradeRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("tradeRecordService")
public class TradeRecordServiceImpl implements TradeRecordService {
    @Autowired
    TradeRecordDao tradeRecordDao;

    @Override
    public List<TradeRecord> getAllRecords() {
        return tradeRecordDao.getAllRecords();
    }

    @Override
    public List<TradeRecord> getRecordsByPhoneNumber(String phoneNumber) {
        return tradeRecordDao.getRecordsByPhoneNumber(phoneNumber);
    }

}
