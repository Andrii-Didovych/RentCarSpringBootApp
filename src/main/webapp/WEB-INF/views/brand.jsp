<!doctype html>
<head>
    <%@include file="template/head.jsp"%>
    <style>
        <%@include file='css/admin-style.css' %>
    </style>
    <title>Brand</title>
</head>
<body>
<%@include file="template/navbar.jsp"%>

<div class="admin-container">
    <div class="admin-container-for-width">
    <div class="row" style="margin: 0px; ">
        <div class="col-sm-6 col-xs-12" style="margin: 0px;">
            <%--@elvariable id="brand" type="java"--%>
            <form:form action="/admin/brand" method="post" modelAttribute="brand">
                <custom:hiddenInputs excludeParams="name"/>
                <div>
                    <form:input path="name" class="form-control"  placeholder="Name"/>
                    <button type="submit" class="btn btn-sm btn-success" style="margin: 5px 0; padding: 3px 8px;">Save</button>
                    <a href="/admin/brand/cancel<custom:allParams/>" class="btn btn-sm btn-info" style="padding: 3px;">Cancel</a>
                </div>
                <div style="font-size: 14px; color: #563d7c;   margin: 5px 0px;  text-align: left">
                    <form:errors cssStyle="background-color: #f0ad4e; border-radius: 2px; padding: 3px;" path="name"/>
                </div>
            </form:form>
        </div>
        <div class="col-sm-6 col-xs-12" style="margin: 0px;">
            <%--@elvariable id="filter" type="java"--%>
            <form:form  action="/admin/brand" modelAttribute="filter" method="get">
                <form:input path="search" class="form-control" cssStyle="margin: 0 5px 5px 0;" placeholder="Find by name"/>
                <span style="display: flex; flex-direction: row; align-items: right;">
                    <span>
                        <button type="submit" style="margin-right: 5px; padding-left: 7px; padding-right: 7px;" class="btn btn-primary btn-sm">Find</button>
                    </span>
                    <span style="padding-right: 5px; ">
                        <custom:size posibleSizes="1,2,5,10" size="${brands.size}"/>
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
                    <th scope="col" style="width: 50%" class="text-center">Brand</th>
                    <th scope="col" style="width: 50%" class="text-center">Options</th>
                </tr>
                </thead>
                <tbody>
                <a:forEach var="brand" items="${brands.content}">
                    <tr>
                        <td class="text-center">${brand.name}</td>
                        <td class="text-center">
                            <a href="/admin/brand/update/${brand.id}<custom:allParams/>"  class="btn btn-warning btn-sm" >Update</a>
                            <a href="/admin/brand/delete/${brand.id}<custom:allParams/>" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                </a:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row" style="margin: 0px; padding: 0px;">
        <div class="col-12 text-center" style="height: 10px; padding-bottom: 100px;">
            <custom:pageable page="${brands}"/>
        </div>
    </div>
    </div>
</div>
<jsp:include page="template/footer.jsp"/>
</body>
</html>