package com.food.project.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import net.sf.json.*;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.domain.CallListVO;
import com.food.project.domain.CustomerVO;
import com.food.project.domain.FoodTruckVO;
import com.food.project.domain.PaymentVO;
import com.food.project.mapper.CallListMapper;
import com.food.project.service.CallListService;
import com.food.project.service.FoodTruckService;
import com.food.project.service.LoginService;
import com.food.project.service.PaymentService;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value="/recruit")
public class RecruitController {
	
	//private CallListMapper callmapper;
	@RequestMapping(value = "", method=RequestMethod.GET)
	public String payment() {
		System.out.println("??");
		
		return "recruit/recruit";
	}
}