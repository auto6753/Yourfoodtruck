package com.food.project.controller;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.food.project.service.PaymentService;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class PaymentController {
	
	private PaymentService payService;
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public String recruit(Model model,HttpRequest request) {

		
		
		
		return "/project";
	}
	
}
