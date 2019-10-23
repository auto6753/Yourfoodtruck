package com.food.project.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Select;

import com.food.project.domain.CustomerVO;
import com.food.project.domain.LocationVO;
import com.food.project.domain.MainPageRankDTO;
import com.food.project.domain.MenuVO;

public interface SellerMapper {
	
	public ArrayList<MenuVO> getmenu(String truck_code);
	
	public void insertmenu(MenuVO vo);
	
	public void updatemenu(MenuVO vo);
	
	public void deletemenu(String menu_code);

	public void insertlocation(LocationVO vo);
	
	@Select("select truck_code ,lat_y,lng_x,loc_time from location where truck_code =#{truck_code} and ROWNUM = 1 order by loc_time desc")
	public LocationVO getlocation(String truck_code);
	
	public CustomerVO getCustomer(String truck_code);

	public MenuVO getmenu2(String menuCode);
}
