<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tiandi Bank</title>
    <link rel="stylesheet" href="../css/style4.css?v=<%= System.currentTimeMillis()%>">
    <style>
        .open,
        .dele
            {
            background: transparent;
            border: none;
            outline: none;
            color: #fff;
            background: #03a9f4;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }
    </style>
</head>

<body>

<script src="../js/jquery-3.6.0.min.js"></script>
<div class="content">
    <div class="img">
        <button class="btn">+Management</button>
        <ul class="uu">
            <li>
                <button class="btn1">All accounts</button>
            </li>
            <li>
                <button class="btn2">Frozen accounts</button>
            </li>
            <li>
                <button class="btn3">Activated accounts</button>
            </li>
            <li>
                <button class="btn5" onclick="showRateTable()">alter interest rate</button>
            </li>
            <li>
                <button class="btn6" onclick="showRecords()">check trade records</button>
            </li>

            <li>
                <form action="/admin/logout">
                <button class="btn4">Exit</button>
                </form>
            </li>
        </ul>


    </div>


    <div>
        <table class="tb" id="tb1" style="display: none">
            <thead>
            <tr>
                <th>No.</th>
                <th>phoneNumber</th>
                <th>Account</th>
                <th>Balance</th>
                <th>Name</th>
                <th>State</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>

    <div>
        <table class="tb" id="tb2" style="display: none">
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
            <tr><td><div id="barcon"></div></td></tr>
        </table>

    </div>

    <div>
        <form id="rateTable" action="/admin/changeRate" method="post" class="tb" style="display: none">
            <p id="showRate"></p>
            <p>
                <label>Alter it to</label>
                <input type="number" name="interestRate" id="irate" required="required" step="0.1" min="0.1" max="5"/>%
            </p>
            <button type="submit" class="open" onsubmit="return checkRate()">confirm</button>
        </form>
    </div>
    </div>
</div>

<script>
    var btn = document.querySelector('.btn');
    var uu = document.querySelector('.uu');
    var btn1 = document.querySelector('.btn1');
    var btn2 = document.querySelector('.btn2');
    var btn3 = document.querySelector('.btn3');
    var flag = 0;
    var f = 0;
    btn.addEventListener('click', function() {
        if (flag == 0) {
            uu.style.display = 'block';
            btn.innerHTML = "-Management";
            flag = 1;
        } else {
            uu.style.display = 'none';
            btn.innerHTML = "+Management";
            flag = 0;
        }
    });

    btn1.addEventListener('click', function () {
        hideRateTable();
        showAccounts();
    });
    btn2.addEventListener('click', function () {
        hideRateTable();
        showFrozen();
    });
    btn3.addEventListener('click', function () {
        hideRateTable();
        showActivated();
    });
    function checkRate() {
        var rate = document.getElementById("irate").value;
        if (rate < 0 || rate > 5) {
            alert("Interest rate is illegal!");
            return false;
        }
        return true;
    }
    function changeState(obj) {
        var block = $(obj).parent().parent().find("td");
        var td5 = block.eq(5);
        var open = block.eq(6);
        // console.log(open);
        var data = block.eq(2).text();
        $.ajax({
            url:"/admin/changeState",
            data: {"cardNumber":data},
            dataType: "json",
            success:function (s) {
                //s = JSON.parse(s);
                console.log(s);
                if(s.state == "activated") {
                    open.innerHTML="frozen";
                    td5.innerHTML="";
                    td5.innerHTML="frozen";

                } else {
                    open.innerHTML = "activated";
                    td5.innerHTML="";
                    td5.innerHTML="activated";
                }
                showAccounts();
            }

        })
    }

    function callDele(obj) {
        var block = $(obj).parent().parent().find("td");
        var data = block.eq(2).text();
        $.ajax({
            url: "/admin/delete",
            data: {"cardNumber":data},
            success:function (data) {
                showAccounts();
            }
        })
    }

    function showAccounts() {
        var pNode = document.getElementById("tb1");
        var tbody = document.getElementsByTagName("tbody")[0];
        if(tbody)
        pNode.removeChild(tbody);
        $.ajax({
        url:"/admin/showAllAccounts",
        dataType:"json",
        success: function (data) {
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
                var s = data[i].balance.toString();
                td3.innerHTML=s.substring(0,s.indexOf(".")+3);
                var td4 = document.createElement('td');
                td4.innerHTML=data[i].name;
                var td5 = document.createElement('td');
                td5.innerHTML=data[i].state;
                var td8 = document.createElement('td');
                td8.innerHTML=data[i].phoneNumber;
                tr.appendChild(td1);
                tr.appendChild(td8);
                tr.appendChild(td2);
                tr.appendChild(td3);
                tr.appendChild(td4);
                tr.appendChild(td5);
                var open = document.createElement('button');
                if(data[i].state == "activated") {
                    open.innerHTML="frozen";
                } else open.innerHTML="activated";
                open.onclick = function () {
                    changeState(this);
                };
                open.className = "open";
                var dele = document.createElement('button')
                dele.innerHTML="delete";
                dele.onclick= function () {
                    callDele(this);
                };
                dele.className = "dele";
                var td6 = document.createElement('td');
                var td7 = document.createElement('td');
                td6.appendChild(open);
                td7.appendChild(dele);
                tr.appendChild(td6);
                tr.appendChild(td7);
            }
        }
    })
    }

    function showActivated() {
        var pNode = document.getElementById("tb1");
        var tbody = document.getElementsByTagName("tbody")[0];
        if(tbody)
            pNode.removeChild(tbody);
        $.ajax({
            url:"/admin/showActivatedAccounts",
            dataType:"json",
            success: function (data) {
                console.log(data);
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
                    td3.innerHTML=Math.round(data[i].balance*100)/100;
                    var td4 = document.createElement('td');
                    td4.innerHTML=data[i].name;
                    var td5 = document.createElement('td');
                    td5.innerHTML=data[i].state;
                    var td8 = document.createElement('td');
                    td8.innerHTML=data[i].phoneNumber;
                    tr.appendChild(td1);
                    tr.appendChild(td8);
                    tr.appendChild(td2);
                    tr.appendChild(td3);
                    tr.appendChild(td4);
                    tr.appendChild(td5);
                    var open = document.createElement('button');
                    if(data[i].state == "activated") {
                        open.innerHTML="frozen";
                    } else open.innerHTML="activated";
                    open.onclick = function () {
                        changeState(this);
                    };
                    open.className = "open";
                    var dele = document.createElement('button')
                    dele.innerHTML="delete";
                    dele.onclick= function () {
                        callDele(this);
                    };
                    dele.className = "dele";
                    var td6 = document.createElement('td');
                    var td7 = document.createElement('td');
                    td6.appendChild(open);
                    td7.appendChild(dele);
                    tr.appendChild(td6);
                    tr.appendChild(td7);
                }
            }
        })
    }

    function showFrozen() {
        var pNode = document.getElementById("tb1");
        var tbody = document.getElementsByTagName("tbody")[0];
        if(tbody)
            pNode.removeChild(tbody);
        $.ajax({
            url:"/admin/showFrozenAccounts",
            dataType:"json",
            success: function (data) {
                // console.log(data);
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
                    td3.innerHTML=Math.round(data[i].balance*100)/100;
                    var td4 = document.createElement('td');
                    td4.innerHTML=data[i].name;
                    var td5 = document.createElement('td');
                    td5.innerHTML=data[i].state;
                    var td8 = document.createElement('td');
                    td8.innerHTML=data[i].phoneNumber;
                    tr.appendChild(td1);
                    tr.appendChild(td8);
                    tr.appendChild(td2);
                    tr.appendChild(td3);
                    tr.appendChild(td4);
                    tr.appendChild(td5);
                    var open = document.createElement('button');
                    if(data[i].state == "activated") {
                        open.innerHTML="frozen";
                    } else open.innerHTML="activated";
                    open.onclick = function () {
                        changeState(this);
                    };
                    open.className = "open";
                    var dele = document.createElement('button')
                    dele.innerHTML="delete";
                    dele.onclick= function () {
                        callDele(this);
                    };
                    dele.className = "dele";
                    var td6 = document.createElement('td');
                    var td7 = document.createElement('td');
                    td6.appendChild(open);
                    td7.appendChild(dele);
                    tr.appendChild(td6);
                    tr.appendChild(td7);
                }
            }
        })
    }

    function showRateTable() {
        var tag = document.getElementById("showRate");
        $.ajax({
            url:"/admin/getRate",
            dataType:"json",
            success: function (data) {
                data=JSON.parse(data);
                // console.log(data);
                tag.innerHTML="The annual interest rate is " + data.iRate*100 + "% currently";
            }
        })
        $("#tb1")[0].style.display="none";
        $("#tb2")[0].style.display="none";
        var id = document.getElementById("rateTable");
        var left = 400;
        var top = 140;
        id.style.top=top;
        id.style.left=left;
        id.style.display="block";
    }

    function hideRateTable() {
        var pNode = document.getElementById("tb1");
        pNode.style.display="block";
        document.getElementById("rateTable").style.display="none";
        $("#tb2")[0].style.display="none";
    }

    function time(time = +new Date()) {
        var date = new Date(time + 8 * 3600 * 1000); // 增加8小时
        return date.toJSON().substr(0, 19).replace('T', ' ');
    }

    // function showRecords() {
    //         $("#tb1")[0].style.display="none";
    //         $("#tb2")[0].style.display="block";
    //         $("#rateTable")[0].style.display="none";
    //         var pNode = $("#tb2")[0];
    //         var tbody = document.getElementsByTagName("tbody")[1];
    //         if(tbody)
    //             pNode.removeChild(tbody);
    // }

    //     function showRecords(){
    //         $("#tb1")[0].style.display="none";
    //         $("#tb2")[0].style.display="block";
    //         $("#rateTable")[0].style.display="none";
    //         var pNode = $("#tb2")[0];
    //         var tbody = document.getElementsByTagName("tbody")[1];
    //         if(tbody)
    //             pNode.removeChild(tbody);
    //     $.ajax({
    //         url:"/tradeRecord/getAllRecords",
    //         type:"post",
    //         success: function(data){
    //             var obj=eval(data);
    //             var tbody=$('<tbody></tbody>');
    //             $(obj).each(function (index){
    //                 var val=obj[index];
    //                 var tr=$('<tr></tr>');
    //                 tr.append('<td>'+ val.senderCardNumber + '</td>' + '<td>'+ val.senderName + '</td>' +'<td>'+ val.receiverCardNumber + '</td>'+'<td>'+ val.receiverName+ '</td>'+'<td>'+ val.amount+ '</td>'+'<td>'+ val.type+ '</td>'+'<td>time('+ val.time+ ')</td>');
    //                 tbody.append(tr);
    //             });
    //             $('#dataList tbody').replaceWith(tbody);
    //
    //             goPage(1,8)
    //
    //         }
    //     });
    // };


        /**
        * 分页函数
        * pno--页数
        * psize--每页显示记录数
        * 分页部分是从真实数据行开始，因而存在加减某个常数，以确定真正的记录数
        * 纯js分页实质是数据行全部加载，通过是否显示属性完成分页功能
        **/
        function goPage(pno,psize){
        var itable = document.getElementById("tb2");
        var num = itable.rows.length;//表格所有行数(所有记录数)
        var totalPage = 0;//总页数
        var pageSize = psize;//每页显示行数
        //总共分几页
        if((num-1)/pageSize > parseInt((num-1)/pageSize)){
        totalPage=parseInt((num-1)/pageSize)+1;
    }else{
        totalPage=parseInt((num-1)/pageSize);
    }
        var currentPage = pno;//当前页数
        var startRow = (currentPage - 1) * pageSize+1;//开始显示的行
        var endRow = currentPage * pageSize;//结束显示的行
        endRow = (endRow > num)? num : endRow;
        //遍历显示数据实现分页
        for(var i=1;i<num;i++){
        var irow = itable.rows[i];
        if(i>=startRow && i<endRow){
        irow.style.display ="";
    }else{
        irow.style.display ="none";
    }
    }

        var tempStr = "共 "+(num-1)+" 条记录        分 "+totalPage+" 页        当前第 "+currentPage+" 页";
        if(currentPage>1){
        tempStr += "<a href=\"#\" onClick=\"goPage("+(1)+","+psize+")\">                首页</a>";
        tempStr += "<a href=\"#\" onClick=\"goPage("+(currentPage-1)+","+psize+")\">                <上一页</a>"
    }else{
        tempStr += "                首页";
        tempStr += "                <上一页";
    }
        if(currentPage<totalPage){
        tempStr += "<a href=\"#\" onClick=\"goPage("+(currentPage+1)+","+psize+")\">              下一页></a>";
        tempStr += "<a href=\"#\" onClick=\"goPage("+(totalPage)+","+psize+")\">                尾页</a>";
    }else{
        tempStr += "                下一页>";
        tempStr += "                尾页";
    }
        document.getElementById("barcon").innerHTML = tempStr;
    }



    function showRecords() {
        $("#tb1")[0].style.display="none";
        $("#tb2")[0].style.display="block";
        $("#rateTable")[0].style.display="none";
        var pNode = document.getElementById("tb2");
        var tbody = document.getElementsByTagName("tbody")[2];
        if(tbody)
            pNode.removeChild(tbody);
        $.ajax({
            url:"/tradeRecord/getAllRecords",
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

</script>

<div style="text-align:center;"></div>
</body>

</html>