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
    <title>Transfer ${loginName}</title>

    <style type="text/css">
        /*初始化属性*/
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        body{
            background-image: url("../images/register.jpg");
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
        #receNum,#amount,#receName,#pw,#sendNum,#sendName{
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
            background-color: rgba(84,83,87,0.11);
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
    function checkSend() {
        var sendNum = document.getElementById("sendNum").value;
        $.ajax({
            url:"/transfer/checkState",
            data:{"cardNumber":sendNum},
            dataType:"json",
            success:function (data) {
                var sp = document.getElementById("sendInfo");
                var rp = document.getElementById("receInfo");
                data = JSON.parse(data);
                if(data.cardNumber == "null") {
                    sp.innerHTML="";
                    rp.innerHTML="";
                    sp.innerHTML="sender doesn't exist, please check again"
                    $("#sendNum").val("");
                }
                else if(data.cardNumber == "frozen") {
                    sp.innerHTML="";
                    rp.innerHTML="";
                    sp.innerHTML="sender is frozen, please check again"
                    $("#sendNum").val("");
                }
                else {
                    sp.innerHTML="";
                    rp.innerHTML="";
                }
            }
        })
    }
    function checkRece() {
        var receNum = document.getElementById("receNum").value;
        $.ajax({
            url:"/transfer/checkState",
            data:{"cardNumber":receNum},
            dataType:"json",
            success:function (data) {
                var rp = document.getElementById("receInfo");
                var sp = document.getElementById("sendInfo");
                data = JSON.parse(data);
                // console.log(data);
                if(data.cardNumber == "null") {
                    sp.innerHTML="";
                    rp.innerHTML="";
                    rp.innerHTML="receiver doesn't exist, please check again"
                    $("#receNum").val("");
                }
                else if(data.cardNumber == "frozen") {
                    sp.innerHTML="";
                    rp.innerHTML="";
                    rp.innerHTML="receiver is frozen, please check again"
                    $("#receNum").val("");
                }
                else {
                    sp.innerHTML="";
                    rp.innerHTML="";
                }
            }
        })
    }

    function insertRecords() {
        var info = {"senderCardNumber":$("#sendNum")[0].value,"senderName":$("#sendName")[0].value,"type":"transfer","receiverCardNumber":$("#receNum")[0].value,"receiverName":$("#receName")[0].value,"time":new Date().getTime(),"amount":$("#amount")[0].value};
        var info1 = {"senderCardNumber":$("#sendNum")[0].value,"pw":$("#pw")[0].value,"receiverCardNumber":$("#receNum")[0].value,"receiverName":$("#receName")[0].value,"amount":$("#amount")[0].value};
        $.ajax({
            url: "/transfer/tf",
            type: "post",
            data:{"info1":JSON.stringify(info1)},
            dataType:"json",
            success: function (data1) {
                data1 = JSON.parse(data1);
                console.log(data1);
                if (data1.state == "true") {
                    $.ajax({
                        url: "/tradeRecord/insertRecord",
                        data: {"info": JSON.stringify(info)},
                        dataType: "text",
                        success: function (data) {
                            console.log(data);
                            alert("The transfer was successful!")
                        }

                    })
                } else alert("The transfer was failed! Maybe caused by wrong payment password or insufficient balance.");
            },
            error: function () {
                alert("The transfer was failed! Check receiver information!");
            }
        })
        $("#sendNum").val("");
        $("#sendName").val("");
        $("#receName").val("");
        $("#receNum").val("");
        $("#amount").val("");
        $("#pw").val("");

    }

    function checkAmount() {
        if ($("#amount")[0].value < 0.01) {
            alert("Amount must be greater than 0.01!")
            $("#amount").val("");
            return false;
        }
        return true;
    }

</script>

<div class="mainPart">
    <div class="explain">
        <p>Transfer</p>
    </div>

    <div class="tableArea">



            <fieldset>
                <strong>Transfer</strong>
                <table class="tableData">
                    <div id="table">
                    <tr>
                        <td class="dataTableLeft"><label><b>Sender CardNumber</b></label></td>
                        <td  class="dataTableRight">
                            <input type="text" placeholder="" id="sendNum" pattern="[0-9]+"
                                   name="senderCardNumber" required="required" onblur="checkSend()">

                        </td>
                        <span id="sendInfo" style="color: red"></span>
                    </tr>

                    <tr>
                        <td class="dataTableLeft"><label><b>Sender Name</b></label></td>
                        <td  class="dataTableRight">
                            <input type="text" placeholder="" id="sendName"
                                   name="senderName" required="required">

                        </td>
                    </tr>

                    <tr>
                        <td class="dataTableLeft"><label><b>Pay Password</b></label></td>
                        <td  class="dataTableRight">
                            <input type="password" placeholder="" id="pw"
                                   name="pw" required="required">

                        </td>
                    </tr>

                    <tr>
                        <td class="dataTableLeft"><label><b>Receiver Name</b></label></td>
                        <td  class="dataTableRight">
                            <input type="text" placeholder="" id="receName"
                                   name="receiverName" required="required" min="2" max="8">

                        </td>
                    </tr>


                    <tr>

                        <td class="dataTableLeft"><label><b>Receiver CardNumber</b></label></td>
                        <td class="dataTableRight"><input type="text" placeholder="" id="receNum" pattern="[0-9]+"
                                                          name="receiverCardNumber" required="required" onblur="checkRece()"></td>
                        <span id="receInfo" style="color: red"></span>
                    </tr>


                    <tr>

                        <td class="dataTableLeft"><label><b>Transfer Amount</b></label></td>
                        <td class="dataTableRight"><input type="number" placeholder="" step="0.01" id="amount" min="0.01"
                                                          name="amount" required="required" onblur="checkAmount()"></td>
                    </tr>

                    <tr>
                        <td  class="subTd" colspan="2">
                            <input type="submit" value="submit" id="sub" onclick="insertRecords()">
                        </td>
                    </tr>
                    </div>
                </table>
            </fieldset>

    </div>

    <div class="rightTip">
        <a href="/views/mainPage.jsp"> <button>←Go Back</button></a>

    </div>


</div>

<script src="../js/jquery-3.6.0.min.js"></script>
</body>
</html>

