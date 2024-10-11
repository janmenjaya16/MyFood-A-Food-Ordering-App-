package com.jsp.hotelmanagementsystem.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.hotelmanagementsystem.dao.ItemDao;
import com.jsp.hotelmanagementsystem.dao.ProductDao;
import com.jsp.hotelmanagementsystem.entities.Item;
import com.jsp.hotelmanagementsystem.entities.Product;

@Controller
public class ItemController {

	@Autowired
	ItemDao itemDao;

	@Autowired
	ProductDao productDao;

	@RequestMapping("/additem")
	public ModelAndView addItem(@RequestParam("id") int productid) {
		Product product = productDao.findProductById(productid);
		Item item = new Item();
		item.setName(product.getName());
		item.setType(product.getType());
		item.setCost(product.getCost());

		ModelAndView mav = new ModelAndView();
		mav.addObject("itemobj", item);
		mav.setViewName("ItemForm");
		return mav;
	}

	@RequestMapping("/additembyhotel")
	public ModelAndView addItemByHotel(@RequestParam("id") int productid) {
		Product product = productDao.findProductById(productid);
		Item item = new Item();
		item.setName(product.getName());
		item.setType(product.getType());
		item.setCost(product.getCost());

		ModelAndView mav = new ModelAndView();
		mav.addObject("itemobj", item);
		mav.setViewName("ItemByHotel");
		return mav;
	}

	@RequestMapping("/saveItemToOrder")
	public ModelAndView saveItemToOrder(@ModelAttribute("id") Item item, HttpSession session) {
		item.setCost(item.getQuantity() * item.getCost());
		if (session.getAttribute("itemlist") == null) {
			List<Item> items = new ArrayList<Item>();
			items.add(item);
			session.setAttribute("itemlist", items);
		} else {
			List<Item> items = (List<Item>) session.getAttribute("itemlist");
			items.add(item);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("message", "Added Successfully");
		mav.setViewName("redirect://fetchallproducts");
		return mav;
	}

	@RequestMapping("/saveitembyhotel")
	public ModelAndView saveItemByHotel(@ModelAttribute("id") Item item, HttpSession session) {
		item.setCost(item.getQuantity() * item.getCost());
		if (session.getAttribute("itemlist") == null) {
			List<Item> items = new ArrayList<Item>();
			items.add(item);
			session.setAttribute("itemlist", items);
		} else {
			List<Item> items = (List<Item>) session.getAttribute("itemlist");
			items.add(item);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("message", "Added Successfully");
		mav.setViewName("redirect://fetchitemsbyhotel");
		return mav;
	}

	@RequestMapping("/removeitem")
	public ModelAndView removeItemFromOrder(@RequestParam("id") int id, HttpSession session) {
		List<Item> items = (List<Item>) session.getAttribute("itemlist");

		items.remove(id + 1);
		session.setAttribute("itemlist", items);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("ViewAddedItemsToCustomer");
		return mav;

	}
}
