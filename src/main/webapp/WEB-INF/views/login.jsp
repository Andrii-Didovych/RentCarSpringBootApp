<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
<head>
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
        <%@include file='main-style.css' %>
    </style>
    <title>Login</title>
</head>
<body style="background-image: url(https://www.247carkeysolutions.co.uk/wp-content/uploads/2016/11/carkeys_shutterstock_74617219.jpg);">
<nav class="navbar navbar-expand-lg navbar-light bg-light" >
    <a class="navbar-brand " href="/">RentCar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
            <sec:authorize access="isAuthenticated()">
                <li class="nav-item">
                    <a class="nav-link" href="/lend">Lend</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/borrow">Borrow</a>
                </li>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/admin" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Admin
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="/admin/brand">Brand</a>
                        <a class="dropdown-item" href="/admin/city">City</a>
                    </div>
                </li>
            </sec:authorize>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <sec:authorize access="isAnonymous()">
                <li><a href="/registration"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <li><a href="/profile"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
                <form:form action="/logout">
                    <a><button class="my-button-like-link"><span class="glyphicon glyphicon-log-in"></span> Logout</button></a>
                </form:form>
            </sec:authorize>
        </ul>
    </div>
</nav>
    <div class="container">
        <div class="row">
            <div class="col-xs-1 col-sm-5 col-lg-6"></div>
            <div class="my-login-form col-xs-10 col-sm-6 col-lg-4">
                <form:form  action="/login" method="post" >
                    <div class="form-group row">
                        <c:if test="${param.fail}">
                            <div class="fail-to-authorize">
                                Fail to authorize
                            </div>
                        </c:if>
                    </div>
                    <div class="form-group row">
                        <input name="login" class="form-control"  placeholder="Input email"/>
                    </div>
                    <div class="form-group row">
                        <input type="password" name="password" class="form-control"  placeholder="Input password"/>
                    </div>
                    <div class="form-group row">
                        <label><span style="color: aliceblue">Remember me</span>  <input type="checkbox" name="rememberMe"></label>
                    </div>
                    <div class="form-group row">
                        <button type="submit" class="btn btn-success mb-2">Login</button>
                        <a href="/registration" class="btn btn-info mb-2">Sign Up</a>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>