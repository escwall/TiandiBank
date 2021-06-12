<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">


<head>
    <meta charset="utf-8">
    <title>Tiandi Bank</title>
    <link rel="stylesheet" href="/css/style.css">
    <style>
        #cha {
            position: absolute;
            top: 420px;
            left: 175px;
        }
    </style>
</head>

<body>
<div class="content">
    <script>
        function checkPhone() {
            var f = false;
            var phone = document.getElementById("phoneNumber").value;
            phone=phone.trim();
            if(phone=="") {
                document.getElementById("fault").innerHTML="";
                document.getElementById("available").innerHTML="";
                document.getElementById("fault").innerHTML="can't be empty";
                document.getElementById("sign-up").reset();
            } else if(phone.length != 11 || isNaN(phone)) {
                document.getElementById("fault").innerHTML="";
                document.getElementById("available").innerHTML="";
                document.getElementById("fault").innerHTML="length should be 11 and consists of numbers";
                document.getElementById("sign-up").reset();
            }
            else {
                $.ajax({
                    url: "/lg/check",
                    type: "post",
                    data: {"phoneNumber": phone},
                    dataType: "json",
                    success: function (data) {
                        data = JSON.parse(data);
                        if (data.s == "false") {
                            document.getElementById("fault").innerHTML="";
                            document.getElementById("available").innerHTML="";
                            document.getElementById("fault").innerHTML="has been registered";
                            document.getElementById("sign-up").reset();
                        } else {
                            document.getElementById("available").innerHTML="";
                            document.getElementById("fault").innerHTML="";
                            document.getElementById("available").innerHTML="can be registered";
                            f = true;
                        }
                    }
                });
            }
            return f;
        }

        function checkLogin() {
            var num = document.getElementById("pn").value;
            var pw = document.getElementById("pw").value;
            $.ajax({
                url: "/lg/ckLogin",
                data: {"phoneNumber":num,"loginPassword":pw},
                dataType: "json",
                success: function (data) {
                    data=JSON.parse(data);
                    // console.log(data);
                    if(data.ck == "false") {
                        alert("Phone number or password is wrong!")
                        document.getElementById("table").reset();
                        return false;
                    }
                }
            })
            return true;
        }

    </script>
    <div class="form sign-in" id="table">
        <h2>Welcome Back</h2>
        <form action="/lg/login" method="POST">
            <label>
                <span>Phone Number</span>
                <input type="text" name="phoneNumber" required="required" pattern="[0-9]{11}" id="pn"/>
            </label>
            <label>
                <span>Password</span>
                <input type="password" name="loginPassword" required="required" id="pw"/>
            </label>
            <p class="forgot-pass"><a href="#">Forget the password? Please contact the admin 029-65536.</a></p>
            <p class="forgot-pass"><a href="/views/Admin.jsp">Administrator login</a></p>
            <button type="submit" class="submit" onclick="return checkLogin()">Login</button>

        </form>
    </div>
    <div class="sub-cont">
        <div class="img">
            <div class="img__text m--up">
                <h2>Not registered yet?</h2>
                <p>Sign up now and enjoy life!</p>
            </div>
            <div class="img__text m--in">
                <h2>Do you have an account?</h2>
                <p>Enjoy it now!</p>
            </div>
            <div class="img__btn">
                <span class="m--up">Register</span>
                <span class="m--in">Login</span>
            </div>
        </div>
        <div class="form sign-up">
            <h2>Register now!</h2>
            <form action="/lg/register" method="POST" id="sign-up">
                <label>
                    <span> Phone number</span>
                    <input type="text" id="phoneNumber" pattern="[0-9]{11}" name="phoneNumber" required="required" onblur="checkPhone()"/>
                    <span id="fault" style="color: red"></span>
                    <span id="available" style="color: limegreen"></span>
                </label>
                <label>
                    <span>Password</span>
                    <input type="password" name = "loginPassword" required="required" id="rpw"/>
                </label>
                <label>
                    <span>Password again</span>
                    <input type="password" name = "loginPasswordagain" required="required" id="rpwa" onblur="checkrpw()"/>
                </label>

                <button type="submit" class="submit">Register</button>

<%--                <div id="cha" class="g-recaptcha" data-callback="notRobot" data-sitekey="6LfEuRobAAAAALWV8Yy0t24GfUlW_zdMIoXfXpOz"></div>--%>
            </form>


        </div>
    </div>
</div>

<script src="/js/script.js"></script>
<script src="/js/jquery-3.6.0.min.js"></script>

<script src="https://www.recaptcha.net/recaptcha/api.js">
</script>

<div style="text-align:center;"></div>
</body>

<script>
    var flag = false;
    window.onload = function ()
    {
        console.log(document.URL);
        history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function () {
            history.pushState(null, null, document.URL);
        })
    }

    // function judge() {
    //     if (!flag) {
    //         alert("Please click reCAPTCHA to verify!")
    //     }
    //     return flag === true;
    // }
    // function notRobot(response) {
    //     console.log(response);
    //     $.ajax({
    //         crossDomain: true,
    //         url: "https://www.recaptcha.net/recaptcha/api/siteverify",
    //         type: "POST",
    //         data: {'secret': '6LfEuRobAAAAAB38Zy4O5IBrnRhGl-ryvp9ygG4p',
    //                'response': response
    //                },
    //         dataType: "json",
    //         success: function (data) {
    //             console.log(data);
    //             flag = data.success;
    //             console.log(flag);
    //
    //         },
    //         error: function () {
    //             return false;
    //         }
    //     })
    // }

    function checkrpw() {
        if(document.getElementById("rpw").value != document.getElementById("rpwa").value) {
            alert("Inconsistent enter the password twice!");
            document.getElementById("sign-up").reset();

        }
    }
</script>


</html>
