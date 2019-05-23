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

	@Override
	public int updatePaymentList(PaymentVO vo) {
		int result=0;
		System.out.println(vo.getPayment_class());
		result=mapper.updatePaymentList(vo);
		return result;
	}
	
	// 매출관리
	@Override
	public String getCurYear2() {
		// TODO Auto-generated method stub
		return mapper.getCurYear2();
	}
	
	@Override
	public String getCurYear4() {
		// TODO Auto-generated method stub
		return mapper.getCurYear4();
	}

	@Override
	public String getCurMonth() {
		// TODO Auto-generated method stub
		return mapper.getCurMonth();
	}
	
	@Override
	public ArrayList<PaymentVO> getTodaySales(String truck_code) {
		// TODO Auto-generated method stub
		return mapper.getTodaySales(truck_code);
	}
	
	@Override
	public ArrayList<PaymentVO> getWeekSales(String truck_code) {
		// TODO Auto-generated method stub
		return mapper.getWeekSales(truck_code);
	}

	@Override
	public ArrayList<PaymentVO> getMonthSales(String truck_code, String inputYear, String inputMonth) {
		// TODO Auto-generated method stub
		return mapper.getMonthSales(truck_code, inputYear, inputMonth);
	}

	@Override
	public ArrayList<PaymentVO> getYearSales(String truck_code, String inputYear) {
		// TODO Auto-generated method stub
		return mapper.getYearSales(truck_code, inputYear);
	}

	@Override
	public ArrayList<PaymentVO> getSelPeriodSales(String truck_code, String inputFirstDate, String inputLastDate) {
		// TODO Auto-generated method stub
		return mapper.getSelPeriodSales(truck_code, inputFirstDate, inputLastDate);
	}

	@Override
	public ArrayList<PaymentVO> getByDaySales(String truck_code, String inputFirstYear, String inputLastYear, int day) {
		// TODO Auto-generated method stub
		return mapper.getByDaySales(truck_code, inputFirstYear, inputLastYear, day);
	}

	@Override
	public ArrayList<PaymentVO> getByTimeSales(String truck_code, String inputFirstDate, String inputLastDate, int hour) {
		// TODO Auto-generated method stub
		return mapper.getByTimeSales(truck_code, inputFirstDate, inputLastDate, hour);
	}

	@Override
	public String isMember(String telephone) {
		// TODO Auto-generated method stub
		return mapper.isMember(telephone);
	}
}
