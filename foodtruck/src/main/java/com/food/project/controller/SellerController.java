package com.food.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/seller", method = RequestMethod.GET)
public class SellerController {
	
	@RequestMapping(value="", method=RequestMethod.GET) 
	public String sellerMain(Model model) {
		return "seller/sellerMain";
	}
	
	@RequestMapping(value="/menu", method=RequestMethod.GET) 
	public String menu(Model model) {
		return "seller/menu/menu";
	}
	
	@RequestMapping(value="/location", method=RequestMethod.GET) 
	public String location(Model model) {
		return "seller/loc/location";
	}
	
	@RequestMapping(value="/event", method=RequestMethod.GET) 
	public String event(Model model) {
		return "seller/event/event";
	}
	@RequestMapping(value="/psgpush", method=RequestMethod.GET) 
	public String passenger(Model model) {
		return "seller/psg/psgpush";
	}
	
	@RequestMapping(value="/callmanage", method=RequestMethod.GET) 
	public String call(Model model) {
		return "seller/call/callmanage";
	}
	
	@RequestMapping(value="/order", method=RequestMethod.GET) 
	public String order(Model model) {
		return "seller/order/orderMain";
	}
	
	@RequestMapping(value="/layout", method=RequestMethod.GET) 
	public String layout(Model model) {
		return "seller/layout/layout";
	}
}