<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE  html>
<head>
    <title>RentCar</title>
    <style>
        <%@include file='index-style.css' %>
    </style>
</head>
<body>
    <div class="container">
        <div class="left">
            <div class="main-text">
                <div class="left-nav">
                    <a href="/" style="font-size: 25px;"><b>RentCar</b></a>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <div class="dropdown">
                            <span><b>admin</b></span>
                            <div class="dropdown-content">
                                <div><a href="/admin/city"><b>city</b></a></div>
                                <div><a href="/admin/brand"><b>brand</b></a></div>
                            </div>
                        </div>
                    </sec:authorize>
                </div>
                <b>LEND YOUR CAR<br>TO SOMEONE</b>
            </div>
            <div class="text-left">
                <b>your vehicle is able<br>to earn money<br> by itself</b>
                <sec:authorize access="isAuthenticated()">
                    <div class="button-go-to">
                        <a href="/lend"><b>lend a car</b></a>
                    </div>
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                    <div class="button-go-to">
                        <a href="/login"><b>lend a car</b></a>
                    </div>
                </sec:authorize>
            </div>

        </div>
        <div class="right">
            <div class="main-text" main-text>
                <div class="right-nav">
                    <sec:authorize access="isAnonymous()">
                        <a href="/registration" style="margin-top:5px;"><b>registration</b></a>
                        <a href="/login" style="margin-top:5px;"><b>login</b></a>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <form:form action="/logout">
                            <button class="my-button-like-link"><b>logout</b></button>
                        </form:form>
                            <div class="dropdown">
                                <span><b>profile</b></span>
                                <div class="dropdown-content">
                                    <div><a href="/profile/${idOfAuthorizedDriver}"><b>profile</b></a></div>
                                    <div><a href="/edit"><b>edit</b></a></div>
                                </div>
                            </div>
                    </sec:authorize>
                </div>
                <b>BORROW A CAR<br>FROM SMB</b>
            </div>
            <div class="text-right">
                <b>you can find a car<br>which you want<br>on this site</b>
                <sec:authorize access="isAuthenticated()">
                    <div class="button-go-to">
                        <a href="/#"><b>find a car</b></a>
                    </div>
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                    <div class="button-go-to">
                        <a href="/login"><b>find a car</b></a>
                    </div>
                </sec:authorize>
            </div>
        </div>
    </div>
</body>
</html>