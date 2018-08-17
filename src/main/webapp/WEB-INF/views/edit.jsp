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
        <%@include file='css/edit-style.css' %>
    </style>
    <title>Edit</title>
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
<div class="edit-container">
        <div class="edit-about-driver">
            <div class="edit-about-driver-container">
                <div class="left-side">
                        <div class="photo-of-driver-or-car">
                            <img src="https://s3.amazonaws.com/drivers-bucket/${infoAboutDriver.photo}" >
                        </div>
                        <div class="info-about-driver-or-car" >
                            <h4><b>${infoAboutDriver.name}
                                ${infoAboutDriver.surname}</b></h4>
                            <h5>
                                ${infoAboutDriver.phone}<br>
                                ${infoAboutDriver.age} years old<br>
                                ${infoAboutDriver.experience} years of experience<br>
                                ${infoAboutDriver.countOfTrips} completed trips<br>
                                Native city: ${infoAboutDriver.placeOfBirth}<br>
                            </h5>
                        </div>
                </div>
                <div class="right-side">
                            <%--@elvariable id="fileRequest" type="java"--%>
                            <form:form action="/edit/photo-of-driver" modelAttribute="fileRequest" enctype="multipart/form-data">
                                <div class="edit-for-picture">
                                    <div class="header-of-block">
                                        <button type="submit" class="btn btn-primary button-float-right">Update</button>
                                        <p><b class="header-of-block-text">Change photo</b></p>
                                    </div>
                                    <div class="error">
                                        <form:errors path="file" /><%--<form:errors >${message}</form:errors>--%>
                                    </div>
                                    <input  name="file" type="file"/>
                                </div>
                            </form:form>
                            <%--@elvariable id="driver" type="java"--%>
                            <form:form  action="/edit/info"  modelAttribute="driver">
                                <div class="my-edit-info-form">
                                    <div class="header-of-block">
                                        <button type="submit" class="btn btn-primary button-float-right">Update</button>
                                        <p class="header-of-block-text"><b>Change main info</b></p>
                                    </div>

                                    <div class="error">
                                        <form:errors path="name" />
                                        <form:errors >${message}</form:errors>
                                    </div>
                                    <div class="label-input-form">
                                        <div class="label-form">
                                            <form:label path="name" for="name">Name</form:label>
                                        </div>
                                        <div class="input-form">
                                            <form:input path="name" class="form-control" id="name"  placeholder="Input new name"/>
                                        </div>
                                    </div>

                                    <div class="error">
                                        <form:errors path="surname" />
                                    </div>
                                    <div class="label-input-form">
                                        <div class="label-form">
                                            <form:label path="phone" for="surname">Surname</form:label>
                                        </div>
                                        <div class="input-form">
                                            <form:input  path="surname" class="form-control" id="surname" placeholder="Input new surname"/>
                                        </div>
                                    </div>

                                    <div class="error">
                                        <form:errors path="phone"/>
                                    </div>
                                    <div class="label-input-form">
                                        <div class="label-form">
                                            <form:label path="phone" for="phone">Phone</form:label>
                                        </div>
                                        <div class="input-form">
                                            <form:input  path="phone" class="form-control" id="phone" placeholder="Input new number"/>
                                        </div>
                                    </div>

                                    <div class="label-input-form">
                                        <div class="label-form">
                                            <form:label path="placeOfBirth" for="place">City</form:label>
                                        </div>
                                        <div class="input-form">
                                            <form:select class="custom-select" path="placeOfBirth" id="city" style="height: 33px;">
                                                <option selected>${missing}</option>
                                                <c:forEach  var="city" items="${cities}">
                                                    <option name="city">${city}</option>
                                                </c:forEach>
                                            </form:select>
                                        </div>
                                    </div>

                                    <div class="error">
                                        <form:errors path="dateOfBirth"/>
                                    </div>

                                    <div class="label-input-form">
                                        <div class="label-form">
                                            <form:label path="dateOfBirth" for="birth">Birthday</form:label>
                                        </div>
                                        <div class="input-form">
                                            <input placeholder="Date of birth" class="textbox-n form-control" name="dateOfBirth" type="text" onfocus="(this.type='date')"  id="dateOfBirth"/>
                                        </div>
                                    </div>

                                    <div class="error">
                                        <form:errors path="experienceBegan"/>
                                    </div>
                                    <div class="label-input-form">
                                        <div class="label-form">
                                            <form:label path="experienceBegan" for="experienceBegan">Start driving</form:label>
                                        </div>
                                        <div class="input-form">
                                            <input placeholder="Experience" class="textbox-n form-control" name="experienceBegan" type="text" onfocus="(this.type='date')"  id="experienceBegan"/>
                                        </div>
                                    </div>

                                </div>
                            </form:form>
                            <%--@elvariable id="user" type="java"--%>
                            <form:form  action="/edit" method="post" modelAttribute="user">
                                <div class="my-edit-info-form">
                                    <div class="header-of-block">
                                        <button type="submit"  class="btn btn-primary button-float-right">Update</button>
                                        <p class="header-of-block-text"><b>Change password</b></p>
                                    </div>

                                    <div class="error">
                                        <form:errors path="oldPassword" />
                                    </div>
                                    <div class="label-input-form">
                                        <div class="label-form">
                                            <form:label path="oldPassword" for="oldPassword">Old password</form:label>
                                        </div>
                                        <div class="input-form">
                                            <form:password path="oldPassword" class="form-control" id="oldPassword"  placeholder="Input old password"/>
                                        </div>
                                    </div>


                                    <div class="error">
                                        <form:errors path="password" />
                                        <form:errors >${message}</form:errors>
                                    </div>
                                    <div class="label-input-form">
                                        <div class="label-form">
                                            <form:label path="password" for="inputPassword">New password</form:label>
                                        </div>
                                        <div class="input-form">
                                            <form:password path="password" class="form-control" id="inputPassword"  placeholder="Input new password"/>
                                        </div>
                                    </div>

                                    <div class="error">
                                        <form:errors path="repeatPassword"/>
                                    </div>
                                    <div class="label-input-form">
                                        <div class="label-form">
                                            <form:label path="repeatPassword" for="repeatPassword" >Repeat password</form:label>
                                        </div>
                                        <div class="input-form">
                                            <form:password path="repeatPassword" class="form-control" id="repeatPassword"  placeholder="Repeat password"/>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
                </div>
            </div>
        </div>

    <div class="edit-about-car">
        <div class="edit-about-driver-container">
            <div class="left-side">
                <div class="photo-of-driver-or-car">
                    <img src="https://s3.amazonaws.com/cars-bucket/${photoOfCar}">
                </div>
                <div class="info-about-driver-or-car" >
                    <h4>
                        <b>${infoAboutCar.brand} ${infoAboutCar.model}</b>
                    </h4>
                    <h5>
                        Year of manufacture: <b>${infoAboutCar.yearOfManufacture}</b><br>
                        Transmission: <b>${infoAboutCar.transmission}</b><br>
                        Type of body: <b>${infoAboutCar.body}</b><br>
                        Number of doors: <b>${infoAboutCar.numberOfDoors}</b><br>
                        Type of fuel: <b>${infoAboutCar.engine}</b><br>
                        Drive: <b>${infoAboutCar.drive}</b><br>
                    </h5>
                </div>
            </div>
            <div class="right-side">
                <%--@elvariable id="fileRequestCar" type="java"--%>
                <form:form action="/edit/photo-of-car" modelAttribute="fileRequestCar" enctype="multipart/form-data">

                    <div class="edit-for-picture">
                        <div class="header-of-block">
                            <button type="submit" class="btn btn-primary button-float-right">Update</button>
                            <p class="header-of-block-text"><b>Change photo</b></p>
                        </div>
                        <div class="error">
                            <form:errors path="file" />
                        </div>
                        <form:input  path="file" type="file"/>
                    </div>
                </form:form>
                <%--@elvariable id="car" type="java"--%>
                <form:form  action="/edit/car"  modelAttribute="car">
                    <div class="my-edit-info-form">
                        <div class="header-of-block">
                            <button type="submit"  class="btn btn-primary button-float-right">Update</button>
                            <p class="header-of-block-text"><b>Add or update a car</b></p>
                        </div>


                        <div class="error">
                            <form:errors path="brand"/>
                            <form:errors>${message}</form:errors>
                        </div>
                        <div class="label-input-form">
                            <div class="label-form">
                                <form:label path="brand" for="brand">Brand</form:label>
                            </div>
                            <div class="input-form">
                                <select class="custom-select" name="brand" id="brand" style="height: 33px">
                                    <option selected>${missing}</option>
                                    <c:forEach  var="brand" items="${brands}">
                                        <option name="brand">${brand}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="error">
                            <form:errors path="model"/>
                        </div>
                        <div class="label-input-form">
                            <div class="label-form">
                                <form:label path="model" for="model">Model</form:label>
                            </div>
                            <div class="input-form">
                                <form:input path="model" class="form-control" id="model" placeholder="Input model"/>
                            </div>
                        </div>

                        <div class="error">
                            <form:errors path="yearOfManufacture"/>
                        </div>
                        <div class="label-input-form">
                            <div class="label-form">
                                <form:label path="yearOfManufacture" for="yearOfManufacture">Production</form:label>
                            </div>
                            <div class="input-form">
                                <input placeholder="Year of manufacture" class="textbox-n form-control" name="yearOfManufacture" type="text" onfocus="(this.type='date')"  id="yearOfManufacture"/>
                            </div>
                        </div>

                        <div class="error">
                            <form:errors path="body"/>
                        </div>
                        <div class="label-input-form">
                            <div class="label-form">
                                <form:label path="body" for="body" >Body</form:label>
                            </div>
                            <div class="input-form">
                                <form:select  path="body" items="${bodies}" cssStyle="height: 33px;" id="body"  class="form-control"/>
                            </div>
                        </div>

                        <div class="error">
                            <form:errors path="engine"/>
                        </div>
                        <div class="label-input-form">
                            <div class="label-form">
                                <form:label path="engine" for="engine">Engine</form:label>
                            </div>
                            <div class="input-form">
                                <form:select  path="engine" items="${engines}" id="engine" cssStyle="height: 33px;"  class="form-control"/>
                            </div>
                        </div>

                        <div class="error">
                            <form:errors path="transmission"/>
                        </div>
                        <div class="label-input-form">
                            <div class="label-form">
                                <form:label path="transmission" for="transmission">Transmission</form:label>
                            </div>
                            <div class="input-form">
                                <form:select  path="transmission" items="${transmissions}" id="transmission" cssStyle="height: 33px;" class="form-control"/>
                            </div>
                        </div>

                        <div class="error">
                            <form:errors path="drive" />
                        </div>
                        <div class="label-input-form">
                            <div class="label-form">
                                <form:label path="drive" for="drive" >Drive</form:label>
                            </div>
                            <div class="input-form">
                                <form:select  path="drive" items="${drives}" id="drive" cssStyle="height: 33px;"  class="form-control"/>
                            </div>
                        </div>

                        <div class="error">
                            <form:errors path="numberOfDoors"/>
                        </div>
                        <div class="label-input-form">
                            <div class="label-form">
                                <form:label path="numberOfDoors" for="numberOfDoors">Doors</form:label>
                            </div>
                            <div class="input-form">
                                <form:select  path="numberOfDoors" items="${doors}" id="numberOfDoors" cssStyle="height: 33px;" class="form-control"/>
                            </div>
                        </div>
                    </div>
                </form:form>
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