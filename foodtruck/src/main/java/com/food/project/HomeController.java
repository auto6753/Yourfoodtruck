package com.food.project;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

//	濡쒓렇�씤
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "login/login";
	}


// rehome 
	@RequestMapping(value = "/rehome", method = RequestMethod.GET)
	public String rehome(Locale locale, Model model) {
//		model.addAttribute("content",main(model));
		return "main/main";
	}

// 硫붿씤
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main/main";
	}


// mypage	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypagedo(Locale locale, Model model) {
		return "customer/Mypage";
	}
	
	
// 怨좉컼�꽱�꽣
	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public String help(Locale locale, Model model) {
		return "help/help";
	}
	
	@RequestMapping(value = "/idSearch", method = RequestMethod.GET)
	public String idSearch(Locale locale, Model model) {
		
	
		return "login/idSearch";
	}

	@RequestMapping(value = "/idSearch1", method = RequestMethod.GET)
	public String idSearch1(Locale locale, Model model) {
		
	
		return "login/idSearch1";
	}

	@RequestMapping(value = "/passSearch", method = RequestMethod.GET)
	public String passSearch(Locale locale, Model model) {
		
	
		return "login/passSearch";
	}
	@RequestMapping(value = "/passSearch1", method = RequestMethod.GET)
	public String passSearch1(Locale locale, Model model) {
		
	
		return "login/passSearch1";
	}
	@RequestMapping(value = "/passSearch2", method = RequestMethod.GET)
	public String passSearch2(Locale locale, Model model) {
		
	
		return "login/passSearch2";
	}
	@RequestMapping(value = "/registerAgree", method = RequestMethod.GET)
	public String registerAgree(Locale locale, Model model) {
		
	
		return "login/registerAgree";
	}

	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public String registerForm(Locale locale, Model model) {
		
	
		return "login/registerForm";
	}



  
}
