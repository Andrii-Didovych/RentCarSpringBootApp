<!doctype html>
<head>
    <%@include file="template/head.jsp"%>
    <style>
        <%@include file='css/profile-style.css' %>
    </style>
    <title>Profile</title>
</head>
<body>

<%@include file="template/navbar.jsp"%>

<div class="container-profile">
    <div class="container-profile-for-width">
            <div class="header" >
                <div class="header-background">
                    <img src="https://s3.amazonaws.com/bucket-of-drivars/${driver.photo}" >
                </div>
                <div class="header-picture-xs">
                    <img src="https://s3.amazonaws.com/bucket-of-drivars/${driver.photo}" >
                </div>
                <h2><b>${driver.name} ${driver.surname}</b></h2>
            </div>
            <div class="main">
                    <div class="left-side">
                            <div class="info-about-driver-or-car ">
                                    <h4>About driver</h4>
                                    <h5>
                                        ${driver.phone}<br>
                                        ${driver.age} years old<br>
                                        ${driver.experience} years of experience<br>
                                        ${driver.countOfTrips} completed trips<br>
                                        Native city: ${driver.placeOfBirth}<br>
                                    </h5>
                            </div>
                            <div class="info-about-driver-or-car ">
                                    <h4>About car</h4>
                                    <h5>
                                            <b>${driversCar.brand} ${driversCar.model}</b><br>
                                            Year of manufacture: <b>${driversCar.yearOfManufacture}</b><br>
                                            Transmission: <b>${driversCar.transmission}</b><br>
                                            Type of body: <b>${driversCar.body}</b><br>
                                            Number of doors: <b>${driversCar.numberOfDoors}</b><br>
                                            Type of fuel: <b>${driversCar.engine}</b><br>
                                            Drive: <b>${driversCar.drive}</b><br>
                                    </h5>

                            </div>
                    </div>

                    <div class="right-side">
                        <div class="form-comment">
                            <%--@elvariable id="comment" type="java"--%>
                            <form:form cssStyle="width: 100%"  action="/profile/${driver.id}/${idOfAuthorizedDriver}" method="post" modelAttribute="comment">
                                <div class="input-form">
                                    <form:label path="text" for="exampleFormControlTextarea1"><h4>Write a comment!</h4></form:label>
                                    <form:textarea  path="text"  id="exampleFormControlTextarea1" rows="2"/>
                                </div>
                                <div class="error">
                                    <form:errors path="text"/>
                                </div>
                                <div class="button-of-comment">
                                    <button type="submit" class="btn btn-success">Send</button>
                                </div>
                            </form:form>
                        </div>
                        <a:forEach var="comment" items="${comments}">
                            <div class="comment">
                                <div class="container-for-header">
                                    <div class="comment-background" style="background-image: url(https://s3.amazonaws.com/bucket-of-cars/${photoOfCarForComment});" >
                                        <div class="comment-inside">
                                            <img src="https://s3.amazonaws.com/bucket-of-drivars/${comment.photoOfSender}">
                                            <h4 class="name-and-surname"><a href="/profile/${comment.senderId}">${comment.name} ${comment.surname}</a></h4>
                                        </div>
                                    </div>
                                    <div class="comment-date">
                                        <h5>${comment.date}</h5>
                                    </div>
                                </div>
                                <div class="comment-text">${comment.text}</div>
                            </div>
                        </a:forEach>
                    </div>
            </div>
    </div>
</div>
<jsp:include page="template/footer.jsp"/>
</body>
</html>