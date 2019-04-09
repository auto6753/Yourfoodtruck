package com.food.project.service;

import java.util.ArrayList;
import org.springframework.stereotype.Service;
import com.food.project.domain.PaymentVO;
import com.food.project.mapper.PaymentMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PaymentServiceImplement implements PaymentService {

	PaymentMapper mapper;
	@Override
	public ArrayList<PaymentVO> getPaymentList(String payment_telephone) {
		return mapper.getPaymentList(payment_telephone);
	}

//	@Override
//	public int insertPaymentList(ArrayList<PaymentVO> payment_list) {
//		int result=0;
//		try{
//			for(PaymentVO vo:payment_list) {
//				mapper.insertPaymentList(vo);
//			}
//			result=1;
//		}catch(Exception e){
//		}
//		return result;
//		
//	}

	@Override
	public ArrayList<PaymentVO> getAllList() {
		return mapper.getAllList();
	}

}
