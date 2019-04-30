package com.food.project.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.domain.CallListVO;
import com.food.project.domain.CustomerVO;
import com.food.project.domain.FoodTruckVO;
import com.food.project.domain.PostVO;
import com.food.project.service.CallListService;
import com.food.project.service.FoodTruckService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/truck")
public class TruckController {
	private FoodTruckService service;
	private CallListService callList;
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String info(Model model/* ,@RequestParam("truck_code") String truck_code */) {
//		service.getFoodTruck(truck_code);
		
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

	@RequestMapping(value = "/callForm", method = RequestMethod.GET)
	public String callForm(Locale locale) {
		
		
		/* callList.insertCallList(vo); */
		 
		return "truck/callForm";
	}
	@ResponseBody
	@RequestMapping(value = "/callList", method = RequestMethod.POST)
	public String callList(Locale locale, CallListVO vo) {
		
		System.out.print(vo);
		/* callList.insertCallList(vo); */
	
		
		return "success";
	}
}