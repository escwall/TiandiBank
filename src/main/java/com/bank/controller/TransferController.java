package com.bank.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bank.service.AdminService;
import com.bank.service.TransferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

@Controller
@RequestMapping("/transfer")
public class TransferController {
    @Autowired
    TransferService transferService;


    @RequestMapping("/tf")
    @ResponseBody
    public String transfer(@RequestParam String info1) {
        JSONObject object = JSONObject.parseObject(info1);
        if(transferService.Transfer(object.getString("senderCardNumber"),object.getString("pw"),object.getString("receiverCardNumber"),object.getString("receiverName"),Double.valueOf(object.getString("amount"))) == "1") {
            return "{\"state\":\"true\"}";
        }
        return "{\"state\":\"false\"}";
    }

    @RequestMapping("checkState")
    @ResponseBody
    public String checkState(String cardNumber) {
        System.out.println(transferService.getState(cardNumber));
        return "{\"cardNumber\":\""+transferService.getState(cardNumber)+"\"}";
    }
}
