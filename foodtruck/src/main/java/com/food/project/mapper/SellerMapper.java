package com.food.project.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Select;

import com.food.project.domain.LocationVO;
import com.food.project.domain.MainPageRankDTO;
import com.food.project.domain.MenuVO;

public interface SellerMapper {
	
	public ArrayList<MenuVO> getmenu(String truckcode);
	
	public void insertmenu(MenuVO vo);
	
	public void updatemenu(MenuVO vo);
	
	public void deletemenu(String menu_code);

	public void insertlocation(LocationVO vo);
	
	
	
}
