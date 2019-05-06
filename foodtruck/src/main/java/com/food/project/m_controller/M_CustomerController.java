package com.food.project.m_controller;

import java.util.ArrayList;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.food.project.domain.CallListVO;
import com.food.project.domain.CustomerVO;
import com.food.project.domain.OnboardVO;
import com.food.project.service.CallListService;
import com.food.project.service.LoginService;
import com.food.project.service.OnboardService;


import lombok.AllArgsConstructor;
@AllArgsConstructor
@Controller

@RequestMapping(value = "/customer", method = RequestMethod.GET)
public class M_CustomerController {

	private LoginService service;
	CallListService callList;
	OnboardService onboard;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model) {
		return "customer/mypage";
	}
	
	@RequestMapping(value = "/onboard", method = RequestMethod.GET)
	public String onboard(Locale locale, Model model, HttpSession session) {
		CustomerVO vo = (CustomerVO) session.getAttribute("sessionid");
		System.out.println(vo.getEmail());
		
		ArrayList<OnboardVO> ob = onboard.getOnboard(vo.getEmail());
		for(int i=0; i < ob.size(); i++) {
			System.out.println(ob);
		}
		model.addAttribute("onboard", ob);
		/*
		 * ArrayList<OnboardVO> ob = onboard.getOnboard(vo.getEmail()); for(int i
		 * =0;i<ob.size();i++) { System.out.println(ob); }
		 * model.addAttribute("Onboard",ob);
		 * 
		 */
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
	public String callList(Locale locale, Model model ,HttpSession session) {
		
		CustomerVO vo = (CustomerVO) session.getAttribute("sessionid");
		System.out.println(vo.getEmail());
		//String email = null;
		
		ArrayList<CallListVO> cl = callList.getMyCallList(vo.getEmail());
		
		for(int i = 0;i<cl.size();i++) {
			System.out.println(cl);
		}
		
		model.addAttribute("CallList", cl);

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
