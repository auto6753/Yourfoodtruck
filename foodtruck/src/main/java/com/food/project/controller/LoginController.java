package com.food.project.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/login", method = RequestMethod.GET)
public class LoginController {
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "login/login";
	}
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.GET)
	public String loginCheck(Locale locale, Model model) {
		return null;
	}
	
	@RequestMapping(value = "/idSearch", method = RequestMethod.POST)
	public String idSearch(Locale locale, Model model) {
		return "login/idSearch";
	}
	@RequestMapping(value = "/idSearch1", method = RequestMethod.POST)
	public String idSearch1(Locale locale, Model model) {
		return "login/idSearch1";
	}
	
	@RequestMapping(value = "/passSearch", method = RequestMethod.POST)
	public String passSearch(Locale locale, Model model) {
		return "login/passSearch";
	}
	@RequestMapping(value = "/passSearch1", method = RequestMethod.POST)
	public String passSearch1(Locale locale, Model model) {
		return "login/passSearch1";
	}
	@RequestMapping(value = "/passSearch2", method = RequestMethod.POST)
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
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Locale locale, Model model) {
		return "login/registerAgree";
	}
}
