package com.food.project.mapper;

import java.util.ArrayList;
import com.food.project.domain.CallListVO;

public interface CallListMapper {
	public ArrayList<CallListVO> getCallList(String truck_code);
	public int insertCallList(CallListVO vo);

}
