
<%@ page contentType="text/html;charset=UTF-8" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Administrator Login</title>
    <link rel="stylesheet" type="text/css" href="../css/style2.css?v=<%= System.currentTimeMillis()%>" />

</head>
<body>

<div class="login-box">
    <h2>Administrator Login</h2>
    <form action="/admin/login" method="post">
        <div class="login-field">
            <input type="text" name="username" required="" />
            <label>Account</label>
        </div>
        <div class="login-field">
            <input type="password" name="adminPassword" required="" />
            <label >Password</label>
        </div>
        <div style="float: left">
        <button type="submit">Login</button>
        </div>
    </form>
    <div style="float: right">
        <a href="../index.jsp"> <button>Back</button></a>
    </div>
</div>



</body>
<script>
    window.onload = function stay()
    {
        console.log(document.URL);
        history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function () {
            history.pushState(null, null, document.URL);
        })
    }
</script>
</html>
