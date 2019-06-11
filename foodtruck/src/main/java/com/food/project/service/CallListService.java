package com.food.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.food.project.domain.CallListVO;

public interface CallListService {
	public ArrayList<Map<String,Object>> getCallList(String truck_code);
	public int insertCallList(CallListVO vo);
	ArrayList<CallListVO> getMyCallList(String email);
	public ArrayList<Map<String, Object>> getCallList2(String email);
	//public void deleteCall(String merchant_uid);
	public int updateCall(CallListVO vo);
	public int updateCallVo(CallListVO vo);
	
	public ArrayList<Map<String,Object>> allList(@Param("start") int start, @Param("end") int end, @Param("truck_code") String truck_code);
	public int totalPage(String truck_code);
}
