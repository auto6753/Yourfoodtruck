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

	
	

		
	
//	�α��� ������
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		
		return "login/login";
	}

// �ΰ�Ŭ���� 
	@RequestMapping(value = "/rehome", method = RequestMethod.GET)
	public String rehome(Locale locale, Model model) {
		model.addAttribute("content",main(model));
		return "home";
	}	
	
	
// �⺻ Ȩ
	
	@RequestMapping(value = "/" , method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		model.addAttribute("content",main(model));
		return "home";
	}
	
	public String main(Model model) {
		return "main/main.jsp";
		
	}
	
	
// ����������	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypagedo(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		model.addAttribute("content",mypage(model));
		return "home";
	}	
	
	public String mypage(Model model) {
	
		return "customer/mypage";
	}
	

//Ʈ�� �˻�
	@RequestMapping(value = "/serach", method = RequestMethod.GET)
	public String serach(Locale locale, Model model) {
		
		model.addAttribute("content",rtserach());
	
		return "home";

	}
	
	public String rtserach() {
		
		return "serach/serach.jsp";
	}

		

	
//������
	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public String help(Locale locale, Model model) {

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
}
