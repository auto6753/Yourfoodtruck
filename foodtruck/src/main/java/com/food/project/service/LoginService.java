package com.food.project.service;

import com.food.project.domain.CustomerVO;

public interface LoginService {
	public void insertCustomer(CustomerVO vo);
	public CustomerVO getCustomer(String email);

	public CustomerVO getName(String nickname);
	public void delete(String email);

	public CustomerVO idSearch(CustomerVO vo);
	public CustomerVO passSearch(CustomerVO vo);
}
