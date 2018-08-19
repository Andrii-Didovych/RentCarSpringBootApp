<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="custom" uri="/WEB-INF/tags/implicit.tld"  %>


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
        <%@include file='css/borrow-style.css' %>
    </style>
    <title>Borrow</title>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-light  " style="background-color: #563d7c; border-radius: 0px; margin: 0px; " >
    <a class="navbar-brand " href="/"><span style="color: white; font-size: 20px; font-family: Arial; color: #f0ad4e" >RentCar</span></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
            <sec:authorize access="isAuthenticated()">
                <li class="nav-item">
                    <a class="nav-link" href="/lend"><span style="color: #f0ad4e; font-size: 16px">Lend</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/borrow"><span style="color: #f0ad4e; font-size: 16px">Borrow</span></a>
                </li>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/admin" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span style="color: #f0ad4e; font-size: 16px">Admin</span>
                    </a>
                    <div class="dropdown-menu" style="background-color: #f0ad4e;" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" style="color: #563d7c;" href="/admin/brand"><b>Brand</b></a>
                        <a class="dropdown-item" style="color: #563d7c;" href="/admin/city"><b>City</b></a>
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
                    <span style="color: #f0ad4e; font-size: 16px">Profile</span>
                </a>
                    <div class="dropdown-menu" style="background-color: #f0ad4e;"  aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" style="color: #563d7c;" href="/profile/${idOfAuthorizedDriver}"><b>See profile</b></a>
                        <a class="dropdown-item" style="color: #563d7c" href="/edit"><b>Edit</b></a>
                    </div>
                </li>
                <form:form action="/logout">
                    <span>
                        <a><button class="my-button-like-link">Logout</button></a>
                    </span>
                </form:form>
            </sec:authorize>
        </ul>
    </div>
