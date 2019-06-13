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
@RequestMapping(value="/pay")
public class PaymentController {
	
	private CallListService callService;
	private PaymentService payService;
	private CallListMapper mapper;
	private FoodTruckService foodService;
	
	//private CallListMapper callmapper;
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/insertPayment")
	@ResponseBody
	public String payment(@RequestBody String param) {
		List<Map<String,Object>> paymentMap = new ArrayList<Map<String,Object>>();
		paymentMap = JSONArray.fromObject(param);
		System.out.println(paymentMap);
		int a=payService.insertPaymentList(paymentMap);
		if(a==0) {
			System.out.println("Error");
			return "error";
		}else {
			System.out.println("Success");
			return "success";
		}
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
	
	// 푸드트럭 호출 결제
	@ResponseBody
	@RequestMapping(value = "/CallPayment", method=RequestMethod.POST)

	public String CallPayment(Model model,CallListVO vo) {
		System.out.println(vo);
		vo.setRequest_date(new Date());
		
		callService.insertCallList(vo);
		System.out.println("결제하고 인서트하러왔다");
		
		return "success";
	}
	// 푸드트럭 결제 환불 또는 진행상태 업데이트
	@ResponseBody
	@RequestMapping(value = "/Callrefund", method=RequestMethod.POST)
	public String Callrefund(Model model,CallListVO vo) {
		//callService.
		//callmapper.deleteCall(vo.getMerchant_uid());
		System.out.println("호출업뎃");
		System.out.println(vo);
		int a ;
		if(vo.getPay_status() == 0) {
			System.out.println("0");
			 a = callService.updateCallVo(vo);
		}else {
			System.out.println("else");
			 a = callService.updateCall(vo);
		}
		if(vo.getProgress()==5) {
			CallListVO ck = mapper.getCall(vo.getMerchant_uid());
			FoodTruckVO food = foodService.getFoodTruck(ck.getTruck_code());
			CustomerVO cus = new CustomerVO();
			cus.setEmail(food.getEmail());
			cus.setPoint(ck.getPrice());
			payService.updatePoint(cus);
		}
		
		System.out.println(vo.getMerchant_uid());
		if(a==1) {
			return "success";
		}else {
			return "fail";
		}

	}
	
	@ResponseBody
	@RequestMapping(value = "/GetPayment", method=RequestMethod.POST)
	public CallListVO GetPayment(Model model,CallListVO vo) {
		System.out.println(vo.getMerchant_uid());
		return mapper.getCall(vo.getMerchant_uid());
	}	
	
}