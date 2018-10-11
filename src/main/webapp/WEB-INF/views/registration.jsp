<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <style>
        <%@include file='css/registration-style.css' %>
    </style>
    <title>Login</title>
</head>
<body>
<div class="login-container">
    <div class="nav-bar">
        <div class="left-nav-xs">
            <a href="/"><b style="font-size: 20px;">RentCar</b></a>
        </div>
        <div class="right-nav-xs">
            <a href="/login">Login</a>
        </div>
    </div>
    <div class="left">
        <div class="left-nav">
            <a href="/"><b>RentCar</b></a>
        </div>
        <div class="login-form">
            <%--@elvariable id="driver" type="java"--%>
            <form:form  action="/registration" method="post" modelAttribute="driver">
                <div class=" row">
                    <div class="error">
                        <form:errors path="email"/>
                    </div>
                </div>
                <div class="form-group row">
                    <form:input path="email" type="email" class="form-control border-input-form" id="inputEmail" placeholder="Input email"/>
                </div>

                <div class="row">
                    <div class="error">
                        <form:errors>${message}</form:errors>
                        <form:errors path="password"/>
                    </div>
                </div>
                <div class="form-group row">
                        <form:password path="password" class="form-control border-input-form" id="inputPassword"  placeholder="Input password"/>
                </div>

                <div class="row">
                    <div class="error">
                        <form:errors>${message}</form:errors>
                        <form:errors path="repeatPassword"/>
                    </div>
                </div>
                <div class="form-group row">
                        <form:password  path="repeatPassword" class="form-control border-input-form" id="repeatPassword" placeholder="Repeate password"/>
                </div>

                <div class="row">
                    <div class="error">
                        <form:errors path="name"/>
                    </div>
                </div>
                <div class="form-group row">
                        <form:input path="name" class="form-control border-input-form" id="inputName" placeholder="Input name"/>
                </div>

                <div class="row">
                    <div class="error">
                        <form:errors path="surname"/>
                    </div>
                </div>
                <div class="form-group row">
                        <form:input path="surname" class="form-control border-input-form" id="inputSurname" placeholder="Input surname"/>
                </div>

                <div class="row">
                    <div class="error">
                        <form:errors path="phone"/>
                    </div>
                </div>
                <div class="form-group row">
                        <form:input type="phone" path="phone" class="form-control border-input-form" id="inputPhone"  placeholder="Input phone"/>
                </div>

                <div class="form-group row" style="display: flex; flex-direction: row-reverse">
                        <button type="submit" class="btn btn-success" style="border-radius: 5px; border: #da9c44;background-color: #f0ad4e; color: #563d7c; margin-top: 5px;">Register</button>
                </div>
            </form:form>
        </div>
    </div>
    <div class="right">
        <div class="text">
            <b>
                ${numberOfUser} people have already <br>signed up on our site,<br> use it right now!
            </b>
        </div>
        <div class="join-us-button">
            <a href="/login"><b>Login</b></a>
        </div>
    </div>
</div>
</body>
</html>