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
	

}
