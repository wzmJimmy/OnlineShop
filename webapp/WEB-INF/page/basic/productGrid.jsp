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
	<div class="seperateline"></div>
	
	<div class="w3-row-padding" >
		<div class="w3-third w3-container w3-margin-bottom">
			<img src="<c:url value="/resource/images/products/oppo.jpg"/>" alt="Norway" class="w3-hover-opacity">
			<div class="w3-container w3-white tab">
				<p><b>Oppo A37</b></p>
				<p>
					Technology - GSM/HSPA/LTE<br/>
					Resolution - 720x1280 pixels<br/>
					OS - Android OS, v5.1(Lollipop)<br/>
					Price - $450.00
				</p>
			</div>
		</div>

		<div class="w3-third w3-container w3-margin-bottom">
			<img src="<c:url value="/resource/images/products/vivo.jpg"/>"
				alt="Norway"  class="w3-hover-opacity">
			<div class="w3-container w3-white">
				<p><b>Vivo V9</b></p>
				<p>
					Technology - GSM/HSPA/LTE<br/>
					Resolution - Android 8.1 pixels<br/>
					OS - Android 8.1<br/>
					Price - $349.00
				</p>
			</div>
		</div>
		<div class="w3-third w3-container w3-margin-bottom">
			<img src="<c:url value="/resource/images/products/samsung.jpg"/>"
				alt="Norway"  class="w3-hover-opacity">
			<div class="w3-container w3-white">
				<p><b>Samsung Galaxy S8</b></p>
				<p>
					Technology - GSM/HSPA/LTE<br/>
					Resolution - 2960x1440 pixels<br/>
					OS - Android 7.0<br/>
					Price - $549.00
				</p>
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
				<p>
					Technology - GSM/HSPA/LTE<br/>
					Resolution - 2880x1440 pixels<br/>
					OS - Android 8.0<br/>
					Price - $649.00
				</p>
			</div>
		</div>

		<div class="w3-third w3-container w3-margin-bottom">
			<img src="<c:url value="/resource/images/products/iphonex.jpg"/>"
				alt="Norway" class="w3-hover-opacity">
			<div class="w3-container w3-white">
				<p ><b>iPhoneX</b></p>
				<p>
					Technology - GSM/HSPA/LTE<br/>
					Resolution - 2436x1125 pixels<br/>
					OS - iOS 11<br/>
					Price - $999.00
				</p>
			</div>
		</div>
		<div class="w3-third w3-container w3-margin-bottom">
			<img src="<c:url value="/resource/images/products/huawei.jpg"/>"
				alt="Norway" class="w3-hover-opacity">
			<div class="w3-container w3-white">
				<p><b>Huawei Mate 10</b></p>
				<p>
					Technology - GSM/HSPA/LTE<br/>
					Resolution - 1440 x 2560 pixels<br/>
					OS - Android 8.0<br/>
					Price - $549.00
				</p>
			</div>
		</div>
	</div>
</section>
</body>
<script src="<c:url value="/resource/js/exhibit.js"/>"></script>
</html>