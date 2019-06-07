package com.food.project.m_controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.domain.CustomerVO;
import com.food.project.domain.EventVO;
import com.food.project.domain.FoodTruckVO;
import com.food.project.domain.MenuVO;
import com.food.project.domain.OnboardVO;
import com.food.project.domain.ReviewDTO;
import com.food.project.service.FoodTruckService;
import com.food.project.service.OnboardService;
import com.google.gson.JsonArray;

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
			obj.put("menu_unitprice",menu.get(i).getUnit_price());
			test1.add(obj);
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
//		ArrayList<ReviewDTO> d = service.getReviewList(truck_code); //클릭한 푸드트럭의 코드로 해당 푸드트럭의 댓글을 조회해서 reviewList에 담고 truck/truckInfo 로 넘겨줌
//		System.out.println(d);
//		JSONObject adf= new JSONObject();
//		JSONArray aff = new JSONArray();
//		System.out.println(d.size());
//		adf.put("review_list", d);
//		//aff.add(d);
//		System.out.println(adf.get("review_code"));
//		System.out.println(adf.toString());
//		for(ReviewDTO a : d) {
//		JSONObject obj = new JSONObject();
//		obj.put("nickname",a.getNickname());
//		obj.put("eemail",a.getEmail());
//		obj.put("review_code",a.getReview_code());
//		obj.put("review_regdate",a.getReview_regdate());
//		obj.put("truck_code",a.getTruck_code());
//		obj.put("event_content",a.getNickname());
//		aff.add(obj);
//	}
		
		//t2.add(d);
		//System.out.println(2);
//		for(int i =0;i<d.size();i++) {
//			System.out.println("z");
//			JSONObject obj2 = new JSONObject();
////			JSONObject obj = new JSONObject();
//			obj2.put("review_code",d.get(i).getReview_code());
//			System.out.println("1");
//			System.out.println(d.get(i).getReview_code());
//			obj2.put("review_content",d.get(i).getReview_content());
//			System.out.println("2");
//			System.out.println(d.get(i).getReview_content());
//			obj2.put("eemail",d.get(i).getEmail());
//			System.out.println("3");
//			System.out.println(d.get(i).getEmail());
//			obj2.put("nickname",d.get(i).getNickname());
//			System.out.println("4");
//			System.out.println(d.get(i).getNickname());
//			obj2.put("review_regdate",d.get(i).getReview_regdate());
//			System.out.println("5");
//			System.out.println(d.get(i).getReview_regdate());
//			t2.add(obj2);
//			//System.out.println(test3);
//			
//		}
//		
//		data.put("review_list",test3);
//		
//		float count = d.size();
//		float score = 0;
//		float result = 0;
//		for(int i = 0;i<d.size();i++) {
//			score += d.get(i).getReview_score();
//		}
//		
//		result = score / count;
//		result = (float) (Math.round(result*100)/100.0);
//		 
//		data.put("score", result);
//		model.addAttribute("reviewList", d);
//		model.addAttribute("sumscore", result);
//		for(MenuVO b : menu) {
//			System.out.println("?");
//			JSONObject obj = new JSONObject();
//			obj.put("menu_name",b.getMenu_name());
//			obj.put("menu_url",b.getMenu_url());
//			obj.put("menu_unitprice",b.getUnit_price());
//			test.add(obj);
//		}
		//System.out.println(truck_code);
		
//		for(EventVO a : event) {
//			JSONObject obj = new JSONObject();
//			obj.put("event_content",a.getEvent_content());
//			obj.put("event_name",a.getEvent_name());
//			obj.put("menu_start",a.getEvent_start());
//			obj.put("menu_end",a.getEvent_end());
//			test.add(obj);
//		}
		System.out.println(data.toString());
		System.out.println(data);
		
//		for(FoodTruckVO a : ss) {
//			JSONObject data=new JSONObject();
//			data.put("truck_code", a.get("TRUCK_CODE"));
//			data.put("account", a.get("ACCOUNT"));
//			data.put("lay_y", a.get("LAT_Y"));
//			data.put("lng_x", a.get("LNG_X"));
//			data.put("brandname", a.get("BRANDNAME"));
//			data.put("trucknum", a.get("TRUCKNUM"));
//			data.put("email", a.get("EMAIL"));
//			data.put("crn", a.get("CRN"));
//			data.put("hours", a.get("HOURS"));
//			data.put("truck_starttime" , a.get("TRUCK_STARTTIME"));
//			data.put("truck_endtime" , a.get("TRUCK_ENDTIME"));
//			data.put("layout", a.get("LAYOUT"));
//			data.put("total_review",a.get("TOTAL_REVIEW"));
//			data.put("avg_review",a.get("AVG_REVIEW"));
//		}
		//model.addAttribute("tlist", ss); //트럭정보
		//String email = request.getParameter("email");
		//String truckcode = request.getParameter("truck_code");
		System.out.println(email);
//		OnboardVO on = new OnboardVO();
//		on.setEmail(email);
//		on.setTruck_code(truckcode);
//
//		ArrayList<OnboardVO> ss = onboard.rideck(on);
//		if (ss.size() != 0) {
//			// System.out.println(ss);
//			System.out.println("zs");
//			JSONObject onBoard = new JSONObject();
//			onBoard.put("onboardstate", ss.get(0).getOnboard_state());
//			System.out.println("ㅇㅇㅇㅇㅇㅇ");
//			System.out.println(ss.get(0).getOnboard_state());
//			return onBoard.toString();
//		} else {
//			JSONObject onBoard = new JSONObject();
//			onBoard.put("onboardstate", 0);
//			return onBoard.toString();
//		}
		
		
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