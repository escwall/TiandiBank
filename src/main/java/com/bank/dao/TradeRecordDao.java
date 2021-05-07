package com.bank.dao;

import com.bank.entity.TradeRecord;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TradeRecordDao {
    @Insert("insert into trade_record values(#{senderCardNumber},#{senderName},#{type},#{receiverCardNumber},#{receiverName},#{time},#{amount})")
    public Integer insertRecord(TradeRecord tradeRecord);
    @Select("select * from trade_record")
    public List<TradeRecord> getAllRecords();
    @Select("with t1 as (select * from user_information natural join card where phoneNumber=#{phoneNumber})\n" +
            "select senderCardNumber,senderName,type,receiverCardNumber,receiverName,time,amount from trade_record as tr, t1 where tr.senderCardNumber=t1.cardNumber or tr.receiverCardNumber=t1.cardNumber order by time")
    public List<TradeRecord> getRecordsByPhoneNumber(String phoneNumber);
}
