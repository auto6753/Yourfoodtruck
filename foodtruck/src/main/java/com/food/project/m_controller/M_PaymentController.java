package com.food.project.m_controller;

import java.util.ArrayList;
import java.util.HashMap;
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
public class M_PaymentController {
	
	private PaymentService payService;
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/insertPayment")
	@ResponseBody
	public void payment(@RequestBody String param) {
		List<Map<String,Object>> paymentMap = new ArrayList<Map<String,Object>>();
		paymentMap = JSONArray.fromObject(param);
		System.out.println(paymentMap);
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
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/updatePayment")
	@ResponseBody
	public void updatePayment(@RequestBody String param,PaymentVO vo) {
		Map<String,Object> paymentMap = new HashMap<String,Object>();
		paymentMap = JSONObject.fromObject(param);
		vo.setTruck_code((String)paymentMap.get("truck_code"));
		vo.setPayment_telephone((String)paymentMap.get("payment_telephone"));
		vo.setPayment_code((String)paymentMap.get("payment_code"));
		vo.setPayment_class(
				(int)paymentMap.get("payment_class"));
		
		System.out.println(paymentMap);
		int a=payService.updatePaymentList(vo);
		if(a==0) System.out.println("Error");
		else System.out.println("Success");
	}
	
	
}