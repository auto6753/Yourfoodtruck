package com.food.project.mapper;

import java.util.ArrayList;

import com.food.project.domain.EventMenuVO;
import com.food.project.domain.EventVO;

public interface EventMapper {
	
	public ArrayList<EventVO> getEvent(String truckcode);
	public void addEvent(EventVO vo);
	public void addEventMenu(EventMenuVO vo);
	public EventVO getEvent_code(String truckcode);
}
