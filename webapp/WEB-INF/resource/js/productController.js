var li =[];
var stocks = $(".stock");
var len = stocks.length;
var chart = $(".addToChart");
var bool = !!chart.length;
for(var i=0;i<len;i++){li.push(stocks[i].innerHTML.trim())}
var style = ["color:#FF7F50","color:#00008B","color:#F00"];
for( i in li){
	var flag = 0; 
	if(li[i]=="Sufficient") flag=1;
	if(li[i]=="Shortage") flag=2;
	
	stocks[i].style=style[flag];
	if(bool&&flag==2){chart[i].style="display:none";}
}

var app = angular.module("myapp", []).controller(
		"myController",
		function($scope, $http) {

			var BASE_PATH = "http://18.218.24.105/onlineShop"; //"http://18.218.24.105/onlineShop" "http://localhost:8080/onlineShop"

			$scope.getProductList = function() {
				$http.get(BASE_PATH + "/getProductsList")
						.success(function(data) {
							$scope.products = data;
						});
			}

			$scope.addToCart = function(productId) {
				
				$http.put(BASE_PATH + "/cart/add/" + productId)
						.then(function() {
							alert("Added Successfully");
						},function() {
							alert("Cannot Add any more");
						})
			}

			$scope.refreshCart = function() {
				$http.get(BASE_PATH + "/cart/getCart/"
								+ $scope.cartId).success(function(data) {

					$scope.carts = data;
				})
			}

			$scope.getCart = function(cartId) {
				$scope.cartId = cartId;
				$scope.refreshCart(cartId);
			}
			
			$scope.removeFromCart = function(cartItemId) {
				$http.put(BASE_PATH +"/cart/removeCartItem/"
								+ cartItemId).success(function() {
					$scope.refreshCart();
				});
			}

			$scope.clearCart = function() {
				$http.put(BASE_PATH + "/cart/removeAllItems/")
					.success(function() {
					$scope.refreshCart();
				});
			}

			$scope.calculateTotal = function() {
				var total = 0.0;
				for (var i = 0; i < $scope.carts.cartItem.length; i++)
					total = total + $scope.carts.cartItem[i].price;
				return total;

			}
		});


