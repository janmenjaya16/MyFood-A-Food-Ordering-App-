package com.jsp.hotelmanagementsystem.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.hotelmanagementsystem.dao.HotelDao;
import com.jsp.hotelmanagementsystem.dao.ProductDao;
import com.jsp.hotelmanagementsystem.entities.Hotel;
import com.jsp.hotelmanagementsystem.entities.Product;

@Controller
public class ProductController {

	@Autowired
	ProductDao productDao;

	@Autowired
	HotelDao hotelDao;

	@RequestMapping("/addproduct")
	public ModelAndView addProduct() {
		Product p = new Product();
		ModelAndView mav = new ModelAndView();
		mav.addObject("productobj", p);
		mav.setViewName("ProductForm");
		return mav;

	}

	@RequestMapping("/saveproduct")
	public ModelAndView saveProduct(@ModelAttribute("productobj") Product p, HttpSession session) {
		Integer hotel_id = (Integer) session.getAttribute("hotelinfo");
		Hotel hotel = hotelDao.findHotelById(hotel_id);
		List<Product> product = hotel.getProducts();
		if (product.size() > 0) {
			product.add(p);
			hotel.setProducts(product);
		} else {
			List<Product> productsList = new ArrayList<Product>();
			productsList.add(p);
			hotel.setProducts(productsList);
		}
		productDao.saveProduct(p);
		hotelDao.updateHotel(hotel);

		ModelAndView mav = new ModelAndView();
		mav.addObject("message", "Added successfully");
		mav.setViewName("HotelOptions");
		return mav;

	}

	@RequestMapping("/fetchallhotelproducts")
	// this handler is used to fetch all the products of particular hotel and submit
	// to displayproducttohotel.jsp
	public ModelAndView fetchAllHotelProducts(HttpSession session) {
		Integer hotel_id = (Integer) session.getAttribute("hotelinfo");
		Hotel hotel = hotelDao.findHotelById(hotel_id);
		List<Product> products = hotel.getProducts();
		ModelAndView mav = new ModelAndView();
		mav.addObject("viewProduct", products);
		mav.setViewName("ShowProductList");
		return mav;
	}

	@RequestMapping("/updateproduct")
	public ModelAndView updateProduct(@RequestParam("id") int id) {
		Product product = productDao.findProductById(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("existingProductInfo", product);
		mav.setViewName("UpdateProductForm");
		return mav;
	}

	@RequestMapping("/updateproductinfo")
	public ModelAndView updateProductInformation(@ModelAttribute("existingProductInfo") Product p) {
		productDao.updateProduct(p);
		ModelAndView mav = new ModelAndView();
		mav.addObject("message", "Updated Successfully");
		mav.setViewName("redirect://fetchallhotelproducts");
		return mav;

	}

	@RequestMapping("/deleteproduct")
	public ModelAndView deleteProduct(@RequestParam("id") int id, HttpSession session) {
		Integer hotel_id = (Integer) session.getAttribute("hotelinfo");
		Hotel hotel = hotelDao.findHotelById(hotel_id);

		List<Product> products = hotel.getProducts();
		List<Product> productlists = products.stream().filter(Product -> Product.getId() != id)
				.collect(Collectors.toList());

		hotel.setProducts(productlists);
		hotelDao.updateHotel(hotel);
		productDao.deleteByid(id);

		ModelAndView mav = new ModelAndView();
		mav.addObject("message", "Deleted Successfully");
		mav.setViewName("redirect://fetchallhotelproducts");
		return mav;

	}

	@RequestMapping("/fetchitemsbyhotel")
	public ModelAndView fetchProductsByHotel(ServletRequest request) {
		String hotelname = request.getParameter("hotelname");
		List<Product> products = productDao.fetchItemsByHotel(hotelname);
		if (products != null) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("productlist", products);
			mav.setViewName("DisplayProductsToCustomer");
			return mav;
		} else {
			ModelAndView mav = new ModelAndView();
			mav.addObject("message", "No Hotels Found");
			mav.setViewName("ReadHotelName");
			return mav;
		}
	}

	@RequestMapping("/fetchproductbyhotelname")
	public ModelAndView fetchHotelName() {
		List<String> list = hotelDao.fetchAllHotelName();
		ModelAndView mav = new ModelAndView();
		mav.addObject("allhotellist", list);
		mav.setViewName("FetchItemsByHotel");
		return mav;
	}

	@RequestMapping("/fetchproductsbyhotel")
	public ModelAndView fetchProductByHotelName(ServletRequest request) {
		String hotelName = request.getParameter("hotel");
		List<Product> products = productDao.fetchItemsByHotel(hotelName);
		ModelAndView mav = new ModelAndView();
		mav.addObject("productlist", products);
		mav.setViewName("DisplayProductsToCustomer");
		return mav;

	}

	@RequestMapping("/fetchallproducts")
	public ModelAndView fetchAllProducts() {
		List<Product> products = productDao.findAllProduct();
		ModelAndView mav = new ModelAndView();
		mav.addObject("productlist", products);
		mav.setViewName("DisplayProductsToCustomer");
		return mav;
	}

	@RequestMapping("/fetchproductsbetweenpricerange")
	public ModelAndView fetchProductsBetweenPriceRange(ServletRequest request) {
		String minPrice = request.getParameter("minPrice");
		String maxPrice = request.getParameter("maxPrice");

		List<Product> products = productDao.fetchProductsBetweenPriceRange(Double.parseDouble(minPrice),
				Double.parseDouble(maxPrice));
		ModelAndView mav = new ModelAndView();
		mav.addObject("productlist", products);
		mav.setViewName("DisplayProductsToCustomer");
		return mav;
	}

	@RequestMapping("/addDiscount")
	public ModelAndView provideDiscountToProducts(ServletRequest request) {
		int discount = Integer.parseInt(request.getParameter("discount"));
		List<Product> products = productDao.findAllProduct();

		for (Product product : products) {
			product.setDiscount(product.getDiscount() + discount);
			productDao.updateProduct(product);
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("message", "Additional Discount added to products.");
		mav.setViewName("HotelOptions");
		return mav;
	}
}
