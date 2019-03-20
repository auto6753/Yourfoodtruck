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

//	로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "login/login";
	}
//	아이디 찾기
	@RequestMapping(value = "/forgetid", method = RequestMethod.GET)
	public String forgetid(Locale locale, Model model) {
		return "login/idsearch";
	}
//	register
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Locale locale, Model model) {
		return "login/register";
	}	
	
// rehome 
	@RequestMapping(value = "/rehome", method = RequestMethod.GET)
	public String rehome(Locale locale, Model model) {
//		model.addAttribute("content",main(model));
		return "main/main";
	}

// 메인
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main/main";
	}

// 푸드트럭 검색
	@RequestMapping(value = "/serach", method = RequestMethod.GET)
	public String serach(Locale locale, Model model) {
		return "serach/serach";

	}

// mypage	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypagedo(Locale locale, Model model) {
		return "customer/Mypage";
	}
	
	
// 고객센터
	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public String help(Locale locale, Model model) {
		return "help/help";
	}

<<<<<<< HEAD
=======
		model.addAttribute("content",returnHelp(model));
		return "home";
	}
	
	public String returnHelp(Model model) {
		return "help/help.jsp";
	}
	@RequestMapping(value = "/idsearch", method = RequestMethod.GET)
	public String idsearch(Locale locale, Model model) {
		
	
		return "login/idsearch";
	}
>>>>>>> refs/remotes/origin/master
}
