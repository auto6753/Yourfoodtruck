package com.food.project.mapper;

import java.util.ArrayList;

import com.food.project.domain.EventMenuVO;
import com.food.project.domain.EventVO;

public interface EventMapper {
	
	public ArrayList<EventVO> getEvent(String truck_code);
	public void addEvent(EventVO vo);
	public void addEventMenu(EventMenuVO vo);
	public EventVO getEvent_code(EventVO vo);
	public void delEvent(String event_code);
	public void delEventMenu(String event_code);
	public ArrayList<EventMenuVO> getEventMenu(String truck_code);
	public ArrayList<EventVO> getMainevent();
	public ArrayList<EventVO> getEventForEdit(String event_code);
}
