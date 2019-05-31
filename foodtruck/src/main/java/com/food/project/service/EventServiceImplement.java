package com.food.project.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.food.project.domain.EventMenuVO;
import com.food.project.domain.EventVO;
import com.food.project.domain.MaineventDTO;
import com.food.project.mapper.EventMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class EventServiceImplement implements EventService {
	private EventMapper eventMapper;

	@Override
	public ArrayList<EventVO> getEvent(String truck_code) {
		// TODO Auto-generated method stub
		return eventMapper.getEvent(truck_code);
	}

	@Override
	public void addEvent(Map<String,Object> evo) {
		// TODO Auto-generated method stub
		//이벤트 테이블에 insert 하면서 이벤트 코드 가져오기
		eventMapper.addEvent((EventVO)evo.get("event"));
		
		EventVO vo=new EventVO();
		vo.setTruck_code((String)evo.get("truck_code"));
		vo =eventMapper.getEvent_code(vo);
		String event_code=vo.getEvent_code();
		
		if(evo.get("eventMenu")!=null) {
			ArrayList<EventMenuVO> emvos= (ArrayList<EventMenuVO>)evo.get("eventMenu");
			for(int i=0; i<emvos.size();i++) {
				emvos.get(i).setEvent_code(event_code);
				eventMapper.addEventMenu(emvos.get(i));
			}
		}
		
	}

	@Override
	public void deleteEvent(String eventCode) {
		// TODO Auto-generated method stub
		eventMapper.delEvent(eventCode);
	}

	@Override
	public void deleteEventMenu(String eventCode) {
		// TODO Auto-generated method stub
		eventMapper.delEventMenu(eventCode);
	}

	@Override
	public ArrayList<EventMenuVO> getEventMenu(String truckcode) {
		// TODO Auto-generated method stub
		return eventMapper.getEventMenu(truckcode);
	}
	/*
	 * @Override public ArrayList<EventVO> getMainevent() { // TODO Auto-generated
	 * method stub return eventMapper.getMainevent(); }
	 */

	@Override
	public ArrayList<EventVO> getEventForEdit(String eventCode) {
		// TODO Auto-generated method stub
		return eventMapper.getEventForEdit(eventCode);
	}

	@Override
	public ArrayList<MaineventDTO> getMainevent(MaineventDTO vo) {
		// TODO Auto-generated method stub
		return eventMapper.getMainevent(vo);
	}


}
