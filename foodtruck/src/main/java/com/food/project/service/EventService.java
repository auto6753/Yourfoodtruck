package com.food.project.service;

import java.util.ArrayList;
import java.util.Map;

import com.food.project.domain.EventMenuVO;
import com.food.project.domain.EventVO;
import com.food.project.domain.MaineventDTO;

public interface EventService {

	public ArrayList<EventVO> getEvent(String truck_code);
	public void addEvent(Map<String,Object> evo);
	public void deleteEvent(String eventCode);
	public void deleteEventMenu(String eventCode);
	public ArrayList<EventMenuVO> getEventMenu(String truckCode);

	public ArrayList<EventVO> getEventForEdit(String eventCode);
	public ArrayList<MaineventDTO> getMainevent(MaineventDTO vo);
	
	
	
}
