package com.food.project.service;

import java.util.ArrayList;
import com.food.project.domain.CallListVO;

public interface CallListService {
	public ArrayList<CallListVO> getCallList(String truck_code);
	public int insertCallList(CallListVO vo);
}
