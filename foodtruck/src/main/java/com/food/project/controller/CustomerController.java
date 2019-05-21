package com.food.project.controller;

import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.ResponseBody;
import com.food.project.domain.CallListVO;
import com.food.project.domain.CustomerVO;
import com.food.project.domain.FoodTruckVO;
import com.food.project.domain.MyreviewlistDTO;
import com.food.project.domain.OnboardVO;
import com.food.project.domain.ReviewVO;
import com.food.project.service.CallListService;
import com.food.project.service.FoodTruckService;
import com.food.project.service.LoginService;
import com.food.project.service.OnboardService;
import com.google.gson.JsonArray;
import com.food.project.service.PostService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller

@RequestMapping(value = "/customer")
public class CustomerController {

	private LoginService service;
	private FoodTruckService review;
	CallListService callList;
	OnboardService onboard;
	PostService post;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model) {
		return "customer/mypage";
	}

	@RequestMapping(value = "/onboard", method = RequestMethod.GET)
	public String onboard(Locale locale, Model model, HttpSession session) {
		CustomerVO vo = (CustomerVO) session.getAttribute("sessionid");
		System.out.println(vo.getEmail());

		ArrayList<OnboardVO> ob = onboard.getOnboard(vo.getEmail());
		for (int i = 0; i < ob.size(); i++) {
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
	@ResponseBody
	@RequestMapping(value = "/onboard", method = RequestMethod.POST)
	public String onboardPOST(Locale locale, Model model, HttpSession session, HttpServletRequest request) {
		String truckcode = request.getParameter("truckcode");
		
		System.out.println(truckcode);
		
		onboard.DeleteOnboard(truckcode);
		
		return "";
	}
	@RequestMapping(value = "/onSale", method = RequestMethod.GET)
	public String onSale(Locale locale, Model model, HttpSession session) {
		CustomerVO vo = (CustomerVO) session.getAttribute("sessionid");
		System.out.println(vo.getEmail());
		
		ArrayList<OnboardVO> sale = new ArrayList<OnboardVO>();
		ArrayList<OnboardVO> result=new ArrayList<>();
		sale = onboard.getOnSale(vo.getEmail());
		int length=sale.size();
		for (int i = 0; i < length; i++) {
			String hours =	sale.get(i).getHours();
			int start_hour=Integer.parseInt(hours.substring(0,2));
			int end_hour=Integer.parseInt(hours.substring(3));
			System.out.println(start_hour+" : " + end_hour );
			SimpleDateFormat date=new SimpleDateFormat("HH");
			int sysdate=Integer.parseInt(date.format(System.currentTimeMillis()));
			if(start_hour <= sysdate && end_hour>=sysdate) {
				result.add(sale.get(i));
			}
		}
		System.out.println(sale);
		model.addAttribute("onSale", result);
		
		
		return "customer/onSale";
	}
	
	
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String review(Locale locale, Model model , HttpSession session) {
		
		CustomerVO vo = (CustomerVO) session.getAttribute("sessionid");
		System.out.println(vo);
		
	
		String tt = vo.getEmail();
		
		
		ArrayList<MyreviewlistDTO> vo2 = review.selectReview(tt);
		
		
		model.addAttribute("rlist" ,vo2);
		
		System.out.println(vo2);
	
		
		return "customer/review";
	}
	/*
	 * @RequestMapping(value = "/reviewList", method = RequestMethod.POST) public
	 * String reviewList(Locale locale, Model model , HttpSession session) {
	 * 
	 * 
	 * 
	 * 
	 * return "customer/review"; }
	 */
	
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
           data.put("merchant_uid", a.get("MERCHANT_UID"));
           data.put("brandname", a.get("BRANDNAME"));
           data.put("festival_startdate", a.get("FESTIVAL_STARTDATE"));
           data.put("festival_enddate", a.get("FESTIVAL_ENDDATE"));
           data.put("progress", a.get("PROGRESS"));
           data.put("place", a.get("PLACE"));
           data.put("festival_endtime", a.get("FESTIVAL_ENDTIME"));
           data.put("festival_starttime", a.get("FESTIVAL_STARTTIME"));
           data.put("name", a.get("NAME"));
		   data.put("pay_status",a.get("PAY_STATUS"));
		   data.put("request_date",a.get("REQUEST_DATE"));
           arry.add(data);
        }
		
		
		//System.out.println(list);
		System.out.println(arry);
		//ArrayList<CallListVO> cl = callList.getMyCallList(vo.getEmail());
		 
	
		
//		for(int i = 0;i<cl.size();i++) {
//			System.out.println(cl);
//		}
//		
		model.addAttribute("CallList2", arry);
		//model.addAttribute("CallList", cl);

		return "customer/callList";

	}

	
	@RequestMapping(value = "/cusInfo", method = RequestMethod.GET)
	public String cusInfoGET(Locale locale, Model model, HttpServletRequest request, HttpSession session, CustomerVO vo ) {
		vo = (CustomerVO) session.getAttribute("sessionid");
		System.out.println(vo.getEmail());
		
		CustomerVO cus = service.getCustomer(vo.getEmail()); 
		System.out.println(cus);
		model.addAttribute("cusinfo", cus);

		return "customer/cusInfo";
	}
	
	@ResponseBody
	@RequestMapping(value = "/cusInfo", method = RequestMethod.POST)
	public String cusInfoPost(Locale locale, Model model, HttpServletRequest request, HttpSession session, CustomerVO vo ) {
		vo = (CustomerVO) session.getAttribute("sessionid");
		System.out.println(vo.getEmail());
		String ps = request.getParameter("password");
		System.out.println(ps);
		
		System.out.println("오나연");
		CustomerVO pass = new CustomerVO();
		pass.setEmail(vo.getEmail());
		pass.setPassword(ps);
		service.updatePassword(pass);
		
		System.out.println("했나연");

		
		return "";
	}
	
	 @RequestMapping(value = "/nicknameck", method = RequestMethod.GET) 
	  public String nicknameGET(Locale locale, Model model, HttpServletRequest request) { 
		  
		  
		  return"customer/cusInfo"; 
		  }
	 @ResponseBody
	 @RequestMapping(value = "/nicknameck", method = RequestMethod.POST) 
	  public String nicknamePOST(Locale locale, Model model, HttpServletRequest request, HttpSession session, CustomerVO vo) {
		 System.out.println("ddddd");
		 vo = (CustomerVO) session.getAttribute("sessionid");
		 String nick = request.getParameter("nickname");
		 System.out.println(nick);
		 System.out.println("1");
		 CustomerVO name = service.getName(nick);
		 System.out.println("2");
		 if(name==null) {
			 System.out.println("3");
			 CustomerVO nickn = new CustomerVO();
			 nickn.setEmail(vo.getEmail());
			 nickn.setNickname(nick);
			 
			 service.updateNickname(nickn);
			 
			 System.out.println("success");
			 return "success";
		 } else {
			 System.out.println(name.getNickname());
			 System.out.println("fail");
			 return "fail";
		 }
		  
		 	
		  }
	 
	
	  @RequestMapping(value = "/goodbyeForm", method = RequestMethod.GET) 
	  public String goodbyeForm(Locale locale, Model model) { 
		  
		  
		  return"customer/goodbyeForm"; }
	

	// 회원탈퇴
	@RequestMapping(value = "/goodbye", method = RequestMethod.GET)
	public String goodbye(Locale locale, Model model, HttpServletRequest request) {
		CustomerVO c = new CustomerVO();
		c = (CustomerVO) request.getSession().getAttribute("sessionid");
		request.getSession().removeAttribute("sessionid");
		service.delete(c.getEmail());

		return "customer/goodbye";
	}
}
