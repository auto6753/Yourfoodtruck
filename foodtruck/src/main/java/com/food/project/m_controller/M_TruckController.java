package com.food.project.m_controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.domain.CustomerVO;
import com.food.project.domain.FoodTruckVO;
import com.food.project.service.FoodTruckService;

import lombok.AllArgsConstructor;
import net.sf.json.JSONObject;

@CrossOrigin()
@Controller
@AllArgsConstructor
@RequestMapping(value = "/m.truck")
public class M_TruckController {
	private FoodTruckService service;
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String info(Model model ,@RequestParam("truck_code") String truck_code ) {

		FoodTruckVO ss= service.getFoodTruck(truck_code);
		model.addAttribute("tlist", ss); //트럭정보
		
		return "truck/truckInfo";
	}
	@ResponseBody
	@RequestMapping(value = "/register", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String register(FoodTruckVO fd,HttpServletRequest request) {
		System.out.println("1");
		System.out.println(fd);
		FoodTruckVO vo2= service.insertFoodTruck(fd);
		System.out.println(vo2);
		//System.out.println(session);
		JSONObject sessionInfo = new JSONObject();
		sessionInfo.put("result","success");
		sessionInfo.put("foodtruck",vo2);
		return sessionInfo.toString();
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