package com.jsp.hotelmanagementsystem.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.hotelmanagementsystem.dao.AdminDao;
import com.jsp.hotelmanagementsystem.entities.Admin;

@Controller
public class AdminController {

	@Autowired
	AdminDao dao;

	@RequestMapping("/addadmin")
	public ModelAndView addAdmin() {
		Admin admin = new Admin();
		ModelAndView mav = new ModelAndView();
		mav.addObject("adminobj", admin);
		mav.setViewName("AdminForm");
		return mav;
	}

	@RequestMapping("/saveadmin")
	public ModelAndView saveAdmin(@ModelAttribute("adminobj") Admin admin) {
		dao.saveAdmin(admin);

		ModelAndView mav = new ModelAndView();
		mav.addObject("message", "Admin Registered Successfully");
		mav.setViewName("AdminLogin");
		return mav;
	}

	@RequestMapping("/adminloginvalidate")
	public ModelAndView loginvalidation(ServletRequest request, HttpSession session) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Admin admin = dao.login(email, password);

		if (admin != null) {
			session.setAttribute("admininfo", admin);
			ModelAndView mav = new ModelAndView();
			mav.addObject("message", "login successfull");
			mav.setViewName("AdminOptions");
			return mav;
		} else {
			ModelAndView mav = new ModelAndView();
			mav.addObject("message", "Invalid Credentials");
			mav.setViewName("AdminLogin");
			return mav;

		}

	}

	@RequestMapping("/adminlogout")
	// handler is used to delete admin data in httpsession
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.addObject("message", "Logged out Successfully");
		mav.setViewName("AdminLogin");
		return mav;
	}
}
