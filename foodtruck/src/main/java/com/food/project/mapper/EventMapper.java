package com.food.project.mapper;

import java.util.ArrayList;

import com.food.project.domain.EventVO;

public interface EventMapper {
	
	public ArrayList<EventVO> getEvent(String truckcode);
	public ArrayList<EventVO> getMainevent();
}
