package com.food.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.food.project.domain.CallListDetailDTO;
import com.food.project.domain.CallListVO;
import com.food.project.mapper.CallListMapper;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class CallListServiceImplement implements CallListService {
	
	CallListMapper mapper;
	@Override
	public ArrayList<CallListVO> getCallList(String truck_code) {
		return mapper.getCallList(truck_code);
	}
	@Override
	public ArrayList<CallListVO> getMyCallList(String email) {
		return mapper.getMyCallList(email);
	}
	@Override
	public int insertCallList(CallListVO vo) {
		return mapper.insertCallList(vo);
	}
	@Override
	public ArrayList<Map<String, Object>> getCallList2(String email) {
		// TODO Auto-generated method stub
		return mapper.getCallList2(email);
	}
	@Override
	public int updateCall(CallListVO vo) {
		// TODO Auto-generated method stub
		return mapper.updateCall(vo);
	}
	@Override
	public int updateCallVo(CallListVO vo) {
		// TODO Auto-generated method stub
		return mapper.updateCallVo(vo);
	}
	@Override
	public int totalPage(String truck_code) {
		Map<String,Object> map=mapper.totalPage(truck_code);
		System.out.println(map.toString());
		int tot_page=Integer.parseInt(String.valueOf(map.get("TOT_PAGE")));
		return tot_page;	
	}
	@Override
	public ArrayList<Map<String,Object>> allList(int start, int end, String truck_code) {	
		Map<String,Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("truck_code", truck_code);
		
		return mapper.allList(map);	
		}
	@Override
	public CallListDetailDTO getCall(String merchant_uid) {
		// TODO Auto-generated method stub
		
		return mapper.getCall2(merchant_uid);
	}

}
