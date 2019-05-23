package com.food.project.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.food.project.domain.CallListVO;
import com.food.project.domain.CustomerVO;
import com.food.project.domain.PaymentVO;

public interface PaymentService {
	public ArrayList<PaymentVO> getAllList();
	public ArrayList<PaymentVO> getPaymentList(String payment_telephone);
	public int insertPaymentList(List<Map<String,Object>> list);
	public int updatePaymentList(PaymentVO vo);
	public int updatePoint(CustomerVO vo);

	// 매출관리
	public String getCurYear2();
	public String getCurYear4();
	public String getCurMonth();
	
	public ArrayList<PaymentVO> getTodaySales(String truck_code);
	public ArrayList<PaymentVO> getWeekSales(String truck_code);
	public ArrayList<PaymentVO> getMonthSales(String truck_code, String inputYear, String inputMonth);
	public ArrayList<PaymentVO> getYearSales(String truck_code, String inputYear);
	public ArrayList<PaymentVO> getSelPeriodSales(String truck_code, String inputFirstDate, String inputLastDate);
	public ArrayList<PaymentVO> getByDaySales(String truck_code, String inputFirstYear, String inputLastYear, int day);
	public ArrayList<PaymentVO> getByTimeSales(String truck_code, String inputFirstDate, String inputLastDate, int hour);
	public String isMember(String telephone);
}
