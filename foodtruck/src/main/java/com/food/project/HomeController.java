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
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "login/login";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		model.addAttribute("content",main(locale, model));
		return "home";
	}
	
	public String main(Locale locale, Model model) {
		return "main/main.jsp";
	}
	
	@RequestMapping(value = "/.do", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "customer/mypage";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypagedo(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		model.addAttribute("content",mypage(locale, model));
		return "home";
	}
<<<<<<< HEAD
	@RequestMapping(value = "/serach", method = RequestMethod.GET)
	public String serach(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		
		model.addAttribute("content",mypage(locale, model));
	
		return "serach/serach";
=======
	
	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public String help(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		model.addAttribute("content",returnHelp(locale, model));
		return "home";
	}
	
	public String returnHelp(Locale locale, Model model) {
		return "help/help.jsp";
>>>>>>> branch 'master' of https://github.com/auto6753/Yourfoodtruck.git
	}
}
