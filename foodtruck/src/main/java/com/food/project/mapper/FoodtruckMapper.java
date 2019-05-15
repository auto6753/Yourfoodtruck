package com.food.project.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;

import com.food.project.domain.FoodTruckVO;
import com.food.project.domain.MyreviewlistDTO;
import com.food.project.domain.ReviewVO;

public interface FoodtruckMapper {
	public ArrayList<FoodTruckVO> getFoodTruckList();
	public FoodTruckVO getFoodTruck(String truck_code);
	public void insertFoodTruck(FoodTruckVO vo);
	public FoodTruckVO getFoodTruckE(String email);
	public void insertReview(ReviewVO vo);
	public ArrayList<ReviewVO> getReviewList(String truck_code);
	
	@Delete("delete from review where review_code =#{review_code}")
	public void reviewdelete(ReviewVO vo);
	public void updateTruckinfo(FoodTruckVO vo);
	public ArrayList<MyreviewlistDTO> selectReviewList(String tt);
	
}
