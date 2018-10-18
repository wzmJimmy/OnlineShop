package onlineShop.service;
import onlineShop.model.Cart;

public interface CartService {
    Cart getCartById(int CartId);
    void removeAllCartItems(Cart cart);
    public void clearCart(Cart cart);
}
