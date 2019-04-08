package com.food.project.service;

import java.util.ArrayList;
import com.food.project.domain.PaymentVO;

public interface PaymentService {
	public ArrayList<PaymentVO> getPaymentList(String payment_code);
	public int insertPaymentList(ArrayList<PaymentVO> payment_list);
}
