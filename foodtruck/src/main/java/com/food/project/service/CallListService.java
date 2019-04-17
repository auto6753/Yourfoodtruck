package com.food.project.service;

import java.util.ArrayList;
import com.food.project.domain.CallListVO;

public interface CallListService {
	public ArrayList<CallListVO> getCallList(String truck_code, String email);
	public int insertCallList(CallListVO vo);
}
