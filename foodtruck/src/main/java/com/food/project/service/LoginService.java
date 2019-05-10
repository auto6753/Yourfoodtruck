package com.food.project.service;

import com.food.project.domain.CustomerVO;
import com.food.project.domain.FoodTruckVO;
import com.food.project.domain.PostVO;

public interface LoginService {
	public void insertCustomer(CustomerVO vo);
	public CustomerVO getCustomer(String email);
	public CustomerVO getTelephone(String telephone);
	public CustomerVO getName(String nickname);
	public void delete(String email);

	public CustomerVO idSearch(CustomerVO vo);
	public CustomerVO passSearch(CustomerVO vo);
	
	public FoodTruckVO getFoodTruck(String email);
	public void updatePassword(CustomerVO vo);
	public void updateNickname(CustomerVO vo);
	
}
