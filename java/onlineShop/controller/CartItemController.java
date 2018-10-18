package onlineShop.controller;


import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import onlineShop.model.Cart;
import onlineShop.model.CartItem;
import onlineShop.model.Customer;
import onlineShop.model.Product;
import onlineShop.service.CartItemService;
import onlineShop.service.CartService;
import onlineShop.service.CustomerService;
import onlineShop.service.ProductService;

@Controller
public class CartItemController {
    @Autowired
    private CartService cartService;

    @Autowired
    private CartItemService cartItemService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private ProductService productService;

    @RequestMapping("/cart/add/{productId}")
    public ResponseEntity<String> addCartItem(@PathVariable(value = "productId") int productId) {
		Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
		String username = loggedInUser.getName();
		Customer customer = customerService.getCustomerByUserName(username);

		Cart cart = customer.getCart();
		List<CartItem> cartItems = cart.getCartItem();
		Product product = productService.getProductById(productId);

		for (int i = 0; i < cartItems.size(); i++) {
			CartItem cartItem = cartItems.get(i);
			if (product.getId() == (cartItem.getProduct().getId())) {
				if(product.getUnitStock()==cartItem.getQuantity()) 
					return new ResponseEntity<String>(HttpStatus.NOT_ACCEPTABLE);
				cartItem.setQuantity(cartItem.getQuantity() + 1);
				cartItem.setPrice(cartItem.getQuantity() * cartItem.getProduct().getProductPrice());
				cartItemService.addCartItem(cartItem);
				return new ResponseEntity<String>(HttpStatus.NO_CONTENT);
			}
		}

		CartItem cartItem = new CartItem();
		cartItem.setQuantity(1);
		cartItem.setProduct(product);
		cartItem.setPrice(product.getProductPrice());
		cartItem.setCart(cart);
		cartItemService.addCartItem(cartItem);
		return new ResponseEntity<String>(HttpStatus.NO_CONTENT);
    }

    @RequestMapping("/cart/removeCartItem/{cartItemId}")
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void removeCartItem(@PathVariable(value = "cartItemId") int cartItemId) {
   	 cartItemService.removeCartItem(cartItemId);
    }
    
    @RequestMapping("/admin/cart/removeAllItems/{cartId}")
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void removeAllCartItems(@PathVariable(value = "cartId") int cartId) {
   	 Cart cart = cartService.getCartById(cartId);
   	 cartService.removeAllCartItems(cart);
    }

    @RequestMapping("/cart/removeAllItems")
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void removeAllCartItems(Principal principal) {
    	String uid =  principal.getName();
    	int cartId = customerService.getCustomerByUserName(uid).getCart().getId();
   	 	Cart cart = cartService.getCartById(cartId);
   	 	cartService.removeAllCartItems(cart);
    }
}
