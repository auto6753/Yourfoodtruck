package com.food.project.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.food.project.domain.EventVO;
import com.food.project.mapper.EventMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class EventServiceImplement implements EventService {
	private EventMapper eventMapper;

	@Override
	public ArrayList<EventVO> getEvent(String truckcode) {
		// TODO Auto-generated method stub
		return eventMapper.getEvent(truckcode);
	}
	@Override
	public ArrayList<EventVO> getMainevent() {
		// TODO Auto-generated method stub
		return eventMapper.getMainevent();
	}
}
