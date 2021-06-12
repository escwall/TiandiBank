package com.bank.service;

import com.bank.entity.PageInfo;
import com.bank.entity.TradeRecord;

import java.util.List;

public interface TradeRecordService {
    public List<TradeRecord> getAllRecords();
    public List<TradeRecord> getRecordsByPhoneNumber(String phoneNumber);
}
