<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<%@ include file="/WEB-INF/page/basic/navbar.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shipping Details</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/submit-panel.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/common.css"/>">

</head>
<body>
<section class="background">
	<div class="container card">
   		<div class="card-header"><h1>Confirm Shipping Address</h1></div>
	    <div class="card-body">
            <form:form modelAttribute="order">
                <div class="sub-panel last">
					<div class="sub-title">Shipping Address</div>
					<div class="form-group">
						<label for="address">Address</label>
						<form:textarea type="text" class="form-control"
							path="cart.customer.shippingAddress.address"/>
					</div>
					<div class="row">
						<div class="col-md-6 form-group">
							<label for="city">City</label>
							<form:input type="text" class="form-control"
								path="cart.customer.shippingAddress.city"/>
						</div>
						<div class="col-md-6 form-group">
							<label for="state">State</label>
							<form:input type="text" class="form-control"
								path="cart.customer.shippingAddress.state"/>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 form-group">
							<label for="country">Country</label>
							<form:input type="text" class="form-control"
								path="cart.customer.shippingAddress.country"/>
						</div>
						<div class="col-md-6 form-group">
							<label for="zipcode">ZipCode</label>
							<form:input type="text" class="form-control"
								path="cart.customer.shippingAddress.zipcode"/>
						</div>
					</div>
				</div>

				<input type="hidden" name="_flowExecutionKey" />

				<div class="form-actions buttons">
					<button class="btn btn-lg btn-info left"
						name="_eventId_backToCollectCustomerInfo">Back</button>
					<button type="Submit" class="btn btn-lg btn-info"
						name="_eventId_shippingDetailCollected">Next</button>
					<button  class="btn btn-lg btn-info right"
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
