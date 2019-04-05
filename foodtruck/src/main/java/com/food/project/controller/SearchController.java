package com.food.project.controller;

import java.util.ArrayList;
import java.util.Locale;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.food.project.domain.LocationVO;
import com.food.project.service.LocationService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value = "/search", method = RequestMethod.GET)
public class SearchController {
	
	LocationService locservice;
	

	@SuppressWarnings("unchecked")

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String search(Locale locale, Model model) {
		
		try{
			ArrayList<LocationVO> a=locservice.getLoc();
			JSONObject positions = new JSONObject();
			JSONArray dataarr = new JSONArray();
				for (LocationVO s : a) {
					JSONObject data = new JSONObject();
					data.put("lat", s.getLat_y());
					data.put("lng",s.getLng_x());
					dataarr.add(data);
				}
			JSONObject object = new JSONObject();
			object.put("positions",dataarr);
			System.out.println(object);
			model.addAttribute("loc",object);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//model.addAttribute("loc",locservice.getLoc());
		return "search/search";
	}
	
//	@RequestMapping(value = "/searchResult", method = RequestMethod.GET)
//	public String searchResult(Locale locale, Model model) {
//		return "search/searchResult";
//	}

}
