package com.food.project.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.food.project.domain.LocationVO;

public interface LocationMapper {

	//회원가입
//	public void insertLoc(LocationVO vo);
	
	//로그인 체크, 및 세션담기
//	public ArrayList<LocationVO> getLocation(LocationVO vo,String email);
	//public ArrayList<> getLoc();
	
	public List<Map<String, Object>> getLoc();
	public ArrayList<LocationVO> getLocation(String truck_code);

}
