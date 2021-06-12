<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tiandi Bank</title>

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
        #name,#idNum,#birthd {
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
<div class="mainPart">
    <div class="explain">
        <strong>Change the account information.</strong>
        <p></p>
    </div>

    <div class="tableArea">

        <form id="table">

            <fieldset>
                <strong>Change the account information.</strong>
                <table class="tableData">

                    <tr>

                        <td class="dataTableLeft"><label><b>name</b></label></td>
                        <td class="dataTableRight"><input type="text" placeholder="please enter your name" id="name"
                                                          name="name" min="2" max="8"></td>
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
                        <td><label><b></b></label></td>
                    </tr>

                    <tr>
                        <td class="dataTableLeft"><label><b>id number</b></label></td>
                        <td  class="dataTableRight"><input type="text" placeholder="length should be 18" id="idNum"
                                                           name="idNumber" min="18" max="18" onblur="checkIdNum()">

                        </td>

                    </tr>


                    <tr>
                        <td  class="subTd" colspan="2">
                            <button type="submit" id="sub" onclick="updateInfo()">submit</button>
                        </td>
                    </tr>

                </table>
            </fieldset>
        </form>
    </div>


    <div class="rightTip">
        <a href="../views/framework.jsp"> <button style="
                                   position: relative;
                                   top: 10px;
                                   left: 0px;
                                   width: 120px;
                                   height: 40px;
                                   background: #d4af7a;
                                   text-transform: uppercase;
                                   text-decoration: none;
                                   border-radius: 100px;
                                   font-size: 20px;">←Go Back</button></a>
    </div>


</div>

<script>
    var d;
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

    window.onload = function () {
        $.ajax({
            url: "/ui/getInfo",
            dataType: "json",
            type: "post",
            success: function (data) {
                data = JSON.parse(data);
                d = data;
                var day = d.birthday;
                console.log(JSON.stringify(d));
                document.getElementById("name").setAttribute("placeholder",data.name);
                document.getElementById("idNum").setAttribute("placeholder",data.idNumber);
                document.getElementById("birthd").value = day;
            }
        })
    }
    function updateInfo() {
        var name = document.getElementById("name").value;
        var sex = $("input[name='sex']:checked").val();
        var bd = document.getElementById("birthd").value;
        bd = new Date(Date.parse(bd.replace(/-/g, "/")));
        var idNumber = document.getElementById("idNum").value;
        if(name != null && name != '') d.name = name;
        if(sex != null && sex != '') d.sex = sex;
        if(bd != null) d.birthday = bd;
        if(idNumber != null && idNumber != '' && idNumber.length == 18) d.idNumber = idNumber;
        console.log(d);
        $.ajax({
            url: "/ui/updateInfo",
            data: {"string": JSON.stringify(d)},
            dataType: "json",
            type: "post",
            success: function (flag) {
                flag = JSON.parse(flag);
                console.log(flag);
                // if(flag.update == "true") {
                //     alert("Success to update your information!");
                //     return true;
                // }
                // else alert("Fail to update, please try again!")
                // return false;
            }
        })
    }
</script>
<script src="../js/jquery-3.6.0.min.js"></script>
</body>
</html>
