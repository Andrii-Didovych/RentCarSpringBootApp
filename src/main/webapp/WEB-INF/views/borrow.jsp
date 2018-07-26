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
        <%@include file='borrow-style.css' %>
    </style>
    <title>Borrow</title>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-light  " style="background-color: #563d7c; border-radius: 0px; margin: 0px; " >
    <a class="navbar-brand " href="/"><span style="color: white; font-size: 20px; font-family: Arial">RentCar</span></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
            <sec:authorize access="isAuthenticated()">
                <li class="nav-item">
                    <a class="nav-link" href="/lend"><span style="color: white; font-size: 16px">Lend</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/borrow"><span style="color: white; font-size: 16px">Borrow</span></a>
                </li>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/admin" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span style="color: white; font-size: 16px">Admin</span>
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
                <li><a class="nav-link dropdown-toggle" style="background-color: #563d7c;" href="/profile" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span style="color: white; font-size: 16px">Profile</span>
                </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="/profile/${idOfAuthorizedDriver}">See profile</a>
                        <a class="dropdown-item" href="/edit">Edit</a>
                    </div>
                </li>
                <form:form action="/logout">
                    <a><button class="my-button-like-link"><span class="glyphicon glyphicon-log-in"></span> Logout</button></a>
                </form:form>
            </sec:authorize>
        </ul>
    </div>
</nav>
<div class="container col-md-12 col-sm-12 col-xs-12">
<div class="container-for-filter">
    <div class="main-container-borrow col-md-6 col-xs-12">
                <a:forEach var="order" items="${freeCars}">
                    <div class="col-md-1"></div>
                    <div class="comment-decorator row col-md-10">
                        <div class="col-sm-8 col-xs-12">
                                <div class="comment" style="background-image: url(https://s3.amazonaws.com/cars-bucket/${order.photoOfCar});" >
                                    <div class="comment-inside">
                                        <img src="https://s3.amazonaws.com/drivers-bucket/${order.photoOfDriver}" style="width: 80px; float: left; height: 80px;  border: #e9ebee 3px solid; margin: 10px;">
                                        <h3 style="margin-top: 0px; color: white; text-align: center;">${order.brand} ${order.model}</h3> <br>
                                    </div>
                                </div>
                                <div style="min-width: 220px;">
                                    <a style="margin-top: -8px; margin-left: -9px;"  class="btn btn-success btn-sm" href="/borrow/choose/${order.id}">Take it</a>
                                    <a style="margin-top: -8px;" class="btn btn-primary btn-sm" href="/profile/${order.driverId}">Profile</a>
                                </div>
                        </div>
                        <div class="col-sm-4 col-xs-12" style="text-align: right">
                                Rent from <b>${order.periodOfRentFrom}</b>
                                to <b>${order.periodOfRentTo}</b>
                                in <b>${order.region}</b> |
                                Chauffeur: <b>${order.chauffeur}</b> |
                                Price: <b>${order.pricePerDay}</b>
                        </div>
                    </div>
                </a:forEach>
    </div>
</div>

<div class="left-side-container-borrow col-md-6 col-xs-12" >
    <div class="container-for-wishes" >
        <div class="background-for-wishes">
            <div class="form-row">
                <h2 style="color: white"><b>Wishes</b></h2>
            </div>
            <div style="height:420px; overflow:auto;">
                <a:forEach items="${selectedOrders}" var="order">
                    <div class="my-particular-order ">
                        <a style="float: right; margin: 5px;" href="/borrow/delete/${order.driverId}/${order.id}" class="btn btn-warning btn-sm">Delete</a>
                        <a style="float: right; margin: 5px;" class="btn btn-primary btn-sm" href="/profile/${order.driverId}">Driver</a>
                        City: <b>${order.region}</b> |
                        Price: <b>${order.pricePerDay}</b> |
                        Chauffeur: <b>${order.chauffeur}</b> <br>
                        Rent from: <b>${order.periodOfRentFrom}</b> |
                        Rent to: <b>${order.periodOfRentTo}</b>
                    </div>
                </a:forEach>
                <a:forEach items="${reservedOrder}" var="order">
                    <div class="my-particular-order">
                        <a style="float: right;margin: 5px;" class="btn btn-primary btn-sm" href="/profile/${order.driverId}">Driver</a>
                        <a style="float: right;margin: 5px;" href="/borrow/complete/${order.id}" class="btn btn-warning btn-sm">Complete</a>
                        City: <b>${order.region}</b> |
                        Price: <b>${order.pricePerDay}</b> |
                        Chauffeur: <b>${order.chauffeur}</b> <br>
                        Rent from: <b>${order.periodOfRentFrom}</b> |
                        Rent to: <b>${order.periodOfRentTo}</b>
                        <span style="color: white; background-color: #f0ad4e; padding: 3px; margin: 5px; float: left; border: 1px solid #4f92ff; border-radius: 3px;" > ${message}</span>
                    </div>
                </a:forEach>
            </div>
        </div>
    </div>
    <div class="container-for-finished-trips" >
        <div class="background-for-wishes">
            <div class="form-row">
                <h2 style="color: white"><b>Finished trips</b></h2>
            </div>
                <a:forEach items="${finishedOrders}" var="order">
                    <div class="my-particular-order">
                        <a style="float: right;" class="btn btn-primary btn-sm" href="/profile/${order.driverId}">Driver</a>
                        City: <b>${order.region}</b> |
                        Price: <b>${order.pricePerDay}</b> |
                        Chauffeur: <b>${order.chauffeur}</b> <br>
                        Rent from: <b>${order.periodOfRentFrom}</b> |
                        Rent to: <b>${order.periodOfRentTo}</b>
                    </div>
                </a:forEach>
        </div>
    </div>
</div>
</div>
<div class="my-footer  col-md-12 col-sm-12 col-xs-12">
    Andrii Didovych
    <img src="https://www.modmy.com/sites/modmy.com/files/styles/large/public/article-images/2017/08/github-app-button.png?itok=ONaR9O8z" style="height: 50px">
    <img src="http://thelinkedinman.com/wp-content/uploads/2016/02/View-my-LinkedIn-profile-image-3-300x140.png" style="height: 50px">
</div>
</body>
</html>