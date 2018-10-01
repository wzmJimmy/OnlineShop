<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="<c:url value="/resource/css/basic/slider.css"/>">
<body>
	<!-- Slider -->
	<div class="jumbotron">
		<!-- <div id="imgDiv" class="left"></div> -->
		
		<div class="container">
			<div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
					<li data-target="#myCarousel" data-slide-to="4"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<img src="<c:url value="/resource/images/pixel.jpg"/>" alt="Image1">
					</div>

					<div class="carousel-item">
						<img src="<c:url value="/resource/images/iphone.jpg"/>" alt="Image2">
					</div>

					<div class="carousel-item">
						<img src="<c:url value="/resource/images/oppo2.jpg"/>" alt="Image3">
					</div>

					<div class="carousel-item">
						<img src="<c:url value="/resource/images/samsung.jpg"/>" alt="Image4">
					</div>

					<div class="carousel-item">
						<img src="<c:url value="/resource/images/buy.jpg"/>" alt="Image5">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
					<span class="sr-only">Previous</span>
				</a> 
				<a class="carousel-control-next" href="#myCarousel" data-slide="next"> 
				<span class="carousel-control-next-icon" aria-hidden="true"></span> 
				<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		
	</div>
<!-- <script type="text/javascript">
	window.onload = function() {
		var bigImg = document.createElement("img");
		bigImg.src = getImgSource();
		bigImg.width = "200";
		bigImg.style = "margin-top:100px;";
		var myDiv = document.getElementById('imgDiv');
		myDiv.appendChild(bigImg);
	};

	function getImgSource() {
   	 var xhttp = new XMLHttpRequest();
   	 var url = "http://localhost:8080/AdsSystem/Ad"; /*http://18.218.24.105:8080/AdsSystem/Ad*/
   	 xhttp.open("GET", url, false);
   	 xhttp.send();
   	 var response = xhttp.responseText;
   	 var obj = JSON.parse(response);
   	 console.log(obj.image_url);
   	 return obj[0].image_url
    }
</script> -->
</body>
</html>