package com.food.project.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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

	@Override
	public ArrayList<PaymentVO> getAllList() {
		return mapper.getAllList();
	}

	@Override
	public int insertPaymentList(List<Map<String, Object>> list) {
		int result=0;
		for(Map<String,Object> pay:list) {
			result=mapper.insertPaymentList(pay);
			if(result==0)break;
		}
		if(result!=0) {
			result=1;
			return result;
		}else {
			return result;
		}
	}
}
