package com.jsp.hotelmanagementsystem.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.hotelmanagementsystem.dao.CustomerDao;
import com.jsp.hotelmanagementsystem.dao.FoodOrderDao;
import com.jsp.hotelmanagementsystem.entities.Customer;
import com.jsp.hotelmanagementsystem.entities.FoodOrder;
import com.jsp.hotelmanagementsystem.entities.Item;

@Controller
public class FoodOrderController {

	@Autowired
	FoodOrderDao foodOrderDao;

	@Autowired
	CustomerDao customerDao;

	@RequestMapping("/addfoodorder")
	public ModelAndView addFoodOrder(HttpSession session) {
		List<Item> items = (List<Item>) session.getAttribute("itemlist");

		FoodOrder foodOrder = new FoodOrder();

		foodOrder.setItems(items);

		double totalprice = items.stream().map(i -> i.getCost()).mapToDouble(Double::new).sum();
		// ->converts list into stream type
		// ->map(i->i.getCost()-based on the no. of elements map method will execute,
		// itemobj will be substituted in place of i from which cost details is fetched
		// and new stream is create where the cost is stored
		// ->mapToDouble -convert stream to double type
		// ->Double is a wrapper class
		// ->(Double::new) -create object of Double---mapToDouble(i->new Double(i))
		// ->sum()-sum of the elements present inside the stream

		foodOrder.setTotalprice(totalprice);
		ModelAndView mav = new ModelAndView();
		mav.addObject("foodorderobj", foodOrder);
		mav.setViewName("FoodOrderForm");
		return mav;

	}

	@RequestMapping("/savefoodorder")
	public ModelAndView saveFoodOrder(@ModelAttribute("foodorderobj") FoodOrder foodOrder, HttpSession session) {
		try {
			List<Item> items = (List) session.getAttribute("itemlist");
			Integer id = (Integer) session.getAttribute("customerinfo");

			List<Item> items2 = new ArrayList<>();
			for (Item sessionItem : items) {
				boolean itemExists = false;
				for (Item item : items2) {
					if (item.getId() == sessionItem.getId()) {
						item.setQuantity(item.getQuantity() + sessionItem.getQuantity());
						itemExists = true;
						break;
					}
				}
				if (!itemExists) {
					items2.add(sessionItem);
				}
			}

			foodOrder.setItems(items2);
			double totalprice = items2.stream().map(i -> i.getCost()).mapToDouble(Double::new).sum();
			foodOrder.setTotalprice(totalprice);
			Customer customer = customerDao.findCustomerById(id);
			List<FoodOrder> foodorders = customer.getFoodOrders();
			if (foodorders == null) {
				foodorders = new ArrayList<>();
				customer.setFoodOrders(foodorders);
			}
			foodorders.add(foodOrder);

			foodOrderDao.saveFoodOrder(foodOrder);
			customerDao.saveCustomer(customer);

			// session.removeAttribute("itemlist");
			ModelAndView mav = new ModelAndView();
			mav.addObject("message", "ordered successfully");
			mav.addObject("foodorderobj", foodOrder);
			mav.setViewName("DisplayBillToCustomer");
			return mav;
		} catch (Exception e) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("message", "some  problem occured please try again");
			mav.setViewName("CustomerOptions");
			return mav;
		}

	}

}
