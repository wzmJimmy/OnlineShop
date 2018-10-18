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
	   	 Product product = null;
	   	 try(Session session = sessionFactory.openSession();) {
	   		 session.beginTransaction();
	   		 product = (Product) session.get(Product.class, productId);
	   		 session.getTransaction().commit();
	   	 } catch (Exception e) {
	   		 e.printStackTrace();
	   	 }
	   	 return product;
	}

	public void deleteProduct(int productId) {
	   	 try(Session session = sessionFactory.openSession();) {
	   		 session.beginTransaction();
	   		 Product product = (Product) session.get(Product.class, productId);
	   		 session.delete(product);
	   		 session.getTransaction().commit();
	   	 } catch (Exception e) {
	   		 e.printStackTrace();
	   	 }
	}

	public void addProduct(Product product) {
	   	updateProduct(product);
	}

	public void updateProduct(Product product) {
	   	 try(Session session = sessionFactory.openSession();) {
	   		 session.beginTransaction();
	   		 session.saveOrUpdate(product);
	   		 session.getTransaction().commit();
	   	 } catch (Exception e) {
	   		 e.printStackTrace();
	   		 //session.getTransaction().rollback();
	   	 } 
	}

	public List<Product> getAllProducts() {
		 List<Product> products = new ArrayList<>();
	   	 try(Session session = sessionFactory.openSession();){
	   		session.beginTransaction();
	   		products = session.createQuery("from Product").list();
	   		session.getTransaction().commit();
	   	 }catch (Exception e) {
	   		 e.printStackTrace();
	   	 }
	   	 return products;
	}
	public List<Product> getProducts(int n) {
		 List<Product> products = new ArrayList<>();
	   	 try(Session session = sessionFactory.openSession();){
	   		session.beginTransaction();
	   		products = session.createQuery("from Product").setMaxResults(n).list();
	   		session.getTransaction().commit();
	   	 }catch (Exception e) {
	   		 e.printStackTrace();
	   	 }
	   	 return products;
	}

}
