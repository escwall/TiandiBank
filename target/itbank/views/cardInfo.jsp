
<%@ page contentType="text/html;charset=UTF-8" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Card Information</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/style4.css?v=<%= System.currentTimeMillis()%>" />

</head>
<body>

<div>
    <table class="tb" id="tb1">
        <thead>
        <tr>
            <th>No.</th>
            <th>Card Num</th>
            <th>name</th>
            <th>balance</th>
            <th>state</th>
            <th>Phone</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
    <a href="../views/framework.jsp"> <button class="back">Go Back</button></a>
</div>

<script>
    window.onload = function showCard() {
        var pNode = document.getElementById("tb1");
        var tbody = document.getElementsByTagName("tbody")[0];
        if(tbody)
            pNode.removeChild(tbody);
        $.ajax({
            url:"/admin/showCard",
            data: {"phoneNumber": ${sessionScope.phoneNumber}},
            dataType:"json",
            success:function (data) {
                var j = 1;
                var tb = document.createElement('tbody');
                pNode.appendChild(tb);
                for(var i in data) {
                    var tr = document.createElement('tr');
                    tb.appendChild(tr);
                    var td1 = document.createElement('td');
                    td1.innerHTML=j.toString();
                    j++;
                    var td2 = document.createElement('td');
                    td2.innerHTML=data[i].cardNumber;
                    var td3 = document.createElement('td');
                    td3.innerHTML=data[i].name;
                    var td4 = document.createElement('td');
                    td4.innerHTML=Math.round(data[i].balance*100)/100;
                    var td5 = document.createElement('td');
                    td5.innerHTML=data[i].state;
                    var td8 = document.createElement('td');
                    td8.innerHTML=data[i].phoneNumber;
                    tr.appendChild(td1);
                    tr.appendChild(td2);
                    tr.appendChild(td3);
                    tr.appendChild(td4);
                    tr.appendChild(td5);
                    tr.appendChild(td8);
                }
            }
        })
    }
</script>


<script src="../js/jquery-3.6.0.min.js"></script>
</body>
</html>
