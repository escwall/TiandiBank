package com.bank.dao;

import com.bank.entity.TradeRecord;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TradeRecordDao {
    public Integer insertRecord(TradeRecord tradeRecord);
    public List<TradeRecord> getAllRecords();
    public List<TradeRecord> getRecordsByPhoneNumber(String phoneNumber);
    public Integer getTotalCount(@Param("cardNumber") String cardNumber);
}
