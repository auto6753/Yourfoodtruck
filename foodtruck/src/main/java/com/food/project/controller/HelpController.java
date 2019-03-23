package com.food.project.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/help", method = RequestMethod.GET)
public class HelpController {
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String help(Locale locale, Model model) {
		return "help/helpMain";
	}
	
	@RequestMapping(value = "/questionReg", method = RequestMethod.GET)
	public String area(Locale locale, Model model) {
		return "help/questionReg";
	}
	
	@RequestMapping(value = "/myQuestion", method = RequestMethod.GET)
	public String onSale(Locale locale, Model model) {
		return "help/myQuestion";
	}
}
