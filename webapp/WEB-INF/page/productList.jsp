<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Management</title>
<link rel="icon" type="image/x-icon" href="<c:url value="/resource/images/favicon.png"/>" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/common.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/ProductList.css"/>">
</head>
<body>
<%@ include file="basic/navbar.jsp" %>

<section class="background">
	<div class="container" id="productTable" ng-app="myapp">
		<h2>Product Management</h2>
		<p class="exlpain-line">The List of Products in our Database</p>
		
		<table class="table table-responsive table-bordered table-hover" id="productList">
			<thead class="thead-dark">
				<tr>
					<th>Screen-Shot</th>
					<th>Product Name</th>
					<th>Products Price</th>
					<th>Condition of stock</th>
					<th>Details
					<security:authorize access="hasRole('ROLE_USER')" >
						/Add to Cart
					</security:authorize> 
					<!-- views only to the admin --> 
					<security:authorize access="hasRole('ROLE_ADMIN')">
						/Edit/Delete
					</security:authorize>
					</th>
				</tr>
			</thead>	
			<tbody>
				<c:forEach items="${products}" var="prod">
					<tr>
						<td style="width: 120px">
						<img src="/products/${prod.id}.jpg"
							style="width: 100px; height: 90px;"/></td>
						<td>${prod.productName}</td>
						<td>${prod.productPrice}</td>
						<td  class="stock">
						<c:if test="${prod.unitStock>10}">Sufficient</c:if>
						<c:if test="${prod.unitStock>0&&prod.unitStock<10}">Only ${prod.unitStock} in Stock</c:if>
						<c:if test="${prod.unitStock<=0}">Shortage</c:if> 
						</td>
						
						<td ng-controller="myController" style="width: 170px">
							<a href="getProductById/${prod.id}" class="btn btn-info" role="button"> 
								<i class="fas fa-info-circle"></i></a>

							<!-- view only for user --> 
							<security:authorize access="hasRole('ROLE_USER')">
								<a  href="#" ng-click="addToCart(${prod.id})" class="btn btn-primary addToChart" 
								style="margin-left: 5px">
									<i class="fas fa-cart-arrow-down"></i></a>
							</security:authorize> 
							
							<!-- view only to the admin --> 
							<security:authorize access="hasRole('ROLE_ADMIN')">
								<a href="admin/product/editProduct/${prod.id}" class="btn btn-success"
								 style="margin-left: 5px"> 
									<i class="fas fa-edit"></i></a>
								<a href="admin/delete/${prod.id}" class="btn btn-danger"
									style="margin-left: 5px"> 
										<i class="fas fa-trash-alt"></i></a>
							</security:authorize>
						</td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
</section>
<jsp:include page="basic/footer.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="<c:url value="/resource/js/productController.js"/>"></script>
</body>
</html>