package com.food.project.controller;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.food.project.domain.PaymentVO;
import com.food.project.service.PaymentService;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
public class AnnounceController {
	PaymentService service;
	@RequestMapping(value = "/announce", method = RequestMethod.GET)
	public String recruit(Model model) {
		return "announce/recruit";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/area", method = RequestMethod.GET)
	public String area(Model model) {
		JSONArray jArray = new JSONArray();
		ArrayList<PaymentVO> list = service.getPaymentList("010-5555-6666");
		for(PaymentVO vo : list) {
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("payment_code",vo.getPayment_code());
			jsonobj.put("truck_code",vo.getTruck_code());
			jsonobj.put("menu_code",vo.getMenu_code());
			jsonobj.put("amount",vo.getAmount());
			jsonobj.put("total_price",vo.getTotal_price());
			jsonobj.put("payment_class",vo.getPayment_class());
			jsonobj.put("payment_telephone",vo.getPayment_telephone());
			jArray.add(jsonobj);
		}
		HomeController.logger.info("{}",jArray);
		
		model.addAttribute("list",jArray);
		return "announce/area";
	}
}
