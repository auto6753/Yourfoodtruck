package com.food.project.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/truck", method = RequestMethod.GET)
public class TruckController {
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String info(Locale locale, Model model) {
		return "truck/truckInfo";
	}
	
//	@RequestMapping(value = "/callForm", method = RequestMethod.GET)
//	public String callForm(Locale locale, Model model) {
//		return "truck/callForm";
//	}
}