</nav>
<div class="borrow-container">
    <div class="borrow-container-for-width">

                    <h2 class="header-of-filter-text"><b>There is a car which you're looking for</b></h2>
                    <%--@elvariable id="carFilter" type="java"--%>
                    <form:form action="/borrow" method="get" modelAttribute="carFilter">
                        <div class="filter-form">
                            <div class="form-group">
                                    <label for="city">Region</label>
                                    <select class="form-control" name="region" id="city" style="height: 33px;">
                                        <option selected>${missing}</option>
                                        <c:forEach  var="region" items="${cities}">
                                            <option name="region">${region}</option>
                                        </c:forEach>
                                    </select>
                            </div>
                            <div class="form-group">
                                    <form:label path="minPrice">Min price</form:label>
                                    <form:input path="minPrice" class="form-control" placeholder="Min price"/>
                            </div>
                            <div class="form-group">
                                    <form:label path="maxPrice">Max price</form:label>
                                    <form:input path="maxPrice" class="form-control" placeholder="Max price"/>
                            </div>
                            <div class="form-group">
                                    <form:label path="periodOfRentFrom" for="periodOfRentFrom">Rent from</form:label>
                                    <input placeholder="Rent from" class="textbox-n form-control" name="periodOfRentFrom" type="text" onfocus="(this.type='date')"  id="periodOfRentFrom"/>
                            </div>
                            <div class="form-group">
                                    <form:label path="periodOfRentTo" for="periodOfRentTo">Rent to</form:label>
                                    <input placeholder="Rent to" class="textbox-n form-control" name="periodOfRentTo" type="text" onfocus="(this.type='date')"  id="periodOfRentTo"/>
                            </div>
                        </div>
                        <div class="helpfull-filters">
                        <div class="filter-form">
                                <div class="form-group">
                                    <label for="brand">Brand</label>
                                    <select class="form-control" name="brand" id="brand" style="height: 25px; padding: 2px;">
                                        <option selected>${missing}</option>
                                        <c:forEach  var="brand" items="${brands}">
                                            <option name="brand">${brand}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <form:label path="model">Model</form:label>
                                    <form:input path="model" placeholder="Input model" class="form-control" cssStyle="padding: 2px; height: 25px;"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="chauffeur">Chauffeur</form:label>
                                    <form:select class="form-control" cssStyle="padding: 2px;" path="chauffeur" items="${chauffeurs}"  />
                                </div>

                                <div class="form-group">
                                    <form:label path="body">Body</form:label>
                                    <form:select  path="body" items="${bodies}"  class="form-control" cssStyle="padding: 2px;"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="door">Door</form:label>
                                    <form:select  path="door" items="${doors}"  class="form-control" cssStyle="padding: 2px;"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="drive">Drive</form:label>
                                    <form:select  path="drive" items="${drives}"  class="form-control" cssStyle="padding: 2px;"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="engine">Engine</form:label>
                                    <form:select path="engine" items="${engines}"  class="form-control" cssStyle="padding: 2px;"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="transmission">Transmission</form:label>
                                    <form:select path="transmission" items="${transmissions}"  class="form-control" cssStyle="padding: 2px;"/>
                                </div>

                                <div class="form-group" style="text-align: right">
                                        <button class="btn btn-success btn-md" type="submit">Find</button>
                                </div>
                        </div>
                        </div>
                    </form:form>



                <div class="container-for-free-cars">
                        <a:forEach var="order" items="${freeCars.content}">
                            <div class="one-order">
                                    <div class="about-car">
                                            <div class="background-of-order" style="background-image: url(https://s3.amazonaws.com/cars-bucket/${order.photoOfCar});" >
                                                <div class="background-for-color">
                                                    <img src="https://s3.amazonaws.com/drivers-bucket/${order.photoOfDriver}">
                                                    <a class="btn btn-success btn-sm" href="/borrow/choose/${order.id}<custom:allParams/>">Take it</a>
                                                    <h3 style="margin: auto 5px;"><a style="text-decoration: none; color: #f0ad4e" href="/profile/${order.driverId}">${order.brand} ${order.model}</a></h3> <br>
                                                </div>
                                            </div>
                                    </div>
                                    <div class="about-order">
                                        <div class="order">
                                            <p>Rent from: <b>${order.periodOfRentFrom}</b><br></p>
                                            <p>Rent to: <b>${order.periodOfRentTo}</b><br></p>
                                            <p>City: <b>${order.region}</b><br></p>
                                            <p>Chauffeur: <b>${order.chauffeur}</b><br></p>
                                            <p>Price: <b>${order.pricePerDay}</b></p>
                                        </div>
                                        <div class="button-of-order">
                                            <a class="btn btn-success btn-sm" href="/borrow/choose/${order.id}<custom:allParams/>">Take it</a>
                                        </div>
                                    </div>
                            </div>
                        </a:forEach>
                </div>
                <div class="row size-of-page">
                        <span style="margin-left: 5px"><custom:pageable page="${freeCars}"/></span>
                        <span  style="margin: 23px 0 0 5px;">
                            <custom:size posibleSizes="1,2,5,10" size="${freeCars.size}"/>
                        </span>
                </div>
         <%----%>

        <%----%>
        <div class="container-for-finished-trips">
            <div class="header-of-order-container"><h2>Wishes</h2></div>
            <div class="finished-trips">
                <a:forEach items="${selectedOrders}" var="order">
                    <div class="one-trip">
                        <div class="trip-info">
                            City: <b>${order.region}</b> |
                            Price: <b>${order.pricePerDay}</b> |
                            Chauffeur: <b>${order.chauffeur}</b> |
                            Rent from: <b>${order.periodOfRentFrom}</b> |
                            Rent to: <b>${order.periodOfRentTo}</b>
                        </div>
                        <div class="buttons-of-trip">
                            <a  href="/borrow/delete/${order.driverId}/${order.id}<custom:allParams/>" class="btn btn-warning btn-sm">Delete</a>
                            <a class="btn btn-primary btn-sm" href="/profile/${order.driverId}">Driver</a>
                        </div>
                    </div>
                </a:forEach>
                <a:forEach items="${reservedOrder}" var="order">
                    <div class="message"><b>${messageAboutTrip}</b></div>
                    <div class="one-trip">
                        <div class="trip-info">
                            City: <b>${order.region}</b> |
                            Price: <b>${order.pricePerDay}</b> |
                            Chauffeur: <b>${order.chauffeur}</b> |
                            Rent from: <b>${order.periodOfRentFrom}</b> |
                            Rent to: <b>${order.periodOfRentTo}</b>
                        </div>
                        <div class="buttons-of-trip">
                            <a  class="btn btn-primary btn-sm" href="/profile/${order.driverId}">Driver</a>
                            <a  href="/borrow/complete/${order.id}<custom:allParams/>" class="btn btn-warning btn-sm">Complete</a>
                        </div>
                    </div>
                </a:forEach>
            </div>
        </div>

        <div class="container-for-finished-trips">
            <div class="header-of-order-container"><h2>Finished trips</h2></div>
            <div class="finished-trips">
                <a:forEach items="${finishedOrders}" var="order">
                    <div class="one-trip">
                        <div class="trip-info">
                            City: <b>${order.region}</b> |
                            Price: <b>${order.pricePerDay}</b> |
                            Chauffeur: <b>${order.chauffeur}</b> |
                            Rent from: <b>${order.periodOfRentFrom}</b> |
                            Rent to: <b>${order.periodOfRentTo}</b>
                        </div>
                        <div class="buttons-of-trip">
                            <a style="float: right" href="/profile/${order.driverId}" class="btn btn-warning btn-sm">Driver</a>
                        </div>
                    </div>
                </a:forEach>
            </div>
        </div>
        <%--</div>--%>
    </div>
</div>
<div class="footer">
    <div class="footer-content">
        <a target="_blank" href="https://www.linkedin.com/in/andrii-didovych/"><img src="http://www.aphi.nz/img/linkedin.png" style="height: 40px; border-radius: 4px; border: 1px solid white;"></a>
        <a target="_blank" href="https://www.facebook.com/profile.php?id=100008114774126"><img src="http://www.jmkxyy.com/find-me-on-facebook-icon/find-me-on-facebook-icon-11.jpg" style="height: 40px; border-radius: 4px; border: 1px solid white; "></a>
        <a target="_blank" href="https://github.com/Andrii-Didovych/RentCarSpringBootApp"><img src="https://www.modmy.com/sites/modmy.com/files/styles/large/public/article-images/2017/08/github-app-button.png?itok=ONaR9O8z" style="height: 42px;"></a>
    </div>
</div>
</body>
</html>