<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
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
                    <form:form  action="/login" method="post" >
                        <div class="form-group row">
                            <c:if test="${param.fail}">
                                <div class="fail-to-authorize" style="background-color: #563d7c; color: #f0ad4e; padding:3px 5px;">
                                    Fail to authorize
                                </div>
                            </c:if>
                        </div>
                        <div class="form-group row" style="border: #563d7c 1px solid; border-radius: 5px">
                            <input name="login" class="form-control"  placeholder="Input email"/>
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