package com.food.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import net.sf.json.*;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.project.domain.PaymentVO;
import com.food.project.service.PaymentService;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping(value="/pay")
public class PaymentController {
	
	private PaymentService payService;
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/insertPayment")
	@ResponseBody
	public void payment(@RequestBody String param) {
		List<Map<String,Object>> paymentMap = new ArrayList<Map<String,Object>>();
		paymentMap = JSONArray.fromObject(param);
		int a=payService.insertPaymentList(paymentMap);
		if(a==0) System.out.println("Error");
		else System.out.println("Success");
	}
	@RequestMapping(value="/insertOrder",method=RequestMethod.POST)
	public void insertOrder(Model model, HttpServletRequest request) {
	}
	@RequestMapping(value="/afterOrder",method=RequestMethod.POST)
	public String afterOrder() {
		return "seller/order/afterOrder";
	}
	@RequestMapping(value="/payck",method=RequestMethod.POST)
	@ResponseBody
	public String payck(Model model,PaymentVO vo) {
		System.out.println(vo.getTruck_code());
		System.out.println(vo.getPayment_telephone());
		
		return "success";
	}
	
	
	
}
