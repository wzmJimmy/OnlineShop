package onlineShop.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import onlineShop.model.Product;

@Repository
public class ProductDaoImpl implements ProductDao {
    @Autowired
    private SessionFactory sessionFactory;

	public Product getProductById(int productId) {
		 Session session = null;
	   	 Product product = null;
	   	 try {
	   		 session = sessionFactory.openSession();
	   		 session.beginTransaction();
	   		 product = (Product) session.get(Product.class, productId);
	   		 session.getTransaction().commit();
	   	 } catch (Exception e) {
	   		 e.printStackTrace();
	   	 } finally {
	   		 if (session != null) {
	   			 session.close();
	   		 }
	   	 }
	   	 return product;
	}

	public void deleteProduct(int productId) {
		 Session session = null;
	   	 try {
	   		 session = sessionFactory.openSession();
	   		 session.beginTransaction();
	   		 Product product = (Product) session.get(Product.class, productId);
	   		 session.delete(product);
	   		 session.getTransaction().commit();
	   	 } catch (Exception e) {
	   		 e.printStackTrace();
	   	 } finally {
	   		 if (session != null) {
	   			 session.close();
	   		 }
	   	 }
	}

	public void addProduct(Product product) {
		Session session = null;
	   	 try {
	   		 session = sessionFactory.openSession();
	   		 session.beginTransaction();
	   		 session.save(product);
	   		 session.getTransaction().commit();
	   	 } catch (Exception e) {
	   		 e.printStackTrace();
	   		 //session.getTransaction().rollback();
	   	 } finally {
	   		 if (session != null) {
	   			 session.close();
	   		 }
	   	 }
	}

	public void updateProduct(Product product) {
		 Session session = null;
	   	 try {
	   		 session = sessionFactory.openSession();
	   		 session.beginTransaction();
	   		 session.saveOrUpdate(product);
	   		 session.getTransaction().commit();
	   	 } catch (Exception e) {
	   		 e.printStackTrace();
	   		 //session.getTransaction().rollback();
	   	 } finally {
	   		 if (session != null) {
	   			 session.close();
	   		 }
	   	 }
	}

	public List<Product> getAllProducts() {
		 List<Product> products = new ArrayList<>();
	   	 try(Session session = sessionFactory.openSession();){
	   		session.beginTransaction();
	   		 products = session.createCriteria(Product.class).list();
	   		 session.getTransaction().commit();
	   	 }catch (Exception e) {
	   		 e.printStackTrace();
	   	 }
	   	 return products;
	}

}
