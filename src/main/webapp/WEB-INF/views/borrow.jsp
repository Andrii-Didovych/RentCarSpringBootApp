<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="custom" uri="/WEB-INF/tags/implicit.tld"  %>


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
<div class="row">
    <div class="col-12">
        <div class="container-for-filter">
            <div class="main-container-borrow col-md-6 col-xs-12">
                <div class="filler-form-for-borrow">
                    <%--<h2 style="color: white; text-align: center;margin: 50px;">There is a car which you're looking for</h2>--%>
                    <%--@elvariable id="carFilter" type="java"--%>
                    <form:form action="/borrow" method="get" modelAttribute="carFilter">
                        <div class="form-group row">
                            <div class="col-4">
                                <label for="city" style="color: white; float: right">Region</label>
                                <select class="custom-select" name="region" id="city" style="height: 33px;">
                                    <option selected>${missing}</option>
                                    <c:forEach  var="region" items="${cities}">
                                        <option name="region">${region}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="col-4">
                                <form:label path="minPrice" cssStyle="color: white; float: right">Min price</form:label>
                                <form:input path="minPrice" class="form-control" placeholder="Min price"/>
                            </div>
                            <div class="col-4">
                                <form:label path="maxPrice" cssStyle="color: white; float: right">Max price</form:label>
                                <form:input path="maxPrice" class="form-control" placeholder="Max price"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6 col-xs-6">
                                <form:label path="periodOfRentFrom" for="periodOfRentFrom"  cssStyle="color: white; float: right">Rent from</form:label>
                                <input  type="date" name="periodOfRentFrom" id="periodOfRentFrom" class="form-control"/>
                            </div>
                            <div class="col-md-6 col-xs-6">
                                <form:label path="periodOfRentTo" for="periodOfRentTo"  cssStyle="color: white; float: right">Rent to</form:label>
                                <input  type="date" name="periodOfRentTo" id="periodOfRentTo" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-4">
                                <label for="brand" style="color: white; margin-top: 40px;">Brand</label>
                                <select class="custom-select" name="brand" id="brand" style="height: 25px; padding: 2px;">
                                    <option selected>${missing}</option>
                                    <c:forEach  var="brand" items="${brands}">
                                        <option name="brand">${brand}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-4" >
                                <form:label path="model"   cssStyle="color: white; margin-top: 40px;">Model</form:label>
                                <form:input path="model" placeholder="Input model" class="form-control" cssStyle="padding: 2px; height: 25px;"/>
                            </div>
                            <div class="col-4">
                                <form:label path="chauffeur"   cssStyle="color: white; margin-top: 40px;">Chauffeur</form:label>
                                <form:select class="form-control" cssStyle="padding: 2px;" path="chauffeur" items="${chauffeurs}"  />
                            </div>

                            <div class="col-4">
                                <form:label path="body"   cssStyle="color: white; margin-top: 10px;">Body</form:label>
                                <form:select  path="body" items="${bodies}"  class="form-control" cssStyle="padding: 2px;"/>
                            </div>
                            <div class="col-4">
                                <form:label path="door"   cssStyle="color: white; margin-top: 10px;">Door</form:label>
                                <form:select  path="door" items="${doors}"  class="form-control" cssStyle="padding: 2px;"/>
                            </div>
                            <div class="col-4">
                                <form:label path="drive"   cssStyle="color: white; margin-top: 10px;">Drive</form:label>
                                <form:select  path="drive" items="${drives}"  class="form-control" cssStyle="padding: 2px;"/>
                            </div>
                            <div class="col-4">
                                <form:label path="engine"   cssStyle="color: white;margin-top: 10px; ">Engine</form:label>
                                <form:select path="engine" items="${engines}"  class="form-control" cssStyle="padding: 2px;"/>
                            </div>
                            <div class="col-4" >
                                <form:label path="transmission"   cssStyle="color: white; margin-top: 10px;">Transmission</form:label>
                                <form:select path="transmission" items="${transmissions}"  class="form-control" cssStyle="padding: 2px;"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-12">
                                <button class="btn btn-success btn-md" style="float: right;" type="submit">Find</button>
                            </div>
                        </div>
                    </form:form>
                </div>
                <div class="row">
                    <div class="col-12">
                        <a:forEach var="order" items="${freeCars.content}">
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
                                            <a style="margin-top: -8px; margin-left: -9px;"  class="btn btn-success btn-sm" href="/borrow/choose/${order.id}<custom:allParams/>">Take it</a>
                                            <a style="margin-top: -8px;" class="btn btn-primary btn-sm" href="/profile/${order.driverId}'">Profile</a>
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
                <div class="row">
                    <div class="col-10 text-right">
                        <custom:pageable page="${freeCars}"/>
                    </div>
                    <div class="col-2" style="margin: 23px 0 0 -10px;">
                        <custom:size posibleSizes="1,2,5,10" size="${freeCars.size}"/>
                    </div>
                </div>
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
                                <a style="float: right; margin: 5px;" href="/borrow/delete/${order.driverId}/${order.id}<custom:allParams/>" class="btn btn-warning btn-sm">Delete</a>
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
                                <a style="float: right;margin: 5px;" href="/borrow/complete/${order.id}<custom:allParams/>" class="btn btn-warning btn-sm">Complete</a>
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
</div>
<div class="row">
    <div class="col-12">
        <div class="footer" style="margin-top: 10px;">
            <a href="#"><img src="http://www.aphi.nz/img/linkedin.png" style="height: 40px; border-radius: 4px; border: 1px solid white; margin: 5px 0px;"></a>
            <a href="#"><img src="http://www.jmkxyy.com/find-me-on-facebook-icon/find-me-on-facebook-icon-11.jpg" style="height: 40px; border-radius: 4px; border: 1px solid white; margin: 5px 0px;"></a>
            <a href="#"><img src="https://www.modmy.com/sites/modmy.com/files/styles/large/public/article-images/2017/08/github-app-button.png?itok=ONaR9O8z" style="height: 42px; margin: 5px opx;"></a>
        </div>
    </div>
</div>
</body>
</html>