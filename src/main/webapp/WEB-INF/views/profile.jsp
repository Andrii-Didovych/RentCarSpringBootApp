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
        <%@include file='admin-style.css' %>
    </style>
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
    <div class="container">
        <div class="row">
            <div class="col-3"></div>
            <div class="col-4">
                <img src="img/${driver.photo}">

                <table class="table table-bordered table-dark">
                    <tbody>
                        <tr>
                            <td class="text-right">Name</td>
                            <td>${driver.name}</td>
                        </tr>
                        <tr>
                            <td class="text-right">Surname</td>
                            <td>${driver.surname}</td>
                        </tr>
                        <tr>
                            <td class="text-right">Phone</td>
                            <td>${driver.phone}</td>
                        </tr>
                        <tr>
                            <td class="text-right">Age</td>
                            <td>${driver.age}</td>
                        </tr>
                        <tr>
                            <td class="text-right">Experience</td>
                            <td>${driver.experience}</td>
                        </tr>
                        <tr>
                            <td class="text-right">Count of trips</td>
                            <td>${driver.countOfTrips}</td>
                        </tr>
                        <tr>
                            <td class="text-right">Place of birth</td>
                            <td>${driver.placeOfBirth}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-5">
                <a href="/profile/edit" class="btn btn-info ">Edit</a>
            </div>
        </div>
        <div class="row">
            <div class="col-3"></div>
            <div class="col-4">
                <table class="table table-bordered table-dark">
                    <tbody>
                    <tr>
                        <td class="text-right">Brand</td>
                        <td>${driversCar.brand}</td>
                    </tr>

                    <tr>
                        <td class="text-right">Model</td>
                        <td>${driversCar.model}</td>
                    </tr>
                    <tr>
                        <td class="text-right">Production</td>
                        <td>${driversCar.yearOfManufacture}</td>
                    </tr>
                    <tr>
                        <td class="text-right">Engine</td>
                        <td>${driversCar.engine}</td>
                    </tr
                    <tr>
                        <td class="text-right">Transmission</td>
                        <td>${driversCar.transmission}</td>
                    </tr>
                    <tr>
                        <td class="text-right">Drive</td>
                        <td>${driversCar.drive}</td>
                    </tr>
                    <tr>
                        <td class="text-right">Body</td>
                        <td>${driversCar.body}</td>
                    </tr>
                    <tr>
                        <td class="text-right">Doors</td>
                        <td>${driversCar.numberOfDoors}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>