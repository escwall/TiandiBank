package com.bank.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bank.entity.TradeRecord;
import com.bank.service.TradeRecordService;
import com.bank.service.TransferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("tradeRecord")
@SessionAttributes("name")
public class TradeRecordController {
    @Autowired
    private TransferService transferService;
    @Autowired
    private TradeRecordService tradeRecordService;

    @RequestMapping("insertRecord")
    @ResponseBody
    public String insertRecord(@RequestParam String info) {
        TradeRecord tradeRecord = JSONArray.toJavaObject((JSONObject) JSONArray.parse(info), TradeRecord.class);
        if(transferService.insertRecord(tradeRecord) == 1) {
            return "{\"s\":\"true\"}";
        } else return "{\"s\":\"false\"}";
    }

    @RequestMapping("getAllRecords")
    @ResponseBody
    public JSONArray getAllRecords() {
        return JSONArray.parseArray(JSON.toJSONString(tradeRecordService.getAllRecords()));
    }

    @RequestMapping("getRecordsByCardNumber")
    @ResponseBody
    public JSONArray getRecordsByPhoneNumber(String phoneNumber) {
        return JSONArray.parseArray(JSON.toJSONString(tradeRecordService.getRecordsByPhoneNumber(phoneNumber)));
    }
}
