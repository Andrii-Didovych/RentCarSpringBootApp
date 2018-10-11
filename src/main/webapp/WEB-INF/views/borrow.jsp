<!doctype html>
<head>
    <%@include file="template/head.jsp"%>
    <style>
        <%@include file='css/borrow-style.css' %>
    </style>
    <title>Borrow</title>
</head>

<body>
<%@include file="template/navbar.jsp"%>
<div class="borrow-container">
    <div class="borrow-container-for-width">

                    <h2 class="header-of-filter-text"><b>There is a car which you're looking for</b></h2>
                    <%--@elvariable id="carFilter" type="java"--%>
                    <form:form action="/borrow" method="get" modelAttribute="carFilter">
                        <div class="filter-form">
                            <div class="form-group">
                                    <label for="city">Region</label>
                                    <select class="form-control" name="region" id="city" style="height: 33px;">
                                        <option selected>${missing}</option>
                                        <c:forEach  var="region" items="${cities}">
                                            <option name="region">${region}</option>
                                        </c:forEach>
                                    </select>
                            </div>
                            <div class="form-group">
                                    <form:label path="minPrice">Min price</form:label>
                                    <form:input path="minPrice" class="form-control" placeholder="Min price"/>
                            </div>
                            <div class="form-group">
                                    <form:label path="maxPrice">Max price</form:label>
                                    <form:input path="maxPrice" class="form-control" placeholder="Max price"/>
                            </div>
                            <div class="form-group">
                                    <form:label path="periodOfRentFrom" for="periodOfRentFrom">Rent from</form:label>
                                    <input placeholder="Rent from" class="textbox-n form-control" name="periodOfRentFrom" type="text" onfocus="(this.type='date')"  id="periodOfRentFrom"/>
                            </div>
                            <div class="form-group">
                                    <form:label path="periodOfRentTo" for="periodOfRentTo">Rent to</form:label>
                                    <input placeholder="Rent to" class="textbox-n form-control" name="periodOfRentTo" type="text" onfocus="(this.type='date')"  id="periodOfRentTo"/>
                            </div>
                        </div>
                        <div class="helpfull-filters">
                        <div class="filter-form">
                                <div class="form-group">
                                    <label for="brand">Brand</label>
                                    <select class="form-control" name="brand" id="brand" style="height: 25px; padding: 2px;">
                                        <option selected>${missing}</option>
                                        <c:forEach  var="brand" items="${brands}">
                                            <option name="brand">${brand}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <form:label path="model">Model</form:label>
                                    <form:input path="model" placeholder="Input model" class="form-control" cssStyle="padding: 2px; height: 25px;"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="chauffeur">Chauffeur</form:label>
                                    <form:select class="form-control" cssStyle="padding: 2px;" path="chauffeur" items="${chauffeurs}"  />
                                </div>

                                <div class="form-group">
                                    <form:label path="body">Body</form:label>
                                    <form:select  path="body" items="${bodies}"  class="form-control" cssStyle="padding: 2px;"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="door">Door</form:label>
                                    <form:select  path="door" items="${doors}"  class="form-control" cssStyle="padding: 2px;"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="drive">Drive</form:label>
                                    <form:select  path="drive" items="${drives}"  class="form-control" cssStyle="padding: 2px;"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="engine">Engine</form:label>
                                    <form:select path="engine" items="${engines}"  class="form-control" cssStyle="padding: 2px;"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="transmission">Transmission</form:label>
                                    <form:select path="transmission" items="${transmissions}"  class="form-control" cssStyle="padding: 2px;"/>
                                </div>

                                <div class="form-group" style="text-align: right">
                                        <button class="btn btn-success btn-md" type="submit">Find</button>
                                </div>
                        </div>
                        </div>
                    </form:form>



        <div class="container-for-my-message">
            <div class="my-message">${myMessage}</div>
        </div>
        <div class="container-for-free-cars">
                        <a:forEach var="order" items="${freeCars.content}">
                            <div class="one-order">
                                    <div class="about-car">
                                            <div class="background-of-order" style="background-image: url(https://s3.amazonaws.com/cars-bucket/${order.photoOfCar});" >
                                                <div class="background-for-color">
                                                    <img src="https://s3.amazonaws.com/drivers-bucket/${order.photoOfDriver}">
                                                    <a class="btn btn-success btn-sm" href="/borrow/choose/${order.id}<custom:allParams/>">Take it</a>
                                                    <h3 style="margin: auto 5px;"><a style="text-decoration: none; color: #f0ad4e" href="/profile/${order.driverId}">${order.brand} ${order.model}</a></h3> <br>
                                                </div>
                                            </div>
                                    </div>
                                    <div class="about-order">
                                        <div class="order">
                                            <p>Rent from: <b>${order.periodOfRentFrom}</b><br></p>
                                            <p>Rent to: <b>${order.periodOfRentTo}</b><br></p>
                                            <p>City: <b>${order.region}</b><br></p>
                                            <p>Chauffeur: <b>${order.chauffeur}</b><br></p>
                                            <p>Price: <b>${order.pricePerDay}</b></p>
                                        </div>
                                        <div class="button-of-order">
                                            <a class="btn btn-success btn-sm" href="/borrow/choose/${order.id}<custom:allParams/>">Take it</a>
                                        </div>
                                    </div>
                            </div>
                        </a:forEach>
                </div>
                <div class="row size-of-page">
                        <span style="margin-left: 5px"><custom:pageable page="${freeCars}"/></span>
                        <span  style="margin: 23px 0 0 5px;">
                            <custom:size posibleSizes="1,2,5,10" size="${freeCars.size}"/>
                        </span>
                </div>
         <%----%>

        <%----%>
        <div class="container-for-finished-trips">
            <div class="header-of-order-container"><h2>Wishes</h2></div>
            <div class="finished-trips">
                <a:forEach items="${selectedOrders}" var="order">
                    <div class="message"><b>${messageAboutTrip}</b></div>
                    <div class="one-trip">
                        <div class="trip-info">
                            City: <b>${order.region}</b> |
                            Price: <b>${order.pricePerDay}</b> |
                            Chauffeur: <b>${order.chauffeur}</b> |
                            Rent from: <b>${order.periodOfRentFrom}</b> |
                            Rent to: <b>${order.periodOfRentTo}</b>
                        </div>
                        <div class="buttons-of-trip">
                            <a  href="/borrow/delete/${order.driverId}/${order.id}<custom:allParams/>" class="btn btn-warning btn-sm">Delete</a>
                            <a class="btn btn-primary btn-sm" href="/profile/${order.ownerId}">Driver</a>
                        </div>
                    </div>
                </a:forEach>
                <a:forEach items="${reservedOrder}" var="order">
                    <div class="message"><b>${messageAboutTrip}</b></div>
                    <div class="one-trip">
                        <div class="trip-info">
                            City: <b>${order.region}</b> |
                            Price: <b>${order.pricePerDay}</b> |
                            Chauffeur: <b>${order.chauffeur}</b> |
                            Rent from: <b>${order.periodOfRentFrom}</b> |
                            Rent to: <b>${order.periodOfRentTo}</b>
                        </div>
                        <div class="buttons-of-trip">
                            <a  class="btn btn-primary btn-sm" href="/profile/${order.ownerId}">Driver</a>
                            <a  href="/borrow/complete/${order.id}<custom:allParams/>" class="btn btn-warning btn-sm">Complete</a>
                        </div>
                    </div>
                </a:forEach>
            </div>
        </div>

        <div class="container-for-finished-trips">
            <div class="header-of-order-container"><h2>Finished trips</h2></div>
            <div class="finished-trips">
                <a:forEach items="${finishedOrders}" var="order">
                    <div class="one-trip">
                        <div class="trip-info">
                            City: <b>${order.region}</b> |
                            Price: <b>${order.pricePerDay}</b> |
                            Chauffeur: <b>${order.chauffeur}</b> |
                            Rent from: <b>${order.periodOfRentFrom}</b> |
                            Rent to: <b>${order.periodOfRentTo}</b>
                        </div>
                        <div class="buttons-of-trip">
                            <a style="float: right" href="/profile/${order.ownerId}" class="btn btn-warning btn-sm">Driver</a>
                        </div>
                    </div>
                </a:forEach>
            </div>
        </div>
        <%--</div>--%>
    </div>
</div>
<jsp:include page="template/footer.jsp"/>
</body>
</html>