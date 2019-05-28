package com.food.project.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.food.project.domain.HelpVO;
import com.food.project.mapper.HelpMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class HelpServiceImplement implements HelpService {
	private HelpMapper helpmapper;
	@Override
	public void insertHelp(HelpVO vo) {
		// TODO Auto-generated method stub
		helpmapper.insertHelp(vo);
	}

	@Override
	public void answerHelp(HelpVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<HelpVO> getHelpList(HelpVO vo) {
		// TODO Auto-generated method stub
		
		return helpmapper.getHelpList(vo);
	}

}
