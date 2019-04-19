package com.food.project.mapper;

import java.util.ArrayList;

import com.food.project.domain.OnboardVO;

public interface OnboardMapper {
	public ArrayList<OnboardVO> getOnboard(String email);
}
