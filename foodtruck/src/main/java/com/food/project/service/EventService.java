package com.food.project.service;

import java.util.ArrayList;
import java.util.Map;
import com.food.project.domain.EventMenuVO;

import com.food.project.domain.EventVO;

public interface EventService {

	public ArrayList<EventVO> getEvent(String truckcode);
	public void addEvent(Map<String,Object> evo);
	
}
