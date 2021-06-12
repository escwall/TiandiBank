<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
    <meta name="renderer" content="webkit">
    <!--国产浏览器高速模式-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="穷在闹市" />
    <!-- 作者 -->
    <meta name="revised" content="穷在闹市.v3, 2019/05/01" />
    <!-- 定义页面的最新版本 -->
    <meta name="description" content="网站简介" />
    <!-- 网站简介 -->
    <meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
    <title>Tiandi Bank</title>

    <!-- 公共样式 开始 -->
    <script src="../js/script.js"></script>
    <script type="text/javascript" src="../framework/jquery-1.11.3.min.js"></script>
    <script src="../bootstrap-3.4.1-dist/js/bootstrap.js"></script>
    <link href="../bootstrap-3.4.1-dist/css/bootstrap-theme.css?v=<%= System.currentTimeMillis()%>" rel="stylesheet" />
    <link href="../bootstrap-3.4.1-dist/css/bootstrap.css?v=<%= System.currentTimeMillis()%>" rel="stylesheet" />
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.js"></script>
    <!-- Latest compiled and minified Locales -->
<%--    <script src="https://unpkg.com/bootstrap-table@1.18.3/dist/locale/bootstrap-table-zh-CN.min.js"></script>--%>
    <link rel="shortcut icon" href="../images/favicon.ico?v=<%= System.currentTimeMillis()%>" />
    <link rel="bookmark" href="../images/favicon.ico?v=<%= System.currentTimeMillis()%>" />
    <link rel="stylesheet" type="text/css" href="../css/base.css?v=<%= System.currentTimeMillis()%>">
    <link rel="stylesheet" type="text/css" href="../css/iconfont.css?v=<%= System.currentTimeMillis()%>">
    <link rel="stylesheet" type="text/css" href="../layui/css/layui.css?v=<%= System.currentTimeMillis()%>">
    <!--[if lt IE 9]>
    <script src="../framework/html5shiv.min.js"></script>
    <script src="../framework/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="../layui/layui.js"></script>
    <!-- 滚动条插件 -->
    <link rel="stylesheet" type="text/css" href="../css/jquery.mCustomScrollbar.css?v=<%= System.currentTimeMillis()%>">
    <script src="../framework/jquery-ui-1.10.4.min.js"></script>
    <script src="../framework/jquery.mousewheel.min.js"></script>
    <script src="../framework/jquery.mCustomScrollbar.min.js"></script>
    <script src="../framework/cframe.js"></script>
    <!-- 仅供所有子页面使用 -->
    <!-- 公共样式 结束 -->

    <link rel="stylesheet" type="text/css" href="../css/frameStyle.css?v=<%= System.currentTimeMillis()%>">
    <script type="text/javascript" src="../framework/frame.js"></script>
    <script src="../js/page.js"></script>
    <link rel="stylesheet" href="../css/style3.css?v=<%= System.currentTimeMillis()%>"/>
    <style>
        .close
        {
            background: transparent;
            position: absolute;
            border: none;
            outline: none;
            top: 500px;
            left: 650px;
            color: #fff;
            background: #0098CA;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }
        .changePW {
            top: 150px;
            left: 350px;
            position: absolute;
            display: none;
        }
        .confirmbtn
        {
            background: transparent;
            position: absolute;
            border: none;
            outline: none;
            top: 250px;
            left: 100px;
            color: #fff;
            background: #0098CA;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }
    </style>

</head>

<body>
<!-- 左侧菜单 - 开始 -->
<div class="frameMenu">
    <div class="logo">
        <img src="../images/logo.png" />
        <div class="logoText">
            <h1>Tiandi Bank</h1>
            <p>Enjoy your life!</p>
        </div>
    </div>
    <div class="menu">
        <ul>
            <li>
                <a class="menuFA" href="../views/loan.jsp"><i class="iconfont icon-huojian left"></i>loan</a>
            </li>
            <li>
                <a class="menuFA" href="../views/transfer.jsp"><i class="iconfont icon-huojian left"></i>transfer</a>
            </li>

            <li>
                <a class="menuFA" href="../views/cardInfo.jsp"><i class="iconfont icon-zhishi left"></i>check cards</a>
            </li>
            <li>
                <a class="menuFA" href="../views/updateInfo.jsp"><i class="iconfont icon-zhishi left"></i>My Information</a>
            </li>
            <li>
                <a class="menuFA" onclick="showChangePassword()"><i class="iconfont icon-huojian left"></i>change the password</a>
            </li>
            <li>
                <a class="menuFA" href="javascript:" onclick="showRate()"><i class="iconfont icon-shangpin left"></i>check interest rate<i class="iconfont icon-dajiantouyou right"></i></a>
            </li>
            <li>
                <a class="menuFA" href="javascript:" onclick="showRecords()"><i class="iconfont icon-liuliangyunpingtaitubiao03 left"></i>show trade records<i class="iconfont icon-dajiantouyou right"></i></a>
            </li>
        </ul>
    </div>
</div>
<!-- 左侧菜单 - 结束 -->

<div class="main">
    <!-- 头部栏 - 开始 -->
    <div class="frameTop">
        <img class="jt" src="../images/top_jt.png" />
        <div class="topMenu">
            <ul>
                <li><a href="javascript:"><i class="iconfont icon-yonghu1"></i>HELLO, customer ${sessionScope.phoneNumber} </a></li>
                <form action="/lg/logout">
                    <button class="iconfont icon-084tuichu" onclick="clearCookie()">Log out</button>
                </form>
<%--                <li><a href="#"><i class="iconfont icon-084tuichu"></i>Log out</a></li>--%>

            </ul>
        </div>
    </div>
    <!-- 头部栏 - 结束 -->

    <!-- 核心区域 - 开始 -->
    <div class="frameMain">
        <div class="title" id="frameMainTitle">
            <span><i class="iconfont icon-xianshiqi"></i>Tiandi Bank</span>
        </div>
        <div class="bg">
<%--            <div id="table" style="display: none">--%>
<%--                <table id="tb2" class="tb">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th>No.</th>--%>
<%--                        <th>Sender Card</th>--%>
<%--                        <th>Sender Name</th>--%>
<%--                        <th>Receiver Card</th>--%>
<%--                        <th>Receiver Name</th>--%>
<%--                        <th>Amount</th>--%>
<%--                        <th>Type</th>--%>
<%--                        <th>Time</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>

<%--                    </tbody>--%>
<%--                </table>--%>
<%--                <button onclick="closeRecords()" class="close">close</button>--%>
<%--            </div>--%>
            <table id="tradeRecords" class="table table-hover" style="display: none"></table>

            <div id="changePW" style="display: none" class="pw">
                <table class="tb" id="cpw">
                    <tr>
                        <td>Old password: </td>
                        <td><input type="password" placeholder="" name="old" id="old" required="required"></td>
                    </tr>
                    <tr>
                        <td>New password: </td>
                        <td><input type="password" name="new" id="new" required="required"></td>
                    </tr>
                    <tr>
                        <td>New once again: </td>
                        <td><input type="password" name="newAgain" id="newAgain" onblur="checkNewPw()" required="required"></td>
                    </tr>
                    <tr>
                        <td><input type="submit" class="confirmbtn" value="Confirm" onclick="changePassword()"></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <!-- 核心区域 - 结束 -->



</div>

<script>
    //生成用户数据

</script>

<script>
    window.onload = function () {
        document.cookie = "phoneNumber=" + ${sessionScope.phoneNumber};
    }
    function setCookie(cname, cvalue, exdays) {

        var d = new Date();

        d.setTime(d.getTime() + (exdays*24*60*60*1000));

        var expires = "expires="+d.toUTCString();

        document.cookie = cname + "=" + cvalue + "; " + expires;

    }
    function clearCookie() {
        setCookie("phoneNumber", "", -1);
    }
    function showRate() {
        $.ajax({
            url: "/admin/getRate",
            dataType: "json",
            success: function (data) {
                data = JSON.parse(data);
                alert("The annual interest rate is " + data.iRate * 100 + "% currently");
            }
        })
    }
    function show() {
        document.getElementById("tb2").style.display = 'block';
    }
    function time(time = +new Date()) {
        var date = new Date(time + 8 * 3600 * 1000); // 增加8小时
        return date.toJSON().substr(0, 19).replace('T', ' ');
    }

    function showRecords() {
        $("#tradeRecords").bootstrapTable('destroy');
        $('#tradeRecords').bootstrapTable({
            method: 'post',
            contentType: "application/x-www-form-urlencoded",//必须要有！！！！
            url: "/tradeRecord/getRecordsByCardNumber",//要请求数据的文件路径
            striped: true, //是否显示行间隔色
            //bootstrap table 可以前端分页也可以后端分页，这里
            //我们使用的是后端分页，后端分页时需返回含有total：总记录数,这个键值好像是固定的
            //rows： 记录集合 键值可以修改  dataField 自己定义成自己想要的就好
            dataField: "count",
            totalField: "data",
            pageNumber: 1, //初始化加载第一页，默认第一页
            pagination: true,//是否分页
            queryParamsType: 'limit',//查询参数组织方式
            queryParams: function (params) {
                var temp = {
                    phoneNumber : ${sessionScope.phoneNumber}
                };
                return temp;
            },//请求服务器时所传的参数
            sidePagination: 'client',//指定服务器端分页
            pageSize: 5,//单页记录数
            showRefresh: true,//刷新按钮
            showColumns: true,
            paginationHAlign: 'center',
            paginationDetailHAlign: 'left',
            clickToSelect: true,//是否启用点击选中行
            toolbarAlign: 'right',
            buttonsAlign: 'right',//按钮对齐方式
            columns: [
                {
                    title: 'sender card',
                    field: 'senderCardNumber',
                    //复选框
                    align: 'center'
                },
                {
                    title: 'sender name',
                    field: 'senderName',
                    align: 'center'
                },
                {
                    title: 'receiver card',
                    field: 'receiverCardNumber',
                    align: 'center'
                },
                {
                    title: 'receiver name',
                    field: 'receiverName',
                    align: 'center'
                },
                {
                    title: 'amount',
                    field: 'amount',
                    align: 'center',
                    sortable: true,
                },
                {
                    title: 'type',
                    field: 'type',
                    align: 'center',
                    sortable: true,
                },
                {
                    title: 'time',
                    field: 'time',
                    sortable: true,
                    align: 'center'
                },
            ],
            locale: 'zh-CN'//中文支持,
        });
        document.getElementById("tradeRecords").style.display = "block";
        document.getElementById("changePW").style.display = "none";
    }
    <%--function showRecords(queryPage) {--%>
    <%--    document.getElementById("table").style.display="block";--%>
    <%--    document.getElementById("changePW").style.display="none";--%>
    <%--    var pNode = document.getElementById("tb2");--%>
    <%--    var tbody = document.getElementsByTagName("tbody")[0];--%>
    <%--    if(tbody)--%>
    <%--        pNode.removeChild(tbody);--%>
    <%--    var queryPage = queryPage||1;--%>
    <%--    $.ajax({--%>
    <%--        url:"/tradeRecord/getRecordsByCardNumber",--%>
    <%--        data:{"phoneNumber":${sessionScope.phoneNumber}},--%>
    <%--        dataType:"json",--%>
    <%--        success:function (data) {--%>
    <%--            console.log("reach")--%>
    <%--            var j = 1;--%>
    <%--            var tb = document.createElement('tbody');--%>
    <%--            pNode.appendChild(tb);--%>
    <%--            for (var i in data) {--%>
    <%--                var tr = document.createElement('tr');--%>
    <%--                tb.appendChild(tr);--%>
    <%--                var td1 = document.createElement('td');--%>
    <%--                td1.innerHTML = j.toString();--%>
    <%--                j++;--%>
    <%--                var td2 = document.createElement('td');--%>
    <%--                td2.innerHTML = data[i].senderCardNumber;--%>
    <%--                var td3 = document.createElement('td');--%>
    <%--                td3.innerHTML = data[i].senderName;--%>
    <%--                var td4 = document.createElement('td');--%>
    <%--                td4.innerHTML = data[i].receiverCardNumber;--%>
    <%--                var td5 = document.createElement('td');--%>
    <%--                td5.innerHTML = data[i].receiverName;--%>
    <%--                var td6 = document.createElement('td');--%>
    <%--                td6.innerHTML = data[i].amount;--%>
    <%--                var td7 = document.createElement('td');--%>
    <%--                td7.innerHTML = data[i].type;--%>
    <%--                var td8 = document.createElement('td');--%>
    <%--                td8.innerHTML = time(data[i].time);--%>
    <%--                tr.appendChild(td1);--%>
    <%--                tr.appendChild(td2);--%>
    <%--                tr.appendChild(td3);--%>
    <%--                tr.appendChild(td4);--%>
    <%--                tr.appendChild(td5);--%>
    <%--                tr.appendChild(td6);--%>
    <%--                tr.appendChild(td7);--%>
    <%--                tr.appendChild(td8);--%>

    <%--            }--%>
    <%--        }--%>
    <%--    })--%>
    <%--}--%>
    function closeRecords() {
        document.getElementById("table").style.display="none";
        // document.getElementById("content").style.display="block";
    }

    function showChangePassword() {
        document.getElementById("changePW").style.display="block";
        $("#tradeRecords").bootstrapTable('destroy');
    }

    function changePassword() {
        var old = document.getElementById("old").value;
        var newPw = document.getElementById("new").value.trim();
        var na = document.getElementById("newAgain").value.trim();
        if(newPw == "" || na == "")
            alert("The new password can't be blank!")
        else {
        $.ajax({
            url: "/lg/getPw",
            type: "post",
            data:{"phoneNumber":${sessionScope.phoneNumber}},
            dataType:"json",
            success: function (data) {
                data = JSON.parse(data);
                if(data.pw == old) {

                        $.ajax({
                            url: "/lg/changePw",
                            type: "post",
                            data:{"newPw":newPw, "phoneNumber":${sessionScope.phoneNumber}},
                            dataType: "json",
                            success: function (data) {
                                data = JSON.parse(data);
                                if(data.ck == "true") alert("Password has been changed!")
                                else alert("Something went wrong, please try again!")
                                document.getElementById("cpw").reset();
                            }
                        })

                }
                else {
                    alert("Wrong old password!");
                    document.getElementById("cpw").reset();
                }
            }
        })
        }
    }

    function checkNewPw() {
        var n1 = document.getElementById("new").value;
        var n2 = document.getElementById("newAgain").value;
        var hint = document.getElementById("hint");
        if(n1 != n2) {
            alert("The new password entered twice is inconsistent!");
            document.getElementById("cpw").reset();
        }
    }

</script>

<%--<script>--%>
<%--    layui.use('table', function () {--%>
<%--        var table = layui.table;--%>
<%--        //第一个实例--%>
<%--        var ta = table.render({--%>
<%--            elem: '#tb2'--%>
<%--            , url: '/tradeRecord/getRecordsByCardNumber' //数据接口--%>
<%--            , where: {"phoneNumber":${sessionScope.phoneNumber}}--%>
<%--            , contentType: "application/json"--%>
<%--            , page: true //开启分页--%>
<%--            , limit: 8 //页容量 pagesize--%>
<%--            , cols: [[ //表头--%>
<%--                { field: 'sender card', title: 'sender card', width: 80, sort: true, fixed: 'left' }--%>
<%--                , { field: 'sender name', title: 'sender name', width: 80 }--%>
<%--                , { field: 'receiver card', title: 'receiver card', width: 80 }--%>
<%--                , { field: 'receiver name', title: 'receiver name', width: 80 }--%>
<%--                , { field: 'amount', title: 'amount', width: 80 }--%>
<%--                , { field: 'type', title: 'type', width: 80 }--%>
<%--                , { field: 'time', title: 'time', width: 80 }--%>
<%--                // , { field: 'Pass', title: '密码', width: 80, sort: true }--%>
<%--                // , { fixed: 'right', width: 165, align: 'center', toolbar: '#barDemo' }--%>
<%--            ]]--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>



</body>

</html>