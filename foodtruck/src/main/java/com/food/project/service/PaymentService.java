package com.food.project.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.food.project.domain.PaymentVO;

public interface PaymentService {
	public ArrayList<PaymentVO> getAllList();
	public ArrayList<PaymentVO> getPaymentList(String payment_telephone);
	public int insertPaymentList(List<Map<String,Object>> list);
}
