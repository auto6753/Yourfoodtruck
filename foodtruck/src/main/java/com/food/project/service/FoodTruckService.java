package com.food.project.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.food.project.domain.EventVO;
import com.food.project.domain.FoodTruckVO;
import com.food.project.domain.MainPageRankDTO;
import com.food.project.domain.MenuVO;
import com.food.project.domain.MyreviewlistDTO;
import com.food.project.domain.PostVO;
import com.food.project.domain.ReviewDTO;
import com.food.project.domain.ReviewVO;

public interface FoodTruckService {
	public ArrayList<FoodTruckVO> getFoodTruckList();
	public FoodTruckVO getFoodTruck(String truck_code);
	public FoodTruckVO getFoodTruckE(String email);
	public FoodTruckVO insertFoodTruck(FoodTruckVO vo);
	public void insertReview(ReviewVO vo);
	public ArrayList<ReviewDTO> getReviewList(String truck_code);
	public void updateTruckinfo(FoodTruckVO vo);
	public ArrayList<MyreviewlistDTO> selectReview(String tt);
	public void updateReview(ReviewVO vo);
	public ArrayList<MenuVO> selectMenu(String truck_code);
	public ArrayList<EventVO> getEvent(String truck_code);
	public ArrayList<MainPageRankDTO> getRank();
	public ArrayList<Map<String,Object>> getRank2();
	public void updatetruckphoto(FoodTruckVO mvo);
	public FoodTruckVO getBrandname(String truckcode);
	
	
}
