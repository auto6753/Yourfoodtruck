package com.food.project.service;

import java.util.ArrayList;

import com.food.project.domain.HelpVO;

public interface HelpService {

	public void insertHelp(HelpVO vo); 
	public void answerHelp(HelpVO vo);
	public ArrayList<HelpVO> getHelpList(HelpVO vo);
	
}
