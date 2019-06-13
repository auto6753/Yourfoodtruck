package com.food.project.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.food.project.domain.EventVO;
import com.food.project.domain.FoodTruckVO;
import com.food.project.domain.MainPageRankDTO;
import com.food.project.domain.MenuVO;
import com.food.project.domain.MyreviewlistDTO;
import com.food.project.domain.ReviewDTO;
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
	public ArrayList<ReviewDTO> getReviewList(String truck_code) {
		// TODO Auto-generated method stub
		return mapper.getReviewList(truck_code);
	}

	@Override
	public void updateTruckinfo(FoodTruckVO vo) {
		
		mapper.updateTruckinfo(vo);
		
	}

	@Override
	public ArrayList<MyreviewlistDTO> selectReview(String tt) {
		// TODO Auto-generated method stub
		return mapper.selectReviewList(tt);
	}

	@Override
	public void updateReview(ReviewVO vo) {
		mapper.updateReview(vo);
		
	}

	@Override
	public ArrayList<MenuVO> selectMenu(String truck_code) {
		// TODO Auto-generated method stub
		return mapper.selectMenu(truck_code);
	}

	@Override
	public ArrayList<EventVO> getEvent(String truck_code) {
		// TODO Auto-generated method stub
		return	mapper.getEvent(truck_code);
	}

	@Override
	public ArrayList<MainPageRankDTO> getRank() {
		// TODO Auto-generated method stub
		return mapper.getRank();
  }
	@Override
	public ArrayList<Map<String,Object>> getRank2() {
		System.out.println(mapper.getRank2().toString());
		return mapper.getRank2();
  }
  
  @Override
	public void updatetruckphoto(FoodTruckVO mvo) {
		mapper.updatetruckphoto(mvo);
	}

@Override
public FoodTruckVO getFoodTruckE(String email) {
	
	return mapper.getFoodTruckE(email);
}

@Override
public FoodTruckVO getBrandname(String truckcode) {
	
	return mapper.getBrandname(truckcode);
}



	

	

}