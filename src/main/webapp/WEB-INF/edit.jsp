<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charsetUTF-8" language="java"%>

<html>
<head>
    <title>Login Webapp</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <nav class="navbar navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">SSC - Login Webapp</a>
            <a class="btn btn-warning btn-sm pull-right" type="button" href="/logout">
                    <i class="fa fa-sign-out"></i>&nbsp; Logout
            </a>
        </div>
    </nav>
    <c:if test="${not empty message}">
        <c:choose>
            <c:when test="${hasError}">
                <div class ="alert alert-danger" role="alert">
                        ${message}
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-primary" role="alert">
                        ${message}
                </div>
            </c:otherwise>
        </c:choose>
    </c:if>
    <div class="row justify-content-md-center">
        <div class="col-sm-12 col-md-6 col-lg-4 mt-5">
                <h3 class="text-center mb-4">Edit User (${username})</h3>
                <p>${error}</p>
                <form action="/user/edit?username=${username}" method="post" autocomplete="off">
                    <input type="hidden" class="form-control" name="username" placeholder="Username" aria-label="Username"
                           aria-describedby="username" autocomplete="off" value="${username}">
                    <div class="input-group mb-4 input-group-md">
                        <span class="input-group-text" id="displayName" style="width: 40px">
                            <i class="fa fa-user"></i>
                        </span>
                        <input type="text" class="form-control" name="displayName" placeholder="Display Name" aria-label="displayName"
                               aria-describedby="displayName" autocomplete="off" value="${displayName}">
                     </div>
                         <div class="d-grid gap-2">
                        <button class="btn btn-success" type="submit"><i class="fa fa-save"></i> &nbsp; Save</button>
                    </div>
                </form>
        </div>
    </div>
</div>

</body>
</html>