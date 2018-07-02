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
<body style="background-image: url(http://ncwebcreations.com/wp-content/uploads/2016/12/pexels-photo-1-e1499782168666.jpg);">
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
        <div class="my-class-for-picture">
            <%--<img src="img/${driver.photo}">--%>
            <%--@elvariable id="fileRequest" type="java"--%>
            <form:form action="/profile/edit/picture" modelAttribute="fileRequest" enctype="multipart/form-data">
                <input type="file" name="file">
                <button>Ok</button>
            </form:form>
        </div>
        <div class="row my-edit-about-driver">
            <div class="col-sm-12"><h3>Driver</h3></div>
            <div class="col-sm-6">
                        <%--@elvariable id="driver" type="java"--%>
                        <form:form  action="/profile/edit/info"  modelAttribute="driver">
                            <div class="my-edit-info-form">
                                <div class="form-group row">
                                    <div class="col-9">
                                        <p style="margin: 0px; color: white; font-size: 16px;">Change main info</p>
                                    </div>
                                    <div class=" col-3">
                                        <button type="submit" class="btn btn-primary my-button-float-right">Change</button>
                                    </div>
                                </div>

                                <div class="row">
                                    <form:errors path="name" style="color: #07fff6"/>
                                    <form:errors style="color: #07fff6">${message}</form:errors>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-4">
                                        <form:label path="name" for="name" cssStyle="color: white; float: right">Name</form:label>
                                    </div>
                                    <div class="col-sm-8">
                                        <form:input path="name" class="form-control" id="name"  placeholder="Input new name"/>
                                    </div>
                                </div>

                                <div class="row">
                                    <form:errors path="surname" style="color: #07fff6"/>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-4">
                                        <form:label path="phone" for="surname" cssStyle="color: white; float: right">Surname</form:label>
                                    </div>
                                    <div class="col-sm-8">
                                        <form:input  path="surname" class="form-control" id="surname" placeholder="Input new surname"/>
                                    </div>
                                </div>

                                <div class="row">
                                    <form:errors path="phone" style="color: #07fff6"/>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-4">
                                        <form:label path="phone" for="phone" cssStyle="color: white; float: right">Phone</form:label>
                                    </div>
                                    <div class="col-sm-8">
                                         <form:input  path="phone" class="form-control" id="phone" placeholder="Input new number"/>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-4">
                                        <form:label path="placeOfBirth" for="place" cssStyle="color: white; float: right">City</form:label>
                                    </div>
                                    <div class="col-sm-8">
                                         <form:select  path="placeOfBirth" items="${cities}" id="place" cssStyle="height: 33px" class="form-control"/>
                                    </div>
                                </div>

                                <div class="row">
                                    <form:errors path="dateOfBirth" style="color: #07fff6;"/>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-4">
                                        <form:label path="dateOfBirth" for="birth" cssStyle="color: white; float: right">Birthday</form:label>
                                    </div>
                                    <div class="col-sm-8">

                                        <input  type="date" name="dateOfBirth" id="birth" class="form-control"/>
                                    </div>

                                </div>

                                <div class="row">
                                    <form:errors path="experienceBegan" style="color: #07fff6"/>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-4">
                                        <form:label path="experienceBegan" for="experienceBegan"  cssStyle="color: white; float: right">Start driving</form:label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input  type="date" name="experienceBegan" id="experienceBegan" class="form-control"/>
                                    </div>
                                </div>

                            </div>
                        </form:form>
                    </div>

                    <div class="col-sm-6">
                        <%--@elvariable id="user" type="java"--%>
                        <form:form  action="/profile/edit" method="post" modelAttribute="user">
                            <div class="my-edit-info-form">
                                <div class="form-group row">
                                    <div class="col-9">
                                        <p style="margin: 0px; color: white; font-size: 16px;">Change password</p>
                                    </div>
                                    <div class=" col-3">
                                        <button type="submit"  class="btn btn-primary my-button-float-right">Change</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <form:errors path="password" style="color: #07fff6"/>
                                    <form:errors style="color: #07fff6">${message}</form:errors>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-4">
                                        <form:label path="password" for="inputPassword" cssStyle="color: white; float: right">New password</form:label>
                                    </div>
                                    <div class="col-sm-8">
                                        <form:password path="password" class="form-control" id="inputPassword"  placeholder="Input new password"/>
                                    </div>
                                </div>

                                <div class="row">
                                    <form:errors path="repeatPassword" style="color: #07fff6"/>
                                    <form:errors style="color: #07fff6">${message}</form:errors>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-4">
                                        <form:label path="repeatPassword" for="repeatPassword" cssStyle="color: white; float: right">New password</form:label>
                                    </div>
                                    <div class="col-sm-8">
                                        <form:password path="repeatPassword" class="form-control" id="repeatPassword"  placeholder="Input new password"/>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                </div>
        </div>
        <div class="row my-edit-about-car">
            <div class="col-sm-12"><h2>Car</h2></div>
            <div class="col-sm-6"></div>
            <div class="col-sm-6">
                <%--@elvariable id="car" type="java"--%>
                <form:form  action="/profile/edit/car"  modelAttribute="car">
                    <div class="my-edit-info-form">
                        <div class="form-group row">
                            <div class="col-9">
                                <p style="margin: 0px; color: white; font-size: 16px;">Add or update car</p>
                            </div>
                            <div class=" col-3">
                                <button type="submit"  class="btn btn-primary my-button-float-right">Update</button>
                            </div>
                        </div>


                        <div class="row">
                            <form:errors path="brand" style="color: #07fff6"/>
                            <form:errors style="color: #07fff6">${message}</form:errors>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-4">
                                <form:label path="brand" for="brand" cssStyle="color: white; float: right">Brand</form:label>
                            </div>
                            <div class="col-sm-8">
                                <form:select path="brand" items="${brands}" id="brand" class="form-control" cssStyle="height: 33px" />
                            </div>
                        </div>

                        <div class="row">
                            <form:errors path="model" style="color: #07fff6"/>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-4">
                                <form:label path="model" for="model" cssStyle="color: white; float: right">Model</form:label>
                            </div>
                            <div class="col-sm-8">
                                <form:input path="model" class="form-control" id="model" placeholder="Input model"/>
                            </div>
                        </div>

                        <div class="row">
                            <form:errors path="yearOfManufacture" style="color: #07fff6"/>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-4">
                                <form:label path="yearOfManufacture" for="yearOfManufacture"  cssStyle="color: white; float: right">Production</form:label>
                            </div>
                            <div class="col-sm-8">
                                <input  type="date" name="yearOfManufacture" id="yearOfManufacture" class="form-control"/>
                            </div>
                        </div>

                        <div class="row">
                            <form:errors path="body" style="color: #07fff6"/>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-4">
                                <form:label path="body" for="body" cssStyle="color: white; float: right">Body</form:label>
                            </div>
                            <div class="col-sm-8">
                                <form:select  path="body" items="${bodies}" id="body" cssStyle="height: 33px" class="form-control"/>
                            </div>
                        </div>

                        <div class="row">
                            <form:errors path="engine" style="color: #07fff6"/>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-4">
                                <form:label path="engine" for="engine" cssStyle="color: white; float: right">Engine</form:label>
                            </div>
                            <div class="col-sm-8">
                                <form:select  path="engine" items="${engines}" id="engine" cssStyle="height: 33px" class="form-control"/>
                            </div>
                        </div>

                        <div class="row">
                            <form:errors path="transmission" style="color: #07fff6"/>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-4">
                                <form:label path="transmission" for="transmission" cssStyle="color: white; float: right">Transmission</form:label>
                            </div>
                            <div class="col-sm-8">
                                <form:select  path="transmission" items="${transmissions}" id="transmission" cssStyle="height: 33px" class="form-control"/>
                            </div>
                        </div>

                        <div class="row">
                            <form:errors path="drive" style="color: #07fff6"/>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-4">
                                <form:label path="drive" for="drive" cssStyle="color: white; float: right">Drive</form:label>
                            </div>
                            <div class="col-sm-8">
                                <form:select  path="drive" items="${drives}" id="drive" cssStyle="height: 33px" class="form-control"/>
                            </div>
                        </div>

                        <div class="row">
                            <form:errors path="numberOfDoors" style="color: #07fff6"/>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-4">
                                <form:label path="numberOfDoors" for="numberOfDoors" cssStyle="color: white; float: right">Doors</form:label>
                            </div>
                            <div class="col-sm-8">
                                <form:select  path="numberOfDoors" items="${doors}" id="numberOfDoors" cssStyle="height: 33px" class="form-control"/>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
</div>

</body>
</html>