package com.food.project.service;

import java.util.ArrayList;
import com.food.project.domain.FoodTruckVO;

public interface FoodTruckService {
	public ArrayList<FoodTruckVO> getFoodTruckList();
	public FoodTruckVO getFoodTruck(String truck_code);
	public FoodTruckVO insertFoodTruck(FoodTruckVO vo);
}
