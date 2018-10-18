<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<%@ include file="/WEB-INF/page/basic/navbar.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Information</title>
<link rel="icon" type="image/x-icon" href="<c:url value="/resource/images/favicon.png"/>" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/submit-panel.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/common.css"/>">
</head>
<body>
<section class="background">
	<div class="container card">
		<div class="card-header"><h1>Customer Details</h1></div>
			<div class="card-body">
				<form:form modelAttribute="order">
					<div class="sub-panel">
						<div class="row">
							<div class="col-md-6 form-group">
								<label for="firstName">First Name</label><sup>*</sup>
								<form:input id="firstName" type="text" class="form-control"
									path="cart.customer.firstName"/>
							</div>
							<div class="col-md-6 form-group">
								<label for="lastName">Last Name</label><sup>*</sup>
								<form:input id="lastName" type="text" class="form-control"
									path="cart.customer.lastName"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 form-group">
								<label for="user.emailId">Email Id</label><sup>*</sup>
								<form:input id="email" type="text" class="form-control"
									path="cart.customer.user.emailId"/>
							</div>
							<div class="col-md-6 form-group">
								<label for="customerPhone">Phone Number</label><sup>*</sup>
								<form:input id="phone" type="text" class="form-control"
									path="cart.customer.customerPhone"/>
							</div>
						</div>
					</div>
					
					<div class="form-check center">
						<input class="form-check-input" type="checkbox" id="check" checked
						data-toggle="collapse" data-target="#billing" aria-controls="billing"> 
						<label class="form-check-label big" for="check"> Use user's default billing address </label>
					</div>
					
					<div id="billing"class="sub-panel last collapse">
						<div class="sub-title">Billing Address</div>
						<div class="form-group">
							<label for="address">Address</label><sup>*</sup>
							<form:textarea id="address" type="text" class="form-control billing"
								path="cart.customer.billingAddress.address"/>
						</div>
						<div class="row">
							<div class="col-md-6 form-group">
								<label for="city">City</label><sup>*</sup>
								<form:input id="city" type="text" class="form-control billing"
									path="cart.customer.billingAddress.city"/>
							</div>
							<div class="col-md-6 form-group">
								<label for="state">State</label><sup>*</sup>
								<form:input id="state" type="text" class="form-control billing"
									path="cart.customer.billingAddress.state"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 form-group">
								<label for="country">Country</label><sup>*</sup>
								<form:input id="country" type="text" class="form-control billing"
									path="cart.customer.billingAddress.country"/>
							</div>
							<div class="col-md-6 form-group">
								<label for="zipcode">ZipCode</label><sup>*</sup>
								<form:input id="zipcode" type="text" class="form-control billing"
									path="cart.customer.billingAddress.zipcode"/>
							</div>
						</div>
					</div>
						
					<input type="hidden" name="_flowExecutionKey" />

					<div class="form-actions buttons">
						<button type="Submit" class="btn btn-lg btn-info left" name="_eventId_customerInfoCollected">Next</button>
						<button class="btn btn-lg btn-info right" name="_eventId_cancel">Cancel</button>
					</div>

			</form:form>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/page/basic/footer.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="<c:url value="/resource/js/validate.js"/>"></script>
<script src="<c:url value="/resource/js/collect_info_check.js"/>"></script>
</body>
</html>