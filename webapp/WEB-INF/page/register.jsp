<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Here</title>
<link rel="icon" type="image/x-icon" href="<c:url value="/resource/images/favicon.png"/>" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/submit-panel.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/common.css"/>">
</head>
<body>
<%@ include file="basic/navbar.jsp"%>
	<section class="background">
		<div class="container card">
			<div class="card-header"><h1>Register</h1></div>
			<div class="card-body">
				<c:url value="/customer/registration" var="url"></c:url>
				<form:form method="post" action="${url}" modelAttribute="customer" enctype="multipart/form-data">
					<div class="sub-panel">
						<div class="sub-title">User Details</div>
						<div class="row">
							<div class="col-md-6 form-group">
								<form:label path="firstName">First Name</form:label>
								<form:input type="text" placeholder="Enter First Name"
									class="form-control" path="firstName"/>
								<form:errors path="firstName"/>
							</div>
							<div class="col-md-6 form-group">
								<form:label path="lastName">Last Name</form:label>
								<form:input type="text" placeholder="Enter Last Name"
									class="form-control" path="lastName"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 form-group">
								<form:label path="user.emailId">Email Id</form:label>
								<form:input type="text" placeholder="Enter Email ID"
									class="form-control" path="user.emailId"/>
								<form:errors path="user.emailId"/>
							</div>
							<div class="col-md-6 form-group">
								<form:label path="customerPhone">Phone Number</form:label>
								<form:input type="text" placeholder="Enter Phone Number"
									class="form-control" path="customerPhone"/>
								<form:errors path="customerPhone"/>
							</div>
						</div>
					</div>

					<div class="sub-panel">
						<div class="sub-title">Shipping Address</div>
						<div class="form-group">
							<form:label path="shippingAddress.address">Address</form:label>
							<form:textarea type="text" placeholder="Enter Shipping Address"
								class="form-control" path="shippingAddress.address"/>
						</div>
						<div class="row">
							<div class="col-md-6 form-group">
								<form:label path="shippingAddress.city">City</form:label>
								<form:input type="text" placeholder="Enter Current City"
									class="form-control" path="shippingAddress.city"/>
							</div>
							<div class="col-md-6 form-group">
								<form:label path="shippingAddress.state">State</form:label>
								<form:input type="text" placeholder="Enter your State"
									class="form-control" path="shippingAddress.state"/>
								<form:errors path="shippingAddress.state"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 form-group">
								<form:label path="shippingAddress.country">Country</form:label>
								<form:input type="text" placeholder="Enter your country"
									class="form-control" path="shippingAddress.country"/>
							</div>
							<div class="col-md-6 form-group">
								<form:label path="shippingAddress.zipcode">ZipCode</form:label>
								<form:input type="text" placeholder="Enter zipcode"
									class="form-control" path="shippingAddress.zipcode"/>
								<form:errors path="shippingAddress.zipcode"/>
							</div>
						</div>
					</div>

					<div class="sub-panel last">
						<div class="sub-title">Billing Address</div>
						<div class="form-group">
							<form:label path="billingAddress.address">Address</form:label>
							<form:textarea type="text" placeholder="Enter Billing Address"
								class="form-control" path="billingAddress.address"/>
						</div>
						<div class="row">
							<div class="col-md-6 form-group">
								<form:label path="billingAddress.city">City</form:label>
								<form:input type="text" placeholder="Enter your City"
									class="form-control" path="billingAddress.city"/>
							</div>
							<div class="col-md-6 form-group">
								<form:label path="billingAddress.state">State</form:label>
								<form:input type="text" placeholder="Enter your state.."
									class="form-control" path="billingAddress.state"/>
								<form:errors path="billingAddress.state"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 form-group">
								<form:label path="billingAddress.country">Country</form:label>
								<form:input type="text" placeholder="Enter your City"
									class="form-control" path="billingAddress.country"/>
							</div>
							<div class="col-md-6 form-group">
								<form:label path="billingAddress.zipcode">ZipCode</form:label>
								<form:input type="text" placeholder="Enter Zipcode"
									class="form-control" path="billingAddress.zipcode"/>
								<form:errors path="billingAddress.zipcode"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 form-group">
								<form:label path="user.password">Password</form:label>
								<form:input type="password" placeholder="******"
									class="form-control" path="user.password" id="pass"/>
							</div>
							<div class="col-md-6 form-group">
								<label>Confirm Password</label> 
								<input type="password" placeholder="******" class="form-control" id="confirmpass" />
							</div>
						</div>
					</div>

					<div class="form-actions">
						<button type="submit" class="btn btn-lg btn-info"
							onclick="return Validate()">Submit</button>
					</div>

				</form:form>
			</div>
		</div>
	</section>
<%@ include file="basic/footer.jsp"%>

	<!-- Validating Password -->
	<script type="text/javascript">
		function Validate() {
			var password = document.getElementById("pass").value;
			var confirmpass = document.getElementById("confirmpass").value;
			if (password != confirmpass) {
				alert("Password does Not Match!");
				return false;
			}
			return true;
		}
	</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>