<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<div class="sub-panel last">
		<div class="row">
			<div class="col-md-6 form-group">
				<form:label path="id">Product Id</form:label>
				<form:input type="text" placeholder="ProductId(auto-generated)"
					class="form-control" path="id" disabled="true" />
			</div>
			<div class="col-md-6 form-group">
				<form:label path="productName">Product Name</form:label>
				<form:input type="text" placeholder="Enter Product Name"
					class="form-control" path="productName" />
			</div>
		</div>

		<div class="form-group">
			<form:label path="productDescription">Product Description</form:label>
			<form:textarea type="text" placeholder="Enter Description"
				class="form-control" path="productDescription" />
		</div>
		<div class="form-group">
			<form:label path="productCategory">Product Category</form:label>
			<form:select class="form-control" path="productCategory">
				<option value="">Choose an os type.</option>
				<option value="Android">Android</option>
				<option value="Mac">IOS</option>
			</form:select>
		</div>

		<div class="row">
			<div class="col-md-4 form-group">
				<form:label path="productManufacturer">Product Manufacturer</form:label>
				<form:input type="text" placeholder="Enter Product Manufacurer"
					class="form-control" path="productManufacturer"></form:input>
			</div>
			<div class="col-md-4 form-group">
				<form:label path="productPrice">Product Price</form:label>
				<form:input type="text" placeholder="Enter Product Price"
					class="form-control" path="productPrice"></form:input>
			</div>
			<div class="col-md-4 form-group">
				<form:label path="unitStock" >Number of Products</form:label>
				<form:input type="text" placeholder="Number of Products"
					class="form-control" path="unitStock"></form:input>
			</div>
		</div>
		<div class="form-group">
			<form:label path="productImage" Style="margin-right:20px;">Product Image: </form:label>
			<form:input type="file" path="productImage" />
		</div>
		<div class="form-actions">
			<button type="submit" class="btn btn-lg btn-info">Update</button>
		</div>
	</div>
</body>
</html>