package com.food.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

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

}
