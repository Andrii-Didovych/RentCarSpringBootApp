<!doctype html>
<head>
    <%@include file="template/head.jsp"%>
    <style>
        <%@include file='css/lend-style.css' %>
    </style>
    <title>Lend</title>
</head>
<body>
<%@include file="template/navbar.jsp"%>

<div class="main-container">
    <div class="container-for-width">
        <div class="lend-car">
                    <%--@elvariable id="car" type="java"--%>
                    <form:form  action="/lend" method="post"  modelAttribute="car">
                        <div class="text-of-lend">
                            <h2><b>Lend car to somebody who needs it</b> </h2>
                            <h4><b>Your vehicle is able to earn money for you by itself</b></h4>
                        </div>
                        <div class="error">
                            <form:errors>${message}</form:errors>
                            <form:errors path="periodOfRentFrom"/>
                            <form:errors path="periodOfRentTo"/>
                            <form:errors path="pricePerDay"/>
                        </div>
                        <div class="form-for-inputs">
                                <div class="form-group">
                                    <form:label path="region" for="region">City</form:label>
                                    <form:select class="custom-select form-control" path="region" id="city" style="height: 33px;">
                                        <option selected>${missing}</option>
                                        <c:forEach  var="city" items="${cities}">
                                            <option name="city">${city}</option>
                                        </c:forEach>
                                    </form:select>
                                </div>
                                <div class="form-group">
                                    <form:label path="periodOfRentFrom" for="periodOfRentFrom">Rent from</form:label>
                                    <input placeholder="Rent from" class="textbox-n form-control" name="periodOfRentFrom" type="text" onfocus="(this.type='date')"  id="periodOfRentFrom"/>
                                </div>

                                <div class="form-group">
                                    <form:label path="periodOfRentTo" for="periodOfRentTo" >Rent to</form:label>
                                    <input placeholder="Rent to" class="textbox-n form-control" name="periodOfRentTo" type="text" onfocus="(this.type='date')"  id="periodOfRentTo"/>
                                </div>

                                <div class="form-group">
                                    <form:label path="pricePerDay" for="pricePerDay">Price</form:label>
                                    <form:input path="pricePerDay" class="form-control" id="pricePerDay"  placeholder="Input price"/>
                                </div>

                                <div class="form-group">
                                    <form:label path="chauffeur" for="chauffeur">Chauffeur</form:label>
                                    <form:select  path="chauffeur" items="${chauffeurs}" id="chauffeur" cssStyle="height: 33px" class="form-control"/>
                                </div>
                        </div>
                        <div class="lend-button">
                            <button type="submit"  class="btn btn-success my-button-float-right">Add car</button>
                        </div>
                    </form:form>
        </div>
        <div class="container-for-particular-order">
            <div class="header-of-order-container"><h2>Particular order</h2></div>
            <c:choose>
                <c:when test="${empty particularOrder}">
                    <div class="my-message"><b>Trip has not added yet!</b></div>
                </c:when>
                <c:otherwise>
                    <div class="particular-order">
                        City: <b>${particularOrder.region}</b> |
                        Rent from: <b>${particularOrder.periodOfRentFrom}</b> |
                        Rent to: <b>${particularOrder.periodOfRentTo}</b> |
                        Price: <b>${particularOrder.pricePerDay}</b> |
                        Chauffeur: <b>${particularOrder.chauffeur}</b> |
                        <a href="/lend/delete" class="btn btn-warning btn-sm">Delete</a>
                    </div>
                </c:otherwise>
            </c:choose>
            <div class="my-message"><b> ${myMessage}</b></div>
            <div class="my-message"><b> ${ifNotSelected}</b></div>
            <div class="list-of-clients-container" >
                <a:forEach items="${clients}" var="client">
                    <div class="list-of-clients">
                        <img  src="/img/${client.photo}">
                        <h4><a href="/profile/${client.id}"><b> ${client.name} ${client.surname}</b></a></h4>
                        <h5>${client.phone}</h5>
                        <h5>${client.age} years old, ${client.placeOfBirth}</h5>
                        <h5>${client.experience} year(s) of practice</h5>
                        <h5>${client.countOfTrips} finished trip(s)</h5>
                        <div  class="buttons">
                            <a href="/lend/refuse/${client.id}/${particularOrder.id}" class="btn btn-warning btn-sm">Refuse</a>
                            <a href="/lend/confirm/${client.id}/${particularOrder.id}"  class="btn btn-primary btn-sm">Confirm</a>
                        </div>
                    </div>
                </a:forEach>
                <a:forEach items="${reservedOrder}" var="client">
                    <div class="list-of-clients">
                        <div class="message"><b> ${infoAboutOrder}</b></div>
                        <img  src="/img/${client.photo}">
                        <h4><a href="/profile/${client.id}"><b> ${client.name} ${client.surname}</b></a></h4>
                        <h5>${client.phone}</h5>
                        <h5>${client.age} years old, ${client.placeOfBirth}</h5>
                        <h5>${client.experience} year(s) of practice</h5>
                        <h5>${client.countOfTrips} finished trip(s)</h5>
                        <div  class="buttons">
                            <a href="/lend/complete/${particularOrder.id}" style="float: right; margin: 2px" class="btn btn-warning btn-sm">Complete</a>
                        </div>
                    </div>
                </a:forEach>
            </div>
        </div>

        <div class="container-for-finished-trips">
            <div class="header-of-order-container"><h2>Finished trips</h2></div>
            <div class="finished-trips">
                <c:choose>
                    <c:when test="${empty finishedOrders}">
                        <div class="my-message"><b>Any of trip was not finished yet</b></div>
                    </c:when>
                    <c:otherwise>
                        <a:forEach items="${finishedOrders}" var="order">
                            <div class="one-trip">
                                <a style="margin-top: -5px; float: right" href="/profile/${order.driverId}" class="btn btn-warning btn-sm">Driver</a>
                                City: <b>${order.region}</b> |
                                Price: <b>${order.pricePerDay}</b> |
                                Chauffeur: <b>${order.chauffeur}</b> |
                                Rent from: <b>${order.periodOfRentFrom}</b> |
                                Rent to: <b>${order.periodOfRentTo}</b>
                            </div>
                        </a:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
<jsp:include page="template/footer.jsp"/>
</body>
</html>