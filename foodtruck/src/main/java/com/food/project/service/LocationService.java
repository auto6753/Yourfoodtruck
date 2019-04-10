package com.food.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.food.project.domain.LocationVO;

public interface LocationService {
	
//	public void insertLoc(LocationVO vo);
	
//	public ArrayList<LocationVO> getLocation(LocationVO vo,String email);
	//public ArrayList<LocationVO> getLoc();
	public List<Map<String, Object>> getLoc();
	
}
