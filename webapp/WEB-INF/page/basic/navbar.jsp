<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/basic/navbar.css"/>">
<body>
<nav id="topnav">
    <div class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid" style="align-items: flex-end;">
        <div class="navbar-brand">
            <img src="<c:url value="/resource/images/shop.png"/>" alt="logo-image"> </img> HomeShop
        </div>
        
        <button class="navbar-toggler" type="button" data-toggle="collapse" 
        data-target="#myNavbar" aria-controls="myNavbar" aria-expanded="false" 
        aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span></button>

        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                	<a class="nav-link" href=" <c:url value="/" />">Home</a>
                </li>
                <li class="nav-item">
                	<a class="nav-link" href=" <c:url value="/getAllProducts" />">Product List</a>
                </li>
                <li class="nav-item">
                	<a class="nav-link" href=" <c:url value="/aboutus" />">About Us</a>
                </li>

                <!-- Only admin can view this link -->
                <security:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="nav-item">
                    	<a class="nav-link"href=" <c:url value="/admin/product/addProduct" />">Add Product</a>
                    </li>
                </security:authorize>
            </ul>
            
            <c:if test="${!empty pageContext.request.userPrincipal.name}">
            	<ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="<c:url value="/index" />">
                    	<span><i class="fas fa-user"></i></span>
                    	Welcome ${pageContext.request.userPrincipal.name}</a></li>

                    <security:authorize access="hasRole('ROLE_USER')">
                        <li class="nav-item"><a class="nav-link" href="<c:url value="/cart/getCartById" />">
                        	<span><i class="fas fa-shopping-cart"></i></span> Cart</a></li>
                    </security:authorize>
                    
                    <li class="nav-item"><a class="nav-link" href="<c:url value="/logout" />">
                    	<span><i class="fas fa-sign-out-alt"></i></span> Logout</a></li>
            	</ul>
            </c:if>
			<c:if test="${pageContext.request.userPrincipal.name==null}">
            	<ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="<c:url value="/login" />">
                    	<span><i class="fas fa-shopping-cart"></i></span> My Cart</a></li>
                    <li class="nav-item"><a class="nav-link" href="<c:url value="/customer/registration" />">
                    	<span><i class="fas fa-user-plus"></i></span> SignUp</a></li>
                    <li class="nav-item"><a class="nav-link" href="<c:url value="/login" />">
                    	<span><i class="fas fa-sign-in-alt"></i></span> Login</a></li>
            	</ul>
            </c:if>
        </div>
    </div>
    </div>
</nav>
<div style="margin-top:70px;"></div>
</body>
</html>