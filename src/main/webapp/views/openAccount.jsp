<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>opening a new account</title>

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
            margin-left: 250px;
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
        #name,#phoneNumber,#birthday,#payPassword,#idNumber{
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
<div class="mainPart">
    <div class="explain">
        <strong>Improve the information to open an account.</strong>
        <p>NEW ACCOUNT</p>
    </div>

    <div class="tableArea">

        <form method="post" action="/ui/openAccount" id="table">

            <fieldset>
                <strong>open a new account</strong>
                <table class="tableData">

                    <tr>

                        <td class="dataTableLeft"><label><b>name</b></label></td>
                        <td class="dataTableRight"><input type="text" placeholder="please enter your name"
                                                          name="name" required="required" min="2" max="8"></td>
                    </tr>


                    <tr>
                        <td class="dataTableLeft"><label><b>gender</b></label></td>
                        <td class="dataTableRight">

                            <input type="radio" value="male"  name="sex"><samp class="sex">male</samp>
                            <input type="radio" value="female" name="sex"><samp class="sex">female</samp>

                        </td>

                    </tr>

                    <tr>

                        <td class="dataTableLeft"><label><b>birthday</b></label></td>
                        <td class="dataTableRight"><input type="date" name="birthday" id="birthd" value=<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>></td>
                        <td><label><b>(default value is today)</b></label></td>
                    </tr>

                    <tr>
                        <td class="dataTableLeft"><label><b>id number</b></label></td>
                        <td  class="dataTableRight"><input type="text" placeholder="length should be 18" id="idNum" pattern="[0-9]{17}[0-9|X]"
                                                           name="idNumber" required="required" min="18" max="18" onblur="checkIdNum()">

                        </td>

                    </tr>

                    <tr>

                        <td class="dataTableLeft"><label><b>pay password</b></label></td>
                        <td class="dataTableRight"><input type="password" placeholder="please enter your password"
                                                          name="payPassword" required="required"></td>

                    </tr>

                    <tr>
                        <td  class="subTd" colspan="2">
                            <input type="submit" value="submit" id="sub">
                        </td>
                    </tr>

                </table>
            </fieldset>
        </form>
    </div>


    <div class="rightTip">
        <a href="../index.jsp"> <button>←Go Back</button></a>
    </div>


</div>

<script>
    function checkIdNum() {
        var idNum = document.getElementById("idNum").value;
        console.log(document.getElementById("birthd").value);
        $.ajax({
            url:"/ui/checkIdNum",
            data:{"idNumber":idNum},
            dataType:"json",
            success:function (data) {
                data=JSON.parse(data);
                if(data.exist == "true") {
                    alert("Id number is used!");
                    document.getElementById("table").reset();
                }
            }
        })
    }
</script>
<script src="../js/jquery-3.6.0.min.js"></script>
</body>
</html>
