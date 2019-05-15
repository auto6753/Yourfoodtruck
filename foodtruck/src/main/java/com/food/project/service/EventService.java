package com.food.project.service;

import java.util.ArrayList;

import com.food.project.domain.EventVO;

public interface EventService {

	public ArrayList<EventVO> getEvent(String truckcode);
	public ArrayList<EventVO> getMainevent();
}
