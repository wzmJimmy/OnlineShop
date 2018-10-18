package onlineShop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onlineShop.dao.CartDao;
import onlineShop.dao.CartItemDao;
import onlineShop.dao.ProductDao;
import onlineShop.model.Cart;
import onlineShop.model.CartItem;
import onlineShop.model.Product;


@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDao cartDao;
	@Autowired
	private CartItemDao cartItemDao;
	@Autowired
	private ProductDao productDao;
	
	public Cart getCartById(int CartId) {
		Cart cart = cartDao.getCartById(CartId);
		for(CartItem cartItem:cart.getCartItem()) {
			cartItemDao.checkStock(cartItem);
			System.out.println(cartItem.getInvalidnumber());
		}
		return cart;
	}
	
    public void removeAllCartItems(Cart cart) {
      	 cartItemDao.removeAllCartItems(cart);
    }
    public void clearCart(Cart cart) {
    	for(CartItem cartItem:cart.getCartItem()) {
    		Product product=cartItem.getProduct();
    		int num = product.getUnitStock()-cartItem.getQuantity();
    		product.setUnitStock(num>=0?num:0);
			productDao.updateProduct(product);
		}
    	cartItemDao.removeAllCartItems(cart);
	}

}
