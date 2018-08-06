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
        <%@include file='profile-style.css' %>
        <%@include file='main-style.css' %>
    </style>
    <title>Profile</title>
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


<div class="container-profile">
    <div class="row" >
        <div class="header col-12" style="padding: 0px; margin: 0px;">
            <img src="https://s3.amazonaws.com/drivers-bucket/${driver.photo}" style="width: 250px; height: 250px; float: left; margin: 80px 0 0 50px; border: 4px solid white">
            <div class="header-background"></div>
            <h2 style="margin: 8px; text-align: right"><b>${driver.name} ${driver.surname}</b></h2>
        </div>
    </div>
    <div class="row">
        <div class="col-12" style="padding: 0px; margin-bottom: 10px;">
            <div class="left-side col-md-4 col-xs-12">
                    <div class="info-about-driver-or-car ">
                            <h4 style="border-bottom: solid 1px #b39898; padding-bottom: 7px;">About driver</h4>
                            <h5 style="padding-left: 20px;">
                                ${driver.phone}<br>
                                ${driver.age} years old<br>
                                ${driver.experience} years of experience<br>
                                ${driver.countOfTrips} completed trips<br>
                                Native city: ${driver.placeOfBirth}<br>
                            </h5>
                    </div>

                    <div class="info-about-driver-or-car ">
                            <h4  style="border-bottom: solid 1px #b39898; padding-bottom: 7px;">
                                About car
                            </h4>
                            <h5 style="padding-left: 20px;">
                                    <b>${driversCar.brand} ${driversCar.model}</b><br>
                                    Year of manufacture: <b>${driversCar.yearOfManufacture}</b><br>
                                    Transmission: <b>${driversCar.transmission}</b><br>
                                    Type of body: <b>${driversCar.body}</b><br>
                                    Number of doors: <b>${driversCar.numberOfDoors}</b><br>
                                    Type of fuel: <b>${driversCar.engine}</b><br>
                                    Drive: <b>${driversCar.drive}</b><br>
                            </h5>
                    </div>
            </div>
            <div class="right-side col-md-8 col-xs-12">
                <div class="additional-right-side-because-margin">
                    <%--@elvariable id="comment" type="java"--%>
                    <form:form class="form-inline " action="/profile/${driver.id}/${idOfAuthorizedDriver}" method="post" modelAttribute="comment">
                        <div class="col-md-12">
                            <form:label path="text" for="exampleFormControlTextarea1" cssStyle=" border-bottom: solid 1px #b39898; width: 100%"><h4 style="width: 100%">Write a comment!</h4></form:label>
                            <form:textarea  path="text"  id="exampleFormControlTextarea1" rows="2" cssStyle="width: 100%; margin-top: 15px;"/>
                        </div>
                        <div class="form-group  invalid-feedback" style="font-size: 14px; margin: 0px 0 0 20px; ">
                            <form:errors path="text"/>
                        </div>
                        <div style="float: right; margin: 10px 0 10px 0;" class="col-md-12">
                            <button style="float: right" type="submit" class="btn btn-success">Send</button>
                        </div>
                    </form:form>
                </div>
            </div>

            <div class="right-side col-md-8 col-xs-12">
                <div class="additional-right-side-because-margin">
                    <a:forEach var="comment" items="${comments}">
                        <div class="comment-decorator">
                            <h5 style="float: right; margin-top: 5px;">${comment.date}</h5>
                            <div class="comment" style="background-image: url(https://s3.amazonaws.com/cars-bucket/${comment.photoOfSendersCar});" >
                               <div class="comment-inside">
                                    <img src="https://s3.amazonaws.com/drivers-bucket/${comment.photoOfSender}" style="width: 80px; float: left; height: 80px;  border: #e9ebee 3px solid; margin: 10px;">
                                   <h3 style="margin-top: 0px; text-align: center;"><a style="color: white";  href="/profile/${comment.senderId}">${comment.name} ${comment.surname}</a></h3> <br>
                               </div>
                             </div>
                            <div class="comment-text">${comment.text}</div>
                        </div>
                    </a:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <a href="#"><img src="http://www.aphi.nz/img/linkedin.png" style="height: 40px; border-radius: 4px; border: 1px solid white; margin: 5px 0px;"></a>
    <a href="#"><img src="http://www.jmkxyy.com/find-me-on-facebook-icon/find-me-on-facebook-icon-11.jpg" style="height: 40px; border-radius: 4px; border: 1px solid white; margin: 5px 0px;"></a>
    <a href="#"><img src="https://www.modmy.com/sites/modmy.com/files/styles/large/public/article-images/2017/08/github-app-button.png?itok=ONaR9O8z" style="height: 42px; margin: 5px opx;"></a>
</div>
</body>
</html>