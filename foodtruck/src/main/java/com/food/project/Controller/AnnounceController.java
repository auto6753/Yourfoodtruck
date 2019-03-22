package com.food.project.Controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AnnounceController {
	
	@RequestMapping(value = "/announce", method = RequestMethod.GET)
	public String recruit(Locale locale, Model model) {
		return "announce/recruit";
	}
	
	@RequestMapping(value = "/area", method = RequestMethod.GET)
	public String area(Locale locale, Model model) {
		return "announce/area";
	}
}
