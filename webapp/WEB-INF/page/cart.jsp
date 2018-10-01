<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Cart</title>
    <link rel="icon" type="image/x-icon" href="<c:url value="/resource/images/favicon.png"/>"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/common.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/cart.css"/>">
</head>
<body>
<%@ include file="basic/navbar.jsp" %>
<section class="background">
	<div class="container" ng-app="myapp" ng-controller="myController">
		<div ng-init="getCart(${cartId})">
			<div class="sub-title">List of Products Purchased</div>

			<div id="high-btns" class="buttons">
				<a class="btn btn-danger" ng-click="clearCart()" style="color: #fff;"> 
					<i class="far fa-trash-alt"></i> Clear Cart </a>
				
				<c:url value="/order/${cartId}" var="url1"></c:url>
				<a href="${url1}" class="btn btn-danger"> 
					<i class="far fa-check-circle"></i> Check Out
				</a>
				
				<c:url value="/getAllProducts" var="url"></c:url>
				<a href="${url}" class="btn btn-danger"> 
					<i class="fas fa-cart-plus"></i> Continue Shopping
				</a>
			</div>

			<table class="table table-hover" id="productList">
				<thead>
					<tr>
						<th>Product Name</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Total Price</th>
						<th>Action</th>
					</tr>
				</thead>

				<tbody>
					<tr ng-repeat="cart in carts.cartItem">
						<td>{{cart.product.productName}}</td>
						<td>{{cart.quantity}}</td>
						<td>{{cart.product.productPrice}}</td>
						<td>{{cart.price}}</td>
						<td><a href="#" class="btn btn-danger"
							ng-click="removeFromCart(cart.id)" style="margin-top: 0px;">
								<i class="far fa-times-circle"></i>remove
						</a></td>
				</tbody>

			</table>

			<div id="cost">Total Cost: {{calculateTotal()}}</div>

			<div id="low-btns" class="buttons" style="display:none;">
				<a class="btn btn-danger" ng-click="clearCart()" style="color: #fff;"> 
					<i class="far fa-trash-alt"></i> Clear Cart </a>
				
				<c:url value="/order/${cartId}" var="url1"></c:url>
				<a href="${url1}" class="btn btn-danger"> 
					<i class="far fa-check-circle"></i> Check Out
				</a>
				
				<c:url value="/getAllProducts" var="url"></c:url>
				<a href="${url}" class="btn btn-danger"> 
					<i class="fas fa-cart-plus"></i> Continue Shopping
				</a>
			</div>
				
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