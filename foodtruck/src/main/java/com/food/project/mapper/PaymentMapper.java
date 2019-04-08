package com.food.project.mapper;

import java.util.ArrayList;
import com.food.project.domain.PaymentVO;

public interface PaymentMapper {
	public ArrayList<PaymentVO> getPaymentList(String payment_code);
	public void insertPaymentList(PaymentVO vo);

}
