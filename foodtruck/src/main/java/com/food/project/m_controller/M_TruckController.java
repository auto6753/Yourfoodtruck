package com.food.project.m_controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.domain.EventVO;
import com.food.project.domain.FoodTruckVO;
import com.food.project.domain.MenuVO;
import com.food.project.domain.OnboardVO;
import com.food.project.domain.ReviewDTO;
import com.food.project.service.FoodTruckService;
import com.food.project.service.OnboardService;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;

@CrossOrigin()
@Controller
@AllArgsConstructor
@RequestMapping(value = "/m.truck")
public class M_TruckController {
	private FoodTruckService service;
	OnboardService onboard;
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/truck_info", method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String info(@RequestBody Map<String,Object> map) {
		String truck_code = (String)map.get("truck_code");
		String email = (String)map.get("email");
		
		
		System.out.println(email);
		System.out.println(truck_code);
		JSONArray test=new JSONArray();
		FoodTruckVO ss= service.getFoodTruck(truck_code);
		JSONObject data = new JSONObject();
		JSONObject ob = new JSONObject();
		ob.put("truck_info", ss);
		test.add(ob);
		data.put("truck_info", test);
		ArrayList<MenuVO> menu = service.selectMenu(truck_code);
		System.out.println(menu.size());
		//menu.get(0).get
		ArrayList<ReviewDTO> review = service.getReviewList(truck_code);
		ArrayList<EventVO> event = service.getEvent(truck_code);
		System.out.println(event.size());
//		메뉴
		JSONArray test1=new JSONArray();
		for(int i =0;i<menu.size();i++) {
			System.out.println("?");
			JSONObject obj = new JSONObject();
			obj.put("menu_name",menu.get(i).getMenu_name());
			obj.put("menu_url",menu.get(i).getMenu_url());
			obj.put("menu_surl",menu.get(i).getMenu_surl());
			obj.put("menu_unitprice",menu.get(i).getUnit_price());
			test1.add(obj);
			System.out.println("메뉴 surl 찍히나?"+test1.toString());
		}
		data.put("menu_list",test1);
		
//		리뷰
		JSONArray test4=new JSONArray();
		for(int i =0;i<review.size();i++) {
			System.out.println("?");
			JSONObject obj = new JSONObject();
			obj.put("eemail",review.get(i).getEmail());
			obj.put("review_content",review.get(i).getReview_content());
			obj.put("nickname",review.get(i).getNickname());
			obj.put("review_code",review.get(i).getReview_code());
			obj.put("truck_code",review.get(i).getTruck_code());
			obj.put("review_score",review.get(i).getReview_score());
			DateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
			Date nowDate = new Date();
			String tempDate = sdFormat.format(review.get(i).getReview_regdate());
			obj.put("regdate",tempDate);
			test4.add(obj);
		}
		data.put("review_list",test4);
		float count = review.size();
		float score = 0;
		float result = 0;
		for(int i = 0;i<review.size();i++) {
			score += review.get(i).getReview_score();
		}
		result = score / count;
		result = (float) (Math.round(result*100)/100.0);
		data.put("sumscore", result);
		
		JSONArray test2=new JSONArray();
		for(int i =0;i<event.size();i++) {
			JSONObject obj = new JSONObject();
			obj.put("event_content",event.get(i).getEvent_content());
			obj.put("event_name",event.get(i).getEvent_name());
			obj.put("menu_start",event.get(i).getEvent_start());
			obj.put("menu_end",event.get(i).getEvent_end());
			test2.add(obj);
		}
		data.put("event_list",test2);
		//OnboardVO on = new OnboardVO();
		if(email==null) {
			JSONObject onBoard = new JSONObject();
			onBoard.put("onboardstate", 0);
			data.put("onboardstate",onBoard);
		}else {
			OnboardVO on = new OnboardVO();
			on.setEmail(email);
			on.setTruck_code(truck_code);
			ArrayList<OnboardVO> sss = onboard.rideck(on);
			if (sss.size() != 0) {
				// System.out.println(ss);
				System.out.println("zs");
				JSONObject onBoard = new JSONObject();
				onBoard.put("onboardstate", sss.get(0).getOnboard_state());
				System.out.println("ㅇㅇㅇㅇㅇㅇ");
				System.out.println(sss.get(0).getOnboard_state());
				data.put("onboardstate",onBoard);
				//return onBoard.toString();
			} else {
				JSONObject onBoard = new JSONObject();
				onBoard.put("onboardstate", 0);
				
				data.put("onboardstate",onBoard);
				//return onBoard.toString();
			}
			
		}
		String truck_surl = service.getFoodTruck(truck_code).getTruck_surl();
		String truck_url = service.getFoodTruck(truck_code).getTruck_url();
		if(truck_surl==null) {
			data.put("truck_url","트럭사진.png");
		}else {
			//data.put("truck_surl",a.get("TRUCK_SURL"));
			System.out.println("독도2");
			System.out.println(truck_surl);
			//String temp[] = a.get("TRUCK_SURL).split("\\"));
			String temp[] = truck_surl.split("\\\\");
			String temp1=temp[0];
			String temp2=temp[1];
			System.out.println(temp1);
			System.out.println(temp2);
			String temp3 = temp1+"/"+temp2;
			System.out.println(temp3);
			data.put("truck_url",temp3);
			//data.put("truck_surl","test6@naver.com/ebd1ba13-7aba-4716-8a13-2c35ffe80a75_mug_obj_152024802935945730");
		}
		data.put("truck_surl",truck_surl);
		data.put("truck_url",truck_url);
		System.out.println(data.toString());
		System.out.println(data);
		System.out.println(email);
		return data.toString();
	}
	@ResponseBody
	@RequestMapping(value = "/register", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String register(FoodTruckVO fd,HttpServletRequest request) {
		System.out.println("1");
		System.out.println(fd);
		FoodTruckVO vo2= service.insertFoodTruck(fd);
		System.out.println(vo2);
		//System.out.println(session);
		JSONObject sessionInfo = new JSONObject();
		sessionInfo.put("result","success");
		sessionInfo.put("foodtruck",vo2);
		return sessionInfo.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/getTruck", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String getTruck(@RequestBody Map<String,Object> map) {
		System.out.println("오나요");
		String truck_code = (String)map.get("truck_code");
		//String truck_code = fd.getTruck_code();
		System.out.println(truck_code);
		
		FoodTruckVO ffd = service.getFoodTruck(truck_code);
		
		System.out.println(ffd.toString());
		JSONArray i  = new JSONArray();
		i.add(ffd);
		
		return i.toString();
	}
	
//	@RequestMapping(value = "/register", method = RequestMethod.POST)
//	public String register2(Model model, FoodTruckVO fd) {
//		System.out.println("fd");
//		return "";
//	}

//	@RequestMapping(value = "/callForm", method = RequestMethod.GET)
//	public String callForm(Locale locale, Model model) {
//		return "truck/callForm";
//	}
}