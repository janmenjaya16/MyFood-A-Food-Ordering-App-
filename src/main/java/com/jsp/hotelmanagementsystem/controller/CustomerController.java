package com.jsp.hotelmanagementsystem.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.hotelmanagementsystem.dao.CustomerDao;
import com.jsp.hotelmanagementsystem.entities.Customer;

@Controller
public class CustomerController {

	@Autowired
	CustomerDao dao;

	@RequestMapping("/addcustomer")
	public ModelAndView addCustomer() {
		Customer customer = new Customer();
		ModelAndView mav = new ModelAndView();
		mav.addObject("customerobj", customer);
		mav.setViewName("CustomerForm");
		return mav;
	}

	@RequestMapping("/savecustomer")
	public ModelAndView saveCustomer(@ModelAttribute("customerobj") Customer customer) {
		try {
			dao.saveCustomer(customer);
			ModelAndView mav = new ModelAndView();
			mav.addObject("message", "Customer Registered Successfully");
			mav.setViewName("CustomerLogin");
			return mav;
		} catch (Exception e) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("message", "Email already Registered");
			mav.setViewName("CustomerLogin");
			return mav;

		}

	}

	@RequestMapping("/customerloginvalidate")
	public ModelAndView loginvalidation(ServletRequest request, HttpSession session) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Customer customer = dao.login(email, password);

		if (customer != null) {
			session.setAttribute("customerinfo", customer.getId());
			ModelAndView mav = new ModelAndView();
			mav.addObject("message", "login successfull");
			mav.setViewName("CustomerOptions");
			return mav;
		} else {
			ModelAndView mav = new ModelAndView();
			mav.addObject("message", "Invalid Credentials");
			mav.setViewName("CustomerLogin");
			return mav;

		}

	}

	@RequestMapping("/customerlogout")
	// handler is used to delete admin data in httpsession
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.addObject("message", "Logged out Successfully");
		mav.setViewName("CustomerLogin");
		return mav;
	}

}
