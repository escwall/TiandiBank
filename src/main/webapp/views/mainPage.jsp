<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tiandi Bank</title>
    <%--    <link rel="stylesheet" type="text/css" href="http://www.w3cplus.com/demo/css3/base.css" media="all" />--%>
    <%--    不知道哪位兄弟用的什么模板--%>
    <%--<script type="text/javascript" src="http://www.w3cplus.com/demo/css3/prefixfree.min.js"></script>--%>
    <%--    原本的style3.css--%>
    <%--<link rel="stylesheet" href="../css/style3.css?v=<%= System.currentTimeMillis()%>"/>--%>
    <%--    bootstrap的css文件引入--%>
    <link rel="stylesheet" href="../css/bootstrap.min.css?v=<%= System.currentTimeMillis()%>"/>
    <link rel="stylesheet" href="../css/bootstrap-theme.min.css?v=<%= System.currentTimeMillis()%>"/>
    <script src="../js/bootstrap.min.js" type="application/javascript"></script>
    <%-- <link rel="stylesheet" type="text/css" href="../css/style4.css?v=<%= System.currentTimeMillis()%>" />--%>
    <style>
        body{
            background-image: url(../images/bg7.jpg);
            /*background-image: url(../images/bg.jpg)no-repeat;*/
            background-repeat: no-repeat;
            background-size: 100%;
            /*-webkit-filter:blur(5px);*/
            /*background-opacity:0.5;*/
            background-size: cover;



            background-position: center 0;
            background-repeat: no-repeat;
            background-attachment: fixed;
            -webkit-background-size: cover;
            -o-background-size: cover;
            -moz-background-size: cover;
            -ms-background-size: cover;
        }



        .explain p:first-child{
            color: #FF0000;
            font-size: 60px;
            margin-left: 10px;
            margin-top: 10px;
            font-family: "Ink Free";
        }
        .tit
        {
            text-align:center;
            width:300px;
            height:300px;
            color:black;
        }
        .box
        {
            width:400px;
            height:300px;
            position: absolute;
            left: 50%;
            margin-left: -100px;
            top:50%;
            margin-top: -100px;
            font-size: 30px;
            font-family: "Ink Free";
        }
        .box ul{width:200px;margin:0 auto;text-align:left}

        .demo {
            margin: 40px auto 0;
            width: 170px;
            text-align: center;
        }
        .menu a {
            display: block;
            color: #484848;
            text-decoration: none;
            text-shadow: 0 1px 0 #e0e0e0;
            font-size: 14px;
        }
        .menu li:hover a,
        .menu li:first-child a {
            color: #980202;
            text-shadow: 0 1px 0 rgba(0,0,0,.1);
        }
        .menu li:hover a{
            color: #fff;
        }
        .menu li {
            position: relative;
            z-index: 2;
        }


        .ribbon_rail > div {
            width: 100%;
        }
        .ribbon_rail > div:before,
        .ribbon_rail > div:after {
            content:"";
            position: absolute;
            top:10px;
            z-index: -1;
            width: 0;
            height:0;
            border-width: 14px;
            border-style: solid;
            border-color: #ff1515 #ff1515 #920000 #ff1515;
        }
        .ribbon_rail > div:before {
            right: 100%;
            border-left-color: transparent;
            margin-right: -10px;
        }
        .ribbon_rail > div:after {
            left: 100%;
            border-right-color: transparent;
            margin-left: -10px;
        }
        .menu li:nth-child(1):hover ~ .ribbon_wrap{
            top: 8px;
        }
        .menu li:nth-child(2):hover ~ .ribbon_wrap{
            top: 43px;
        }
        .menu li:nth-child(3):hover ~ .ribbon_wrap{
            top: 78px;
        }
        .menu li:nth-child(4):hover ~ .ribbon_wrap{
            top: 113px;
        }
        .menu li:nth-child(5):hover ~ .ribbon_wrap{
            top: 148px;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Tiandi Bank</span>
            </button>
            <a class="navbar-brand" href="#">Tiandi Bank</a>
        </div>

        <%--        这个是右上角的个人资料dropdown 先不要了--%>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <%-- <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
             <form class="navbar-form navbar-left">
                 <div class="form-group">
                     <input type="text" class="form-control" placeholder="Search">
                 </div>
                 <button type="submit" class="btn btn-default">Submit</button>
             </form>
             <ul class="nav navbar-nav navbar-right">
                 <li><a href="#">Log in</a></li>
                 <li class="dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Me <span class="caret"></span></a>
                     <ul class="dropdown-menu">
                         <li><a href="#">Action</a></li>
                         <li><a href="#">Another action</a></li>
                         <li><a href="#">Something else here</a></li>
                         <li role="separator" class="divider"></li>
                         <li><a href="#">Separated link</a></li>
                     </ul>
                 </li>
             </ul>
         </div><!-- /.navbar-collapse -->--%>
    </div><!-- /.container-fluid -->
</nav>

<div id="table" style="display: none">
    <table class="tb" id="tb2">
        <thead>
        <tr>
            <th>No.</th>
            <th>Sender Card</th>
            <th>Sender Name</th>
            <th>Receiver Card</th>
            <th>Receiver Name</th>
            <th>Amount</th>
            <th>Type</th>
            <th>Time</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
    <button onclick="closeRecords()" style=" position: absolute;
    top: 600px;
    left: 650px;
    background: #d4af7a;
    text-transform: uppercase;
    text-decoration: none;
    border-radius: 100px;
    font-size: 20px;">close</button>
</div>

<div class="explain" id="content" >
    <div class="img"></div>
    <label class="tit">HELLO, customer ${sessionScope.phoneNumber}!
        <p id="showRate"></p>
    </label>
    <ul class="box">
        <li><a href="../views/cardInfo.jsp" title=""><strong>Check Cards</strong></a></li>
        <li><a href="../views/transfer.jsp" title=""><strong>Transfer</strong></a></li>
        <li><a onclick=showRate() ><strong>Check interest rate</strong></a></li>
        <li><a onclick=showRecords()><strong>Show trade records</strong></a></li>
    </ul>
    <%-- <a href="../views/cardInfo.jsp"><button class="btn4">Check cards</button> </a>
    <%-- <a href="../views/transfer.jsp"><button class="btn">Transfer</button></a>
<%--    <a href="../views/openAccount.jsp"><button class="btn1">open an account</button></a>--%>
    <%-- <button class="btn2" onclick="showRate()">Check interest rate</button>
    <%-- <button class="btn3" onclick="showRecords()">Show trade records</button> --%>

    <form action="/lg/logout">
        <%--            log out 那个按钮在这--%>
        <%--    <button class="back"  style="position:absolute;left:750px;top:500px;">Log out</button>--%>
        <button style=" position: absolute;
    top: 600px;
    left: 650px;
    background: #d4af7a;
    text-transform: uppercase;
    text-decoration: none;
    border-radius: 100px;
    font-size: 20px;">Log out</button>
    </form>
</div>

<script>
    function showRate() {
        $.ajax({
            url: "/admin/getRate",
            dataType: "json",
            success: function (data) {
                data = JSON.parse(data);
                document.getElementById("showRate").innerHTML = "The annual interest rate is " + data.iRate * 100 + "% currently";
            }
        })
    }
    function time(time = +new Date()) {
        var date = new Date(time + 8 * 3600 * 1000); // 增加8小时
        return date.toJSON().substr(0, 19).replace('T', ' ');
    }
    function showRecords() {
        $("#table")[0].style.display="block";
        $("#content")[0].style.display="none";
        var pNode = $("#tb2")[0];
        var tbody = document.getElementsByTagName("tbody")[0];
        if(tbody)
            pNode.removeChild(tbody);
        $.ajax({
            url:"/tradeRecord/getRecordsByCardNumber",
            data:{"phoneNumber":${sessionScope.phoneNumber}},
            dataType:"json",
            success:function (data) {
                var j = 1;
                var tb = document.createElement('tbody');
                pNode.appendChild(tb);
                for (var i in data) {
                    var tr = document.createElement('tr');
                    tb.appendChild(tr);
                    var td1 = document.createElement('td');
                    td1.innerHTML = j.toString();
                    j++;
                    var td2 = document.createElement('td');
                    td2.innerHTML = data[i].senderCardNumber;
                    var td3 = document.createElement('td');
                    td3.innerHTML = data[i].senderName;
                    var td4 = document.createElement('td');
                    td4.innerHTML = data[i].receiverCardNumber;
                    var td5 = document.createElement('td');
                    td5.innerHTML = data[i].receiverName;
                    var td6 = document.createElement('td');
                    td6.innerHTML = data[i].amount;
                    var td7 = document.createElement('td');
                    td7.innerHTML = data[i].type;
                    var td8 = document.createElement('td');
                    td8.innerHTML = time(data[i].time);
                    tr.appendChild(td1);
                    tr.appendChild(td2);
                    tr.appendChild(td3);
                    tr.appendChild(td4);
                    tr.appendChild(td5);
                    tr.appendChild(td6);
                    tr.appendChild(td7);
                    tr.appendChild(td8);

                }
            }
        })
    }
    function closeRecords() {
        $("#table")[0].style.display="none";
        $("#content")[0].style.display="block";
    }
</script>

<script src="../js/script.js"></script>
<script src="../js/jquery-3.6.0.min.js"></script>

<div style="text-align:center;"></div>
</body>

</html>