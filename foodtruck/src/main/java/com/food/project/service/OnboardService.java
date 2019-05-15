
package com.food.project.service;

import java.util.ArrayList;


import com.food.project.domain.OnboardVO;

public interface OnboardService {

	public ArrayList<OnboardVO> getOnboard(String email);
	public void DeleteOnboard(String truck_code);
	public ArrayList<OnboardVO> getOnSale(String email);
}
