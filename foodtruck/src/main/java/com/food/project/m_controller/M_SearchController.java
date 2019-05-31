package com.food.project.m_controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.service.FoodTruckService;
import com.food.project.service.LocationService;

import lombok.AllArgsConstructor;

@CrossOrigin()
@Controller
@AllArgsConstructor
@RequestMapping(value = "/m.search")
public class M_SearchController {
	
	LocationService locservice;
	FoodTruckService ftservice;

	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/load", method = RequestMethod.POST,produces = "application/text; charset=utf8")
	public String search() {
		System.out.println("서치킹");
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
			JSONArray test=new JSONArray();
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
				data.put("truck_starttime" , a.get("TRUCK_STARTTIME"));
				data.put("truck_endtime" , a.get("TRUCK_ENDTIME"));
				data.put("layout", a.get("LAYOUT"));
				data.put("total_review",a.get("TOTAL_REVIEW"));
				data.put("avg_review",a.get("AVG_REVIEW"));
				if(a.get("TRUCK_SURL")==null) {
					data.put("truck_surl","트럭사진.png");
				}else {
					//data.put("truck_surl",a.get("TRUCK_SURL"));
					System.out.println("독도");
					System.out.println(a.get("TRUCK_SURL"));
					String z=(String) a.get("TRUCK_SURL");
					//String temp[] = a.get("TRUCK_SURL).split("\\"));
					String temp[] = z.split("\\\\");
					String temp1=temp[0];
					String temp2=temp[1];
					System.out.println(temp1);
					System.out.println(temp2);
					String temp3 = temp1+"/"+temp2;
					System.out.println(temp3);
					data.put("truck_surl",temp3);
					//data.put("truck_surl","test6@naver.com/ebd1ba13-7aba-4716-8a13-2c35ffe80a75_mug_obj_152024802935945730");
				}
				if(a.get("TRUCK_URL")==null) {
					data.put("truck_url","트럭사진.png");
				}else {
					//data.put("truck_surl",a.get("TRUCK_SURL"));
					System.out.println("독도2");
					System.out.println(a.get("TRUCK_URL"));
					String z=(String) a.get("TRUCK_URL");
					//String temp[] = a.get("TRUCK_SURL).split("\\"));
					String temp[] = z.split("\\\\");
					String temp1=temp[0];
					String temp2=temp[1];
					System.out.println(temp1);
					System.out.println(temp2);
					String temp3 = temp1+"/"+temp2;
					System.out.println(temp3);
					data.put("truck_url",temp3);
					//data.put("truck_surl","test6@naver.com/ebd1ba13-7aba-4716-8a13-2c35ffe80a75_mug_obj_152024802935945730");
				}
				
				
				arry.add(data);
				
			}
			//model.addAttribute("loc",list2);
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(arry.toString());
		return arry.toString();
	}
	
//	@RequestMapping(value = "/searchResult", method = RequestMethod.GET)
//	public String searchResult(Locale locale, Model model) {
//		return "search/searchResult";
//	}

}

