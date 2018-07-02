<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <div class="col-12">
                <%--@elvariable id="city" type="java"--%>
                <form:form class="form-inline " action="/admin/city" method="post" modelAttribute="city">
                    <div class="form-group mx-sm-3 md-2 invalid-feedback" style="font-size: 14px">
                        <form:errors path="name"/>
                    </div>
                    <div class="form-group  mx-sm-3 mb-2">
                        <form:input path="name" class="form-control"  placeholder="Input name"/>
                    </div>
                    <button type="submit" class="btn btn-success mb-2">Save</button>
                    <a href="/admin/city/cancel" class="btn btn-info mb-2" style="margin-left: 5px; padding-left:6px; padding-right: 6px">Cancel</a>
                </form:form>
            </div>
        </div>

        <table class="table table-bordered table-dark">
            <thead>
                <tr>
                    <th scope="col" class="text-center">City</th>
                    <th scope="col" class="text-center">Options</th>
                </tr>
            </thead>
            <tbody>
                <a:forEach var="city" items="${cities}">
                    <tr>
                        <td class="text-center">${city.name}</td>
                        <td class="text-center">
                            <a href="/admin/city/update/${city.id}" class="btn btn-warning btn-sm">Update</a>
                            <a href="/admin/city/delete/${city.id}" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                </a:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>