package onlineShop.service;

import onlineShop.model.CartItem;

public interface CartItemService {
    void addCartItem(CartItem cartItem);
    void removeCartItem(int CartItemId);
}

