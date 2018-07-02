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
    <title>Edit</title>
</head>
<body>
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
<div class="header">
    <div class="container-for-article col-md-5 col-xs-12">
        <h2 style="color: #2981c0; text-align: center; margin-top: 12%;"><b>There are list of all free cars</b></h2>
        <h4 style="color: #2981c0; text-align: center;">With filters help you can find car with particular details</h4>
    </div>
    <div class="container-for-picture col-md-7 col-xs-12">

    </div>
</div>
<div class="main-container-borrow col-md-7 col-xs-12">
    <div class="container-for-main-filter">
        <div class="form-row">
            <h2 style="color: #2981c0"><b>Main filter</b></h2>
        </div>
    </div>

    <div class="container-for-free-car">
        <div class="form-row">
            <h2 style="color: #2981c0"><b>Free cars</b></h2>
        </div>
        <div style="height:390px; overflow:auto;">
            <a:forEach items="${freeCars}" var="order">
                <div class="my-particular-order">
                    City: <b>${order.region}</b> |
                    Price: <b>${order.pricePerDay}</b> |
                    Chauffeur: <b>${order.chauffeur}</b> |
                    Rent from: <b>${order.periodOfRentFrom}</b> |
                    Rent to: <b>${order.periodOfRentTo}</b>
                        <a href="/borrow/choose/${order.id}" class="button">Choose</a>
                </div>
            </a:forEach>
        </div>
    </div>
</div>

<div class="left-side-container-borrow col-md-5 col-xs-12" >
    <div class="container-for-filter ">
        <div class="form-row">
            <h2 style="color: #2981c0"><b>Additional filters</b></h2>
        </div>
    </div>
    <div class="container-for-wishes " >
        <div class="form-row">
            <h2 style="color: #2981c0"><b>Wishes</b></h2>
        </div>
        <div style="height:390px; overflow:auto;">
            <a:forEach items="${selectedOrders}" var="order">
                <div class="my-particular-order">
                    <a style="float: right" href="/borrow/delete/${order.driverId}/${order.id}" class="btn btn-warning btn-sm">Delete</a>
                    <a style="float: right" href="/driver/${order.driverId}" class="btn btn-warning btn-sm">Driver</a>
                    City: <b>${order.region}</b> |
                    Price: <b>${order.pricePerDay}</b> |
                    Chauffeur: <b>${order.chauffeur}</b> <br>
                    Rent from: <b>${order.periodOfRentFrom}</b> |
                    Rent to: <b>${order.periodOfRentTo}</b>
                </div>
            </a:forEach>
            <a:forEach items="${reservedOrder}" var="order">
                <div class="my-finished-trips-for-borrow">
                    <a style="float: right" href="/driver/${order.driverId}" class="btn btn-warning btn-sm">Driver</a>
                    <a style="float: right" href="/borrow/complete/${order.id}" class="btn btn-warning btn-sm">Complete</a>
                    City: <b>${order.region}</b> |
                    Price: <b>${order.pricePerDay}</b> |
                    Chauffeur: <b>${order.chauffeur}</b> <br>
                    Rent from: <b>${order.periodOfRentFrom}</b> |
                    Rent to: <b>${order.periodOfRentTo}</b>
                </div>
            </a:forEach>
        </div>
    </div>
    <div class="container-for-finished-trips" >
        <div class="form-row">
            <h2 style="color: #2981c0"><b>Finished trips</b></h2>
            <a:forEach items="${finishedOrders}" var="order">
                <div class="my-particular-order">
                    <a style="float: right" href="/driver/${order.driverId}" class="btn btn-warning btn-sm">Driver</a>
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


</body>
</html>