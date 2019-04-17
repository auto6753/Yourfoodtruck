package com.food.project.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.food.project.domain.CallListVO;
import com.food.project.mapper.CallListMapper;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class CallListServiceImplement implements CallListService {
	
	CallListMapper mapper;
	@Override
	public ArrayList<CallListVO> getCallList(String truck_code, String email) {
		return mapper.getCallList(truck_code, email);
	}
	@Override
	public int insertCallList(CallListVO vo) {
		return mapper.insertCallList(vo);
	}

}
