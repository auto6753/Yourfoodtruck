package com.food.project.controller;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.food.project.domain.FoodTruckVO;
import com.food.project.domain.LocationVO;
import com.food.project.domain.MenuVO;
import com.food.project.service.MemberService;
import com.food.project.service.SellerService;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/seller")
public class SellerController {
  
	private static final int MENU_PER_LINE = 4; // 1줄당 메뉴 개수
	private SellerService sellerservice;

	@RequestMapping(value="", method=RequestMethod.GET) 
	public String sellerMain(Model model) {
		System.out.println("셀러메인");
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
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/seorder", method=RequestMethod.GET) 
	public String seorder(Model model) {
		
		JSONObject data = new JSONObject();
		JSONObject number = new JSONObject();
		JSONArray arr = new JSONArray();
		data.put("truck_code", 123);
		data.put("menu_code", 4443);
		data.put("amount", 3);
		data.put("total_price",6000);
		data.put("payment_class",1);
		arr.add(data);
		data.put("truck_code", 123);
		data.put("menu_code", 4443);
		data.put("amount", 3);
		data.put("total_price",6000);
		data.put("payment_class",1);
		arr.add(data);
		System.out.println(arr);
		number.put("01064364393", arr);
		System.out.println(number);
		model.addAttribute("list", number);
		
		return "seller/order/seorder";
	}
	
	@RequestMapping(value="/cuorder", method=RequestMethod.GET) 
	public String cuorder(Model model,HttpServletRequest request) {
		FoodTruckVO vo = new FoodTruckVO();
		vo = (FoodTruckVO) request.getSession().getAttribute("seller");
		String truckcode = vo.getTruck_code();
		System.out.println(truckcode);
		ArrayList<MenuVO> menulist = new ArrayList<>();
		menulist = sellerservice.getmenu(truckcode);
		model.addAttribute("menulist", menulist); 
		 //vo2 = sellerservice.getmenu(truckcode);
		 System.out.println();
		return "seller/order/cuorder";
	}
	
	@RequestMapping(value="/truckinfo", method=RequestMethod.GET) 
	public String truckinfo(Model model) {
		return "seller/truckinfo/truckinfo";
	}
	
}
