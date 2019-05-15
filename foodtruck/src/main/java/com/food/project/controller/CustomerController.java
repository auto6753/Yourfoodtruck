package com.food.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.domain.CallListVO;
import com.food.project.domain.CustomerVO;
import com.food.project.domain.OnboardVO;
import com.food.project.service.CallListService;
import com.food.project.service.LoginService;
import com.food.project.service.OnboardService;
import com.google.gson.JsonArray;

import lombok.AllArgsConstructor;
@AllArgsConstructor
@Controller

@RequestMapping(value = "/customer")
public class CustomerController {

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
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/callList" ,method = RequestMethod.GET)
	public String callList(Locale locale, Model model ,HttpSession session) {
		
		CustomerVO vo = (CustomerVO) session.getAttribute("sessionid");
		System.out.println(vo.getEmail());
		//String email = null;
		
		//System.out.println("z"+callList.getCallList2(vo.getEmail()));
		
		List<Map<String, Object>> list = callList.getCallList2(vo.getEmail());
		JSONArray arry= new JSONArray();
        for(Map<String, Object> a : list) {
           JSONObject data=new JSONObject();
           data.put("festival_name", a.get("FESTIVAL_NAME"));
           data.put("brandname", a.get("BRANDNAME"));
           data.put("festival_startdate", a.get("FESTIVAL_STARTDATE"));
           data.put("festival_enddate", a.get("FESTIVAL_ENDDATE"));
           data.put("progress", a.get("PROGRESS"));
           data.put("place", a.get("PLACE"));
           data.put("festival_endtime", a.get("FESTIVAL_ENDTIME"));
           data.put("festival_starttime", a.get("FESTIVAL_STARTTIME"));
           data.put("name", a.get("NAME"));
		   data.put("pay_status",a.get("PAY_STATUS"));
           arry.add(data);
        }
		
		
		//System.out.println(list);
		System.out.println(arry);
		ArrayList<CallListVO> cl = callList.getMyCallList(vo.getEmail());
		 
	
		
//		for(int i = 0;i<cl.size();i++) {
//			System.out.println(cl);
//		}
//		
		model.addAttribute("CallList2", arry);
		model.addAttribute("CallList", cl);

		 return "customer/callList";
		 
	}

	@RequestMapping(value = "/cusInfo", method= {RequestMethod.POST, RequestMethod.GET})
	public String cusInfo(Locale locale, Model model, HttpSession session, @RequestParam("password") String password) {
		CustomerVO vo = (CustomerVO) session.getAttribute("sessionid");
		System.out.println(vo.getEmail());
		
		CustomerVO cus = service.getCustomer(vo.getEmail());
		System.out.println(cus);
		model.addAttribute("cusinfo", cus);
		
		/* String ps = .getPassword(password)); */
		 
		
		System.out.println(vo.getPassword());
		/* service.updatePassword(vo.getPassword()); */
		 
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
