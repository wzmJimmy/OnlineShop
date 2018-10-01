<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/page/basic/navbar.jsp"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE jsp:useBean PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thank you</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/submit-panel.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/common.css"/>">	
</head>
<body>
<section class="background">
	<div class="container card">
		<div class="card-header alert-danger">
			<h1>Invalid Cart!</h1>
		</div>
		<div class="card-body">
		<p>Your checkout process is cancelled! You may continue shopping.</p>
		<div class="center">
			<a href="<spring:url value="/getAllProducts" />" class="btn btn-light">Browse Products</a>
		</div>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/page/basic/footer.jsp"%>
</body>
</html>