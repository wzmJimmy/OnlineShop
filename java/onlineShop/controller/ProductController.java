package onlineShop.controller;

import java.io.BufferedReader;
import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import onlineShop.model.Product;
import onlineShop.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	private static final String BASE_URL = "http://18.218.24.105/AdsSystem/"; //"http://18.218.24.105/AdsSystem/" "http://localhost:8080/AdsSystem/"
	private String image_path = "/home/ubuntu/products/";  // "/home/ubuntu/products/" "/Users/wzm/Desktop/products/"
	private String format = ".jpg";

	@RequestMapping(value = "/getAllProducts", method = RequestMethod.GET)
	public ModelAndView getAllProducts() {
		List<Product> products = productService.getAllProducts();
		return new ModelAndView("productList", "products", products);
	}

	@RequestMapping(value = "/getProductById/{productId}", method = RequestMethod.GET)
	public ModelAndView getProductById(@PathVariable(value = "productId") int productId) {
		Product product = productService.getProductById(productId);
		return new ModelAndView("productPage", "product", product);
	}

	@RequestMapping(value = "/admin/delete/{productId}", method = RequestMethod.GET)
	public String deleteProduct(@PathVariable(value = "productId") int productId) {
		Path path = Paths.get(image_path + productId + format);

		if (Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		productService.deleteProduct(productId);
		
		try {
			/*processing request and respond.*/
			HttpURLConnection connection = (HttpURLConnection) new URL(BASE_URL+"CreateAd?url="+productId).openConnection();
			connection.setRequestMethod("DELETE");
			System.out.println(connection.getResponseCode());
		}catch (Exception e) {
			e.printStackTrace();
		}	
		
		return "redirect:/getAllProducts";
	}

	@RequestMapping(value = "/admin/product/addProduct", method = RequestMethod.GET)
	public ModelAndView getProductForm() {
		return new ModelAndView("addProduct", "productForm", new Product());
	}

	@RequestMapping(value = "/admin/product/addProduct", method = RequestMethod.POST)
	public String addProduct(@Valid @ModelAttribute(value = "productForm") Product product, BindingResult result) {

		if (result.hasErrors()) {
			return "addProduct";
		}
		productService.addProduct(product);
		
		MultipartFile image = product.getProductImage();
		if (image != null && !image.isEmpty()) {
			Path path = Paths.get(image_path + product.getId() + format);
			//System.out.println(path.toString());
			try {
				image.transferTo(new File(path.toString()));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		if(!sendToAdsSystem(product)) System.out.println("Ads add failed.");;
		return "redirect:/getAllProducts";
	}

	@RequestMapping(value = "/admin/product/editProduct/{productId}")
	public ModelAndView getEditForm(@PathVariable(value = "productId") int productId) {
		Product product = productService.getProductById(productId);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("editProduct");
		modelAndView.addObject("editProductObj", product);
		modelAndView.addObject("productId", productId);

		return modelAndView;
	}

	@RequestMapping(value = "/admin/product/editProduct/{productId}", method = RequestMethod.POST)
	public String editProduct(@ModelAttribute(value = "editProductObj") Product product,
			@PathVariable(value = "productId") int productId) {
		product.setId(productId);
		productService.updateProduct(product);
		
		MultipartFile image = product.getProductImage();
		if (image != null && !image.isEmpty()) {
			Path path = Paths.get(image_path + product.getId() + format);
			//System.out.println(path.toString());
			try {
				image.transferTo(new File(path.toString()));
			} catch( IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/getAllProducts";
	}

	@RequestMapping("/getProductsList")
	public @ResponseBody List<Product> getProductsListJson() {
		return productService.getAllProducts();
	}
	
	
	@RequestMapping("/ProductsGrid")
	public @ResponseBody List<Product> getProductsGridJson() {
		try {
			/*processing request and respond.*/
			HttpURLConnection connection = (HttpURLConnection) new URL(BASE_URL+"Ad?top=6").openConnection();
			connection.setRequestMethod("GET");
			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
				StringBuilder response = new StringBuilder();
				try(BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));){
					String inputline;
					while((inputline = in.readLine())!=null) {response.append(inputline);}
				}
				/*resovle json*/
				System.out.println(response);
				JSONArray array = new JSONArray(response.toString());
				List<Product> products= new ArrayList<>();
				for (int i = 0; i < array.length(); ++i) {
					JSONObject obj = array.getJSONObject(i);
					int id = Integer.parseInt(obj.getString("image_url"));
					products.add(productService.getProductById(id));
				}
				return products;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return productService.getProducts(6);
	}
	
	private Boolean sendToAdsSystem(Product product) {
		try {
			/*processing request and respond.*/
			HttpURLConnection connection = (HttpURLConnection) new URL(BASE_URL+"CreateAd").openConnection();
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			connection.setRequestProperty("Accept", "application/json");
			connection.setDoOutput(true);
			
			JSONObject data = new JSONObject();
			data.put("bid", 1);
			data.put("image_url", ""+product.getId());
			data.put("advertiser_id", 1);
			String string = product.getProductDescription();
			data.put("ad_score", string.length()<150?string.length()/50.0:0);
			

			OutputStream os = connection.getOutputStream();
			os.write(data.toString().getBytes("UTF-8"));
			os.close();
			
			int HttpResult = connection.getResponseCode(); 
			//System.out.println(HttpResult);
			if (HttpResult == HttpURLConnection.HTTP_OK) {return true;}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
