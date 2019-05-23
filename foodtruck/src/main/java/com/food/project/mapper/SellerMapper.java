package com.food.project.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.food.project.domain.CallListVO;
import com.food.project.domain.LocationVO;
import com.food.project.domain.MenuVO;

public interface SellerMapper {
	
	public ArrayList<MenuVO> getmenu(String truckcode);
	
	public void insertmenu(MenuVO vo);
	
	public void updatemenu(MenuVO vo);
	
	@Delete("delete from menu where menu_code = #{menu_code}")
	public void deletemenu(MenuVO vo);

	public void insertlocation(LocationVO vo);

}
