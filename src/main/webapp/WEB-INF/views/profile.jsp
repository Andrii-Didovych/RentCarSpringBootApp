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
        <%@include file='css/profile-style.css' %>
    </style>
    <title>Profile</title>
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


<div class="container-profile">
    <div class="container-profile-for-width">
            <div class="header" >
                <div class="header-background">
                    <img src="https://s3.amazonaws.com/drivers-bucket/${driver.photo}" >
                </div>
                <div class="header-picture-xs">
                    <img src="https://s3.amazonaws.com/drivers-bucket/${driver.photo}" >
                </div>
                <h2><b>${driver.name} ${driver.surname}</b></h2>
            </div>
            <div class="main">
                    <div class="left-side">
                            <div class="info-about-driver-or-car ">
                                    <h4>About driver</h4>
                                    <h5>
                                        ${driver.phone}<br>
                                        ${driver.age} years old<br>
                                        ${driver.experience} years of experience<br>
                                        ${driver.countOfTrips} completed trips<br>
                                        Native city: ${driver.placeOfBirth}<br>
                                    </h5>
                            </div>
                            <div class="info-about-driver-or-car ">
                                    <h4>About car</h4>
                                    <h5>
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

                    <div class="right-side">
                        <div class="form-comment">
                            <%--@elvariable id="comment" type="java"--%>
                            <form:form cssStyle="width: 100%"  action="/profile/${driver.id}/${idOfAuthorizedDriver}" method="post" modelAttribute="comment">
                                <div class="input-form">
                                    <form:label path="text" for="exampleFormControlTextarea1"><h4>Write a comment!</h4></form:label>
                                    <form:textarea  path="text"  id="exampleFormControlTextarea1" rows="2"/>
                                </div>
                                <div class="error">
                                    <form:errors path="text"/>
                                </div>
                                <div class="button-of-comment">
                                    <button type="submit" class="btn btn-success">Send</button>
                                </div>
                            </form:form>
                        </div>
                        <a:forEach var="comment" items="${comments}">
                            <div class="comment">
                                <div class="container-for-header">
                                    <div class="comment-background" style="background-image: url(https://s3.amazonaws.com/cars-bucket/${photoOfCarForComment});" >
                                        <div class="comment-inside">
                                            <img src="https://s3.amazonaws.com/drivers-bucket/${comment.photoOfSender}">
                                            <h4 class="name-and-surname"><a href="/profile/${comment.senderId}">${comment.name} ${comment.surname}</a></h4>
                                        </div>
                                    </div>
                                    <div class="comment-date">
                                        <h5>${comment.date}</h5>
                                    </div>
                                </div>
                                <div class="comment-text">${comment.text}</div>
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