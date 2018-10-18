<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<div idclass="sub-panel last">
		<div class="row">
			<div class="col-md-6 form-group">
				<form:label path="id">Product Id(auto-generated)</form:label>
				<form:input type="text" placeholder="ProductId(auto-generated)"
					class="form-control" path="id" disabled="true" />
			</div>
			<div class="col-md-6 form-group">
				<form:label path="productName">Product Name</form:label><sup>*</sup>
				<form:input type="text" placeholder="Enter Product Name"
					class="form-control product" path="productName" />
			</div>
		</div>

		<div class="form-group">
			<form:label path="productDescription">Product Description</form:label>
			<form:textarea type="text" placeholder="Enter Description"
				class="form-control" path="productDescription" />
		</div>
		<div class="form-group">
			<form:label path="productCategory">Product Category</form:label><sup>*</sup>
			<form:select class="form-control  product" path="productCategory">
			 	<form:option value="" label="Choose one OS type."/>
				<form:option value="Android" label="Android"/>
				<form:option value="IOS" label="IOS"/>
			</form:select>
		</div>

		<div class="row">
			<div class="col-md-4 form-group">
				<form:label path="productManufacturer">Product Manufacturer</form:label>
				<form:input type="text" placeholder="Enter Product Manufacurer"
					class="form-control" path="productManufacturer"></form:input>
			</div>
			<div class="col-md-4 form-group">
				<form:label path="productPrice">Product Price</form:label><sup>*</sup>
				<form:input type="text" placeholder="Enter Product Price"
					class="form-control  product" path="productPrice"></form:input>
			</div>
			<div class="col-md-4 form-group">
				<form:label path="unitStock" >Number of Products</form:label><sup>*</sup>
				<form:input type="text" id="Number_of_Products" placeholder="Number of Products"
					class="form-control  product" path="unitStock"></form:input>
			</div>
		</div>
		<div class="form-group">
			<form:label path="productImage" Style="margin-right:20px;">Product Image</form:label><sup id="if-star">*</sup>
			<form:input id="imageFile" type="file" path="productImage" /> 
		</div>
		<div class="form-actions">
			<button id="submit" type="submit" class="btn btn-lg btn-info">Update</button>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="<c:url value="/resource/js/validate.js"/>"></script>
<script src="<c:url value="/resource/js/product_check.js"/>"></script>
</body>
</html>