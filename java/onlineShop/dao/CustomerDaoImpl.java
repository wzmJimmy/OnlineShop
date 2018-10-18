package onlineShop.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import onlineShop.model.Authorities;
import onlineShop.model.Cart;
import onlineShop.model.Customer;
import onlineShop.model.User;

@Repository
public class CustomerDaoImpl implements CustomerDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void addCustomer(Customer customer) {
   	 customer.getUser().setEnabled(true);

   	 Authorities authorities = new Authorities();
   	 authorities.setAuthorities("ROLE_USER");
   	 authorities.setEmailId(customer.getUser().getEmailId());

   	 Cart cart = new Cart();
   	 customer.setCart(cart);
   	 cart.setCustomer(customer);

   	 try(Session session = sessionFactory.openSession();) {
   		 session.beginTransaction();
   		 session.save(authorities);
   		 session.save(customer);
   		 session.getTransaction().commit();
   	 } catch (Exception e) {
   		 e.printStackTrace();
   	 }
    }

    public Customer getCustomerByUserName(String userName) {
   	 User user = null;
   	 try(Session session = sessionFactory.openSession();) {
   		 session.beginTransaction();
   		 Query query = session.createQuery("from User u where u.emailId=?");
   		 user = (User)query.setParameter(0, userName).uniqueResult();
   		 session.getTransaction().commit();
   	 } catch (Exception e) {
   		 e.printStackTrace();
   	 }
   	 
   	 if(user != null) return user.getCustomer();
   	 return null;
    }
    
	public boolean deletebyId(int i) {
      	 try(Session session = sessionFactory.openSession();) {
      		 session.beginTransaction();
      		 Customer cust = (Customer)session.load(Customer.class,new Integer(i));
      		 session.delete(cust);
      		 session.getTransaction().commit();
      	 } catch (Exception e) {
      		 e.printStackTrace();
      	 }
      	 return true;
	}
}
