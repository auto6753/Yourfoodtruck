package com.food.project.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;
import com.food.project.domain.FoodTruckVO;
import com.food.project.domain.ReviewVO;
import com.food.project.mapper.FoodtruckMapper;
import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class FoodTruckServiceImplement implements FoodTruckService {
	FoodtruckMapper mapper;
	LoginService lmapper;
	@Override
	public ArrayList<FoodTruckVO> getFoodTruckList() {
		return mapper.getFoodTruckList();
	}
	
	@Override
	public FoodTruckVO getFoodTruck(String truck_code) {
		return mapper.getFoodTruck(truck_code);
	}

	@Override
	public FoodTruckVO insertFoodTruck(FoodTruckVO vo) {
		mapper.insertFoodTruck(vo);
		
		return lmapper.getFoodTruck(vo.getEmail());
	}

	@Override
	public void insertReview(ReviewVO vo) {
		
		mapper.insertReview(vo);
	}

	@Override
	public ArrayList<ReviewVO> getReviewList(String truck_code) {
		// TODO Auto-generated method stub
		return mapper.getReviewList(truck_code);
	} 
	

	

}
