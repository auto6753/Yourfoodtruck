package com.food.project.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.food.project.domain.CallListDetailDTO;
import com.food.project.domain.CallListVO;


public interface CallListMapper {
	public ArrayList<Map<String,Object>> getCallList(String truck_code);
	public int insertCallList(CallListVO vo);
	public ArrayList<CallListVO> getMyCallList(String email);
	public ArrayList<Map<String, Object>> getCallList2(String email);
	public int updateCall(CallListVO vo);
	public int updateCallVo(CallListVO vo);
	/*
	 * @Delete("delete call_list where merchant_uid =#{merchant_uid}") public void
	 * deleteCall(String merchant_uid);
	 */
	public ArrayList<Map<String,Object>> allList(Map<String,Object> map);
	public Map<String,Object> totalPage(String truck_code);
	@Select("select * from call_list where merchant_uid=#{merchant_uid}")
	public CallListVO getCall(String merchant_uid);
	
	public CallListDetailDTO getCall2(String merchant_uid);
}
