package com.food.project.mapper;

import java.util.ArrayList;
import com.food.project.domain.PaymentVO;

public interface PaymentMapper {
	public ArrayList<PaymentVO> getAllList();
	public ArrayList<PaymentVO> getPaymentList(String payment_telephone);
//	public void insertPaymentList(PaymentVO vo);

}
