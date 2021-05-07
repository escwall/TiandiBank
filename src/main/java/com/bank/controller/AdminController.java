package com.bank.controller;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bank.entity.Admin;
import com.bank.entity.CardUser;
import com.bank.entity.UserInformation;
import com.bank.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    public String login(Admin admin) {
        if(adminService.login(admin)) {
            return "adminInfo";
        }
        else return "Admin";
    }

    @RequestMapping("/logout")
    public String logOut() {
        return "Admin";
    }

    @RequestMapping("showAllAccounts")
    @ResponseBody
    public JSONArray showAllAccounts() {
        JSONArray array = JSONArray.parseArray(JSON.toJSONString(adminService.showAllAccounts()));
        System.out.println(array);
        return array;
    }

    @RequestMapping("showActivatedAccounts")
    @ResponseBody
    public JSONArray showActivatedAccounts() {
        JSONArray array = JSONArray.parseArray(JSON.toJSONString(adminService.showActivatedAccounts()));
        System.out.println(array);
        return array;
    }

    @RequestMapping("showFrozenAccounts")
    @ResponseBody
    public JSONArray showFrozenAccounts() {
        JSONArray array = JSONArray.parseArray(JSON.toJSONString(adminService.showFrozenAccounts()));
        System.out.println(array);
        return array;
    }

    @RequestMapping("changeState")
    @ResponseBody
    public String changeState(String cardNumber) {
        String state = adminService.setState(cardNumber);
        System.out.println(state);
        return "{\"state\":"+state+"}";
    }

    @RequestMapping("delete")
    @ResponseBody
    public void delete(String cardNumber) {
        adminService.delete(cardNumber);
    }

    @RequestMapping("changeRate")
    public String changeRate(Double interestRate) {
        adminService.changeRate(interestRate);
        return "adminInfo";
    }

    @RequestMapping("getRate")
    @ResponseBody
    public String getRate() {
        Double rate = adminService.getRate();
        return "{\"iRate\":"+rate.toString()+"}";
    }

    @RequestMapping("showCard")
    @ResponseBody
    public JSONArray showCard(String phoneNumber) {
        return JSONArray.parseArray(JSON.toJSONString(adminService.showCard(phoneNumber)));
    }
}
