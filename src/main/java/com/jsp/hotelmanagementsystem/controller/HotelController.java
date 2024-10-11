package com.jsp.hotelmanagementsystem.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.hotelmanagementsystem.dao.HotelDao;
import com.jsp.hotelmanagementsystem.entities.Hotel;

@Controller
public class HotelController {
	@Autowired
	HotelDao dao;

	@RequestMapping("/addhotel")
	// handler used to create hotel class object and pass it to HotelForm.jsp
	public ModelAndView addHotel() {
		Hotel hotel = new Hotel();
		ModelAndView mav = new ModelAndView();
		mav.addObject("hotelobj", hotel);
		mav.setViewName("HotelForm");
		return mav;
	}

	@RequestMapping("/savehotel")
	// handler used to save hotel information in database
	public ModelAndView saveHotel(@ModelAttribute("hotelobj") Hotel hotel) {
		hotel.setStatus("Not Approved");
		dao.saveHotel(hotel);

		ModelAndView mav = new ModelAndView();
		mav.addObject("message", "Your Account is in review, Please wait for some time.");
		mav.setViewName("HotelLogin");
		return mav;
	}

	@RequestMapping("/hotelloginvalidate")
	// handler used to perform login validation for hotel and return appropriate
	// response
	public ModelAndView loginvalidation(ServletRequest request, HttpSession session) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Hotel hotel = dao.login(email, password);

		if (hotel != null) {
			if (hotel.getStatus().equals("Not Approved")) {
				ModelAndView mav = new ModelAndView();
				mav.addObject("message", "Your Account is in review, Please wait for some time");
				mav.setViewName("DisplayMessage");
				return mav;
			} else if (hotel.getStatus().equals("Blocked")) {
				ModelAndView mav = new ModelAndView();
				mav.addObject("message", "Your account is blocked");
				mav.setViewName("DisplayMessage");
				return mav;
			} else {
				// storing hotel entity object into session
				// storing the logged in hotel into session
				session.setAttribute("hotelinfo", hotel.getId());
				ModelAndView mav = new ModelAndView();
				mav.addObject("message", "Loggedin Successfully");
				mav.setViewName("HotelOptions");
				return mav;
			}

		} else {
			ModelAndView mav = new ModelAndView();
			mav.addObject("message", "Invalid credentials");
			mav.setViewName("HotelLogin");
			return mav;

		}

	}

	@RequestMapping("/hotellogout")
	// handler is used to delete admin data in httpsession
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.addObject("message", "Logged out Successfully");
		mav.setViewName("HotelLogin");
		return mav;
	}

	@RequestMapping("/fetchunapprovedhotels")
	// handler is used to find unapproved hotels
	public ModelAndView fetchUnapprovedHotels() {
		List<Hotel> hotels = dao.fetchUnapprovedHotels();
		ModelAndView mav = new ModelAndView();
		mav.addObject("unapprovedhotels", hotels);
		mav.setViewName("DisplayUnApprovedHotels");
		return mav;

	}

	@RequestMapping("/approvehotel")
	// handler is used to modify the hotel status as approved hotels
	public ModelAndView approveHotel(@RequestParam("id") int id) {
		Hotel h = dao.findHotelById(id);
		h.setStatus("approved");
		dao.updateHotel(h);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect://fetchunapprovedhotels");
		return mav;
	}

	@RequestMapping("/fetchblockedhotel")
	// handler is used to return Blocked hotels
	public ModelAndView viewBlockHotels() {
		List<Hotel> hotels = dao.fetchAllBlockedHotels();

		ModelAndView mav = new ModelAndView();
		mav.addObject("blockhotels", hotels);
		mav.setViewName("ViewBlockedHotels");
		return mav;
	}

	@RequestMapping("/unblockblockhotel")
	public ModelAndView unblockHotel(@RequestParam("id") int id) {
		Hotel h = dao.findHotelById(id);
		h.setStatus("approved");
		dao.updateHotel(h);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect://fetchblockedhotel");
		return mav;
	}

	@RequestMapping("/fetchunblockedhotel")
	// handler is used to return Unblocked hotels
	public ModelAndView viewUnblockedHotels() {
		List<Hotel> hotels = dao.fetchAllUnblockedHotels();

		ModelAndView mav = new ModelAndView();
		mav.addObject("unblockhotels", hotels);
		mav.setViewName("ViewUnblockedHotels");
		return mav;
	}

	@RequestMapping("/blockhotel")
	public ModelAndView blockHotel(@RequestParam("id") int id) {
		Hotel h = dao.findHotelById(id);
		h.setStatus("Blocked");
		dao.updateHotel(h);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect://fetchunblockedhotel");
		return mav;
	}

}
