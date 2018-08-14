<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <%@include file='admin-style.css' %>
    </style>
    <title>City</title>
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

<div class="admin-container">
    <div class="row" style="margin: 0px; ">
        <div class="col-sm-6 col-xs-12" style="margin: 0px;">
            <%--@elvariable id="city" type="java"--%>
            <form:form action="/admin/city" method="post" modelAttribute="city">
                <custom:hiddenInputs excludeParams="name"/>
                <div>
                    <form:input path="name" class="form-control"  placeholder="Name"/>
                    <button type="submit" class="btn btn-sm btn-success" style="margin: 5px 0; padding: 3px 8px;">Save</button>
                    <a href="/admin/city/cancel<custom:allParams/>" class="btn btn-sm btn-info" style="padding: 3px;">Cancel</a>
                </div>
                <div style="font-size: 14px; color: #563d7c;   margin: 5px 0px;  text-align: left">
                    <form:errors cssStyle="background-color: #f0ad4e; border-radius: 2px; padding: 3px;" path="name"/>
                </div>
            </form:form>
        </div>
        <div class="col-sm-6 col-xs-12" style="margin: 0px;">
            <%--@elvariable id="filter" type="java"--%>
            <form:form  action="/admin/city" modelAttribute="filter" method="get">
                <form:input path="search" class="form-control" cssStyle="margin: 0 5px 5px 0;" placeholder="Find by name"/>
                <span style="display: flex; flex-direction: row; align-items: right;">
                    <span>
                        <button type="submit" style="margin-right: 5px; padding-left: 10px; padding-right: 10px;" class="btn btn-primary btn-sm">Find</button>
                    </span>
                    <span style="padding-right: 5px; ">
                        <custom:size posibleSizes="1,2,5,10" size="${cities.size}"/>
                    </span>
                    <span>
                            <span>
                                <button class="btn btn-primary btn-sm "  data-toggle="dropdown">
                                    Sort
                                    <span class="caret"></span>
                                </button>
                                <div class="dropdown-menu">
                                    <custom:sort innerHtml="Name asc" paramValue="name"/>
                                    <custom:sort innerHtml="Name desc" paramValue="name,desc"/>
                                </div>
                            </span>
                    </span>
                </span>
            </form:form>
        </div>
    </div>
    <div class="row" style="margin: 0px">
        <div class="col-12">
            <table class="table  table-dark">
                <thead >
                <tr>
                    <th scope="col" style="width: 50%" class="text-center">City</th>
                    <th scope="col" style="width: 50%" class="text-center">Options</th>
                </tr>
                </thead>
                <tbody>
                <a:forEach var="city" items="${cities.content}">
                    <tr>
                        <td class="text-center">${city.name}</td>
                        <td class="text-center">
                            <a href="/admin/city/update/${city.id}<custom:allParams/>"  class="btn btn-warning btn-sm" >Update</a>
                            <a href="/admin/city/delete/${city.id}<custom:allParams/>" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                </a:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row" style="margin: 0px; padding: 0px;">
        <div class="col-12 text-center" style="height: 10px; padding-bottom: 100px;">
            <custom:pageable page="${cities}"/>
        </div>
    </div>
</div>
<div class="footer">
    <a target="_blank" href="https://www.linkedin.com/in/andrii-didovych/"><img src="http://www.aphi.nz/img/linkedin.png" style="height: 40px; border-radius: 4px; border: 1px solid white;"></a>
    <a target="_blank" href="https://www.facebook.com/profile.php?id=100008114774126"><img src="http://www.jmkxyy.com/find-me-on-facebook-icon/find-me-on-facebook-icon-11.jpg" style="height: 40px; border-radius: 4px; border: 1px solid white; "></a>
    <a target="_blank" href="https://github.com/Andrii-Didovych/RentCarSpringBootApp"><img src="https://www.modmy.com/sites/modmy.com/files/styles/large/public/article-images/2017/08/github-app-button.png?itok=ONaR9O8z" style="height: 42px;"></a>
</div>
</body>
</html>