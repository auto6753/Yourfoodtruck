package com.food.project.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.food.project.domain.CallListVO;
import com.food.project.domain.CustomerVO;
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
	@Override
	public int updatePoint(CustomerVO vo) {
		return mapper.updatePoint(vo);
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
	public String getTodaySalesForSeorder(String truck_code) {
		// TODO Auto-generated method stub
		String result;
		try {
			result = (String) mapper.getTodaySalesForSeorder(truck_code).get("SUM");
		}catch(Exception e) {
			result="empty";
		}
		System.out.println(result);
		return result;
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
	public ArrayList<PaymentVO> getByDaySales(String truck_code, String inputFirstYear, String inputLastYear) {
		// TODO Auto-generated method stub
		return mapper.getByDaySales(truck_code, inputFirstYear, inputLastYear);
	}

	@Override
	public ArrayList<PaymentVO> getByTimeSales(String truck_code, String inputFirstYear, String inputLastYear) {
		// TODO Auto-generated method stub
		return mapper.getByTimeSales(truck_code, inputFirstYear, inputLastYear);
	}

	@Override
	public String isMember(String telephone) {
		// TODO Auto-generated method stub
		return mapper.isMember(telephone);
	}

	@Override
	public String[] getMonthValue(String truck_code) {
		// TODO Auto-generated method stub
		return mapper.getMonthValue(truck_code);
	}

	@Override
	public String[] getYearValue(String truck_code) {
		// TODO Auto-generated method stub
		return mapper.getYearValue(truck_code);
	}

	@Override
	public String[] getByDayValue(String truck_code) {
		return mapper.getByDayValue(truck_code);
	}

	@Override
	public String[] getByTimeValue(String truck_code) {
		// TODO Auto-generated method stub
		return mapper.getByTimeValue(truck_code);
	}
	
}
