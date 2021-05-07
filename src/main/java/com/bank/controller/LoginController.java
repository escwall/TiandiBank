package com.bank.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bank.entity.Login;
import com.bank.service.AdminService;
import com.bank.service.LoginService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/lg")
@SessionAttributes("phoneNumber")
public class LoginController {
    @Autowired
    private LoginService loginService;


    /**
     * 用户注册
     * @param user
     * @return
     */
    @RequestMapping("/register")
    public String insert(Login user, Model model) {
        // 调用注入的 usersService 调用 insertUsers 方法
        try {
            loginService.insertUser(user);
        }catch (DuplicateKeyException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            return "../index";
        }
        model.addAttribute("phoneNumber",user.getPhoneNumber());
        return "openAccount";
    }


    /**
     * 用户登录
     * @param user
     * @return
     */
    @RequestMapping("/login")
    public String login(Login user, Model model) {
        // 调用注入的 usersService 调用 login 方法
        model.addAttribute("phoneNumber",user.getPhoneNumber());
        if(loginService.checkAccount(user.getPhoneNumber()) == null)
            return "openAccount";
        if(loginService.login(user)) {
            return "mainPage";
        }
        else {
            return "../index";
        }

    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "../index";
    }

    @RequestMapping(value = "/check",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String check(String phoneNumber) {
        if(loginService.check(phoneNumber) != null) {
            return "{\"s\":\"false\"}";
        }
        return "{\"s\":\"true\"}";
    }
    @RequestMapping("ckLogin")
    @ResponseBody
    public String ckLogin(Login login) {
        if(loginService.login(login)) return "{\"ck\":\"true\"}";
        else return "{\"ck\":\"false\"}";
    }
    
}
