package com.food.project.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.food.project.domain.CallListVO;


public interface CallListMapper {
	public ArrayList<CallListVO> getCallList(String truck_code);
	public int insertCallList(CallListVO vo);
	public ArrayList<CallListVO> getMyCallList(String email);
	public ArrayList<Map<String, Object>> getCallList2(String email);
}
