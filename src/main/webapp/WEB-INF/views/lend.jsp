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

<div class="container-for-lend">
    <div class="my-lend-car">
                <%--@elvariable id="car" type="java"--%>
                <form:form  action="/lend" method="post"  modelAttribute="car">
                    <div style="margin-bottom: 50px">
                        <h2 style="color: white; text-align: center">Lend car to somebody who needs it </h2>
                        <h4 style="color: white; text-align: center" >Your vehicle is able to earn money for you by itself</h4>
                    </div>
                    <div class="form-row">
                        <form:errors style="color: #07fff6">${message}</form:errors>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4 col-xs-6">
                            <form:label path="region" for="region" cssStyle="color: white; float: right">City</form:label>
                            <form:select  path="region" items="${cities}" id="region" cssStyle="height: 33px" class="form-control"/>
                        </div>
                        <div class="form-group col-md-2 col-xs-6">
                            <form:label path="periodOfRentFrom" for="periodOfRentFrom"  cssStyle="color: white; float: right">Rent from</form:label>
                            <input  type="date" name="periodOfRentFrom" id="periodOfRentFrom" class="form-control"/>
                            <form:errors path="periodOfRentFrom" style="color: #07fff6"/>
                        </div>

                        <div class="form-group col-md-2 col-xs-6">
                            <form:label path="periodOfRentTo" for="periodOfRentTo"  cssStyle="color: white; float: right">Rent to</form:label>
                            <input  type="date" name="periodOfRentTo" id="periodOfRentTo" class="form-control"/>
                            <form:errors path="periodOfRentTo" style="color: #07fff6"/>
                        </div>

                        <div class="form-group col-md-2 col-xs-6">
                            <form:label path="pricePerDay" for="pricePerDay" cssStyle="color: white; float: right">Price</form:label>
                            <form:input path="pricePerDay" class="form-control" id="pricePerDay"  placeholder="Input price"/>
                            <form:errors path="pricePerDay" style="color: #07fff6"/>
                        </div>

                        <div class="form-group col-md-2 col-xs-6">
                            <form:label path="chauffeur" for="chauffeur" cssStyle="color: white; float: right">Chauffeur</form:label>
                            <form:select  path="chauffeur" items="${chauffeurs}" id="chauffeur" cssStyle="height: 33px" class="form-control"/>
                        </div>
                        <div class="form-group col-md-12 col-xs-6">
                            <button type="submit"  class="btn btn-success my-button-float-right">Add car</button>
                        </div>
                    </div>
                </form:form>
    </div>
</div>


<div class="my-form-for-particular-order col-md-7 col-xs-12">
    <h2 style="color: white">Particular order</h2>
    <div class="my-particular-order">
        City: <b>${particularOrder.region}</b> |
        Rent from: <b>${particularOrder.periodOfRentFrom}</b> |
        Rent to: <b>${particularOrder.periodOfRentTo}</b> |
        Price: <b>${particularOrder.pricePerDay}</b> |
        Chauffeur: <b>${particularOrder.chauffeur}</b> |
        <a href="/lend/delete/${particularOrder.id}" class="btn btn-warning btn-sm">Delete</a>
    </div>
    <div style="height:310px; overflow:auto;">
        <a:forEach items="${clients}" var="client">
            <div class="my-list-of-clients col-md-6 col-xs-6">
                <div class="my-margin-for-list-of-clients">
                    <img style="width: 100px; float: right; display: block; color: white;" src="https://i1.wp.com/www.winhelponline.com/blog/wp-content/uploads/2017/12/user.png?fit=256%2C256&quality=100">
                    <h4 style="color: white;">${client.name} ${client.surname}</h4>
                    <h5 style="margin: 2px 10px; color: white;">${client.phone}</h5>
                    <h5 style="margin: 2px 10px; color: white;">${client.age} years old, ${client.placeOfBirth}</h5>
                    <h5 style="margin: 2px 10px; color: white;">${client.experience} year(s) of practice</h5>
                    <h5 style="margin: 2px 10px; color: white;">${client.countOfTrips} finished trip(s)</h5>
                    <a href="/lend/refuse/${client.id}/${particularOrder.id}" style="float: right; margin: 2px" class="btn btn-warning btn-sm">Refuse</a>
                    <a href="/lend/confirm/${client.id}/${particularOrder.id}" style="float: right; margin: 2px" class="btn btn-primary btn-sm">Confirm</a>
                </div>
            </div>
        </a:forEach>

        <a:forEach items="${reservedOrder}" var="client">
            <div class="my-list-of-clients col-md-6 col-xs-6">
                <div class="my-margin-for-client">
                    <img style="width: 100px; float: right; display: block; color: white;" src="https://i1.wp.com/www.winhelponline.com/blog/wp-content/uploads/2017/12/user.png?fit=256%2C256&quality=100">
                    <h4 style="color: white;">${client.name} ${client.surname}</h4>
                    <h5 style="margin: 2px 10px; color: white;">${client.phone}</h5>
                    <h5 style="margin: 2px 10px; color: white;">${client.age} years old, ${client.placeOfBirth}</h5>
                    <h5 style="margin: 2px 10px; color: white;">${client.experience} year(s) of practice</h5>
                    <h5 style="margin: 2px 10px; color: white;">${client.countOfTrips} finished trip(s)</h5>
                    <a href="/lend/complete/${particularOrder.id}" style="float: right; margin: 2px" class="btn btn-warning btn-sm">Complete</a>
                </div>
            </div>
        </a:forEach>
    </div>
</div>

<div class="my-form-for-finished-orders col-md-5 col-xs-12">
        <div class="form-row">
            <h2 style="color: white">Finished trips</h2>
        </div>
    <div style="height:390px; overflow:auto;">
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

</body>
</html>