<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <%@include file='admin-style.css' %>
    </style>
    <title>Brand</title>
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
    <div class="admin-container">
        <div class="row" style="margin: 10px -15px 10px -15px">
            <div class="col-5">
                <%--@elvariable id="brand" type="java"--%>
                <form:form class="form-inline" action="/admin/brand" method="post" modelAttribute="brand">
                    <custom:hiddenInputs excludeParams="name"/>
                    <div>
                        <form:input path="name" class="form-control"  placeholder="Add name"/>
                        <button type="submit" class="btn btn-sm btn-success" style="margin: 5px 0;">Save</button>
                        <a href="/admin/brand/cancel<custom:allParams/>" class="btn btn-sm btn-info" style="padding-left:6px; padding-right: 6px">Cancel</a>
                    </div>
                    <div class="col-md-12" style="font-size: 14px; color: red; margin-left: 15px;">
                        <form:errors path="name"/>
                    </div>
                </form:form>
            </div>
            <div class="col-7">
                <%--@elvariable id="filter" type="java"--%>
                <form:form class="form-inline" cssStyle="float: right" action="/admin/brand" modelAttribute="filter" method="get">
                        <form:input path="search" class="form-control" cssStyle="margin: 0 5px 2px 0;" placeholder="Find by name"/>
                        <button type="submit" style="margin-right: 5px;" class="btn btn-primary btn-sm">Search</button>
                        <custom:size posibleSizes="1,2,5,10" size="${brands.size}"/>
                        <span style="margin-left: 5px;">
                            <button class="btn btn-primary btn-sm "  data-toggle="dropdown">
                                Sort
                                <span class="caret"></span>
                            </button>
                            <div class="dropdown-menu">
                                <custom:sort innerHtml="Name asc" paramValue="name"/>
                                <custom:sort innerHtml="Name desc" paramValue="name,desc"/>
                            </div>
                        </span>
                </form:form>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <table class="table table-bordered table-dark">
                    <thead>
                        <tr>
                            <th scope="col" class="text-center">Brand</th>
                            <th scope="col" class="text-center">Options</th>
                        </tr>
                    </thead>
                    <tbody>
                        <a:forEach var="brand" items="${brands.content}">
                            <tr>
                                <td class="text-center">${brand.name}</td>
                                <td class="text-center">
                                    <a href="/admin/brand/update/${brand.id}<custom:allParams/>" class="btn btn-warning btn-sm">Update</a>
                                    <a href="/admin/brand/delete/${brand.id}<custom:allParams/>" class="btn btn-danger btn-sm">Delete</a>
                                </td>
                            </tr>
                        </a:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-12 text-center" style="height: 10px">
                <custom:pageable page="${brands}"/>
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