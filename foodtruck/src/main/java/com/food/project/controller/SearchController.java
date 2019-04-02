package com.food.project.controller;

import java.util.ArrayList;
import java.util.Locale;

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
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String search(Locale locale, Model model) {
		
		try{
			ArrayList<LocationVO> a=locservice.getLoc();
				for (LocationVO s : a) {
					System.out.println(s.getTruck_code());
				}
			model.addAttribute("loc",a);
			
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
