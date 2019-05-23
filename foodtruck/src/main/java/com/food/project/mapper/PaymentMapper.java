package com.food.project.mapper;

import java.util.ArrayList;
import java.util.Map;


import org.apache.ibatis.annotations.Update;
import com.food.project.domain.CustomerVO;
import org.apache.ibatis.annotations.Param;
import com.food.project.domain.PaymentVO;

public interface PaymentMapper {
	public ArrayList<PaymentVO> getAllList();
	public ArrayList<PaymentVO> getPaymentList(String payment_telephone);
	public int insertPaymentList(Map<String,Object> list);
	public int updatePaymentList(PaymentVO vo);
	
	public int updatePoint(CustomerVO vo);
	//point update

	// 매출관리
	public String getCurYear2();
	public String getCurYear4();
	public String getCurMonth();
	
	public ArrayList<PaymentVO> getTodaySales(String truck_code);
	public ArrayList<PaymentVO> getWeekSales(String truck_code);
	public ArrayList<PaymentVO> getMonthSales(@Param("truck_code") String truck_code, @Param("inputYear") String inputYear, @Param("inputMonth") String inputMonth);
	public ArrayList<PaymentVO> getYearSales(@Param("truck_code") String truck_code, @Param("inputYear") String inputYear);
	public ArrayList<PaymentVO> getSelPeriodSales(@Param("truck_code") String truck_code, @Param("inputFirstDate") String inputFirstDate, @Param("inputLastDate") String inputLastDate);
	public ArrayList<PaymentVO> getByDaySales (@Param("truck_code") String truck_code, @Param("inputFirstYear") String inputFirstYear, @Param("inputLastYear") String inputLastYear, @Param("day") int day);
	public ArrayList<PaymentVO> getByTimeSales(@Param("truck_code") String truck_code, @Param("inputFirstDate") String inputFirstDate, @Param("inputLastDate") String inputLastDate, @Param("hour") int hour);
	public String isMember(String telephone);
}
