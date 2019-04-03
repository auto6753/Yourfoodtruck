package com.food.project.mapper;

import java.util.ArrayList;

import com.food.project.domain.MenuVO;

public interface SellerMapper {
	
	public ArrayList<MenuVO> getmenu(String truckcode);
}
