package com.food.project.m_controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.food.project.domain.CustomerVO;
import com.food.project.domain.FoodTruckVO;
import com.food.project.service.FoodTruckService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/m.truck", method = RequestMethod.GET)
public class M_TruckController {
	private FoodTruckService service;
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String info(Model model ,@RequestParam("truck_code") String truck_code ) {

		FoodTruckVO ss= service.getFoodTruck(truck_code);
		model.addAttribute("tlist", ss); //트럭정보
		
		return "truck/truckInfo";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model) {
		System.out.println("ㅇ");
		return "truck/register/registerForm";
	}
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String register(Model model,FoodTruckVO fd,HttpServletRequest request,HttpSession session) {
		System.out.println("1");
		CustomerVO vo = (CustomerVO) session.getAttribute("sessionid");
		fd.setEmail(vo.getEmail());
		fd.setLayout(0);
		//System.out.println(fd);
		FoodTruckVO vo2= service.insertFoodTruck(fd);
		System.out.println(vo2);
		//System.out.println(session);
		session.setAttribute("seller", vo2);
		return "redirect:/seller";
	}

	
//	@RequestMapping(value = "/register", method = RequestMethod.POST)
//	public String register2(Model model, FoodTruckVO fd) {
//		System.out.println("fd");
//		return "";
//	}

//	@RequestMapping(value = "/callForm", method = RequestMethod.GET)
//	public String callForm(Locale locale, Model model) {
//		return "truck/callForm";
//	}
}