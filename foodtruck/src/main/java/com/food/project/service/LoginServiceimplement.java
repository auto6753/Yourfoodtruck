package com.food.project.service;

import org.springframework.stereotype.Service;
import com.food.project.domain.CustomerVO;
import com.food.project.domain.FoodTruckVO;
import com.food.project.mapper.LoginMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class LoginServiceimplement implements LoginService {
	private LoginMapper mapper;
	@Override
	public void insertCustomer(CustomerVO vo) {	mapper.insertCustomer(vo);	}

	@Override
	public CustomerVO getCustomer(String email) {	return mapper.getCustomer(email);	}

	@Override
	public CustomerVO getName(String nickname) {	return mapper.getName(nickname);	}

	@Override
	public void delete(String email) {	mapper.delete(email);	}

	@Override
	public CustomerVO idSearch(CustomerVO vo) {	return mapper.idSearch(vo);	}

	@Override
	public CustomerVO passSearch(CustomerVO vo) {	return mapper.passSearch(vo);	}

	@Override
	public FoodTruckVO getFoodTruck(String email) {    return mapper.getFoodTruck(email);  }

}
