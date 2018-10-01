<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
<link rel="icon" type="image/x-icon" href="<c:url value="/resource/images/favicon.png"/>" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/common.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/Product.css"/>">
</head>
<body>
<%@ include file="basic/navbar.jsp"%>
<section class="background">
	<div class="container" ng-app="myapp">
		<h2>Product Details</h2>
		<p class="exlpain-line" >Details of the Product</p>
		<table class="table table-bordered" id="prod">
			<tbody>
				<tr>
					<td>Prodcut Image</td>
					<td ><img src="/products/${product.id}.jpg" alt="${product.productName}" /></td>
				</tr>
				<tr>
					<td>Prodcut ID</td>
					<td>${product.id}</td>
				</tr>
				<tr>
					<td>Product Name</td>
					<td>${product.productName}</td>
				</tr>
				<tr>
					<td>Product Category</td>
					<td>${product.productCategory}</td>
				</tr>
				<tr>
					<td>Product Description</td>
					<td>${product.productDescription}</td>
				</tr>
				<tr>
					<td>Product Manufacturer</td>
					<td>${product.productManufacturer}</td>
				</tr>
				<tr>
					<td>Product Price</td>
					<td>${product.productPrice}</td>
				</tr>
				<tr>
					<td>Stock Available</td>
					<td>${product.unitStock}</td>
				</tr>
			</tbody>
		</table>

		<c:url value="/cart/add/${product.id}" var="addcart"></c:url>
		<div class="buttons" ng-controller="myController">
			<p class="left">
				<security:authorize access="hasRole('ROLE_USER')">
					<a href="#" ng-click="addToCart(${product.id})"
						class="btn btn-info">
						<i class="fas fa-cart-arrow-down"></i> Add to Cart
					</a>
				</security:authorize>
			</p>

			<p class="right">
				<a href="<c:url value="/getAllProducts" />" class="btn btn-info"> 
					<i class="far fa-arrow-alt-circle-left"></i> Go Back
				</a>
			</p>
		</div>
		
	</div>	
</section>
<jsp:include page="basic/footer.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="<c:url value="/resource/js/productController.js"/>"></script>
</body>
</html>
