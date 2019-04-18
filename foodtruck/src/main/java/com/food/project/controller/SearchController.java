package com.food.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.food.project.service.FoodTruckService;
import com.food.project.service.LocationService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/search", method = RequestMethod.GET)
public class SearchController {
	
	LocationService locservice;
	FoodTruckService ftservice;

	@SuppressWarnings("unchecked")

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String search(Model model) {
		JSONArray arry= new JSONArray();
		try{
//			ArrayList<FoodTruckVO> ft = ftservice.getFoodTruckList();
//			ArrayList<LocationVO> a=locservice.getLoc();
//			JSONArray truckArr = new JSONArray();
//			JSONArray dataarr = new JSONArray();
//				for (LocationVO s : a) {
//					JSONObject data = new JSONObject();
//					data.put("lat", s.getLat_y());
//					data.put("lng",s.getLng_x());
//					dataarr.add(data);
//				}
//				for(FoodTruckVO d : ft) {
//					JSONObject data=new JSONObject();
//					data.put("truck_code",d.getTruck_code());
//					data.put("crn",d.getCrn());
//					data.put("trucknum",d.getTrucknum());
//					data.put("account",d.getAccount());
//					data.put("layout",d.getLayout());
//					data.put("hours",d.getHours());
//					data.put("weekend_hour",d.getWeekend_hours());
//					data.put("brandname",d.getBrandname());
//					data.put("truck_regdate",d.getTruck_regdate().toString());
//					data.put("email",d.getEmail());
//					truckArr.add(data);
//				}
//			JSONObject data2 = new JSONObject();
//			data2.put("positions", dataarr);
//			model.addAttribute("foodtruckList",truckArr);
//			model.addAttribute("loc",data2);
			
			//HashMap<String, Object> list = new HashMap<>();
			//list=locservice.getLoc();
			
			List<Map<String, Object>> list = locservice.getLoc();
			for(Map<String, Object> a : list) {
				JSONObject data=new JSONObject();
				data.put("truck_code", a.get("TRUCK_CODE"));
				data.put("account", a.get("ACCOUNT"));
				data.put("lay_y", a.get("LAT_Y"));
				data.put("lng_x", a.get("LNG_X"));
				data.put("brandname", a.get("BRANDNAME"));
				data.put("trucknum", a.get("TRUCKNUM"));
				data.put("email", a.get("EMAIL"));
				data.put("crn", a.get("CRN"));
				data.put("hours", a.get("HOURS"));
				data.put("layout", a.get("LAYOUT"));
				data.put("total_review",a.get("TOTAL_REVIEW"));
				data.put("avg_review",a.get("AVG_REVIEW"));
				arry.add(data);
			}
			//model.addAttribute("loc",list2);
		}catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("loc",arry);
		return "search/search";
	}
	
//	@RequestMapping(value = "/searchResult", method = RequestMethod.GET)
//	public String searchResult(Locale locale, Model model) {
//		return "search/searchResult";
//	}

}
