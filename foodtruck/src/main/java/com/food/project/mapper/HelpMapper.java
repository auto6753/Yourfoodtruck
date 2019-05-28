package com.food.project.mapper;

import java.util.ArrayList;

import com.food.project.domain.HelpVO;

public interface HelpMapper {
	public void insertHelp(HelpVO vo);
	public ArrayList<HelpVO> getHelpList(HelpVO vo);
}
