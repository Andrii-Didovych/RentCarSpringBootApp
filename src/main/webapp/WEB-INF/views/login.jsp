<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        <%@include file='css/login-style.css' %>
    </style>
    <title>Login</title>
</head>
<body>
<div class="login-container">
        <div class="nav-bar">
            <div class="left-nav-xs">
                <a href="/"><b style="font-size: 20px;">RentCar</b></a>
            </div>
            <div class="right-nav-xs">
                <a href="/registration">Register</a>
            </div>
        </div>
        <div class="left">
            <div class="left-nav">
                <a href="/"><b>RentCar</b></a>
            </div>
            <div class="text">
                <b>
                ${numberOfUser} people have already <br>signed up on our site,<br> join us right now!
                </b>
            </div>
            <div class="join-us-button">
                <a href="/registration"><b>Register</b></a>
            </div>
        </div>
        <div class="right">
            <div class="login-form">
                    <form:form  action="/login" method="post">
                        <div class="form-group row">
                            <c:if test="${param.fail}">
                                   Fail to authorize<br>
                                <span style="font-size: 12px">Maybe you have not activated your account</span>
                            </c:if>
                                ${message}
                        </div>
                        <div class="form-group row" style="border: #563d7c 1px solid; border-radius: 5px">
                            <input name="login" type="email"  class="form-control"  placeholder="Input email"/>
                        </div>
                        <div class="form-group row" style="border: #563d7c 1px solid; border-radius: 5px">
                            <input type="password" name="password" class="form-control"  placeholder="Input password"/>
                        </div>
                        <div class="form-group row">
                            <label for="remember" style="color: #563d7c; margin-right: 5px;">Remember me</label>
                            <input id="remember" type="checkbox" name="rememberMe">
                        </div>
                        <div class="form-group row" style="display: flex; flex-direction: row-reverse">
                            <button style="background-color: #563d7c; color: #f0ad4e; border: #da9c44 solid 1px;" type="submit" class="btn btn-success mb-2">Login</button>
                        </div>
                    </form:form>
            </div>
        </div>
</div>
</body>
</html>