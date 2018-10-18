package onlineShop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import onlineShop.model.Cart;
import onlineShop.model.CartItem;

@Repository
public class CartItemDaoImpl implements CartItemDao {
	@Autowired
	private SessionFactory sessionFactory;

	public void addCartItem(CartItem cartItem) {
		try(Session session = sessionFactory.openSession();) {
			session.beginTransaction();
			session.saveOrUpdate(cartItem);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	public void removeCartItem(int CartItemId) {
		try(Session session = sessionFactory.openSession();) {
			CartItem cartItem = (CartItem) session.get(CartItem.class, CartItemId);
			Cart cart = cartItem.getCart();
			List<CartItem> cartItems = cart.getCartItem();
			cartItems.remove(cartItem);
			session.beginTransaction();
			session.delete(cartItem);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void removeAllCartItems(Cart cart) {
		List<CartItem> cartItems = cart.getCartItem();
		try(Session session = sessionFactory.openSession();) {
			session.beginTransaction();
			session.createQuery("Delete CartItem where cart=?").setParameter(0, cart).executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}	
		cartItems.clear();
	}
	
	public void checkStock(CartItem cartItem) {
		int stock = cartItem.getProduct().getUnitStock();
		int quantity = cartItem.getQuantity();
		if(stock<quantity) {
			cartItem.setInvalidnumber(quantity-stock);
			cartItem.setQuantity(stock);
			try(Session session = sessionFactory.openSession();) {
				session.beginTransaction();
				session.saveOrUpdate(cartItem);
				session.getTransaction().commit();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		
	}

}
