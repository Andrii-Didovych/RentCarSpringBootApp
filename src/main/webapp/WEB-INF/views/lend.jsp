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
        <%@include file='css/lend-style.css' %>
    </style>
    <title>Lend</title>
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

<div class="main-container">
    <div class="container-for-width">
        <div class="lend-car">
                    <%--@elvariable id="car" type="java"--%>
                    <form:form  action="/lend" method="post"  modelAttribute="car">
                        <div class="text-of-lend">
                            <h2><b>Lend car to somebody who needs it</b> </h2>
                            <h4><b>Your vehicle is able to earn money for you by itself</b></h4>
                        </div>
                        <div class="error">
                            <form:errors>${message}</form:errors>
                            <form:errors path="periodOfRentFrom"/>
                            <form:errors path="periodOfRentTo"/>
                            <form:errors path="pricePerDay"/>
                        </div>
                        <div class="form-for-inputs">
                                <div class="form-group">
                                    <form:label path="region" for="region">City</form:label>
                                    <form:select class="custom-select form-control" path="region" id="city" style="height: 33px;">
                                        <option selected>${missing}</option>
                                        <c:forEach  var="city" items="${cities}">
                                            <option name="city">${city}</option>
                                        </c:forEach>
                                    </form:select>
                                </div>
                                <div class="form-group">
                                    <form:label path="periodOfRentFrom" for="periodOfRentFrom">Rent from</form:label>
                                    <input placeholder="Rent from" class="textbox-n form-control" name="periodOfRentFrom" type="text" onfocus="(this.type='date')"  id="periodOfRentFrom"/>
                                </div>

                                <div class="form-group">
                                    <form:label path="periodOfRentTo" for="periodOfRentTo" >Rent to</form:label>
                                    <input placeholder="Rent to" class="textbox-n form-control" name="periodOfRentTo" type="text" onfocus="(this.type='date')"  id="periodOfRentTo"/>
                                </div>

                                <div class="form-group">
                                    <form:label path="pricePerDay" for="pricePerDay">Price</form:label>
                                    <form:input path="pricePerDay" class="form-control" id="pricePerDay"  placeholder="Input price"/>
                                </div>

                                <div class="form-group">
                                    <form:label path="chauffeur" for="chauffeur">Chauffeur</form:label>
                                    <form:select  path="chauffeur" items="${chauffeurs}" id="chauffeur" cssStyle="height: 33px" class="form-control"/>
                                </div>
                        </div>
                        <div class="lend-button">
                            <button type="submit"  class="btn btn-success my-button-float-right">Add car</button>
                        </div>
                    </form:form>
        </div>
        <div class="container-for-particular-order">
            <div class="header-of-order-container"><h2>Particular order</h2></div>
            <div class="my-message"><b> ${myMessage}</b></div>
            <div class="particular-order">
                City: <b>${particularOrder.region}</b> |
                Rent from: <b>${particularOrder.periodOfRentFrom}</b> |
                Rent to: <b>${particularOrder.periodOfRentTo}</b> |
                Price: <b>${particularOrder.pricePerDay}</b> |
                Chauffeur: <b>${particularOrder.chauffeur}</b> |
                <a href="/lend/delete" class="btn btn-warning btn-sm">Delete</a>
            </div>
            <div class="list-of-clients-container" >
                <a:forEach items="${clients}" var="client">
                    <div class="list-of-clients">
                        <img  src="https://s3.amazonaws.com/drivers-bucket/${client.photo}">
                        <h4><a href="/profile/${client.id}"><b> ${client.name} ${client.surname}</b></a></h4>
                        <h5>${client.phone}</h5>
                        <h5>${client.age} years old, ${client.placeOfBirth}</h5>
                        <h5>${client.experience} year(s) of practice</h5>
                        <h5>${client.countOfTrips} finished trip(s)</h5>
                        <div  class="buttons">
                            <a href="/lend/refuse/${client.id}/${particularOrder.id}" class="btn btn-warning btn-sm">Refuse</a>
                            <a href="/lend/confirm/${client.id}/${particularOrder.id}"  class="btn btn-primary btn-sm">Confirm</a>
                        </div>
                    </div>
                </a:forEach>
                <a:forEach items="${reservedOrder}" var="client">
                    <div class="list-of-clients">
                        <div class="message"><b> ${infoAboutOrder}</b></div>
                        <img  src="https://s3.amazonaws.com/drivers-bucket/${client.photo}">
                        <h4><a href="/profile/${client.id}"><b> ${client.name} ${client.surname}</b></a></h4>
                        <h5>${client.phone}</h5>
                        <h5>${client.age} years old, ${client.placeOfBirth}</h5>
                        <h5>${client.experience} year(s) of practice</h5>
                        <h5>${client.countOfTrips} finished trip(s)</h5>
                        <div  class="buttons">
                            <a href="/lend/complete/${particularOrder.id}" style="float: right; margin: 2px" class="btn btn-warning btn-sm">Complete</a>
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
                            <a style="margin-top: -5px; float: right" href="/profile/${order.driverId}" class="btn btn-warning btn-sm">Driver</a>
                            City: <b>${order.region}</b> |
                            Price: <b>${order.pricePerDay}</b> |
                            Chauffeur: <b>${order.chauffeur}</b> |
                            Rent from: <b>${order.periodOfRentFrom}</b> |
                            Rent to: <b>${order.periodOfRentTo}</b>
                        </div>
                </a:forEach>
            </div>
        </div>
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