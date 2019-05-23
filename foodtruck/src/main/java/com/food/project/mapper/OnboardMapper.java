package com.food.project.mapper;

import java.util.ArrayList;


import com.food.project.domain.OnboardVO;

public interface OnboardMapper {
	public ArrayList<OnboardVO> getOnboard(String email);
	public void DeleteOnboard(String truck_code);
	public ArrayList<OnboardVO> getOnSale(String email);
	public void insertOnboard(OnboardVO br);
	public ArrayList<OnboardVO> rideck(OnboardVO on);
	public void Deleteride(OnboardVO on);
	public void updateOutdate(OnboardVO on);
	public void updateOnboarddate(OnboardVO on);
}
