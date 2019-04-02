package com.food.project.controller;

import java.util.Locale;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.domain.CustomerVO;
import com.food.project.service.LoginService;

import lombok.AllArgsConstructor;
@AllArgsConstructor
@Controller
@RequestMapping(value = "/customer", method = RequestMethod.GET)
public class CustomerController {
	private LoginService service;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model) {
		return "customer/mypage";
	}
	
	@RequestMapping(value = "/onboard", method = RequestMethod.GET)
	public String onboard(Locale locale, Model model) {
		return "customer/onboard";
	}
	
	@RequestMapping(value = "/onSale", method = RequestMethod.GET)
	public String onSale(Locale locale, Model model) {
		return "customer/onSale";
	}
	
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String review(Locale locale, Model model) {
		return "customer/review";
	}
	
	@RequestMapping(value = "/callList", method = RequestMethod.GET)
	public String callList(Locale locale, Model model) {
		return "customer/callList";
	}
	
	@RequestMapping(value = "/cusInfo", method = RequestMethod.GET)
	public String cusInfo(Locale locale, Model model) {
		return "customer/cusInfo";
	}
	
	@RequestMapping(value = "/goodbyeForm", method = RequestMethod.GET)
	public String goodbyeForm(Locale locale, Model model) {
		return "customer/goodbyeForm";
	}
	
	//회원탈퇴
	@RequestMapping(value = "/goodbye", method = RequestMethod.GET)
	public String goodbye(Locale locale, Model model,HttpServletRequest request) {
		CustomerVO c = new CustomerVO();
		c=(CustomerVO) request.getSession().getAttribute("sessionid");
		request.getSession().removeAttribute("sessionid");
		service.delete(c.getEmail());	
		return "customer/goodbye";
	}
}
