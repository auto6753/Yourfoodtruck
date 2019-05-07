package com.food.project.service;

import java.util.ArrayList;
import com.food.project.domain.FoodTruckVO;
import com.food.project.domain.ReviewVO;

public interface FoodTruckService {
	public ArrayList<FoodTruckVO> getFoodTruckList();
	public FoodTruckVO getFoodTruck(String truck_code);
	public FoodTruckVO insertFoodTruck(FoodTruckVO vo);
	public void insertReview(ReviewVO vo);
	public ArrayList<ReviewVO> getReviewList(String truck_code);
}
