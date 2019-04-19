package com.food.project.mapper;

import java.util.ArrayList;
import com.food.project.domain.FoodTruckVO;

public interface FoodtruckMapper {
	public ArrayList<FoodTruckVO> getFoodTruckList();
	public FoodTruckVO getFoodTruck(String truck_code);
	public void insertFoodTruck(FoodTruckVO vo);
	public FoodTruckVO getFoodTruckE(String email);
	
}
