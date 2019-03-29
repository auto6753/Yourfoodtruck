package com.food.project.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NewsController {
	
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public String news(Locale locale, Model model) {
		return "news/news";
	}
	
	@RequestMapping(value = "/eventOn", method = RequestMethod.GET)
	public String eventOn(Locale locale, Model model) {
		return "event/event";
	}
	
//	@RequestMapping(value = "/eventOff", method = RequestMethod.GET)
//	public String eventOff(Locale locale, Model model) {
//		return "event/off";
//	}
}
