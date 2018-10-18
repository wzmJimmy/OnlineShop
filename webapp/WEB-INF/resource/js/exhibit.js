(function() {
 var BASE_PATH = "http://18.218.24.105/onlineShop"; //"http://18.218.24.105/onlineShop" "http://localhost:8080/onlineShop"
 
 $.ajax(BASE_PATH+"/ProductsGrid").done((data)=>{
	 //console.log(data);
	 if(data.length>0) successGet(data);
	 });
 
 var sample = {
	id: -1,
	productName: "Sample",
	productDescription: "Sample",
	productPrice:"Sample",
 }
	
function successGet(data){
	 var len = data.length;
	 for(var i=0;i<6-len;i++) data.push(sample);
	 
	 var container = $("#main-grid");
	 var seperateline = $("<div class='seperateline'></div>");
	 var firstrow = $("<div class='w3-row-padding'></div>");
	 var hr = $("<hr/>");
	 var secondrow = $("<div class='w3-row-padding'></div>");
	 
	 for(var i=0; i<6; i++){		 
		 var contents = $("<div class='w3-third w3-container w3-margin-bottom'></div>");
		 
		 var src = "/products/"+data[i].id+".jpg";
		 $("<img src='"+src+"'alt='"+data[i].productName+"' class='w3-hover-opacity'/>").appendTo(contents);
		 
		 var words = $("<div class='w3-container w3-white tab'></div>");
		 $("<p class='big'><b>"+data[i].productName+"</b></p>").appendTo(words);
		 $("<p class='gridWords'>"+data[i].productDescription+
				 "<br/><b>Price</b> - $"+data[i].productPrice+"</p>").appendTo(words);
		 words.appendTo(contents);
		 
		 var grid;
		 if(i<len) {
			 grid = $("<a href='getProductById/"+data[i].id+"'></a>");
			 grid.append(contents);
		 } else grid = contents;
		 
		 if(i<3) grid.appendTo(firstrow);
		 else grid.appendTo(secondrow);
	 }
	 
	 container.html("");
	 container.append(seperateline,firstrow,hr,secondrow); 
}

})();