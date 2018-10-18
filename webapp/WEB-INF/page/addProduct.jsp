<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product</title>
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
		<div class="card-header"><h1>Add Product</h1></div>
		<div class="card-body">
			<c:url value="/admin/product/addProduct" var="url"></c:url>
			<form:form method="post" action="${url}" modelAttribute="productForm" enctype="multipart/form-data">
				<%@ include file="basic/product.jsp"%>
			</form:form>
		</div>
	</div>
</section>
<jsp:include page="basic/footer.jsp"></jsp:include>
</body>
</html>