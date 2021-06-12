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
    <title>Loan</title>

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
        #borrower,#amount,#pw{
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
    function checkAmount() {
        var amount = $("#amount")[0].value;
        if (Math.floor(amount) == amount) {
            if (amount < 10000 || amount > 500000) {
                alert("Loan amount must be greater than 10k and less than 500k!")
                $("#amount").val("");
                return false;
            }
        } else {
            alert("Loan amount must be an integer!");
            $("#amount").val("");
        }
    }

    function insertRecords() {
        var borrower = document.getElementById("borrower").value;
        var pw = document.getElementById("pw").value;
        $.ajax({
            url:"/lg/ckLogin",
            data:{"phoneNumber":borrower, "loginPassword":pw},
            type: "post",
            dataType:"json",
            success:function (data) {
                data = JSON.parse(data);
                if(data.ck == "false") {
                    alert("Wrong borrower info, please check again!");
                    $("#borrower").val("")
                    $("#amount").val("")
                    $("#pw").val("")
                }
                else {
                    var pn = document.getElementById("borrower").value;
                    $.ajax({
                        url:"/loan/check",
                        data: {"phoneNumber": pn},
                        success: function (data) {
                            data = JSON.parse(data);
                            console.log(data);
                            if(data.cnt == 1) {
                                alert("There is a loan you haven't repaid yet!")
                            }
                            else {
                                $.ajax({
                                    url: "/loan/insert",
                                    data: {"phoneNumber": pn, "amount": document.getElementById("amount").value},
                                    success: function (ret) {
                                        ret = JSON.parse(ret);
                                        if(ret.cnt == 1) {
                                            alert("Success to loan")
                                        }
                                        else {
                                            alert("Fail to loan!")
                                        }
                                    }
                                })
                            }
                        }
                    })
                }
            }
        })
        document.getElementById("table").reset();
    }

    window.onload = function () {
        var lr = document.getElementById("loanRate");
        lr.innerHTML="";
        $.ajax({
            url: "/lg/getLoanRate",
            dataType: "json",
            success: function (data) {
                data = JSON.parse(data);
                lr.innerHTML = " \nThe annual loan rate is " + data.rate*100 + "%";
            }
        })
    }
</script>

<div class="mainPart">
    <div class="explain">
        <p>Loan</p>
    </div>

    <div class="tableArea">



        <fieldset>
            <strong>Loan</strong>
            <span id="loanRate"></span>
            <table class="tableData" id="tbl">
                <div id="table">
                    <tr>
                        <td class="dataTableLeft"><label><b>Borrower PhoneNumber</b></label></td>
                        <td  class="dataTableRight">
                            <input type="text" placeholder="" id="borrower" pattern="[0-9]+"
                                   name="phoneNumber" required="required">

                        </td>
                        <span id="sendInfo" style="color: red"></span>
                    </tr>

                    <tr>
                        <td class="dataTableLeft"><label><b>Borrower Password</b></label></td>
                        <td  class="dataTableRight">
                            <input type="password" placeholder="" id="pw"
                                   name="loginPassword" required="required">

                        </td>
                    </tr>

                    <tr>
                        <td class="dataTableLeft"><label><b>Loan Amount</b></label></td>
                        <td  class="dataTableRight">
                            <input type="number" placeholder="" id="amount" step="10000" min="10000" max="500000"
                                   name="amount" required="required" onblur="checkAmount()">

                        </td>
                    </tr>

                    <tr>
                        <td  class="subTd" colspan="2">
                            <input type="submit" value="submit" id="sub" onclick="insertRecords()">
                        </td>
                        <td class="subTd" colspan="2">

                        </td>
                    </tr>
                </div>
            </table>
        </fieldset>

    </div>

    <div class="rightTip">
        <a href="../views/framework.jsp" > <button style="background: #d4af7a;
    text-transform: uppercase;
    text-decoration: none;
    border-radius: 100px;
    font-size: 20px;">←Go Back</button></a>
        <a href="../views/repay.jsp"><button  style="background: #d4af7a;
    text-transform: uppercase;
    text-decoration: none;
    border-radius: 100px;
    font-size: 20px;">Repay the loan</button></a>
    </div>


</div>

<script src="../js/jquery-3.6.0.min.js"></script>
</body>
</html>

