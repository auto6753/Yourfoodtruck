package com.food.project.Controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/customer", method = RequestMethod.GET)
public class CustomerController {
	
//	@RequestMapping(value = "", method = RequestMethod.GET)
//	public String mypage(Locale locale, Model model) {
//		return "customer/mypage";
//	}
	
//	@RequestMapping(value = "/onboard", method = RequestMethod.GET)
//	public String onboard(Locale locale, Model model) {
//		return "customer/onboard";
//	}
	
//	@RequestMapping(value = "/onSale", method = RequestMethod.GET)
//	public String onSale(Locale locale, Model model) {
//		return "customer/onSale";
//	}
	
//	@RequestMapping(value = "/review", method = RequestMethod.GET)
//	public String review(Locale locale, Model model) {
//		return "customer/review";
//	}
	
//	@RequestMapping(value = "/callList", method = RequestMethod.GET)
//	public String callList(Locale locale, Model model) {
//		return "customer/callList";
//	}
	
//	@RequestMapping(value = "/cusInfo", method = RequestMethod.GET)
//	public String onSale(Locale locale, Model model) {
//		return "customer/cusInfo";
//	}
	
//	@RequestMapping(value = "/goodbyeForm", method = RequestMethod.GET)
//	public String onSale(Locale locale, Model model) {
//		return "customer/goodbyeForm";
//	}
	
//	@RequestMapping(value = "/goodbye", method = RequestMethod.GET)
//	public String onSale(Locale locale, Model model) {
//		return "customer/goodbye";
//	}
}
