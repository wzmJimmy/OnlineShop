<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login</title>
    <link rel="icon" type="image/x-icon" href="<c:url value="/resource/images/favicon.png"/>"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/login.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/common.css"/>">
</head>
<body>
<%@ include file="basic/navbar.jsp" %>
<div id="login-container">
        <div id="login-panel" class="card col-xl-4 col-lg-5 col-md-6 col-sm-8">
            <div class="card-header">Sign In</div>
            <div class="card-body">
                <!-- will display after registration form registerd successfully -->
                <c:if test="${not empty registrationSuccess}">
                    <div class="error" style="color: #ff0000;">${registrationSuccess}</div>
                </c:if>
                <!-- will display after logged out successfull -->
                <c:if test="${not empty logout}">
                    <div class="error" style="color: #ff0000;">${logout}</div>
                </c:if>

                <form name="loginForm" action="<c:url value="/login"/>" method="post">
                    <fieldset>
                        <div class="form-group">
                            <input class="form-control" placeholder="E-mail" name="username" type="email">
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Password"name="password" type="password">
                        </div>
                         <c:if test="${not empty error}">
                        	<div class="checkbox form-group">
                                <div class="error" style="color: #ff0000">${error}</div>
                        	</div>
                        </c:if>
                        <!-- Change this to a button or input when using this as a form -->
                        <div id="button">
                            <div><button type="submit" class="btn btn-primary">Login</button></div>
                            <p><a href="<c:url value="/customer/registration"/>">Register here.</a></p>
                        </div>
                    </fieldset>
                </form>
                
            </div>
        </div>
</div>
<jsp:include page="basic/footer.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>