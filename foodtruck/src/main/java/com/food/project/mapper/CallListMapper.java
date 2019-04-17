package com.food.project.mapper;

import java.util.ArrayList;
import com.food.project.domain.CallListVO;

public interface CallListMapper {
	public ArrayList<CallListVO> getCallList(String truck_code, String email);
	public int insertCallList(CallListVO vo);

}
