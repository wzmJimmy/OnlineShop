<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/basic/grid.css"/>">
<body>
<section id="main-grid" style="box-shadow: 0px -1px 2px #808080;">
	<div style="height:20px;border-bottom: 1px solid #808080;"></div>
	<div class="w3-row-padding" >
		<div class="w3-third w3-container w3-margin-bottom">
			<img src="<c:url value="/resource/images/products/oppo.jpg"/>"
				alt="Norway" class="w3-hover-opacity">
			<div class="w3-container w3-white">
				<p><b>Oppo A37</b></p>
				<ul>
					<li>Technology - GSM/HSPA/LTE</li>
					<li>Resolution - 720x1280 pixels</li>
					<li>OS - Android OS, v5.1(Lollipop)</li>
					<li>Price - 3000.00</li>
				</ul>
			</div>
		</div>

		<div class="w3-third w3-container w3-margin-bottom">
			<img src="<c:url value="/resource/images/products/vivo.jpg"/>"
				alt="Norway"  class="w3-hover-opacity">
			<div class="w3-container w3-white">
				<p><b>Vivo V9</b></p>
				<ul>
					<li>Technology - GSM/HSPA/LTE</li>
					<li>Resolution - Android 8.1 pixels</li>
					<li>OS - Android 8.1</li>
					<li>Price - $349.00</li>
				</ul>
			</div>
		</div>
		<div class="w3-third w3-container w3-margin-bottom">
			<img src="<c:url value="/resource/images/products/samsung.jpg"/>"
				alt="Norway"  class="w3-hover-opacity">
			<div class="w3-container w3-white">
				<p><b>Samsung Galaxy S8</b></p>
				<ul>
					<li>Technology - GSM/HSPA/LTE</li>
					<li>Resolution - 2960x1440 pixels</li>
					<li>OS - Android 7.0</li>
					<li>Price - $549.00</li>
				</ul>
			</div>
		</div>
		
	</div>

	<hr>
	<div class="w3-row-padding">
		<div class="w3-third w3-container w3-margin-bottom">
			<img src="<c:url value="/resource/images/products/pixel.jpg"/>"
				alt="Norway" class="w3-hover-opacity">
			<div class="w3-container w3-white">
				<p><b>Google Pixel</b></p>
				<ul>
					<li>Technology - GSM/HSPA/LTE</li>
					<li>Resolution - 2880x1440 pixels</li>
					<li>OS - Android 8.0</li>
					<li>Price - $649.00</li>
				</ul>
			</div>
		</div>

		<div class="w3-third w3-container w3-margin-bottom">
			<img src="<c:url value="/resource/images/products/iphonex.jpg"/>"
				alt="Norway" class="w3-hover-opacity">
			<div class="w3-container w3-white">
				<p ><b>iPhoneX</b></p>
				<ul>
					<li>Technology - GSM/HSPA/LTE</li>
					<li>Resolution - 2436x1125 pixels</li>
					<li>OS - iOS 11</li>
					<li>Price - $999.00</li>
				</ul>
			</div>
		</div>
		<div class="w3-third w3-container w3-margin-bottom">
			<img src="<c:url value="/resource/images/products/huawei.jpg"/>"
				alt="Norway" class="w3-hover-opacity">
			<div class="w3-container w3-white">
				<p><b>Huawei Mate 10</b></p>
				<ul>
					<li>Technology - GSM/HSPA/LTE</li>
					<li>Resolution - 1440 x 2560 pixels</li>
					<li>OS - Android 8.0</li>
					<li>Price - $549.00</li>
				</ul>
			</div>
		</div>
	</div>
</section>
</body>

</html>