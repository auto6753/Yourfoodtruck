package com.food.project.m_controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.domain.CallListVO;
import com.food.project.domain.CustomerVO;
import com.food.project.domain.OnboardVO;
import com.food.project.service.CallListService;
import com.food.project.service.LoginService;
import com.food.project.service.OnboardService;
import com.google.gson.JsonObject;

import lombok.AllArgsConstructor;
import net.sf.json.JSON;
@AllArgsConstructor
@Controller
@CrossOrigin()
@RequestMapping(value = "/m.customer")
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
	
	@ResponseBody
	@RequestMapping(value = "/insertOnboard", method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String insertOnboard(@RequestBody Map<String,Object> map) {
		String truckc = (String)map.get("truck_code");
		String email = (String)map.get("email");
		
		//CustomerVO vo = (CustomerVO) session.getAttribute("sessionid");
		OnboardVO br = new OnboardVO();
		String ee = email;
		int i = 1;
		
		//String truckc = request.getParameter("truck_code");
		String sysd = (String)map.get("onboard_date");
		System.out.println(ee);
		System.out.println(truckc);
		System.out.println(sysd);
		br.setEmail(ee);
		br.setTruck_code(truckc);
		ArrayList<OnboardVO> dd = new ArrayList<OnboardVO>();
		System.out.println("1");
		dd = onboard.rideck(br);
		System.out.println("2");
		System.out.println(dd);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-mm-dd");
		//System.out.println(dd.size());
		
		if (dd.size()>=1) {
			System.out.println("3");
			if (dd.get(0).getOnboard_state() == 0) {
				System.out.println("4");
				try {
					transFormat.parse(sysd);
					System.out.println(transFormat.format(transFormat.parse(sysd)));

					Date test = Date.valueOf(transFormat.format(transFormat.parse(sysd)));
					br.setOnboard_date(test);
					System.out.println("넘어오나여?");
					System.out.println("넣어나여?");
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				int eee = 1;
				br.setEmail(ee);
				br.setTruck_code(truckc);
				br.setOnboard_state(eee);
				onboard.updateOnboarddate(br);
			}
		}else {
			System.out.println("5");
			try {
				transFormat.parse(sysd);
				System.out.println();
				System.out.println(transFormat.format(transFormat.parse(sysd)));

				Date test = Date.valueOf(transFormat.format(transFormat.parse(sysd)));
				br.setOnboard_date(test);
				System.out.println("넘어오나여?");
				System.out.println("넣어나여?");
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("6");
			br.setOnboard_state(i);
			System.out.println("넣어나여?");
			onboard.insertOnboard(br);
			System.out.println("7");
			System.out.println("되라");
		}
		JSONObject ob = new JSONObject();
		return  ob.toString();
	}
	@ResponseBody
	@RequestMapping(value = "/Deleteride", method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String Deleteride(@RequestBody Map<String,Object> map) {
		System.out.println("Dddd");
		String truckcode = (String)map.get("truck_code");
		String email = (String)map.get("email");
		String sysd = (String)map.get("out_date");
		System.out.println(sysd);
		int i = 0;
		OnboardVO on = new OnboardVO();
		on.setEmail(email);
		on.setTruck_code(truckcode);
		on.setOnboard_state(i);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-mm-dd");

		try {
			transFormat.parse(sysd);
			Date test = Date.valueOf(transFormat.format(transFormat.parse(sysd)));
			on.setOut_date(test);
			System.out.println(test);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("DDDDDDDD");
		onboard.updateOutdate(on);
		JSONObject ob = new JSONObject();
		System.out.println("?D");
		return ob.toString();
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
