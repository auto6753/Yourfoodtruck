
package com.food.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.food.project.domain.OnboardCountDTO;
import com.food.project.domain.OnboardVO;

public interface OnboardService {

	public ArrayList<OnboardVO> getOnboard(String email);
	public void DeleteOnboard(String truck_code);
	public ArrayList<OnboardVO> getOnSale(String email);
	public void insertOnboard(OnboardVO br);
	public ArrayList<OnboardVO> rideck(OnboardVO on);
	public void Deleteride(OnboardVO on);
	public void updateOutdate(OnboardVO on);
	public void updateOnboarddate(OnboardVO br);
	public ArrayList<HashMap<String,Object>> CountOnboard(OnboardVO br);
}
