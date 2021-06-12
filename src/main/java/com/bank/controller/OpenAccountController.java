package com.bank.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bank.entity.UserInformation;
import com.bank.service.OpenAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("ui")
@SessionAttributes("phoneNumber")
public class OpenAccountController {
    @Autowired
    private OpenAccountService openAccountService;

    @RequestMapping("openAccount")
    public String openAccount(UserInformation userInformation, HttpSession session) {
        String s = (String) session.getAttribute("phoneNumber");
        System.out.println(s);
        userInformation.setPhoneNumber(s);
        System.out.println(userInformation.getPhoneNumber());
        if(openAccountService.openAccount(userInformation)) {
            System.out.println("开户成功");
            return "framework";
        }
        else {
            System.out.println("开户失败");
            return "openAccount";
        }
    }

    @RequestMapping("checkIdNum")
    @ResponseBody
    public String checkIdNum(String idNumber) {
        if(openAccountService.checkIdNum(idNumber) == null)
            return "{\"exist\":\"false\"}";
        else return "{\"exist\":\"true\"}";
    }

    @RequestMapping("getInfo")
    @ResponseBody
    public String getInfo(HttpSession session) {
        String s = (String) session.getAttribute("phoneNumber");
        return JSON.toJSONString(openAccountService.getInfo(s));
    }

    @RequestMapping("updateInfo")
    @ResponseBody
    public String updateInfo(String string) {
        UserInformation userInformation = JSONObject.parseObject(string, UserInformation.class);
        System.out.println("update: " + userInformation);
        if(openAccountService.updateInfo(userInformation) > 0) {
            return "{\"update\":\"true\"}";
        }
        else return "{\"update\":\"false\"}";
    }
}
