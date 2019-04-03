package com.food.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/seller", method = RequestMethod.GET)
public class SellerController {
	private static final int MENU_PER_LINE = 4; // 1줄당 메뉴 개수
	
	@RequestMapping(value="", method=RequestMethod.GET) 
	public String sellerMain(Model model) {
		return "seller/sellerMain";
	}
	
	@RequestMapping(value="/menu", method=RequestMethod.GET) 
	public String menu(Model model) {
		String[] menuList = {"김밥", "볶음밥", "오므라이스", "냉면", "돈가스"}; // DB에 등록된 메뉴
		
		int menu = menuList.length; // DB에 등록된 메뉴 개수
		int lineNext; // 줄 바꿈 횟수
		int chkremain; // 나머지 존재 여부 확인
		
		lineNext = (menu / MENU_PER_LINE) - 1;
		chkremain = menu % MENU_PER_LINE;
		
		if(chkremain > 0 || menu == 0) {
			lineNext++;
		}
		
		model.addAttribute("menuList", menuList);
		model.addAttribute("menu", menu);
		model.addAttribute("lineNext", lineNext);
		model.addAttribute("MENU_PER_LINE", MENU_PER_LINE);
		
		return "seller/menu/menu";
	}
	
	@RequestMapping(value="/location", method=RequestMethod.GET) 
	public String location(Model model) {
		return "seller/loc/location";
	}
	
	@RequestMapping(value="/event", method=RequestMethod.GET) 
	public String event(Model model) {
		return "seller/event/event";
	}
	@RequestMapping(value="/psgpush", method=RequestMethod.GET) 
	public String passenger(Model model) {
		return "seller/psg/psgpush";
	}
	
	@RequestMapping(value="/callmanage", method=RequestMethod.GET) 
	public String call(Model model) {
		return "seller/call/callmanage";
	}
	
	@RequestMapping(value="/order", method=RequestMethod.GET) 
	public String order(Model model) {
		return "seller/order/orderMain";
	}
	
	@RequestMapping(value="/layout", method=RequestMethod.GET) 
	public String layout(Model model) {
		return "seller/layout/layout";
	}
	
	@RequestMapping(value="/side", method=RequestMethod.GET) 
	public String side(Model model) {
		return "seller/sideMenuBar/sideMenuBar";
	}
}
