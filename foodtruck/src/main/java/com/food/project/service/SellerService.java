package com.food.project.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.food.project.domain.MenuVO;

public interface SellerService {

	public ArrayList<MenuVO> getmenu(String truckcode);
	
}
