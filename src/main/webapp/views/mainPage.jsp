<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tiandi Bank</title>
    <link rel="stylesheet" href="../css/style3.css?v=<%= System.currentTimeMillis()%>"/>
    <style>
        .close
        {
            background: transparent;
            position: absolute;
            border: none;
            outline: none;
            top: 500px;
            left: 600px;
            color: #fff;
            background: #03a9f4;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }
    </style>
</head>

<body>
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
    <button onclick="closeRecords()" class="close">close</button>
</div>

<div class="content" id="content">
    <div class="img"></div>
    <label class="biao">HELLO, customer ${sessionScope.phoneNumber}!
        <p id="showRate"></p>
    </label>
    <a href="../views/cardInfo.jsp"><button class="btn4">check cards</button> </a>
    <a href="../views/transfer.jsp"><button class="btn">transfer</button></a>
<%--    <a href="../views/openAccount.jsp"><button class="btn1">open an account</button></a>--%>
    <button class="btn2" onclick="showRate()">check interest rate</button>
    <button class="btn3" onclick="showRecords()">show trade records</button>
    <form action="/lg/logout">
        <button class="btn5">Log out</button>
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