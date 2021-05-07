<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">


<head>
    <meta charset="utf-8">
    <title>Tiandi Bank</title>
    <link rel="stylesheet" href="/css/style.css">
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
            } else if(phone.length != 11) {
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
            <p class="forgot-pass"><a href="#">Forget the password?</a></p>
            <p class="forgot-pass"><a href="/views/Admin.jsp">Administrator login</a></p>
            <button type="button" class="submit" onclick="return checkLogin()"><input type="submit" class="submit1" value="Login"></button>

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
                    <input type="text" id="phoneNumber" pattern="[0-9]{11}" name="phoneNumber"required="required" onblur="checkPhone()"/>
                    <span id="fault" style="color: red"></span>
                    <span id="available" style="color: limegreen"></span>
                </label>
                <label>
                    <span>Password</span>
                    <input type="password" name = "loginPassword" required="required"/>
                </label>

                <button type="button" class="submit"><input type="submit" value="Register"></button>
            </form>


        </div>
    </div>
</div>

<script src="/js/script.js"></script>
<script src="/js/jquery-3.6.0.min.js"></script>

<div style="text-align:center;"></div>
</body>

</html>
