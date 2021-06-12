<%--
  Created by IntelliJ IDEA.
  User: Richard Lv
  Date: 2021/4/10
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Repay</title>

    <style type="text/css">
        /*初始化属性*/
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        body{
            background-image: url("../images/bg7.jpg");
            background-repeat: no-repeat;
            background-size: 100%;
        }

        .mainPart{
            width: 1000px;
            height: 500px;
            border: 4px solid #ebe5ff;
            margin: 90px auto auto;
        }

        .explain{
            float: left;
        }

        /*设置第一个P标签*/
        .explain p:first-child{
            color: #ff956e;
            font-size: 25px;
            margin-left: 10px;
            margin-top: 10px;
        }

        /*设置最后一个P标签*/
        .explain p:last-child{
            margin-left: 10px;
        }

        .tableArea{
            float: left;
            width:500px;
            height:400px;
            margin-left: 70px;
            margin-top: 50px;
        }
        /*设置图片*/
        #picture{
            position: absolute;
            z-index: -1;
            opacity: 0.5;
            width: 995px;
            height:495px;
        }

        .rightTip{
            float: right;
        }
        .rightTip a{
            color: #ff94d7;
            text-decoration: none;
        }
        .rightTip a:hover{
            color: #ff3b31;
        }


        /*中间的div的表单区域设置*/
        .tableData{
            width: 400px;
            height: 350px;
            margin: auto;
        }
        /*设置fieldset*/
        fieldset{
            height: 396px;
        }
        /*设置表格*/
        .dataTableLeft{
            width: 80px;
            text-align: right;
        }
        .dataTableRight{
            padding-left: 20px;
        }

        /*设置输入框*/
        #borrower,#password,#cardNumber{
            border: 1px solid rgba(203,197,198,0.03);
            border-radius: 5px;
            height: 27px;
            width:235px;
            padding-left: 5px;
        }

        /*设置提交按钮*/
        #sub{
            width: 120px;
            height: 40px;
            background: #d4af7a;
            border: 1px solid #faf7f7;
            border-radius: 10px;
            color: #deebff;
        }
        .subTd{
            text-align: center;
        }

    </style>
</head>

<body>

<script>

    function repayLoan() {
        var cn = document.getElementById("cardNumber").value;
        var pw = document.getElementById("password").value;
        $.ajax({
            url: "/loan/getBalance",
            data: {"cardNumber": cn, "payPassword": pw},
            dataType: "json",
            success: function (data) {
                data = JSON.parse(data);
                if(data.balance == "null") {
                    alert("Wrong card info!");
                }
                else {
                    $.ajax({
                        url: "/loan/getAmount",
                        data: {"phoneNumber": getCookie("phoneNumber")},
                        dataType: "json",
                        success: function (ret) {
                            ret = JSON.parse(ret);
                            if(ret.amount > data.balance) {
                                alert("Card balance is not enough!")
                            }
                            else {
                                $.ajax({
                                    url: "/loan/repay",
                                    data: {"phoneNumber": getCookie("phoneNumber"), "amount": ret.amount, "cardNumber": cn, "payPassword": pw},
                                    dataType: "json",
                                    success: function (fin) {
                                        fin = JSON.parse(fin);
                                        if(fin.cnt == 1) {
                                            alert("Success to repay!");
                                        }
                                        else {
                                            alert("Fail to repay!");
                                        }
                                        $("#cardNumber").val("");
                                        $("#password").val("");
                                    }
                                })
                            }
                        }
                    })
                }
            },
            error: function () {
                alert("Wrong card info!")
            }
        })
    }

    window.onload = function () {
        var lr = document.getElementById("loanAmount");
        lr.innerHTML="";
        console.log(getCookie("phoneNumber"));
        $.ajax({
            url: "/loan/getAmount",
            data: {"phoneNumber": getCookie("phoneNumber")},
            dataType: "json",
            success: function (data) {
                data = JSON.parse(data);
                console.log(data);
                lr.innerHTML = "You should repay " + data.amount;
            },
            error: function () {
                lr.innerHTML = "There is no loan record for " + getCookie("phoneNumber");
            }
        })
    }

    function getCookie(key) {
        var array = document.cookie.split(";");
        var kv = array[0].split("=");
        if(key == kv[0]) {
            return kv[1];
        }
        return "";
    }
</script>

<div class="mainPart">
    <div class="explain">
        <p>Repay</p>
    </div>

    <div class="tableArea">



        <fieldset>
            <strong>Repay</strong>
            <span id="loanAmount"></span>
            <table class="tableData" id="tbl">
                <div id="table">

                    <tr>
                        <td class="dataTableLeft"><label><b>Card Number</b></label></td>
                        <td  class="dataTableRight">
                            <input type="text" placeholder="" id="cardNumber" pattern="[0-9]{8}"
                                   name="cardNumber" required="required">

                        </td>
                    </tr>

                    <tr>
                        <td class="dataTableLeft"><label><b>Payment Password</b></label></td>
                        <td  class="dataTableRight">
                            <input type="password" placeholder="" id="password"
                                   name="payPassword" required="required">

                        </td>
                    </tr>

                    <tr>
                        <td  class="subTd" colspan="2">
                            <input type="submit" value="submit" id="sub" onclick="repayLoan()">
                        </td>
                        <td class="subTd" colspan="2">

                        </td>
                    </tr>
                </div>
            </table>
        </fieldset>

    </div>

    <div class="rightTip">
        <a href="../views/loan.jsp"> <button  style="background: #d4af7a;
    text-transform: uppercase;
    text-decoration: none;
    border-radius: 100px;
    font-size: 20px;">←Go Back</button></a>
    </div>


</div>

<script src="../js/jquery-3.6.0.min.js"></script>
</body>
</html>

