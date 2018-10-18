<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/page/basic/navbar.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>

<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE jsp:useBean PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Final Check</title>
<link rel="icon" type="image/x-icon" href="<c:url value="/resource/images/favicon.png"/>" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/submit-panel.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/common.css"/>">		
</head>
<body>
<section class="background">
	<div class="container card bill">
		<div class="card-body">
			<form:form modelAttribute="order" class="form-horizontal">
				<div class="center"><h1>Receipt</h1></div>
				<p class="text-right">
					Shipping Date:
					<fmt:formatDate type="date" value="${now}" />
				</p>

				<div class="row">
					<div class="col-md-6 col-sm-6">
						<strong>Shipping Address</strong>
						<address class="box">
							${order.cart.customer.shippingAddress.address} <br />
							${order.cart.customer.shippingAddress.city},
							${order.cart.customer.shippingAddress.state} <br />
							${order.cart.customer.shippingAddress.country},
							${order.cart.customer.shippingAddress.zipcode}
						</address>
					</div>
					<div class="col-md-6 col-sm-6">
						<strong>Billing Address</strong>
						<address class="box">
							${order.cart.customer.billingAddress.address} <br />
							${order.cart.customer.billingAddress.city},
							${order.cart.customer.billingAddress.state} <br />
							${order.cart.customer.billingAddress.country},
							${order.cart.customer.billingAddress.zipcode}
						</address>
					</div>
				</div>

				<table class="table table-bordered table-hover">
					<thead class="thead-light">
						<tr>
							<th class="text-center">Product</th>
							<th class="text-center">Quantity</th>
							<th class="text-center">Price</th>
							<th class="text-center">Total</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cartItem" items="${order.cart.cartItem}">
							<tr>
								<td style="text-align: center"><em>${cartItem.product.productName}</em></td>
								<td style="text-align: center">${cartItem.quantity}</td>
								<td style="text-align: center">${cartItem.product.productPrice}</td>
								<td style="text-align: center">${cartItem.price}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div>
					<h5 id="cost">
						Total:  <span class="text-danger">$ ${order.cart.totalPrice}</span>
					</h5>
				</div>

				<input type="hidden" name="_flowExecutionKey" /> <br /> <br />
				<div class="buttons">
					<button class="btn btn-lg btn-info left"
						name="_eventId_backToCollectShippingDetail">Back</button>

					<input  type="submit"
						value="Submit Order" class="btn btn-lg btn-info"
						name="_eventId_orderConfirmed" />

					<button class="btn btn-lg btn-info right"
						name="_eventId_cancel">Cancel</button>
				</div>		
			</form:form>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/page/basic/footer.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>